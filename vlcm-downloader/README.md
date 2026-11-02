# ⚔️ Võ Lâm Chi Mộng (VLCM) - Asset Extractor & Model Studio

Bộ công cụ tự động phân tích mã nguồn ActionScript (.as), quét danh sách toàn bộ tài nguyên game (UI, Skin, Trang phục Avatar, Hiệu ứng Effect, Icon vật phẩm, Bản đồ, MovieClip, Âm thanh), giải mã định dạng mã hóa `.tse` / `.tsze`, chuyển đổi `.swf` thành ảnh `.png` / `.jpg` trong suốt và **tự động bóc tách Mô Hình Nhân Vật (Avatar Models) thành thư mục riêng với file cấu hình JSON toạ độ hành động**.

---

## 🌟 Tính Năng Nổi Bật

### 1. Thuật toán giải mã `.tse` & `.tsze` chuẩn xác (CodeMixer)
Trích xuất trực tiếp từ mã nguồn Flash client `LoadingUISwf` / `CodeMixer.as`:
- **Tham số giải mã:**
  - `KEY_A = 121` (0x79)
  - `COUNT_B = 39` (XOR 39 bytes liên tiếp)
  - `SKIP_C = 297` (Nhảy qua 297 bytes không đổi)
- **Cơ chế hoạt động:**
  - Lặp lại quy trình: XOR `b` byte với `a`, sau đó bỏ qua `c` byte cho đến hết file.
  - Đối với file **`.tse`**: Sau khi giải mã sẽ trả về file nhị phân chuẩn **`.swf`** (Flash Movie).
  - Đối với file **`.tsze`**: File nén dạng ZIP container (`PK\x03\x04`), bộ giải mã tự động giải nén và giải mã XOR để thu được file **`.xml`** cấu hình bản đồ/thông số game hoàn chỉnh.

---

### 2. Trích xuất Mô hình Nhân vật & Hiệu ứng (Model & Frame JSON)
Thay vì chỉ lưu ảnh trần, công cụ tự động phân tích cấu trúc nhị phân của SWF theo chuẩn JPEXS Free Flash Decompiler:
- **Đọc Tag 76 (`SymbolClass`)**: Ánh xạ ID của các ảnh sprite với tên hành động cụ thể (ví dụ: `1_mid151.walk.png`, `2_mid151.stand.png`, `3_mid151.sit.png`...).
- **Đọc Tag 82/72 (`DoABC`)**: Trích xuất ActionScript bytecode chứa cấu trúc toạ độ frame XML (`public static const X_M_L:XML = <r>...<s>...<p>...`).
- **Chuyển đổi XML sang JSON chuẩn (`${modelName}.json`)**:
  - Tên model và danh sách toàn bộ hành động (`walk`, `stand`, `sit`, `attack`, `die`...).
  - Thời gian chuyển frame `time` (ms), số lượng frame `frameCount`.
  - Toạ độ cắt sprite chi tiết cho từng hướng xoay (`angle 1..8`):
    - Vị trí cắt trên spritesheet: `x`, `y`, `width`, `height`.
    - Toạ độ gốc và điểm neo trong game: `tx`, `ty`, `ox`, `oy`.
  - Tên file spritesheet tương ứng được liên kết trực tiếp trong JSON.
- **Cấu trúc thư mục độc lập cho từng Model**:
  ```
  res/data/avatar/clothes/mid151/
  ├── mid151.json              # File cấu trúc toạ độ frame và hành động chuẩn JSON
  ├── mid151.as                # Mã nguồn ActionScript chứa XML toạ độ gốc
  ├── 1_mid151.walk.png        # Spritesheet hành động đi bộ (PNG trong suốt)
  ├── 2_mid151.stand.png       # Spritesheet hành động đứng yên
  ├── 3_mid151.sit.png         # Spritesheet hành động ngồi
  ├── 4_mid151.special.png     # Spritesheet hành động đặc biệt
  └── ...
  ```

---

### 3. Chuyển đổi `.swf` sang `.png` / `.jpg` trong suốt
Bộ phân tích SWF nhị phân thuần bằng Node.js (không cần cài thêm Flash Player hay JPEXS):
- **Tag 35 (`DefineBitsJPEG3`)**: Tách luồng JPEG và mặt nạ kênh Alpha Zlib, ghép nối tạo ảnh **PNG trong suốt 32-bit (Alpha Translucent)** hoàn hảo.
- **Tag 20 / 36 (`DefineBitsLossless/2`)**: Giải nén bitmap ARGB thành file PNG sắc nét.
- **Tag 21 (`DefineBitsJPEG2`)** & **Tag 6 (`DefineBitsJPEG`)**: Tự động ghép JPEG Tables để tạo file JPG hoàn chỉnh.

---

### 4. Tải đa luồng siêu tốc & Phân loại thư mục chuẩn CDN
- Tự động quét 4.348 file `.as` để lọc hơn **16.500+ assets**.
- Tải song song 16–32 luồng, tự động tạo cấu trúc thư mục chuẩn:
  - `res/ui/`: Giao diện UI & nút bấm.
  - `program526/skin/`: Toàn bộ skin giao diện game.
  - `res/data/avatar/clothes/`: Trang phục nhân vật, vũ khí (`mid*.tse`).
  - `res/data/avatar/effect/`: Hiệu ứng kỹ năng, ánh sáng (`eid*.tse`).
  - `res/data/ico_jpg/` & `res/data/ico_big/`: Icon vật phẩm.
  - `res/data/map1/`: Bản đồ và Map tiles.

