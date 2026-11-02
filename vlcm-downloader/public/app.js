document.addEventListener('DOMContentLoaded', () => {
  // DOM Elements
  const statTotal = document.getElementById('stat-total');
  const statDownloaded = document.getElementById('stat-downloaded');
  const statConverted = document.getElementById('stat-converted');
  const statSpeed = document.getElementById('stat-speed');
  const statSkipped = document.getElementById('stat-skipped');
  const statFailed = document.getElementById('stat-failed');
  const statElapsed = document.getElementById('stat-elapsed');

  const progressBar = document.getElementById('progress-bar-fill');
  const progressPercent = document.getElementById('progress-percent');
  const terminalWindow = document.getElementById('terminal-window');
  const categoryChips = document.getElementById('category-chips');

  const cdnUrlInput = document.getElementById('cdn-url');
  const programInput = document.getElementById('program-version');
  const categoryFilter = document.getElementById('category-filter');
  const optSkin = document.getElementById('opt-skin');
  const concurrencyRange = document.getElementById('concurrency-range');
  const concurrencyVal = document.getElementById('concurrency-val');
  const chkConvert = document.getElementById('chk-convert');
  const chkSaveOriginal = document.getElementById('chk-save-original');

  const btnScan = document.getElementById('btn-scan');
  const btnStart = document.getElementById('btn-start');
  const btnPause = document.getElementById('btn-pause');
  const btnStop = document.getElementById('btn-stop');
  const btnClearLog = document.getElementById('btn-clear-log');
  const btnRefreshGallery = document.getElementById('btn-refresh-gallery');
  const galleryGrid = document.getElementById('gallery-grid');
  const statusText = document.getElementById('status-text');

  if (programInput && optSkin) {
    programInput.addEventListener('input', () => {
      const p = programInput.value.trim() || 'program526';
      optSkin.textContent = `Giao diện Skin (${p}/skin/)`;
    });
  }

  concurrencyRange.addEventListener('input', (e) => {
    concurrencyVal.textContent = e.target.value;
  });

  function addLog(msg, type = 'info') {
    const line = document.createElement('div');
    line.className = `log-line ${type}`;
    const time = new Date().toLocaleTimeString();
    line.textContent = `[${time}] ${msg}`;
    terminalWindow.appendChild(line);
    terminalWindow.scrollTop = terminalWindow.scrollHeight;
  }

  btnClearLog.addEventListener('click', () => {
    terminalWindow.innerHTML = '';
  });

  // Render category chips
  function renderCategories(categories) {
    if (!categories) return;
    categoryChips.innerHTML = '';
    const labels = {
      skin: 'Giao diện Skin',
      ui: 'UI & Buttons',
      avatar_clothes: 'Trang phục Avatar',
      avatar_effect: 'Hiệu ứng Effect',
      icon: 'Icon nhỏ (ico_jpg)',
      icon_big: 'Icon lớn (ico_big)',
      map: 'Bản đồ Maps',
      mc: 'MovieClip',
      sound: 'Âm thanh Sound',
      other: 'Khác'
    };

    for (const [k, count] of Object.entries(categories)) {
      if (count === 0) continue;
      const chip = document.createElement('div');
      chip.className = 'chip';
      chip.innerHTML = `${labels[k] || k}: <b>${count.toLocaleString()}</b>`;
      categoryChips.appendChild(chip);
    }
  }

  // Update UI from Snapshot
  function updateSnapshot(snapshot) {
    if (!snapshot) return;
    const s = snapshot.stats;

    statTotal.textContent = s.total.toLocaleString();
    statDownloaded.textContent = s.downloaded.toLocaleString();
    statConverted.textContent = s.converted.toLocaleString();
    statSpeed.textContent = `${s.speedMB} MB/s (${s.speedFiles} f/s)`;
    statSkipped.textContent = s.skipped.toLocaleString();
    statFailed.textContent = s.failed.toLocaleString();
    statElapsed.textContent = `${s.elapsedSec}s`;

    progressBar.style.width = `${s.percent}%`;
    progressPercent.textContent = `${s.percent}%`;

    statusText.textContent = snapshot.status === 'running' ? 'Đang tải dữ liệu...'
      : snapshot.status === 'paused' ? 'Đã tạm dừng'
      : snapshot.status === 'completed' ? 'Đã hoàn thành'
      : 'Sẵn sàng';

    btnStart.disabled = snapshot.status === 'running';
    btnPause.disabled = snapshot.status !== 'running';
    btnStop.disabled = snapshot.status !== 'running' && snapshot.status !== 'paused';
    btnPause.textContent = snapshot.status === 'paused' ? '▶️ Tiếp tục' : '⏸️ Tạm dừng';
  }

  // Connect SSE
  function connectSSE() {
    const sse = new EventSource('/api/stream');
    sse.onopen = () => {
      statusText.textContent = 'Đã kết nối Server';
    };
    sse.onmessage = (e) => {
      try {
        const payload = JSON.parse(e.data);
        if (payload.snapshot) {
          updateSnapshot(payload.snapshot);
        }
        if (payload.event === 'log' && payload.data) {
          addLog(payload.data.msg, payload.data.type);
        }
        if (payload.event === 'completed') {
          addLog('Tất cả assets đã được tải thành công!', 'success');
          loadGallery();
          loadModels();
        }
      } catch (err) {
        console.error('SSE parse error:', err);
      }
    };
    sse.onerror = () => {
      statusText.textContent = 'Mất kết nối, đang thử lại...';
      setTimeout(connectSSE, 3000);
    };
  }

  // Initial Status fetch
  async function loadInitialStatus() {
    try {
      const res = await fetch('/api/status');
      const data = await res.json();
      if (data.downloader) updateSnapshot(data.downloader);
      if (data.manifestSummary) {
        statTotal.textContent = data.manifestSummary.total.toLocaleString();
        renderCategories(data.manifestSummary.categories);
      }
    } catch (e) {
      addLog(`Lỗi nạp trạng thái: ${e.message}`, 'error');
    }
  }

  // Gallery Fetch
  async function loadGallery() {
    try {
      const res = await fetch('/api/gallery');
      const data = await res.json();
      if (!data.items || data.items.length === 0) {
        galleryGrid.innerHTML = '<div class="gallery-empty">Chưa có hình ảnh nào được tải.</div>';
        return;
      }

      galleryGrid.innerHTML = '';
      for (const item of data.items) {
        const card = document.createElement('div');
        card.className = 'gallery-card';
        card.innerHTML = `
          <div class="gallery-thumb-container">
            <img class="gallery-thumb" src="/api/file?path=${encodeURIComponent(item.relPath)}" alt="${item.name}" loading="lazy">
          </div>
          <span class="gallery-name" title="${item.relPath}">${item.name}</span>
        `;
        galleryGrid.appendChild(card);
      }
    } catch (e) {
      console.error('Gallery load error:', e);
    }
  }

  // Models Studio Fetch
  const btnRefreshModels = document.getElementById('btn-refresh-models');
  const modelsGrid = document.getElementById('models-grid');

  async function loadModels() {
    try {
      const res = await fetch('/api/models');
      const data = await res.json();
      if (!data.models || data.models.length === 0) {
        modelsGrid.innerHTML = '<div class="gallery-empty">Chưa có model nào được tải. Khi tải các file mid*.tse, eid*.tse..., các model sẽ tự động xuất hiện ở đây cùng với file JSON toạ độ!</div>';
        return;
      }

      modelsGrid.innerHTML = '';
      for (const m of data.models) {
        const card = document.createElement('div');
        card.className = 'model-card';

        let thumbsHtml = '';
        if (m.images && m.images.length > 0) {
          thumbsHtml = `<div class="model-thumbs-row">` +
            m.images.slice(0, 8).map(img => `
              <div class="model-mini-thumb" title="${img.name}">
                <img src="/api/file?path=${encodeURIComponent(img.relPath)}" alt="${img.name}" loading="lazy">
              </div>
            `).join('') +
          `</div>`;
        }

        const actionsHtml = (m.actions || []).slice(0, 10).map(act =>
          `<span class="action-badge">${act}</span>`
        ).join('') + ((m.actions && m.actions.length > 10) ? `<span class="action-badge">+${m.actions.length - 10}</span>` : '');

        card.innerHTML = `
          <div class="model-card-header">
            <span class="model-name">🎭 ${m.name}</span>
            <span class="model-actions-count">${m.totalActions} hành động</span>
          </div>
          ${thumbsHtml}
          <div class="model-actions-list">
            ${actionsHtml}
          </div>
          <div class="model-footer">
            <span style="font-size: 0.72rem; color: var(--text-muted);">${m.relDir}</span>
            <a href="/api/file?path=${encodeURIComponent(m.jsonRelPath)}" target="_blank" title="Xem cấu trúc toạ độ frame JSON">📄 Xem ${m.name}.json</a>
          </div>
        `;
        modelsGrid.appendChild(card);
      }
    } catch (e) {
      console.error('Models load error:', e);
    }
  }

  if (btnRefreshModels) {
    btnRefreshModels.addEventListener('click', loadModels);
  }

  btnRefreshGallery.addEventListener('click', loadGallery);

  // Scan Action
  btnScan.addEventListener('click', async () => {
    btnScan.disabled = true;
    btnScan.textContent = '⏳ Đang quét...';
    const programVal = programInput ? (programInput.value.trim() || 'program526') : 'program526';
    addLog(`Bắt đầu quét lại mã nguồn ActionScript (program: ${programVal})...`, 'info');

    try {
      const res = await fetch('/api/scan', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ program: programVal })
      });
      const data = await res.json();
      if (data.success) {
        addLog(`Quét thành công! Tìm thấy ${data.total} assets.`, 'success');
        statTotal.textContent = data.total.toLocaleString();
        renderCategories(data.categories);
      } else {
        addLog(`Lỗi quét: ${data.error}`, 'error');
      }
    } catch (e) {
      addLog(`Lỗi kết nối khi quét: ${e.message}`, 'error');
    } finally {
      btnScan.disabled = false;
      btnScan.textContent = '🔍 Quét lại Source Code';
    }
  });

  // Start Download
  btnStart.addEventListener('click', async () => {
    const payload = {
      cdnBase: cdnUrlInput.value.trim(),
      program: programInput ? (programInput.value.trim() || 'program526') : 'program526',
      category: categoryFilter.value || null,
      concurrency: parseInt(concurrencyRange.value, 10),
      convertSwfToImages: chkConvert.checked,
      saveOriginalSwf: chkSaveOriginal.checked
    };

    addLog(`Gửi lệnh bắt đầu tải (${payload.concurrency} luồng)...`, 'info');
    try {
      const res = await fetch('/api/download/start', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload)
      });
      const data = await res.json();
      if (data.success) {
        addLog(`Đang khởi chạy tải ${data.total} assets!`, 'success');
      } else {
        addLog(`Lỗi: ${data.error}`, 'error');
      }
    } catch (e) {
      addLog(`Lỗi kết nối: ${e.message}`, 'error');
    }
  });

  // Pause / Resume
  btnPause.addEventListener('click', async () => {
    const isPaused = btnPause.textContent.includes('Tiếp tục');
    const endpoint = isPaused ? '/api/download/resume' : '/api/download/pause';
    await fetch(endpoint, { method: 'POST' });
  });

  // Stop
  btnStop.addEventListener('click', async () => {
    if (confirm('Bạn có chắc chắn muốn dừng quá trình tải?')) {
      await fetch('/api/download/stop', { method: 'POST' });
    }
  });

  // Init
  loadInitialStatus();
  connectSSE();
  loadGallery();
  loadModels();
  setInterval(loadGallery, 6000);
  setInterval(loadModels, 6000);
});
