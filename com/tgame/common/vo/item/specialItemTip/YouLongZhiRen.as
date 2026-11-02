package com.tgame.common.vo.item.specialItemTip
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Buff;
   
   public class YouLongZhiRen
   {
      
      public function YouLongZhiRen()
      {
         super();
      }
      
      public static function getItemTipXML(param1:Buff) : XML
      {
         var _loc3_:XML = null;
         var _loc2_:XML = <data/>;
         _loc3_ = XML("<row id=\'" + 4 + "\' txt=\'" + param1.res.name + "\' color=\'" + StaticValue.PURPLE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 255 + "\' txt=\'" + param1.res.id_ico_big + "\' color=\'" + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 258 + "\' txt=\'" + LanResManager.getLanCommonTextWords("佩戴部位   武器") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 258 + "\' txt=\'" + LanResManager.getLanCommonTextWords("装备阶数   唯一") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 258 + "\' txt=\'" + LanResManager.getLanCommonTextWords("使用等级   不限") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 258 + "\' txt=\'" + LanResManager.getLanCommonTextWords("门派限制   不限") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 5 + "\' txt=\'" + LanResManager.getLanCommonTextWords("游龙之刃描述") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 258 + "\' txt=\'" + LanResManager.getLanCommonTextWords("耐久度     永不磨损") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 258 + "\' txt=\'" + LanResManager.getLanCommonTextWords("强化等级   无法锻造") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 251 + "\' txt=\'" + LanResManager.getLanCommonTextWords("基本属性") + "\' color=\'" + StaticValue.ORANGE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + "\' txt=\'  " + LanResManager.getLanCommonTextWords("攻击") + "+20000000\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + "\' txt=\'  " + LanResManager.getLanCommonTextWords("防御") + "+20000000\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + "\' txt=\'  " + LanResManager.getLanCommonTextWords("暴击") + "+888\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + "\' txt=\'  " + LanResManager.getLanCommonTextWords("闪避") + "+888\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + 251 + "\' txt=\'" + LanResManager.getLanCommonTextWords("特殊属性") + "\' color=\'" + StaticValue.ORANGE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + "\' txt=\'  " + LanResManager.getLanCommonTextWords("【王威】：战斗时有额外5%的几率打出3倍暴击伤害") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + "\' txt=\'  " + LanResManager.getLanCommonTextWords("【臣服】：战斗时有额外5%的几率将对手从坐骑上击落") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         _loc3_ = XML("<row id=\'" + "\' txt=\'  " + LanResManager.getLanCommonTextWords("【暴击减免】：减免对手的30000000暴击属性") + "\' color=\'" + StaticValue.WHITE_HTML + "\' />");
         _loc2_.appendChild(_loc3_);
         return _loc2_;
      }
   }
}

