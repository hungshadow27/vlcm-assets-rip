import http from 'node:http';
import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { scanAllAssets } from './scanner.js';
import { AssetDownloader } from './downloader.js';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, '..', '..');
const manifestPath = path.join(__dirname, '..', 'manifest.json');
const publicDir = path.join(__dirname, '..', 'public');
const defaultOutputDir = path.join(projectRoot, 'output_assets');

let manifest = null;
if (fs.existsSync(manifestPath)) {
  try {
    manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
  } catch (e) {}
}

const downloader = new AssetDownloader({
  cdnBase: 'https://cdn-mct.tepaylink.vn/eflashdir0918/',
  outputDir: defaultOutputDir,
  concurrency: 16,
  convertSwfToImages: true,
  saveOriginalSwf: false
});

// SSE Client connections
const sseClients = new Set();

downloader.onProgress((event, data, snapshot) => {
  const payload = `data: ${JSON.stringify({ event, data, snapshot })}\n\n`;
  for (const client of sseClients) {
    client.write(payload);
  }
});

function sendJson(res, statusCode, data) {
  res.writeHead(statusCode, {
    'Content-Type': 'application/json; charset=utf-8',
    'Access-Control-Allow-Origin': '*'
  });
  res.end(JSON.stringify(data));
}

function parseBody(req) {
  return new Promise((resolve) => {
    let body = '';
    req.on('data', chunk => body += chunk);
    req.on('end', () => {
      try {
        resolve(body ? JSON.parse(body) : {});
      } catch (e) {
        resolve({});
      }
    });
  });
}

