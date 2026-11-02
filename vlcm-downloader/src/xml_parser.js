/**
 * XML and ActionScript to JSON Parser for VLCM Models
 */

export function parseModelXmlToJson(xmlStr, modelName, symbolImageMap = {}) {
  if (!xmlStr || typeof xmlStr !== 'string') return null;

  const result = {
    model: modelName,
    name: modelName,
    exportedAt: new Date().toISOString(),
    totalActions: 0,
    actions: {},
    rawXml: xmlStr.trim()
  };

  // 1. Format: <r> <s k="action" t="time" f="frames"> <p .../> </s> </r>
  const sRegex = /<s\s+([^>]+)>([\s\S]*?)<\/s>/g;
  let sMatch;
  while ((sMatch = sRegex.exec(xmlStr)) !== null) {
    const sAttrs = sMatch[1];
    const sBody = sMatch[2];

    const kMatch = sAttrs.match(/k=["']([^"']+)["']/);
    const tMatch = sAttrs.match(/t=["']([^"']+)["']/);
    const fMatch = sAttrs.match(/f=["']([^"']+)["']/);

    const actionKey = kMatch ? kMatch[1] : 'default';
    const intervalTime = tMatch ? parseInt(tMatch[1], 10) : 100;
    const totalFrames = fMatch ? parseInt(fMatch[1], 10) : 1;

    // Find image asset matching action
    let imageFile = null;
    let charId = null;
    let symbolFullName = null;

    for (const [sCharId, sName] of Object.entries(symbolImageMap)) {
      // sName can be "1_mid151.walk.png" or "mid151.walk"
      const lower = sName.toLowerCase();
      if (lower.includes(`.${actionKey}.`) || lower.endsWith(`.${actionKey}`) || lower.includes(`_${actionKey}.`) || lower === actionKey) {
        imageFile = sName;
        charId = parseInt(sCharId, 10);
        symbolFullName = `${modelName}.${actionKey}`;
        break;
      }
    }

    const actionObj = {
      key: actionKey,
      time: intervalTime,
      frames: totalFrames,
      image: imageFile,
      charId: charId,
      symbol: symbolFullName,
      directions: {},
      parts: []
    };

    const pRegex = /<p\s+([^>]+)\/>/g;
    let pMatch;
    while ((pMatch = pRegex.exec(sBody)) !== null) {
      const pAttrs = pMatch[1];
      const getAttr = (name, def = 0) => {
        const m = pAttrs.match(new RegExp(`${name}=["']([^"']+)["']`));
        return m ? parseInt(m[1], 10) : def;
      };

      const angle = getAttr('a');
      const frame = getAttr('f');
      const sx = getAttr('sx');
      const sy = getAttr('sy');
      const w = getAttr('w');
      const h = getAttr('h');
      const tx = getAttr('tx');
      const ty = getAttr('ty');
      const ox = getAttr('ox');
      const oy = getAttr('oy');

      const partData = {
        angle,
        frame,
        sx,
        sy,
        width: w,
        height: h,
        tx,
        ty,
        ox,
        oy,
        anchorX: tx + ox,
        anchorY: ty + oy
      };

      actionObj.parts.push(partData);

      // Group by angle/direction (0..7)
      if (!actionObj.directions[angle]) {
        actionObj.directions[angle] = [];
      }
      actionObj.directions[angle].push(partData);
    }

    result.actions[actionKey] = actionObj;
    result.totalActions++;
  }

  // 2. Format: <status type="action" frame="f" time="t" width="w" height="h" tx="x" ty="y" />
  const statusRegex = /<status\s+([^>]+)\/>/g;
  let statusMatch;
  while ((statusMatch = statusRegex.exec(xmlStr)) !== null) {
    const attrs = statusMatch[1];
    const getAttr = (name, def = 0) => {
      const m = attrs.match(new RegExp(`${name}=["']([^"']+)["']`));
      if (!m) return def;
      const val = parseInt(m[1], 10);
      return isNaN(val) ? m[1] : val;
    };

    const actionType = String(getAttr('type', 'default'));
    let imageFile = null;
    let charId = null;

    for (const [sCharId, sName] of Object.entries(symbolImageMap)) {
      const lower = sName.toLowerCase();
      if (lower.includes(`.${actionType}.`) || lower.endsWith(`.${actionType}`) || lower.includes(`_${actionType}.`) || lower === actionType) {
        imageFile = sName;
        charId = parseInt(sCharId, 10);
        break;
      }
    }

    result.actions[actionType] = {
      key: actionType,
      time: getAttr('time', 100),
      frames: getAttr('frame', 1),
      width: getAttr('width', 0),
      height: getAttr('height', 0),
      tx: getAttr('tx', 0),
      ty: getAttr('ty', 0),
      image: imageFile,
      charId,
      isOldWay: true
    };
    result.totalActions++;
  }

  return result.totalActions > 0 ? result : null;
}
