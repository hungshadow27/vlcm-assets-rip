import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { scanAllAssets } from './scanner.js';
import { AssetDownloader } from './downloader.js';
import { decodeTSEBuffer, decodeTSZEBuffer } from './decoder.js';
import { convertSWFToImages } from './swf_converter.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, '..', '..'); // scripts/

function parseArgs() {
  const args = process.argv.slice(2);
  const options = {
    command: args[0] || 'help',
    cdn: 'https://cdn-mct.tepaylink.vn/eflashdir0918/',
    output: path.join(projectRoot, 'output_assets'),
    concurrency: 16,
    convert: true,
    saveOriginal: false,
    saveAs: true,
    category: null,
    dir: null
  };

  for (let i = 0; i < args.length; i++) {
    const a = args[i];
    if (a === '--cdn' && args[i + 1]) options.cdn = args[++i];
    if (a === '--output' && args[i + 1]) options.output = path.resolve(args[++i]);
    if (a === '--dir' && args[i + 1]) options.dir = path.resolve(args[++i]);
    if (a === '--concurrency' && args[i + 1]) options.concurrency = parseInt(args[++i], 10);
    if (a === '--category' && args[i + 1]) options.category = args[++i];
    if (a === '--no-convert') options.convert = false;
    if (a === '--save-original') options.saveOriginal = true;
    if (a === '--no-as') options.saveAs = false;
  }

  return options;
}

function printHeader() {
  console.log(`
==================================================================
           ⚔️  VÕ LÂM CHI MỘNG - ASSET STUDIO & EXTRACTOR  ⚔️
==================================================================
  * Tự động quét mã nguồn ActionScript & UI Skin Game
  * Giải mã .tse / .tsze (CodeMixer Key: 121, Count: 39, Skip: 297)
  * Trích xuất Model Avatar/Effect: Tọa độ Frame -> .JSON + PNG
  * Tải đa luồng tự động phân chia thư mục chuẩn CDN
==================================================================
`);
}