const server = http.createServer(async (req, res) => {
  const url = new URL(req.url, `http://${req.headers.host}`);
  const pathname = url.pathname;

  // Static files
  if (req.method === 'GET' && (pathname === '/' || pathname === '/index.html')) {
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
    return res.end(fs.readFileSync(path.join(publicDir, 'index.html')));
  }
  if (req.method === 'GET' && pathname === '/style.css') {
    res.writeHead(200, { 'Content-Type': 'text/css; charset=utf-8' });
    return res.end(fs.readFileSync(path.join(publicDir, 'style.css')));
  }
  if (req.method === 'GET' && pathname === '/app.js') {
    res.writeHead(200, { 'Content-Type': 'application/javascript; charset=utf-8' });
    return res.end(fs.readFileSync(path.join(publicDir, 'app.js')));
  }

  // SSE Stream
  if (req.method === 'GET' && pathname === '/api/stream') {
    res.writeHead(200, {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache',
      'Connection': 'keep-alive',
      'Access-Control-Allow-Origin': '*'
    });
    res.write(`data: ${JSON.stringify({ event: 'init', snapshot: downloader.getSnapshot() })}\n\n`);
    sseClients.add(res);
    req.on('close', () => sseClients.delete(res));
    return;
  }

  // API Status & Manifest
  if (req.method === 'GET' && pathname === '/api/status') {
    return sendJson(res, 200, {
      downloader: downloader.getSnapshot(),
      manifestSummary: manifest ? {
        total: manifest.total,
        categories: Object.fromEntries(
          Object.entries(manifest.categories).map(([k, v]) => [k, v.length])
        )
      } : null
    });
  }

  // API Scan
  if (req.method === 'POST' && pathname === '/api/scan') {
    try {
      const body = await parseBody(req);
      const program = body.program || 'program526';
      manifest = scanAllAssets(projectRoot, { program });
      fs.writeFileSync(manifestPath, JSON.stringify(manifest, null, 2), 'utf8');
      return sendJson(res, 200, {
        success: true,
        program,
        total: manifest.total,
        categories: Object.fromEntries(
          Object.entries(manifest.categories).map(([k, v]) => [k, v.length])
        )
      });
    } catch (err) {
      return sendJson(res, 500, { success: false, error: err.message });
    }
  }

  // API Download Start
  if (req.method === 'POST' && pathname === '/api/download/start') {
    const body = await parseBody(req);
    const program = body.program || 'program526';
    
    if (!manifest || (body.program && manifest.allAssets && !manifest.allAssets.some(a => a.startsWith(program + '/')))) {
      manifest = scanAllAssets(projectRoot, { program });
      fs.writeFileSync(manifestPath, JSON.stringify(manifest, null, 2), 'utf8');
    }

    if (body.cdnBase) downloader.cdnBase = body.cdnBase.endsWith('/') ? body.cdnBase : body.cdnBase + '/';
    if (body.concurrency) downloader.concurrency = parseInt(body.concurrency, 10);
    if (body.convertSwfToImages !== undefined) downloader.convertSwfToImages = !!body.convertSwfToImages;
    if (body.saveOriginalSwf !== undefined) downloader.saveOriginalSwf = !!body.saveOriginalSwf;
    if (body.outputDir) downloader.outputDir = path.resolve(body.outputDir);

    let list = manifest.allAssets;
    if (body.category && manifest.categories[body.category]) {
      list = manifest.categories[body.category];
    }

    downloader.setAssetList(list);
    downloader.start(); // runs asynchronously

    return sendJson(res, 200, { success: true, message: 'Đã bắt đầu tải', total: list.length });
  }

  // API Pause
  if (req.method === 'POST' && pathname === '/api/download/pause') {
    downloader.pause();
    return sendJson(res, 200, { success: true });
  }

  // API Resume
  if (req.method === 'POST' && pathname === '/api/download/resume') {
    downloader.resume();
    return sendJson(res, 200, { success: true });
  }

  // API Stop
  if (req.method === 'POST' && pathname === '/api/download/stop') {
    downloader.stop();
    return sendJson(res, 200, { success: true });
  }

  // API Gallery List
  if (req.method === 'GET' && pathname === '/api/gallery') {
    const outDir = downloader.outputDir;
    const items = [];

    function findImages(dir, count = 0) {
      if (!fs.existsSync(dir) || count > 200) return count;
      const entries = fs.readdirSync(dir, { withFileTypes: true });
      for (const entry of entries) {
        const full = path.join(dir, entry.name);
        if (entry.isDirectory()) {
          count = findImages(full, count);
        } else if (/\.(png|jpg|jpeg)$/i.test(entry.name)) {
          const rel = path.relative(outDir, full).replace(/\\/g, '/');
          items.push({
            name: entry.name,
            relPath: rel,
            size: fs.statSync(full).size
          });
          count++;
          if (count >= 200) break;
        }
      }
      return count;
    }

    findImages(outDir);
    return sendJson(res, 200, { items: items.slice(0, 100) });
  }

  // API Models List (Avatar / Effect Models with JSON coordinates)
  if (req.method === 'GET' && pathname === '/api/models') {
    const outDir = downloader.outputDir;
    const models = [];

    function findModels(dir) {
      if (!fs.existsSync(dir) || models.length >= 100) return;
      const entries = fs.readdirSync(dir, { withFileTypes: true });
      for (const entry of entries) {
        const full = path.join(dir, entry.name);
        if (entry.isDirectory()) {
          const jsonFile = path.join(full, `${entry.name}.json`);
          if (fs.existsSync(jsonFile)) {
            try {
              const data = JSON.parse(fs.readFileSync(jsonFile, 'utf8'));
              const allFiles = fs.readdirSync(full);
              const imgFiles = allFiles.filter(f => /\.(png|jpg|jpeg)$/i.test(f)).map(f => ({
                name: f,
                relPath: path.relative(outDir, path.join(full, f)).replace(/\\/g, '/')
              }));
              models.push({
                name: entry.name,
                relDir: path.relative(outDir, full).replace(/\\/g, '/'),
                totalActions: data.totalActions || Object.keys(data.actions || {}).length,
                actions: Object.keys(data.actions || {}),
                images: imgFiles,
                jsonRelPath: path.relative(outDir, jsonFile).replace(/\\/g, '/')
              });
            } catch (e) {}
          } else {
            findModels(full);
          }
        }
      }
    }

    findModels(outDir);
    return sendJson(res, 200, { models });
  }

  // API Serve File
  if (req.method === 'GET' && pathname === '/api/file') {
    const rel = url.searchParams.get('path');
    if (!rel) return sendJson(res, 400, { error: 'Missing path' });
    const full = path.join(downloader.outputDir, rel);
    if (!fs.existsSync(full) || !full.startsWith(downloader.outputDir)) {
      return sendJson(res, 404, { error: 'File not found' });
    }
    const ext = path.extname(full).toLowerCase();
    const mimeTypes = {
      '.png': 'image/png',
      '.jpg': 'image/jpeg',
      '.jpeg': 'image/jpeg',
      '.mp3': 'audio/mpeg',
      '.swf': 'application/x-shockwave-flash',
      '.json': 'application/json; charset=utf-8',
      '.xml': 'application/xml; charset=utf-8',
      '.as': 'text/plain; charset=utf-8'
    };
    res.writeHead(200, { 'Content-Type': mimeTypes[ext] || 'application/octet-stream' });
    return res.end(fs.readFileSync(full));
  }

  sendJson(res, 404, { error: 'Endpoint not found' });
});

const PORT = process.env.PORT || 3030;
server.listen(PORT, () => {
  console.log(`
==================================================================
  🚀 VLCM Asset Downloader Dashboard đã khởi chạy thành công!
  🌐 Truy cập Web UI tại: http://localhost:${PORT}
==================================================================
`);
});
