/**
 * TSE & TSZE Decryption Module for Võ Lâm Chi Mộng (VLCM)
 * Key parameters extracted from client LoadingUISwf / CodeMixer:
 * KEY_A = 121 (0x79)
 * COUNT_B = 39
 * SKIP_C = 297
 */

import zlib from 'node:zlib';

export const KEY_A = 121;
export const COUNT_B = 39;
export const SKIP_C = 297;

/**
 * Core byte decryption algorithm
 * Matches CodeMixer.decodeBytes exactly
 */
export function decodeBytes(data, a = KEY_A, b = COUNT_B, c = SKIP_C) {
  if (!data || data.length === 0) return data;
  const out = Buffer.from(data);
  const len = out.length;
  let i = 0;
  while (i < len) {
    for (let k = 0; k < b; k++) {
      out[i] ^= a;
      i++;
      if (i >= len) return out;
    }
    i += c;
  }
  return out;
}

/**
 * Decodes a .tse file buffer into a standard .swf file buffer
 */
export function decodeTSEBuffer(rawBuffer) {
  return decodeBytes(rawBuffer, KEY_A, COUNT_B, SKIP_C);
}

/**
 * Decodes a .tsze file buffer into a standard .xml file buffer
 * Handles both zipped tsze (PK\x03\x04 container) and raw encrypted XML
 */
export function decodeTSZEBuffer(rawBuffer) {
  if (!rawBuffer || rawBuffer.length < 4) return rawBuffer;

  // Check if it's a zip archive (starts with PK\x03\x04)
  if (rawBuffer[0] === 0x50 && rawBuffer[1] === 0x4B && rawBuffer[2] === 0x03 && rawBuffer[3] === 0x04) {
    try {
      const fnLen = rawBuffer.readUInt16LE(26);
      const extraLen = rawBuffer.readUInt16LE(28);
      const compMethod = rawBuffer.readUInt16LE(8);
      const compSize = rawBuffer.readUInt32LE(18);
      const dataOffset = 30 + fnLen + extraLen;
      const compData = rawBuffer.subarray(dataOffset, dataOffset + compSize);
      
      const uncomp = compMethod === 8 ? zlib.inflateRawSync(compData) : compData;
      return decodeBytes(uncomp, KEY_A, COUNT_B, SKIP_C);
    } catch (err) {
      // If zip parsing fails, fallback to direct decode
    }
  }

  return decodeBytes(rawBuffer, KEY_A, COUNT_B, SKIP_C);
}

/**
 * Detects whether a buffer is SWF, TSE, TSZE, or standard
 */
export function detectFileType(buffer) {
  if (!buffer || buffer.length < 4) return 'unknown';

  const sig = buffer.slice(0, 3).toString('ascii');
  if (sig === 'CWS' || sig === 'FWS' || sig === 'ZWS') return 'swf';

  if (buffer[0] === 0x50 && buffer[1] === 0x4B && buffer[2] === 0x03 && buffer[3] === 0x04) {
    return 'tsze_or_zip';
  }

  // Check if decoding reveals SWF signature
  const dec = decodeBytes(buffer.subarray(0, 32));
  const decSig = dec.slice(0, 3).toString('ascii');
  if (decSig === 'CWS' || decSig === 'FWS' || decSig === 'ZWS') {
    return 'tse';
  }

  return 'other';
}
