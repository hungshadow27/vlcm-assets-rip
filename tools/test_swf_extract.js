import fs from 'node:fs';
import path from 'node:path';
import zlib from 'node:zlib';

function decodeTSE(raw) {
  const buf = Buffer.from(raw);
  const a = 0x79, b = 39, c = 297;
  let loc8 = 0, len = buf.length;
  do {
    let loc7 = 0;
    while (loc7 < b) {
      buf[loc8] ^= a;
      loc8++;
      if (loc8 >= len) break;
      loc7++;
    }
    loc8 += c;
  } while (loc8 < len);
  return buf;
}

// Simple PNG encoder in pure JS (no external dependency needed)
function createPNG(width, height, rgbaBuffer) {
  // PNG signature: 89 50 4E 47 0D 0A 1A 0A
  const signature = Buffer.from([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]);
  
  // IHDR chunk
  const ihdrData = Buffer.alloc(13);
  ihdrData.writeUInt32BE(width, 0);
  ihdrData.writeUInt32BE(height, 4);
  ihdrData[8] = 8; // Bit depth: 8
  ihdrData[9] = 6; // Color type: 6 (RGBA)
  ihdrData[10] = 0; // Compression method: 0 (deflate)
  ihdrData[11] = 0; // Filter method: 0
  ihdrData[12] = 0; // Interlace: 0
  const ihdrChunk = makeChunk('IHDR', ihdrData);
  
  // IDAT chunk (Raw scanlines with filter byte 0)
  const rowBytes = width * 4;
  const rawScanlines = Buffer.alloc(height * (1 + rowBytes));
  let destPos = 0;
  let srcPos = 0;
  for (let y = 0; y < height; y++) {
    rawScanlines[destPos++] = 0; // Filter: None
    rgbaBuffer.copy(rawScanlines, destPos, srcPos, srcPos + rowBytes);
    destPos += rowBytes;
    srcPos += rowBytes;
  }
  
  const compressedIDAT = zlib.deflateSync(rawScanlines, { level: 6 });
  const idatChunk = makeChunk('IDAT', compressedIDAT);
  
  // IEND chunk
  const iendChunk = makeChunk('IEND', Buffer.alloc(0));
  
  return Buffer.concat([signature, ihdrChunk, idatChunk, iendChunk]);
}

// CRC32 calculation for PNG chunks
const crcTable = [];
for (let n = 0; n < 256; n++) {
  let c = n;
  for (let k = 0; k < 8; k++) {
    c = (c & 1) ? (0xEDB88320 ^ (c >>> 1)) : (c >>> 1);
  }
  crcTable[n] = c;
}

function crc32(buf) {
  let crc = 0xFFFFFFFF;
  for (let i = 0; i < buf.length; i++) {
    crc = crcTable[(crc ^ buf[i]) & 0xFF] ^ (crc >>> 8);
  }
  return (crc ^ 0xFFFFFFFF) >>> 0;
}

function makeChunk(type, data) {
  const len = data.length;
  const chunk = Buffer.alloc(4 + 4 + len + 4);
  chunk.writeUInt32BE(len, 0);
  chunk.write(type, 4, 4, 'ascii');
  data.copy(chunk, 8);
  const typeAndData = chunk.slice(4, 8 + len);
  const crc = crc32(typeAndData);
  chunk.writeUInt32BE(crc, 8 + len);
  return chunk;
}

