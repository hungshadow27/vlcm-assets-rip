import fs from 'node:fs';
import path from 'node:path';
import { decodeTSEBuffer, decodeTSZEBuffer } from './decoder.js';
import { convertSWFToImages } from './swf_converter.js';

export class AssetDownloader {
  constructor(options = {}) {
    this.cdnBase = options.cdnBase || 'https://cdn-mct.tepaylink.vn/eflashdir0918/';
    if (!this.cdnBase.endsWith('/')) this.cdnBase += '/';
    
    this.outputDir = options.outputDir || path.resolve('output_assets');
    this.concurrency = options.concurrency || 16;
    this.convertSwfToImages = options.convertSwfToImages !== false; // default true
    this.saveOriginalSwf = options.saveOriginalSwf || false;
    this.saveAsCode = options.saveAsCode !== false; // default true, saves .as class definition
    this.overwrite = options.overwrite || false;
    
    this.status = 'idle'; // 'idle', 'running', 'paused', 'stopped', 'completed'
    this.queue = [];
    this.activeWorkers = 0;
    this.index = 0;

    this.stats = {
      total: 0,
      downloaded: 0,
      skipped: 0,
      failed: 0,
      converted: 0,
      models: 0,
      bytes: 0,
      startTime: 0,
      endTime: 0
    };

    this.listeners = new Set();
    this.logs = [];
  }

  onProgress(fn) {
    this.listeners.add(fn);
  }

  offProgress(fn) {
    this.listeners.delete(fn);
  }

  notify(event, data) {
    for (const fn of this.listeners) {
      try {
        fn(event, data, this.getSnapshot());
      } catch (e) {
        console.error('Listener error:', e);
      }
    }
  }

  log(msg, type = 'info') {
    const entry = { time: new Date().toLocaleTimeString(), msg, type };
    this.logs.push(entry);
    if (this.logs.length > 500) this.logs.shift();
    this.notify('log', entry);
  }

  getSnapshot() {
    const elapsedSec = this.stats.startTime > 0 
      ? ((this.status === 'completed' ? this.stats.endTime : Date.now()) - this.stats.startTime) / 1000 
      : 0;
    
    const speedBytes = elapsedSec > 0 ? (this.stats.bytes / elapsedSec) : 0;
    const speedFiles = elapsedSec > 0 ? ((this.stats.downloaded + this.stats.skipped) / elapsedSec) : 0;

    return {
      status: this.status,
      cdnBase: this.cdnBase,
      outputDir: this.outputDir,
      concurrency: this.concurrency,
      convertSwfToImages: this.convertSwfToImages,
      saveOriginalSwf: this.saveOriginalSwf,
      stats: {
        ...this.stats,
        elapsedSec: Math.round(elapsedSec),
        speedMB: (speedBytes / (1024 * 1024)).toFixed(2),
        speedFiles: speedFiles.toFixed(1),
        percent: this.stats.total > 0 
          ? (((this.stats.downloaded + this.stats.skipped + this.stats.failed) / this.stats.total) * 100).toFixed(1) 
          : 0
      },
      activeWorkers: this.activeWorkers,
      recentLogs: this.logs.slice(-30)
    };
  }

  setAssetList(assetList) {
    this.queue = Array.from(new Set(assetList));
    this.stats.total = this.queue.length;
    this.stats.downloaded = 0;
    this.stats.skipped = 0;
    this.stats.failed = 0;
    this.stats.converted = 0;
    this.stats.models = 0;
    this.stats.bytes = 0;
    this.index = 0;
  }

  async start() {
    if (this.status === 'running') return;
    this.status = 'running';
    if (!this.stats.startTime) this.stats.startTime = Date.now();
    this.log(`Bắt đầu tải ${this.stats.total} assets từ CDN: ${this.cdnBase} (Luồng: ${this.concurrency})`);

    const workers = [];
    for (let i = 0; i < this.concurrency; i++) {
      workers.push(this.worker());
    }

    await Promise.all(workers);

    if (this.status === 'running') {
      this.status = 'completed';
      this.stats.endTime = Date.now();
      this.log(`Hoàn thành tải toàn bộ! Đã tải: ${this.stats.downloaded}, Models: ${this.stats.models}, Bỏ qua: ${this.stats.skipped}, Lỗi: ${this.stats.failed}, Chuyển đổi: ${this.stats.converted}`);
      this.notify('completed', this.getSnapshot());
    }
  }

