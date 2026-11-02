import zlib from 'node:zlib';
import jpeg from 'jpeg-js';
import { decodeTSEBuffer } from './decoder.js';
import { parseModelXmlToJson } from './xml_parser.js';

// Precomputed CRC32 Table for PNG generator
const crcTable = new Uint32Array(256);
for (let n = 0; n < 256; n++) {
  let c = n;
  for (let k = 0; k < 8; k++) {
    c = (c & 1) ? (0xEDB88320 ^ (c >>> 1)) : (c >>> 1);
  }
  crcTable[n] = c >>> 0;
}

function crc32(buf) {
  let crc = 0xFFFFFFFF;
  for (let i = 0; i < buf.length; i++) {
    crc = crcTable[(crc ^ buf[i]) & 0xFF] ^ (crc >>> 8);
  }
  return (crc ^ 0xFFFFFFFF) >>> 0;
}

function makePngChunk(type, data) {
  const len = data.length;
  const chunk = Buffer.alloc(4 + 4 + len + 4);
  chunk.writeUInt32BE(len, 0);
  chunk.write(type, 4, 4, 'ascii');
  data.copy(chunk, 8);
  const typeAndData = chunk.subarray(4, 8 + len);
  const crc = crc32(typeAndData);
  chunk.writeUInt32BE(crc, 8 + len);
  return chunk;
}

/**
 * Pure JS fast RGBA to PNG encoder
 */
export function encodePNG(width, height, rgbaBuffer) {
  const signature = Buffer.from([0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]);
  
  const ihdrData = Buffer.alloc(13);
  ihdrData.writeUInt32BE(width, 0);
  ihdrData.writeUInt32BE(height, 4);
  ihdrData[8] = 8; // Bit depth: 8
  ihdrData[9] = 6; // Color type: 6 (RGBA)
  ihdrData[10] = 0; // Deflate
  ihdrData[11] = 0; // Filter method
  ihdrData[12] = 0; // Interlace
  const ihdrChunk = makePngChunk('IHDR', ihdrData);

  const rowBytes = width * 4;
  const rawScanlines = Buffer.alloc(height * (1 + rowBytes));
  let destPos = 0;
  let srcPos = 0;
  for (let y = 0; y < height; y++) {
    rawScanlines[destPos++] = 0;
    rgbaBuffer.copy(rawScanlines, destPos, srcPos, srcPos + rowBytes);
    destPos += rowBytes;
    srcPos += rowBytes;
  }

  const compressedIDAT = zlib.deflateSync(rawScanlines, { level: 6 });
  const idatChunk = makePngChunk('IDAT', compressedIDAT);
  const iendChunk = makePngChunk('IEND', Buffer.alloc(0));

  return Buffer.concat([signature, ihdrChunk, idatChunk, iendChunk]);
}

/**
 * Parses SWF buffer and extracts all raw tags
 */
export function parseSWFTags(swfBuffer) {
  let swfData = swfBuffer;
  const sig = swfBuffer.slice(0, 3).toString('ascii');
  
  if (sig === 'CWS') {
    try {
      const uncompressed = zlib.inflateSync(swfBuffer.slice(8));
      const header = Buffer.alloc(8);
      swfBuffer.copy(header, 0, 0, 8);
      header[0] = 0x46; // 'FWS'
      swfData = Buffer.concat([header, uncompressed]);
    } catch (e) {
      throw new Error(`Failed to decompress CWS zlib stream: ${e.message}`);
    }
  } else if (sig !== 'FWS' && sig !== 'ZWS') {
    throw new Error(`Invalid SWF signature: ${sig}`);
  }

  let pos = 8;
  const firstByte = swfData[pos];
  const nBits = firstByte >> 3;
  const totalBits = 5 + nBits * 4;
  const rectBytes = Math.ceil(totalBits / 8);
  pos += rectBytes;
  pos += 4; // Skip frameRate (2 bytes) + frameCount (2 bytes)

  const tags = [];
  let jpegTables = null;

  while (pos < swfData.length - 2) {
    const tagCodeAndLength = swfData.readUInt16LE(pos);
    pos += 2;
    let tagType = tagCodeAndLength >> 6;
    let tagLength = tagCodeAndLength & 0x3f;
    if (tagLength === 0x3f) {
      if (pos + 4 > swfData.length) break;
      tagLength = swfData.readUInt32LE(pos);
      pos += 4;
    }

    if (pos + tagLength > swfData.length) {
      tagLength = swfData.length - pos;
    }

    const tagData = swfData.subarray(pos, pos + tagLength);
    if (tagType === 8) {
      jpegTables = tagData;
    }
    tags.push({ tagType, tagLength, data: tagData });
    pos += tagLength;
    if (tagType === 0) break; // End Tag
  }

  return { tags, jpegTables, swfData };
}