function parseSWFTags(swfBuffer) {
  let swfData = swfBuffer;
  const sig = swfBuffer.slice(0, 3).toString('ascii');
  if (sig === 'CWS') {
    const uncompressed = zlib.inflateSync(swfBuffer.slice(8));
    const header = Buffer.alloc(8);
    swfBuffer.copy(header, 0, 0, 8);
    header[0] = 0x46; // FWS
    swfData = Buffer.concat([header, uncompressed]);
  }
  
  let pos = 8;
  const firstByte = swfData[pos];
  const nBits = firstByte >> 3;
  const totalBits = 5 + nBits * 4;
  const rectBytes = Math.ceil(totalBits / 8);
  pos += rectBytes;
  pos += 4;
  
  const tags = [];
  while (pos < swfData.length) {
    const tagCodeAndLength = swfData.readUInt16LE(pos);
    pos += 2;
    let tagType = tagCodeAndLength >> 6;
    let tagLength = tagCodeAndLength & 0x3f;
    if (tagLength === 0x3f) {
      tagLength = swfData.readUInt32LE(pos);
      pos += 4;
    }
    const tagData = swfData.slice(pos, pos + tagLength);
    tags.push({ tagType, tagLength, data: tagData });
    pos += tagLength;
  }
  return tags;
}

// Extract images from SWF
export function extractImagesFromSWF(swfBuffer) {
  const tags = parseSWFTags(swfBuffer);
  const images = [];
  
  for (const tag of tags) {
    // Tag 21: DefineBitsJPEG2
    if (tag.tagType === 21) {
      const charId = tag.data.readUInt16LE(0);
      const imgData = tag.data.slice(2);
      images.push({ charId, type: 'jpeg', ext: 'jpg', data: imgData });
    }
    // Tag 35: DefineBitsJPEG3 (JPEG + Alpha channel)
    else if (tag.tagType === 35) {
      const charId = tag.data.readUInt16LE(0);
      const alphaOffset = tag.data.readUInt32LE(2);
      const jpegData = tag.data.slice(6, 6 + alphaOffset);
      const alphaData = tag.data.slice(6 + alphaOffset);
      
      // If alpha data exists, we can keep the alpha buffer for combining, or save raw jpeg if no alpha
      images.push({
        charId,
        type: 'jpeg3',
        ext: alphaData.length > 0 ? 'png' : 'jpg',
        jpegData,
        alphaData
      });
    }
    // Tag 20 / 36: DefineBitsLossless / DefineBitsLossless2
    else if (tag.tagType === 20 || tag.tagType === 36) {
      const charId = tag.data.readUInt16LE(0);
      const format = tag.data[2]; // 3=8-bit colormapped, 4=15-bit, 5=24/32-bit
      const width = tag.data.readUInt16LE(3);
      const height = tag.data.readUInt16LE(5);
      const zlibData = tag.data.slice(tag.tagType === 20 ? 7 : (format === 3 ? 8 : 7));
      
      try {
        const uncompressed = zlib.inflateSync(zlibData);
        if (format === 5) {
          // 32-bit ARGB
          const rgba = Buffer.alloc(width * height * 4);
          for (let i = 0; i < width * height; i++) {
            const a = uncompressed[i * 4];
            const r = uncompressed[i * 4 + 1];
            const g = uncompressed[i * 4 + 2];
            const b = uncompressed[i * 4 + 3];
            rgba[i * 4] = r;
            rgba[i * 4 + 1] = g;
            rgba[i * 4 + 2] = b;
            rgba[i * 4 + 3] = (tag.tagType === 36) ? a : 255;
          }
          const png = createPNG(width, height, rgba);
          images.push({ charId, type: 'png', ext: 'png', data: png, width, height });
        }
      } catch (e) {
        console.error('Lossless inflate error:', e.message);
      }
    }
  }
  return images;
}

// Test runner if executed directly
if (process.argv[1].endsWith('test_swf_extract.js')) {
  (async () => {
    console.log('Testing SWF extraction on chengfachangtai.tse...');
    const r = await fetch('https://cdn-mct.tepaylink.vn/eflashdir0918/program526/skin/JingGaoJieMie/chengfachangtai.tse');
    const buf = decodeTSE(Buffer.from(await r.arrayBuffer()));
    const images = extractImagesFromSWF(buf);
    console.log('Extracted images count:', images.length);
    for (const img of images) {
      console.log(' - Image CharID:', img.charId, 'Type:', img.type, 'Ext:', img.ext);
      if (img.jpegData) console.log('   JPEG bytes:', img.jpegData.length, 'Alpha bytes:', img.alphaData.length);
    }
  })();
}