  pause() {
    if (this.status === 'running') {
      this.status = 'paused';
      this.log('Đã tạm dừng tải');
      this.notify('paused', this.getSnapshot());
    }
  }

  resume() {
    if (this.status === 'paused') {
      this.status = 'running';
      this.log('Tiếp tục tải...');
      this.notify('resumed', this.getSnapshot());
      for (let i = 0; i < this.concurrency; i++) {
        this.worker();
      }
    }
  }

  stop() {
    this.status = 'stopped';
    this.log('Đã dừng tải');
    this.notify('stopped', this.getSnapshot());
  }

  async worker() {
    this.activeWorkers++;
    while (this.status === 'running' && this.index < this.queue.length) {
      const currentIdx = this.index++;
      const relativePath = this.queue[currentIdx];
      await this.downloadSingleAsset(relativePath);
    }
    this.activeWorkers--;
  }

  async downloadSingleAsset(relPath) {
    const fullUrl = this.cdnBase + relPath;
    const targetPath = path.join(this.outputDir, relPath);
    const targetDir = path.dirname(targetPath);
    const ext = path.extname(relPath).toLowerCase();
    const baseName = path.basename(relPath, ext);

    const isTSE = ext === '.tse';
    const isSWF = ext === '.swf';
    const isTSZE = ext === '.tsze';

    // Model folder check (if model already exists)
    const modelDir = path.join(targetDir, baseName);
    const modelJsonPath = path.join(modelDir, `${baseName}.json`);
    const singlePngPath = path.join(targetDir, `${baseName}.png`);
    const singleJpgPath = path.join(targetDir, `${baseName}.jpg`);
    const xmlPath = targetPath.replace(/\.tsze$/i, '.xml');

    if (!this.overwrite) {
      if (fs.existsSync(modelJsonPath)) {
        this.stats.skipped++;
        this.notify('skip', { relPath });
        return;
      }
      if (isTSZE && fs.existsSync(xmlPath)) {
        this.stats.skipped++;
        this.notify('skip', { relPath });
        return;
      }
      if ((isTSE || isSWF) && (fs.existsSync(singlePngPath) || fs.existsSync(singleJpgPath))) {
        this.stats.skipped++;
        this.notify('skip', { relPath });
        return;
      }
      if (!isTSE && !isSWF && !isTSZE && fs.existsSync(targetPath)) {
        this.stats.skipped++;
        this.notify('skip', { relPath });
        return;
      }
    }

    try {
      const response = await fetch(fullUrl, {
        headers: { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' }
      });

      if (!response.ok) {
        this.stats.failed++;
        if (response.status !== 404) {
          this.log(`HTTP ${response.status}: ${relPath}`, 'warn');
        }
        this.notify('fail', { relPath, status: response.status });
        return;
      }

      const buffer = Buffer.from(await response.arrayBuffer());
      this.stats.bytes += buffer.length;

      // Ensure target directory exists
      if (!fs.existsSync(targetDir)) {
        fs.mkdirSync(targetDir, { recursive: true });
      }

      // 1. Process .tsze (Encrypted XML)
      if (isTSZE) {
        try {
          const decodedXml = decodeTSZEBuffer(buffer);
          fs.writeFileSync(xmlPath, decodedXml);
          this.stats.downloaded++;
          this.stats.converted++;
          this.notify('download', { relPath, converted: true, outPath: xmlPath });
          return;
        } catch (err) {
          fs.writeFileSync(targetPath, buffer);
          this.stats.downloaded++;
          this.notify('download', { relPath, converted: false });
          return;
        }
      }

      // 2. Process .tse or .swf (Models, Skins, UI)
      if (this.convertSwfToImages && (isTSE || isSWF)) {
        try {
          const convResult = convertSWFToImages(buffer, isTSE, baseName);
          const { isModel, modelJson, asCode, images, decodedSwf } = convResult;

          // Case A: Model with Action XML or multiple action symbols
          if (isModel && (modelJson || images.length > 1)) {
            if (!fs.existsSync(modelDir)) {
              fs.mkdirSync(modelDir, { recursive: true });
            }

            // Save Model JSON
            if (modelJson) {
              fs.writeFileSync(path.join(modelDir, `${baseName}.json`), JSON.stringify(modelJson, null, 2), 'utf8');
            }

            // Save ActionScript Code
            if (this.saveAsCode && asCode) {
              fs.writeFileSync(path.join(modelDir, `${baseName}.as`), asCode, 'utf8');
            }

            // Save all action sprite images (e.g. 1_mid151.walk.png, 2_mid151.stand.png)
            for (const img of images) {
              fs.writeFileSync(path.join(modelDir, img.fileName), img.data);
            }

            // Optionally save decrypted SWF
            if (this.saveOriginalSwf) {
              fs.writeFileSync(path.join(modelDir, `${baseName}.swf`), decodedSwf);
              if (isTSE) fs.writeFileSync(path.join(modelDir, `${baseName}.tse`), buffer);
            }

            this.stats.models++;
            this.stats.downloaded++;
            this.stats.converted += images.length;
            this.log(`Đã xuất model [${baseName}]: ${images.length} actions, tọa độ JSON -> ${modelDir}`, 'success');
            this.notify('download', { relPath, isModel: true, modelName: baseName, imageCount: images.length });
            return;
          }

          // Case B: Single UI component / Skin (like Group16.tse)
          if (images.length === 1) {
            const img = images[0];
            const outPath = path.join(targetDir, `${baseName}.${img.ext}`);
            fs.writeFileSync(outPath, img.data);

            if (this.saveOriginalSwf) {
              fs.writeFileSync(path.join(targetDir, `${baseName}.swf`), decodedSwf);
            }

            this.stats.downloaded++;
            this.stats.converted++;
            this.notify('download', { relPath, converted: true, outPath });
            return;
          }

          // Case C: Multiple images without XML
          if (images.length > 1) {
            if (!fs.existsSync(modelDir)) fs.mkdirSync(modelDir, { recursive: true });
            for (const img of images) {
              fs.writeFileSync(path.join(modelDir, img.fileName), img.data);
            }
            if (this.saveOriginalSwf) {
              fs.writeFileSync(path.join(modelDir, `${baseName}.swf`), decodedSwf);
            }
            this.stats.downloaded++;
            this.stats.converted += images.length;
            this.notify('download', { relPath, isModel: true, modelName: baseName });
            return;
          }

          // Fallback: save decrypted SWF if no image extracted
          fs.writeFileSync(targetPath.replace(/\.tse$/i, '.swf'), decodedSwf);
          this.stats.downloaded++;
          this.notify('download', { relPath, converted: false });
          return;

        } catch (convErr) {
          // If SWF conversion fails, fallback to saving decrypted SWF or raw buffer
          if (isTSE) {
            try {
              const dec = decodeTSEBuffer(buffer);
              fs.writeFileSync(targetPath.replace(/\.tse$/i, '.swf'), dec);
            } catch (e) {
              fs.writeFileSync(targetPath, buffer);
            }
          } else {
            fs.writeFileSync(targetPath, buffer);
          }
          this.stats.downloaded++;
          this.notify('download', { relPath, converted: false });
          return;
        }
      }

      // 3. Direct file (.png, .jpg, .mp3, etc.)
      fs.writeFileSync(targetPath, buffer);
      this.stats.downloaded++;
      this.notify('download', { relPath, converted: false });

    } catch (err) {
      this.stats.failed++;
      this.log(`Lỗi tải ${relPath}: ${err.message}`, 'error');
      this.notify('fail', { relPath, error: err.message });
    }
  }
}
