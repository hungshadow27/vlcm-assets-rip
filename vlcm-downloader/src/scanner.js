import fs from 'node:fs';
import path from 'node:path';

function getAllAsFiles(dir, list = []) {
  if (!fs.existsSync(dir)) return list;
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  for (const entry of entries) {
    const fullPath = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      if (entry.name !== 'node_modules' && entry.name !== '.git' && entry.name !== 'vlcm-downloader' && entry.name !== 'output') {
        getAllAsFiles(fullPath, list);
      }
    } else if (entry.isFile() && entry.name.endsWith('.as')) {
      list.push(fullPath);
    }
  }
  return list;
}

export function scanAllAssets(scriptsRoot, options = {}) {
  const program = (options.program && typeof options.program === 'string')
    ? options.program.trim().replace(/^(\/|\\)+|(\/|\\)+$/g, '')
    : 'program526';

  const asFiles = getAllAsFiles(scriptsRoot);
  console.log(`[Scanner] Đang quét ${asFiles.length} tệp mã nguồn ActionScript (.as) (Program: ${program})...`);

  const assetSet = new Set();
  const categories = {
    ui: new Set(),
    skin: new Set(),
    avatar_clothes: new Set(),
    avatar_effect: new Set(),
    icon: new Set(),
    icon_big: new Set(),
    map: new Set(),
    mc: new Set(),
    sound: new Set(),
    other: new Set()
  };

  function addAsset(rawPath, forceCategory = null) {
    if (!rawPath || typeof rawPath !== 'string') return;
    let clean = rawPath.trim().replace(/\\/g, '/');
    clean = clean.replace(/^(\.\.\/|\.\/|\/)+/, '');
    clean = clean.split('?')[0];

    // Filter invalid empty or placeholder paths
    if (!clean || clean.length < 4) return;
    if (clean.includes(' ') || clean.includes('{') || clean.includes('(') || clean.includes(';') || clean.includes('$')) return;
    if (clean.endsWith('.as') || clean.endsWith('.com') || clean.endsWith('.net') || clean.endsWith('.org') || clean.endsWith('.vn') || clean.endsWith('.asp')) return;

    // Filter phantom paths like res/ui/.png or res/data/avatar/clothes/.tse
    if (/\/\.[a-zA-Z0-9]+$/.test(clean) || clean.endsWith('/')) return;

    // If string has a generic program prefix or other version, map to current configured program
    if (/^program\d*\//i.test(clean)) {
      clean = clean.replace(/^program\d*\//i, `${program}/`);
    }

    // Correct TSE/SWF rule:
    // 1. All skins in {program}/skin/ use .tse
    // 2. All avatar clothes & effect use .tse
    // 3. HighEffect uses .tse
    // 4. Map configs use .tsze
    // 5. Normal UI and MC components use .swf or .png/.jpg
    if ((clean.startsWith(`${program}/skin/`) || clean.includes('/skin/')) && clean.endsWith('.swf')) {
      clean = clean.replace(/\.swf$/i, '.tse');
    }
    if ((clean.includes('avatar/clothes/') || clean.includes('avatar/effect/') || clean.includes('higheffect/')) && clean.endsWith('.swf')) {
      clean = clean.replace(/\.swf$/i, '.tse');
    }
    if (clean.startsWith('res/data/maps/') && clean.endsWith('.xml')) {
      clean = clean.replace(/\.xml$/i, '.tsze');
    }

    let category = forceCategory;
    if (!category) {
      if (clean.startsWith('program') || clean.startsWith(program) || clean.includes('/skin/')) {
        category = 'skin';
      } else if (clean.includes('avatar/clothes')) {
        category = 'avatar_clothes';
      } else if (clean.includes('avatar/effect') || clean.includes('higheffect/')) {
        category = 'avatar_effect';
      } else if (clean.includes('ico_jpg') || clean.includes('icon_')) {
        category = 'icon';
      } else if (clean.includes('ico_big') || clean.includes('bigIco/')) {
        category = 'icon_big';
      } else if (clean.includes('map1') || clean.includes('smallMap') || clean.includes('maps/')) {
        category = 'map';
      } else if (clean.includes('mc/')) {
        category = 'mc';
      } else if (clean.includes('sound/')) {
        category = 'sound';
      } else if (clean.includes('res/ui')) {
        category = 'ui';
      } else {
        category = 'other';
      }
    }

    assetSet.add(clean);
    if (categories[category]) {
      categories[category].add(clean);
    } else {
      categories.other.add(clean);
    }
  }

  // 1. Quét tất cả các skin trong game/skin/*.as
  const skinDir = path.join(scriptsRoot, 'game', 'skin');
  if (fs.existsSync(skinDir)) {
    const skinFiles = fs.readdirSync(skinDir).filter(f => f.endsWith('.as'));
    console.log(`[Scanner] Đang phân tích ${skinFiles.length} tệp giao diện UI skin...`);
    
    for (const sFile of skinFiles) {
      const content = fs.readFileSync(path.join(skinDir, sFile), 'utf8');
      
      const linkRegex = /"link"\s*:\s*"([a-zA-Z0-9_]+)\.([a-zA-Z0-9_]+)"/g;
      let m;
      while ((m = linkRegex.exec(content)) !== null) {
        const skinName = m[1];
        const imageName = m[2];
        addAsset(`${program}/skin/${skinName}/${imageName}.tse`, 'skin');
      }
    }
  }

  // 2. Quét chuỗi đường dẫn trực tiếp và chuỗi động từ source code
  console.log(`[Scanner] Đang trích xuất chuỗi đường dẫn tài nguyên...`);
  const stringLiteralRegex = /"([^"\r\n]+)"|'([^'\r\n]+)'/g;

  for (const file of asFiles) {
    const content = fs.readFileSync(file, 'utf8');
    let m;
    while ((m = stringLiteralRegex.exec(content)) !== null) {
      const str = m[1] || m[2];
      if (!str) continue;

      if (str.startsWith('res/') || str.startsWith('res\\') || str.includes('res/ui/') || str.includes('res/data/')) {
        let p = str.replace(/\\/g, '/');
        if (!p.includes('$') && /\.[a-zA-Z0-9]+$/.test(p)) {
          addAsset(p);
        }
      } else if (str.match(/\.(png|jpg|jpeg|swf|tse|tsze|xml|mp3)$/i)) {
        if (str.startsWith('program') || str.startsWith('res/') || str.includes('/')) {
          addAsset(str);
        }
      }
    }

    // Avatar clothes & effects
    const midRegex = /mid(\d+)/g;
    while ((m = midRegex.exec(content)) !== null) {
      const id = m[1];
      addAsset(`res/data/avatar/clothes/mid${id}.tse`, 'avatar_clothes');
      addAsset(`res/data/avatar/clothes/midm${id}.tse`, 'avatar_clothes');
      addAsset(`res/data/avatar/clothes/midf${id}.tse`, 'avatar_clothes');
      addAsset(`res/data/avatar/clothes/midw${id}.tse`, 'avatar_clothes');
    }

    const eidRegex = /eid(\d+)/g;
    while ((m = eidRegex.exec(content)) !== null) {
      const id = m[1];
      addAsset(`res/data/avatar/effect/eid${id}.tse`, 'avatar_effect');
    }

    const iconRegex = /icon_(\d+)/g;
    while ((m = iconRegex.exec(content)) !== null) {
      addAsset(`res/data/ico_jpg/icon_${m[1]}.jpg`, 'icon');
    }

    const icoBigRegex = /ico(\d+)/g;
    while ((m = icoBigRegex.exec(content)) !== null) {
      addAsset(`res/data/ico_big/ico${m[1]}.png`, 'icon_big');
    }
  }

  // 3. Phân tích SpecialGoodsID.as, SpeciaAvatarPartID.as, ItemPositionRange.as
  const staticDataDir = path.join(scriptsRoot, 'com', 'tgame', 'common', 'staticdata');
  if (fs.existsSync(staticDataDir)) {
    console.log(`[Scanner] Đang trích xuất toàn bộ Goods IDs & Avatar IDs từ staticdata...`);
    const staticFiles = fs.readdirSync(staticDataDir).filter(f => f.endsWith('.as'));
    for (const sf of staticFiles) {
      const content = fs.readFileSync(path.join(staticDataDir, sf), 'utf8');
      
      // Match var declarations: public static var/const NAME:int = 12345;
      const idRegex = /(?:var|const)\s+([A-Za-z0-9_]+)\s*:\s*(?:int|Number)\s*=\s*(\d+)/g;
      let idMatch;
      while ((idMatch = idRegex.exec(content)) !== null) {
        const varName = idMatch[1];
        const numId = idMatch[2];
        if (numId.length >= 2 && parseInt(numId) > 0) {
          addAsset(`res/data/ico_jpg/icon_${numId}.jpg`, 'icon');
          addAsset(`res/data/ico_big/ico${numId}.png`, 'icon_big');

          if (varName.includes('AVATAR') || varName.includes('MOUNT') || varName.includes('BODY') || varName.includes('WUQI') || varName.includes('WING') || varName.includes('CHIBANG') || varName.includes('CLOTHES')) {
            addAsset(`res/data/avatar/clothes/mid${numId}.tse`, 'avatar_clothes');
            addAsset(`res/data/avatar/clothes/midm${numId}.tse`, 'avatar_clothes');
            addAsset(`res/data/avatar/clothes/midf${numId}.tse`, 'avatar_clothes');
            addAsset(`res/data/avatar/clothes/midw${numId}.tse`, 'avatar_clothes');
            addAsset(`res/data/avatar/effect/eid${numId}.tse`, 'avatar_effect');
          }
        }
      }

      // Arrays of IDs: e.g. [123, 456, 789]
      const arrayRegex = /\[([0-9,\s]+)\]/g;
      let arrMatch;
      while ((arrMatch = arrayRegex.exec(content)) !== null) {
        const nums = arrMatch[1].split(',').map(s => s.trim()).filter(s => s.length >= 2 && /^\d+$/.test(s));
        for (const numId of nums) {
          addAsset(`res/data/ico_jpg/icon_${numId}.jpg`, 'icon');
          addAsset(`res/data/ico_big/ico${numId}.png`, 'icon_big');
          addAsset(`res/data/avatar/clothes/mid${numId}.tse`, 'avatar_clothes');
          addAsset(`res/data/avatar/clothes/midm${numId}.tse`, 'avatar_clothes');
          addAsset(`res/data/avatar/effect/eid${numId}.tse`, 'avatar_effect');
        }
      }
    }
  }

  // 4. Standard Clothes, Effects & Sounds ranges
  for (let i = 1; i <= 360; i++) {
    addAsset(`res/data/avatar/clothes/mid${i}.tse`, 'avatar_clothes');
    addAsset(`res/data/avatar/clothes/midm${i}.tse`, 'avatar_clothes');
    addAsset(`res/data/avatar/clothes/midf${i}.tse`, 'avatar_clothes');
    addAsset(`res/data/avatar/clothes/midw${i}.tse`, 'avatar_clothes');
  }
  for (let i = 10000; i <= 10120; i++) {
    addAsset(`res/data/avatar/clothes/mid${i}.tse`, 'avatar_clothes');
    addAsset(`res/data/avatar/clothes/midm${i}.tse`, 'avatar_clothes');
    addAsset(`res/data/avatar/clothes/midf${i}.tse`, 'avatar_clothes');
    addAsset(`res/data/avatar/clothes/midw${i}.tse`, 'avatar_clothes');
  }
  for (let i = 2400; i <= 2900; i++) {
    addAsset(`res/data/avatar/effect/eid${i}.tse`, 'avatar_effect');
  }
  for (let i = 10100; i <= 10800; i++) {
    addAsset(`res/data/avatar/effect/eid${i}.tse`, 'avatar_effect');
  }
  for (let i = 11460; i <= 11470; i++) {
    addAsset(`res/data/avatar/effect/eid${i}.tse`, 'avatar_effect');
  }
  for (let i = 2400; i <= 3400; i++) {
    addAsset(`res/data/sound/bgsound${i}.mp3`, 'sound');
    addAsset(`res/data/sound/sound_${i}.mp3`, 'sound');
  }

  // 5. Phân tích ResPathManager.as
  const resPathManagerFile = path.join(scriptsRoot, 'com', 'tgame', 'common', 'res', 'ResPathManager.as');
  if (fs.existsSync(resPathManagerFile)) {
    console.log(`[Scanner] Đang phân tích ResPathManager.as...`);
    const content = fs.readFileSync(resPathManagerFile, 'utf8');
    
    const soundConstRegex = /SOUND_[A-Z0-9_]+:\s*int\s*=\s*(\d+)/g;
    let sm;
    while ((sm = soundConstRegex.exec(content)) !== null) {
      const sId = sm[1];
      addAsset(`res/data/sound/sound_${sId}.mp3`, 'sound');
      addAsset(`res/data/sound/bgsound${sId}.mp3`, 'sound');
    }

    for (let i = 1; i <= 10; i++) {
      addAsset(`res/ui/UIditu/qingrenjiexianhua/flowerKuang${i}.png`, 'ui');
      addAsset(`res/data/mc/effect/lipao/1/${i}.png`, 'mc');
      addAsset(`res/data/mc/effect/lipao/2/${i}.png`, 'mc');
    }

    addAsset('res/data/higheffect/flower.tse', 'avatar_effect');
    addAsset('res/data/higheffect/fenflower.tse', 'avatar_effect');
    addAsset('res/data/higheffect/yuanbao.tse', 'avatar_effect');
    addAsset('res/data/higheffect/shitou.tse', 'avatar_effect');
    addAsset('res/data/higheffect/xuehua.tse', 'avatar_effect');
  }

  // 6. Login & Nhân vật khởi tạo
  const parties = ['shaolin', 'quanzhen', 'gumu', 'taohua', 'baituoshan', 'mingjiao', 'zicuangmenpai_nan', 'zicuangmenpai_nv'];
  for (const party of parties) {
    addAsset(`res/ui/xingxiang_${party}.png`, 'ui');
    addAsset(`res/ui/wenzi_${party}.png`, 'ui');
    addAsset(`res/data/mc/denglu2/${party}.swf`, 'mc');
  }
  addAsset('res/ui/login/stand.png', 'ui');
  addAsset('res/data/mc/login/stand.swf', 'mc');
  addAsset('res/data/mc/denglu2/leaf.swf', 'mc');

  // 7. Map, World Map & Bản đồ .tsze
  const mapNames = [
    'huashan', 'gumu', 'shendiaogu', 'zhongnanhoushan', 'zhongnanshan',
    'xiangyangzhanchang', 'yuchun', 'taohuadao', 'xiangyangcheng', 'zhongnanshanxia',
    'dashengguan', 'niujiachun', 'jueqingshenjian', 'jueqinggu', 'yuanyueshanzhuang',
    'diwangbaoku', 'baituoshanxia', 'kuafudating', 'kuafuzhanchang', 'wuxianfeng',
    'xuanminggu', 'shaolin', 'quanzhen', 'mingjiao'
  ];

  addAsset('res/ui/world.jpg', 'ui');
  for (const mName of mapNames) {
    addAsset(`res/data/maps/${mName}.tsze`, 'map');
    addAsset(`res/smallMap/${mName}.jpg`, 'map');
    for (let x = 0; x <= 14; x++) {
      for (let y = 0; y <= 14; y++) {
        addAsset(`res/data/map1/${mName}/${x}_${y}.jpg`, 'map');
      }
    }
  }

  // 8. Button States và NewSkinButton
  const buttonNames = [
    'saodi', 'xiake', 'zongshi', 'waiGuanXianShiButton', 'quXiaoWaiGuanButton',
    'fwwy', 'tengshe', 'qinglong', 'xuanwu', 'zhuque', 'baihu', 'gouchen',
    'jingleiqiang_0', 'jingleiqiang_1', 'tulongjinjie'
  ];
  const bStates = ['up', 'over', 'down', 'disabled', 'selected'];
  for (const bName of buttonNames) {
    for (const st of bStates) {
      addAsset(`res/ui/button/${bName}_${st}.png`, 'ui');
      addAsset(`res/ui/button/20190306/${bName}_${st}.png`, 'ui');
    }
  }

  // Button 20190306/btn29...
  for (let i = 1; i <= 50; i++) {
    for (const st of ['up', 'over', 'down', 'disabled']) {
      addAsset(`res/ui/button/20190306/btn${i}_${st}.png`, 'ui');
      addAsset(`res/ui/button/btn${i}_${st}.png`, 'ui');
    }
  }

  const charheadTypes = ['show', 'hide'];
  for (const t of charheadTypes) {
    for (const s of bStates) {
      addAsset(`res/ui/charhead/${t}_${s}.png`, 'ui');
    }
  }

  // Sub-modules UI buttons (jishiqi, xiulian, etc.)
  for (const s of ['up', 'over', 'down', 'disabled']) {
    addAsset(`res/ui/UIditu/shijianshalou/jishiqi_${s}.png`, 'ui');
    addAsset(`res/ui/UIditu/menpaijuexue/xiulian_${s}.png`, 'ui');
  }

  // 9. Hệ thống võ học, kinh mạch & UIditu modules
  for (let i = 0; i <= 9; i++) {
    addAsset(`res/ui/qishangquan/${i}.png`, 'ui');
    addAsset(`res/ui/baguazhang/${i}.png`, 'ui');
  }
  for (let i = 1; i <= 8; i++) {
    addAsset(`res/ui/UIditu/roushen/${i}.swf`, 'ui');
  }
  for (let i = 0; i <= 5; i++) {
    addAsset(`res/ui/UIditu/wuduzhen/${i}.swf`, 'ui');
    addAsset(`res/ui/UIditu/wuxingzhen/${i}.swf`, 'ui');
    addAsset(`res/ui/UIditu/yuanXiaoJie/${i}.swf`, 'ui');
    addAsset(`res/ui/UIditu/tianshanliuyangzhang/qiu${i}.swf`, 'ui');
  }
  for (let i = 1; i <= 7; i++) {
    addAsset(`res/ui/UIditu/bihaichaoshengqu/hulu${i}.swf`, 'ui');
    addAsset(`res/ui/UIditu/sanshiliushou/diban${i}.swf`, 'ui');
  }
  for (let i = 1; i <= 10; i++) {
    addAsset(`res/ui/UIditu/zhenyanshouyin/${i}.swf`, 'ui');
  }

  // Special UI Big Icons
  addAsset('res/ui/bigIco/ico_14hour.png', 'icon_big');
  addAsset('res/ui/bigIco/ico_42hour.png', 'icon_big');
  addAsset('res/ui/bigIco/ico_84hour.png', 'icon_big');

  // Specific UIditu & MC components
  const specificList = [
    'res/ui/UIditu/qingrenjiexianhua/songhualaba.png',
    'res/ui/UIditu/fabao/colorbar_bg.png',
    'res/ui/UIditu/ynSpecial/18.swf',
    'res/ui/xiangyangzhanchang/shu.png',
    'res/ui/baguazhen/mian_menu_baguazhen.swf',
    'res/ui/UIditu/shiershengxiao/duanzao_bg.swf',
    'res/ui/UIditu/shiershengxiao/jixiang.swf',
    'res/ui/UIditu/tunshitiandi/redbg.swf',
    'res/ui/UIditu/tunshitiandi/bluebg.swf',
    'res/ui/zhanqixitong/zhanqi.jpg',
    'res/ui/zhanqixitong/wanzi.swf',
    'res/ui/zhanqixitong/shizi.swf',
    'res/ui/baguazhang/guang.swf',
    'res/ui/shenzhaojing/shenzhaojing.jpg',
    'res/ui/feilongtanyunshou/feilongtanyunshou.jpg',
    'res/data/mc/liumaishenjian/liumaishenjian.swf',
    'res/data/mc/qishangquan/selected.swf',
    'res/data/mc/qishangquan/firebar.swf',
    'res/data/mc/qishangquan/yanhua.swf',
    'res/data/mc/wuhun/long.swf',
    'res/ui/UIditu/cangjianxuantian/bg.swf',
    'res/ui/UIditu/woDeMenPai/diZiAttributeBg.swf',
    'res/ui/UIditu/woDeMenPai/chuanGong.swf',
    'res/ui/UIditu/woDeMenPai/renwu.swf',
    'res/ui/UIditu/woDeMenPai/ball.swf',
    'res/ui/UIditu/woDeMenPai/bg1.swf',
    'res/ui/UIditu/woDeMenPai/bg2.swf',
    'res/ui/venation_long.png',
    'res/ui/venation_long2.jpg',
    'res/ui/UIditu/boss/bg.swf',
    'res/ui/UIditu/richang/guajixiaojiemian.swf',
    'res/ui/UIditu/richang/huodongyouhua.swf',
    'res/ui/UIditu/2015chunjie/zhizuozongzi_bg.swf',
    'res/ui/UIditu/ynSpecial/liulongzhuangbei/jt.swf',
    'res/ui/UIditu/ynSpecial/liulongzhuangbei/bg1.swf',
    'res/ui/UIditu/ynSpecial/liulongzhuangbei/long.swf',
    'res/ui/UIditu/ynSpecial/liulongzhuangbei/bg2.swf',
    'res/ui/jingjie/guangxiao.swf',
    'res/ui/UIditu/tianfu/bg.swf',
    'res/ui/UIditu/tianfu/shaozi.swf',
    'res/ui/UIditu/xunzhangduihuan/bg.xunzhangyangcheng.swf',
    'res/ui/UIditu/lianqi/barbg.swf',
    'res/ui/UIditu/lianqi/kuang.swf',
    'res/ui/UIditu/sanshiliushou/xueweidian.swf',
    'res/ui/UIditu/mingyugong/bg.swf',
    'res/ui/UIditu/cuqiankungfu/ui.cuqiankungfu.bg.swf',
    'res/ui/UIditu/bow/ui.bow.bg.swf',
    'res/ui/UIditu/ynSpecial/jinfengdiao/bg1.swf',
    'res/ui/UIditu/ynSpecial/jinfengdiao/jinfengdiao.swf',
    'res/ui/UIditu/ynSpecial/jinfengdiao/bg2.swf',
    'res/data/mc/wuxingzhiren/line.swf',
    'res/ui/UIditu/yuyi/bg.swf',
    'res/ui/UIditu/yuyi/xuanzhong.swf',
    'res/ui/UIditu/emozhiyi/bg.swf',
    'res/ui/UIditu/emozhiyi/huoyan.swf',
    'res/ui/UIditu/molingzhiyi/bg.swf',
    'res/ui/UIditu/ganjiangmoye/bg.swf',
    'res/data/mc/shenbingjuexing/huyi.swf',
    'res/data/mc/shenbingjuexing/longya.swf',
    'res/data/mc/shenbingjuexing/quanshen.swf',
    'res/data/mc/shenbingjuexing/longyin.swf',
    'res/data/mc/shenbingjuexing/liekong.swf',
    'res/data/mc/shenbingjuexing/xueyin.swf',
    'res/ui/UIditu/aojianshenjiangji/bg.swf',
    'res/ui/UIditu/aojianshenjiangji/help.swf',
    'res/ui/UIditu/aojianshenjiangji/renwu1.swf',
    'res/ui/UIditu/langhundun/bg.swf',
    'res/ui/UIditu/langhundun/kulou.swf',
    'res/ui/UIditu/langhundun/mingzi.swf',
    'res/ui/UIditu/langhundun/jiahao.swf',
    'res/ui/UIditu/jingleiqiang/bg.swf',
    'res/data/mc/yuejinlun/taiyang.swf',
    'res/data/mc/yuejinlun/yueliang.swf',
    'res/data/mc/yuejinlun/xing.swf',
    'res/ui/UIditu/shuanglongzhan/bg.swf',
    'res/ui/UIditu/qimenzhen/qimenzhen.bg.swf',
    'res/ui/UIditu/wuxingzhen/bgdown.swf',
    'res/ui/UIditu/wuxingzhen/guang.swf',
    'res/ui/UIditu/wuxingzhen/bgmc.swf',
    'res/ui/UIditu/wuxingzhen/jin.swf',
    'res/ui/UIditu/wuxingzhen/mu.swf',
    'res/ui/UIditu/wuxingzhen/tu.swf',
    'res/ui/UIditu/wuxingzhen/shui.swf',
    'res/ui/UIditu/wuxingzhen/select.swf',
    'res/ui/UIditu/wuxingzhen/selectimg.swf',
    'res/ui/UIditu/beidouqixingzhen/bg.swf',
    'res/ui/UIditu/beidouqixingzhen/tianchong.swf',
    'res/ui/UIditu/beidouqixingzhen/xuanzhong.swf',
    'res/ui/UIditu/jinchantuoqiao/bg.swf',
    'res/ui/UIditu/jiuquhuanghezhen/ui.jiuquhuanghezhen.bg.swf',
    'res/ui/UIditu/jiuquhuanghezhen/jin.swf',
    'res/ui/UIditu/jiuquhuanghezhen/mu.swf',
    'res/ui/UIditu/jiuquhuanghezhen/shui.swf',
    'res/ui/UIditu/jiuquhuanghezhen/huo.swf',
    'res/ui/UIditu/jiuquhuanghezhen/tu.swf',
    'res/ui/UIditu/zhenwuqijiezhen/bg.swf',
    'res/ui/UIditu/douzhuanxingyi/bg.swf',
    'res/ui/UIditu/guiliuzhen/bg.swf',
    'res/ui/UIditu/jingangfumoquan/bg.swf',
    'res/ui/UIditu/qinlonggong/bg.swf',
    'res/ui/UIditu/xiaoyaoyufeng/bg.swf',
    'res/ui/UIditu/tianmenzhen/kuang.swf',
    'res/ui/UIditu/tianmenzhen/pingbijian.swf',
    'res/ui/UIditu/bihaichaoshengqu/tengBg.swf',
    'res/ui/UIditu/yuxiaojianfa/bg.swf',
    'res/ui/UIditu/canhezhi/bg.swf',
    'res/ui/UIditu/xiantiangong/bg.swf',
    'res/ui/UIditu/xiantiangong/an.swf',
    'res/ui/UIditu/xuedaoxinfa/bg.swf',
    'res/ui/UIditu/xuedaoxinfa/xuedao.swf',
    'res/ui/UIditu/wuduzhen/bgmc.swf',
    'res/ui/UIditu/wuduzhen/shengxie.swf',
    'res/ui/UIditu/wuduzhen/yuchan.swf',
    'res/ui/UIditu/wuduzhen/lingshe.swf',
    'res/ui/UIditu/wuduzhen/wugong.swf',
    'res/ui/UIditu/wuduzhen/tianzhu.swf',
    'res/ui/UIditu/wuduzhen/select.swf',
    'res/ui/UIditu/wuduzhen/kuang.swf',
    'res/ui/UIditu/zhenyanshouyin/zysy_bg.swf',
    'res/ui/UIditu/zhenyanshouyin/jineng.swf',
    'res/ui/UIditu/shengsifu/bg.swf',
    'res/ui/UIditu/taohuazhen/bg.swf',
    'res/ui/UIditu/taohuazhen/dian.swf',
    'res/ui/UIditu/tianshanliuyangzhang/bg.swf',
    'res/ui/UIditu/duomingshisanjian/bg.swf',
    'res/ui/UIditu/duomingshisanjian/qiu.swf',
    'res/ui/UIditu/kongmingquan/bg.swf',
    'res/ui/UIditu/xingxiuzhen/bg.swf',
    'res/ui/UIditu/xingxiuzhen/bg1.swf',
    'res/ui/UIditu/xingxiuzhen/qinglong.swf',
    'res/ui/UIditu/xingxiuzhen/baihu.swf',
    'res/ui/UIditu/xingxiuzhen/zhuque.swf',
    'res/ui/UIditu/xingxiuzhen/xuanwu.swf',
    'res/ui/UIditu/xingxiuzhen1/bg.swf',
    'res/ui/UIditu/xingxiuzhen1/bg1.swf',
    'res/ui/UIditu/xingxiuzhen1/qinglong.swf',
    'res/ui/UIditu/xingxiuzhen1/baihu.swf',
    'res/ui/UIditu/xingxiuzhen1/zhuque.swf',
    'res/ui/UIditu/xingxiuzhen1/xuanwu.swf',
    'res/ui/UIditu/xingxiuzhen1/jian.swf',
    'res/ui/UIditu/xingxiuzhen1/mc.swf',
    'res/ui/UIditu/qishazhen/bg.swf',
    'res/ui/UIditu/fuWenKeHua/bg.swf',
    'res/ui/UIditu/fuWenKeHua/rightBg.swf',
    'res/ui/UIditu/liangyiweichenzhen/bg.swf',
    'res/ui/UIditu/liangyiweichenzhen/texiao.swf',
    'res/ui/UIditu/sijuejianzhen/bg.swf',
    'res/ui/UIditu/juezhanguangmingding/bg.swf',
    'res/ui/UIditu/juezhanguangmingding/bg1.swf',
    'res/ui/UIditu/juezhanguangmingding/lanping.swf',
    'res/ui/UIditu/juezhanguangmingding/huangping.swf',
    'res/ui/UIditu/duguqiubai/bg.swf',
    'res/ui/UIditu/xiakexing/bg.swf',
    'res/ui/UIditu/huashanlunjian/bg.swf',
    'res/ui/UIditu/rijinlun/bg.swf',
    'res/ui/UIditu/huangtubaye/shengling.swf',
    'res/ui/UIditu/huangtubaye/wdrys.swf',
    'res/ui/UIditu/huangtubaye/wdryx.swf',
    'res/ui/UIditu/huangtubaye/shenglingxuanzhong.swf',
    'res/ui/UIditu/xiangyangzhizhan/bg.swf',
    'res/ui/UIditu/tulongdao/bg.swf',
    'res/ui/UIditu/tulongdao/jinjieBg.swf',
    'res/ui/UIditu/tulongdao/jinengBg.swf',
    'res/ui/UIditu/jinSheJianFa/bg.swf',
    'res/ui/UIditu/menpaijuexue/bg.swf',
    'res/ui/UIditu/menpaijuexue/biaoti.swf',
    'res/ui/UIditu/menpaijuexue/biaoti2.swf',
    'res/data/mc/qianchuibailian/qichui.swf'
  ];

  for (const item of specificList) {
    addAsset(item);
  }

  const categorizedResults = {};
  for (const [cat, set] of Object.entries(categories)) {
    categorizedResults[cat] = Array.from(set).sort();
  }

  const allAssetsList = Array.from(assetSet).sort();

  console.log(`[Scanner] Hoàn tất quét! Tổng cộng tìm thấy ${allAssetsList.length} tài nguyên.`);
  for (const [cat, list] of Object.entries(categorizedResults)) {
    console.log(` - ${cat}: ${list.length} tài nguyên`);
  }

  return {
    total: allAssetsList.length,
    categories: categorizedResults,
    allAssets: allAssetsList
  };
}
