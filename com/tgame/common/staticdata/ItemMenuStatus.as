package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class ItemMenuStatus
   {
      
      public static var USE:String = "使用";
      
      public static var USE2:String = "佩戴";
      
      public static var USE3:String = "坐骑佩戴";
      
      public static var UNLOAD:String = "卸下";
      
      public static var DESTROY:String = "销毁";
      
      public static var SPLIT:String = "拆分";
      
      public static var MOVE:String = "移动";
      
      public static var NORMAL:String = "NORMAL";
      
      public static var MOVE_TO_CHAT:String = "发到聊天框";
      
      public static var ADD_STONE:String = "宝石镶嵌";
      
      public static var SUPER_XIANGQIAN:String = "超级镶嵌";
      
      public static var SYNTHESIS_STONE:String = "合成";
      
      public static var ADD_SHELIZI:String = "镶嵌舍利子";
      
      public static var EQUIP2BAOSHI:String = "兑换礼金";
      
      public static var KAI_GUANG:String = "虎翼开光";
      
      public static var LING_HUA:String = "虎翼灵化";
      
      public static var XI_LIAN:String = "虎翼洗炼";
      
      public static var LONGYIN_KAI_GUANG:String = "龙吟开光";
      
      public static var LONGYA_KAI_GUANG:String = "龙牙开光";
      
      public static var KUAISU_SHEGNJIE:String = "装备升阶";
      
      public static var SELECT_EQUIP:String = "切换武器外观";
      
      public static var YN_SELECT_SBTR_EQUIP:String = "切换装备";
      
      public static var ZHUANGBEI_JI_HUO:String = "激活";
      
      public static var HUSHEN_XI_LIAN:String = "护身符洗炼";
      
      public static var ZHUANGBEI_YANGCHENG:String = "装备养成";
      
      public static var SUODING:String = "锁定";
      
      public static var JIESUO:String = "解锁";
      
      public static var FANGRUZHANXING:String = "放入战星";
      
      public static var QUCHUZHANXING:String = "取出战星";
      
      public static var XUNZHANG_DUANZAO:String = "强化";
      
      public static var ZUOQI_DAZAO:String = "打造";
      
      public static var COPY:String = "复制";
      
      public static var MENU_XIANGQIAN:String = "镶嵌";
      
      public static var MENU_XUNZHANGXIANGQIAN:String = "勋章镶嵌";
      
      public static var SHISHIKAIFENG:String = "史诗开封";
      
      public static var TISHENGPINZHI:String = "提升品质";
      
      public static var SHENGDAN_XUNZHANG_SHENGJI:String = "升级";
      
      public static var XUNZHANG_XILIAN:String = "勋章洗练";
      
      public static var DUOXUAN_QIANGHUA:String = "多选强化";
      
      public static var SHENQI_JINHUA:String = "进化";
      
      public static var TIANSHANGZHIHUN_SHENGJIE:String = "升星";
      
      public static var CHUANSHUO_XI_LIAN:String = "传说洗炼";
      
      public static var YNAOJIAN_ZHIZAO:String = "制造";
      
      public static var YNFENJIE:String = "分解";
      
      public static var WUFANGQIANGHUA:String = "武防强化";
      
      public static var YN_PILIANG:String = "批量";
      
      public static var YN_DUANLIAN:String = "锻炼";
      
      public function ItemMenuStatus()
      {
         super();
      }
      
      public static function init() : void
      {
         USE = LanResManager.getLanCommonTextWords("使用");
         USE2 = LanResManager.getLanCommonTextWords("佩戴");
         USE3 = LanResManager.getLanCommonTextWords("坐骑佩戴");
         UNLOAD = LanResManager.getLanCommonTextWords("卸下");
         SPLIT = LanResManager.getLanCommonTextWords("拆分");
         DESTROY = LanResManager.getLanCommonTextWords("销毁");
         MOVE = LanResManager.getLanCommonTextWords("移动");
         NORMAL = LanResManager.getLanCommonTextWords("NORMAL");
         MOVE_TO_CHAT = LanResManager.getLanCommonTextWords("发到聊天框");
         ADD_STONE = LanResManager.getLanCommonTextWords("宝石镶嵌");
         SUPER_XIANGQIAN = "Khảm Siêu Cấp ";
         SYNTHESIS_STONE = LanResManager.getLanCommonTextWords("合成");
         ADD_SHELIZI = LanResManager.getLanCommonTextWords("镶嵌舍利子");
         EQUIP2BAOSHI = LanResManager.getLanCommonTextWords("兑换礼金");
         KAI_GUANG = LanResManager.getLanCommonTextWords("虎翼开光");
         LING_HUA = LanResManager.getLanCommonTextWords("虎翼灵化");
         XI_LIAN = LanResManager.getLanCommonTextWords("虎翼洗炼");
         LONGYIN_KAI_GUANG = LanResManager.getLanCommonTextWords("龙吟开光");
         SELECT_EQUIP = LanResManager.getLanCommonTextWords("切换武器外观");
         ZHUANGBEI_JI_HUO = LanResManager.getLanCommonTextWords("激活");
         HUSHEN_XI_LIAN = LanResManager.getLanCommonTextWords("护身符洗炼");
         KUAISU_SHEGNJIE = LanResManager.getLanCommonTextWords("装备升阶");
         ZHUANGBEI_YANGCHENG = LanResManager.getLanCommonTextWords("装备养成");
         SUODING = LanResManager.getLanCommonTextWords("锁定");
         JIESUO = LanResManager.getLanCommonTextWords("解锁");
         FANGRUZHANXING = LanResManager.getLanCommonTextWords("放入战星");
         QUCHUZHANXING = LanResManager.getLanCommonTextWords("取出战星");
         XUNZHANG_DUANZAO = LanResManager.getLanCommonTextWords("强化");
         COPY = LanResManager.getLanCommonTextWords("复制");
         MENU_XIANGQIAN = LanResManager.getLanCommonTextWords("镶嵌");
         SHISHIKAIFENG = LanResManager.getLanCommonTextWords("史诗开封");
         TISHENGPINZHI = LanResManager.getLanCommonTextWords("提升品质");
         ZUOQI_DAZAO = LanResManager.getLanCommonTextWords("打造");
         SHENGDAN_XUNZHANG_SHENGJI = LanResManager.getLanCommonTextWords("升级1");
         MENU_XUNZHANGXIANGQIAN = LanResManager.getLanCommonTextWords("勋章镶嵌");
         XUNZHANG_XILIAN = LanResManager.getLanCommonTextWords("勋章洗练1");
         TIANSHANGZHIHUN_SHENGJIE = LanResManager.getLanCommonTextWords("升星");
         DUOXUAN_QIANGHUA = LanResManager.getLanCommonTextWords("多选强化");
         SHENQI_JINHUA = LanResManager.getLanCommonTextWords("进化");
         CHUANSHUO_XI_LIAN = LanResManager.getLanCommonTextWords("传说洗炼");
         YNAOJIAN_ZHIZAO = LanResManager.getLanCommonTextWords("制造");
         YNFENJIE = LanResManager.getLanCommonTextWords("分解");
         YN_SELECT_SBTR_EQUIP = LanResManager.getLanCommonTextWords("切换装备");
         WUFANGQIANGHUA = LanResManager.getLanCommonTextWords("武防强化");
         YN_PILIANG = LanResManager.getLanCommonTextWords("批量");
         YN_DUANLIAN = LanResManager.getLanCommonTextWords("锻炼");
      }
   }
}