/**
 * Converts SWF or TSE buffer into model data:
 * - Detects SymbolClass (e.g. 1 -> mid151.walk, 2 -> mid151.stand)
 * - Extracts coordinate XML from DoABC
 * - Converts each frame image into transparent PNG / JPG with proper naming
 * - Generates structured JSON model
 */
export function convertSWFToImages(buffer, isTSE = false, defaultModelName = 'model') {
  let swfBuffer = buffer;
  if (isTSE) {
    swfBuffer = decodeTSEBuffer(buffer);
  }

  const { tags, jpegTables } = parseSWFTags(swfBuffer);

  // 1. Extract SymbolClass mappings (Tag 76)
  const symbols = {};
  for (const tag of tags) {
    if (tag.tagType === 76) {
      const numSymbols = tag.data.readUInt16LE(0);
      let p = 2;
      for (let s = 0; s < numSymbols; s++) {
        if (p + 2 > tag.data.length) break;
        const charId = tag.data.readUInt16LE(p);
        p += 2;
        let nullByte = p;
        while (nullByte < tag.data.length && tag.data[nullByte] !== 0) nullByte++;
        const symName = tag.data.slice(p, nullByte).toString('utf8');
        symbols[charId] = symName;
        p = nullByte + 1;
      }
    }
  }

  // Determine model name from symbols (charId 0 is usually main class)
  const modelName = symbols[0] || defaultModelName;

  // 2. Extract XML from DoABC (Tag 82 / 72)
  let rawXml = null;
  for (const tag of tags) {
    if (tag.tagType === 82 || tag.tagType === 72) {
      const str = tag.data.toString('utf8');
      const m1 = str.match(/<r>[\s\S]*?<\/r>/);
      const m2 = str.match(/<status[\s\S]*?\/>/);
      if (m1) {
        rawXml = m1[0];
        break;
      } else if (m2) {
        rawXml = m2[0];
        break;
      }
    }
  }

  // 3. Extract all image tags
  const images = [];
  const symbolImageMap = {};

  for (const tag of tags) {
    // Tag 35: DefineBitsJPEG3 (JPEG + Alpha Channel)
    if (tag.tagType === 35) {
      if (tag.data.length < 6) continue;
      const charId = tag.data.readUInt16LE(0);
      const alphaOffset = tag.data.readUInt32LE(2);
      const jpegData = tag.data.subarray(6, 6 + alphaOffset);
      const alphaData = tag.data.subarray(6 + alphaOffset);

      const symName = symbols[charId] || null;
      let ext = (alphaData && alphaData.length > 0) ? 'png' : 'jpg';
      let fileName = symName ? `${charId}_${symName}.${ext}` : `${charId}.${ext}`;

      let imgBuffer = null;
      let width = 0;
      let height = 0;

      if (alphaData && alphaData.length > 0) {
        try {
          const rawJpeg = jpeg.decode(jpegData, { useTArray: true });
          width = rawJpeg.width;
          height = rawJpeg.height;
          const alphaUncompressed = zlib.inflateSync(alphaData);
          
          const rgba = Buffer.from(rawJpeg.data);
          const pixelCount = Math.min(width * height, alphaUncompressed.length);
          for (let i = 0; i < pixelCount; i++) {
            rgba[i * 4 + 3] = alphaUncompressed[i];
          }

          imgBuffer = encodePNG(width, height, rgba);
        } catch (err) {
          imgBuffer = jpegData;
          ext = 'jpg';
          fileName = symName ? `${charId}_${symName}.${ext}` : `${charId}.${ext}`;
        }
      } else {
        imgBuffer = jpegData;
      }

      images.push({
        charId,
        symName,
        fileName,
        ext,
        width,
        height,
        data: imgBuffer
      });

      symbolImageMap[charId] = fileName;
      if (symName) symbolImageMap[symName] = fileName;
    }
    // Tag 21: DefineBitsJPEG2
    else if (tag.tagType === 21) {
      if (tag.data.length < 2) continue;
      const charId = tag.data.readUInt16LE(0);
      const imgData = tag.data.subarray(2);
      let ext = 'jpg';
      if (imgData.length > 8 && imgData[0] === 0x89 && imgData[1] === 0x50 && imgData[2] === 0x4E) {
        ext = 'png';
      }

      const symName = symbols[charId] || null;
      const fileName = symName ? `${charId}_${symName}.${ext}` : `${charId}.${ext}`;

      images.push({
        charId,
        symName,
        fileName,
        ext,
        data: imgData
      });

      symbolImageMap[charId] = fileName;
      if (symName) symbolImageMap[symName] = fileName;
    }
    // Tag 20 / 36: DefineBitsLossless / DefineBitsLossless2
    else if (tag.tagType === 20 || tag.tagType === 36) {
      if (tag.data.length < 7) continue;
      const charId = tag.data.readUInt16LE(0);
      const format = tag.data[2];
      const width = tag.data.readUInt16LE(3);
      const height = tag.data.readUInt16LE(5);
      const zlibData = tag.data.subarray(tag.tagType === 20 ? 7 : (format === 3 ? 8 : 7));

      try {
        const uncompressed = zlib.inflateSync(zlibData);
        if (format === 5) {
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
          const pngData = encodePNG(width, height, rgba);
          const symName = symbols[charId] || null;
          const fileName = symName ? `${charId}_${symName}.png` : `${charId}.png`;

          images.push({
            charId,
            symName,
            fileName,
            ext: 'png',
            width,
            height,
            data: pngData
          });

          symbolImageMap[charId] = fileName;
          if (symName) symbolImageMap[symName] = fileName;
        }
      } catch (err) {}
    }
    // Tag 6: DefineBitsJPEG + JPEGTables
    else if (tag.tagType === 6) {
      if (tag.data.length < 2) continue;
      const charId = tag.data.readUInt16LE(0);
      const rawJpeg = tag.data.subarray(2);
      let finalJpeg = rawJpeg;
      if (jpegTables && jpegTables.length > 0) {
        finalJpeg = Buffer.concat([
          jpegTables.subarray(0, jpegTables.length - 2),
          rawJpeg.subarray(2)
        ]);
      }
      const symName = symbols[charId] || null;
      const fileName = symName ? `${charId}_${symName}.jpg` : `${charId}.jpg`;

      images.push({
        charId,
        symName,
        fileName,
        ext: 'jpg',
        data: finalJpeg
      });

      symbolImageMap[charId] = fileName;
      if (symName) symbolImageMap[symName] = fileName;
    }
  }

  // 4. Parse XML to Model JSON
  const isModel = !!(rawXml || (images.length > 1 && Object.keys(symbols).length > 1));
  let modelJson = null;
  if (rawXml) {
    modelJson = parseModelXmlToJson(rawXml, modelName, symbolImageMap);
  }

  // 5. Generate ActionScript code
  let asCode = null;
  if (rawXml) {
    asCode = `package\n{\n   import flash.display.MovieClip;\n   \n   public class ${modelName} extends MovieClip\n   {\n      public static const X_M_L:XML = ${rawXml};\n   }\n}\n`;
  }

  return {
    isModel,
    modelName,
    symbols,
    rawXml,
    modelJson,
    asCode,
    images,
    decodedSwf: swfBuffer
  };
}