async function runCli() {
  printHeader();
  const options = parseArgs();
  const manifestPath = path.join(__dirname, '..', 'manifest.json');

  // Lệnh 1: Quét mã nguồn
  if (options.command === 'scan') {
    console.log(`[+] Đang quét mã nguồn tại: ${projectRoot}`);
    const manifest = scanAllAssets(projectRoot);
    fs.writeFileSync(manifestPath, JSON.stringify(manifest, null, 2), 'utf8');
    console.log(`\n[✓] Đã lưu danh sách manifest (${manifest.total} assets) vào: ${manifestPath}`);
    return;
  }

  // Lệnh 2: Tải assets từ CDN
  if (options.command === 'download') {
    let manifest;
    if (fs.existsSync(manifestPath)) {
      manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
    } else {
      console.log(`[!] Chưa có file manifest, đang tự động quét mã nguồn trước...`);
      manifest = scanAllAssets(projectRoot);
      fs.writeFileSync(manifestPath, JSON.stringify(manifest, null, 2), 'utf8');
    }

    let assetList = manifest.allAssets;
    if (options.category && manifest.categories[options.category]) {
      assetList = manifest.categories[options.category];
      console.log(`[*] Đang lọc theo danh mục: ${options.category} (${assetList.length} assets)`);
    }

    console.log(`\n[*] Cấu hình tải:`);
    console.log(`  - CDN Base:          ${options.cdn}`);
    console.log(`  - Thư mục lưu:       ${options.output}`);
    console.log(`  - Số luồng tải:      ${options.concurrency}`);
    console.log(`  - Chuyển SWF/TSE:    ${options.convert ? 'BẬT (PNG/JPG + Model JSON)' : 'TẮT'}`);
    console.log(`  - Lưu bản gốc SWF:   ${options.saveOriginal ? 'BẬT' : 'TẮT'}`);
    console.log(`  - Lưu mã nguồn .AS:  ${options.saveAs ? 'BẬT' : 'TẮT'}`);
    console.log(`  - Tổng số file:      ${assetList.length}`);
    console.log(`------------------------------------------------------------------\n`);

    const downloader = new AssetDownloader({
      cdnBase: options.cdn,
      outputDir: options.output,
      concurrency: options.concurrency,
      convertSwfToImages: options.convert,
      saveOriginalSwf: options.saveOriginal,
      saveAsCode: options.saveAs
    });

    downloader.setAssetList(assetList);

    let lastPrint = 0;
    downloader.onProgress((event, data, snapshot) => {
      const now = Date.now();
      if (now - lastPrint > 250 || snapshot.status === 'completed') {
        lastPrint = now;
        const s = snapshot.stats;
        process.stdout.write(
          `\r[Tiến độ: ${s.percent}%] Tải: ${s.downloaded} | Models: ${s.models} | Bỏ qua: ${s.skipped} | Lỗi: ${s.failed} | Tốc độ: ${s.speedMB} MB/s (${s.speedFiles} file/s) `
        );
      }
    });

    await downloader.start();
    console.log(`\n\n[✓] Quá trình tải hoàn tất! Dữ liệu đã lưu tại: ${options.output}\n`);
    return;
  }

  // Lệnh 3: Chuyển đổi file cục bộ (.tse / .swf / .tsze)
  if (options.command === 'convert-local') {
    const targetDir = options.dir || options.output;
    console.log(`[*] Đang quét và chuyển đổi các file cục bộ trong: ${targetDir}`);
    if (!fs.existsSync(targetDir)) {
      console.log(`[!] Thư mục không tồn tại: ${targetDir}`);
      return;
    }

    function getAllConvertibleFiles(d, list = []) {
      for (const e of fs.readdirSync(d, { withFileTypes: true })) {
        const p = path.join(d, e.name);
        if (e.isDirectory()) {
          getAllConvertibleFiles(p, list);
        } else if (/\.(tse|swf|tsze)$/i.test(e.name)) {
          list.push(p);
        }
      }
      return list;
    }

    const files = getAllConvertibleFiles(targetDir);
    console.log(`[*] Tìm thấy ${files.length} file (.tse, .swf, .tsze) cần xử lý.`);

    let convertedModels = 0;
    let convertedImages = 0;
    let convertedXml = 0;

    for (const f of files) {
      const ext = path.extname(f).toLowerCase();
      const baseName = path.basename(f, ext);
      const parentDir = path.dirname(f);
      const buf = fs.readFileSync(f);

      // Handle .tsze
      if (ext === '.tsze') {
        try {
          const xmlData = decodeTSZEBuffer(buf);
          const outXml = path.join(parentDir, `${baseName}.xml`);
          fs.writeFileSync(outXml, xmlData);
          convertedXml++;
          console.log(`[XML] Đã giải mã: ${baseName}.tsze -> ${baseName}.xml`);
        } catch (e) {
          console.error(`[Lỗi] Không thể giải mã ${f}: ${e.message}`);
        }
        continue;
      }

      // Handle .tse and .swf
      try {
        const isTSE = ext === '.tse';
        const result = convertSWFToImages(buf, isTSE, baseName);
        const { isModel, modelJson, asCode, images, decodedSwf } = result;

        if (isModel && (modelJson || images.length > 1)) {
          const modelFolder = path.join(parentDir, baseName);
          if (!fs.existsSync(modelFolder)) fs.mkdirSync(modelFolder, { recursive: true });

          if (modelJson) {
            fs.writeFileSync(path.join(modelFolder, `${baseName}.json`), JSON.stringify(modelJson, null, 2), 'utf8');
          }
          if (options.saveAs && asCode) {
            fs.writeFileSync(path.join(modelFolder, `${baseName}.as`), asCode, 'utf8');
          }
          for (const img of images) {
            fs.writeFileSync(path.join(modelFolder, img.fileName), img.data);
          }
          if (options.saveOriginal) {
            fs.writeFileSync(path.join(modelFolder, `${baseName}.swf`), decodedSwf);
          }

          convertedModels++;
          convertedImages += images.length;
          console.log(`[MODEL] ${baseName}: ${images.length} actions -> thư mục ${baseName}/ (có ${baseName}.json)`);
        } else if (images.length === 1) {
          const outImg = path.join(parentDir, `${baseName}.${images[0].ext}`);
          fs.writeFileSync(outImg, images[0].data);
          convertedImages++;
        }
      } catch (err) {
        console.error(`[Lỗi] Lỗi xử lý ${f}: ${err.message}`);
      }
    }

    console.log(`\n[✓] Hoàn tất chuyển đổi cục bộ:`);
    console.log(`  - Models tạo mới: ${convertedModels} thư mục`);
    console.log(`  - Ảnh xuất ra:    ${convertedImages} file (.png/.jpg)`);
    console.log(`  - File XML:       ${convertedXml} file`);
    return;
  }

  // Help
  console.log(`
Các lệnh có sẵn:
  1. node src/cli.js scan
     Quét toàn bộ mã nguồn ActionScript & tạo danh sách manifest.json

  2. node src/cli.js download [--cdn <url>] [--output <dir>] [--concurrency <num>] [--category <name>]
     Tải toàn bộ assets từ CDN, tự động giải mã .tse/.tsze, xuất model folder (.json + pngs)

  3. node src/cli.js convert-local [--dir <folder>]
     Chuyển đổi toàn bộ các tệp .tse / .swf / .tsze có sẵn trong một thư mục cục bộ

  4. npm start (hoặc node src/server.js)
     Khởi chạy Giao diện Web Dashboard Trực quan để quản lý, xem mô hình & tải assets
`);
}

runCli();