---

## 🚀 Hướng Dẫn Sử Dụng

### 1. Khởi chạy Giao diện Web Dashboard (Web UI Studio)
```bash
cd vlcm-downloader
npm start
```
Sau đó mở trình duyệt truy cập: **`http://localhost:3030`**

Giao diện Web cung cấp:
- **Cấu hình & Điều khiển**: Tùy chỉnh URL CDN, chọn danh mục, điều chỉnh số luồng song song, bật/tắt chuyển đổi.
- **Thống kê thời gian thực**: Tốc độ MB/s, % tiến độ, số file đã tải / chuyển đổi / bỏ qua.
- **Live Terminal Logs**: Theo dõi từng file đang được tải và giải mã.
- **🎭 Model Studio**: Xem danh sách các model đã xuất, số lượng action, danh sách action badges, xem trước các sprite thu nhỏ và click xem trực tiếp nội dung file `model.json`.
- **🖼️ Live Gallery**: Bộ sưu tập các hình ảnh đã chuyển đổi theo thời gian thực.

---

### 2. Sử dụng qua Dòng Lệnh (CLI)

#### a) Tải Assets từ CDN:
```bash
# Tải toàn bộ assets với 16 luồng
node src/cli.js download

# Tải riêng Trang phục nhân vật (tự giải mã TSE, tạo thư mục model và file JSON)
node src/cli.js download --category avatar_clothes

# Tải riêng Hiệu ứng Effect (eid*.tse)
node src/cli.js download --category avatar_effect

# Tải riêng Skin giao diện (program526/skin/)
node src/cli.js download --category skin

# Tùy chỉnh thư mục lưu kết quả và số luồng
node src/cli.js download --category avatar_clothes --concurrency 24 --output ./output_assets
```

#### b) Chuyển đổi hàng loạt các file `.tse` / `.swf` / `.tsze` có sẵn trong máy:
Nếu bạn đã có các file `.tse` hoặc `.swf` tải về từ trước (hoặc decompile từ nguồn khác):
```bash
node src/cli.js convert-local --dir "C:/Users/Shadow/Desktop/dump full swf/scripts/output_assets"
```
Lệnh này sẽ tự động:
1. Quét đệ quy toàn bộ thư mục chỉ định.
2. Giải mã mọi file `.tse` sang SWF bằng thuật toán `Key 121, Count 39, Skip 297`.
3. Giải nén và giải mã mọi file `.tsze` thành `.xml`.
4. Bóc tách mọi model thành thư mục riêng với file `${model}.json` toạ độ + các file `${id}_${model}.${action}.png` + file `.as`.

#### c) Quét lại mã nguồn client:
```bash
node src/cli.js scan
```

---

## 📋 Cấu Trúc JSON Toạ Độ Model (`mid151.json`)

Mỗi model xuất ra sẽ có file JSON toạ độ chuẩn hoá dạng:
```json
{
  "name": "mid151",
  "totalActions": 7,
  "actions": {
    "walk": {
      "time": 80,
      "frameCount": 8,
      "spriteSheet": "1_mid151.walk.png",
      "frames": [
        {
          "frameIndex": 0,
          "angle": 0,
          "x": 0,
          "y": 0,
          "width": 64,
          "height": 72,
          "tx": 32,
          "ty": 68,
          "ox": 0,
          "oy": 0
        }
      ]
    },
    "stand": {
      "time": 100,
      "frameCount": 6,
      "spriteSheet": "2_mid151.stand.png",
      "frames": [ ... ]
    }
  }
}
```

> **Lưu ý về góc xoay (8 hướng)**: Trong engine game Flash VLCM, các góc `1, 2, 3` là hình ảnh lật gương (flip horizontal) từ các góc `7, 6, 5` tương ứng với độ lệch `tx = width - tx`.

---

## 📁 Cấu Trúc Dự Án

```
vlcm-downloader/
├── package.json          # Cấu hình dự án Node.js (ES Module)
├── manifest.json         # Danh sách 16.500+ assets quét từ mã nguồn
├── README.md             # Hướng dẫn chi tiết
├── src/
│   ├── index.js          # Entry point chính
│   ├── scanner.js        # Engine phân tích source code ActionScript
│   ├── decoder.js        # Thuật toán giải mã .tse / .tsze (Key: 121, Count: 39, Skip: 297)
│   ├── xml_parser.js     # Parser chuyển đổi XML toạ độ frame ActionScript sang JSON
│   ├── swf_converter.js  # Bóc tách SWF Tag 76 (SymbolClass), Tag 82 (DoABC), Tag 35 (JPEG3)
│   ├── downloader.js     # Engine tải đa luồng, tự động tạo model folder + .json + pngs
│   ├── cli.js            # Giao diện dòng lệnh CLI (download, scan, convert-local)
│   └── server.js         # Web API & Server-Sent Events (SSE)
└── public/
    ├── index.html        # Giao diện Web Dashboard (Controls, Gallery, Model Studio)
    ├── style.css         # Dark-Mode Glassmorphism UI
    └── app.js            # Logic SSE, hiển thị Models & Gallery thời gian thực
```
