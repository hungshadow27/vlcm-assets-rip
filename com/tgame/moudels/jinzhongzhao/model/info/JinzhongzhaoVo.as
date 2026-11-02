package com.tgame.moudels.jinzhongzhao.model.info
{
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class JinzhongzhaoVo
   {
      
      public var userID:int = 0;
      
      public var learnedSkillID:int = 0;
      
      public var viewSkillID:int = 1;
      
      public var viewSkillName:String;
      
      public var viewSkillDesc:String;
      
      public var isLingwu:int = 0;
      
      public var minShengming:int = 0;
      
      public var maxShengming:int = 0;
      
      public var minFangyu:int = 0;
      
      public var maxFangyu:int = 0;
      
      public var minNeili:int = 0;
      
      public var maxNeili:int = 0;
      
      public var minTili:int = 0;
      
      public var maxTili:int = 0;
      
      public var goodId:int;
      
      public var shiyongArray:Array = [];
      
      public var sk:int;
      
      public var skMiaoshu:String;
      
      public var chi:Boolean;
      
      public var dese:String;
      
      public var isQiangHua:Boolean;
      
      public var fumoBo:Boolean;
      
      public var isJinzhongTuwen:Boolean;
      
      public function JinzhongzhaoVo()
      {
         super();
      }
      
      public function getMiaoshu(param1:Array) : String
      {
         var _loc2_:String = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您可以使用") + "</font>";
         var _loc3_:GoodsRes = GoodsResManager.getGoodsRes(this.goodId);
         _loc2_ += "<u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:goodsID#" + _loc3_.id_kind + "\'>" + _loc3_.name + "</a></font></u>";
         _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("来修炼金钟罩") + "，" + "</font>";
         _loc2_ += "<u><font color=\'" + StaticValue.GREEN_HTML + "\'><a href=\'event:goodsID#" + _loc3_.id_kind + "\'>" + _loc3_.name + "</a></font></u>";
         return _loc2_ + ("<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("可以击杀70-90级的地图怪物获得") + "</font>");
      }
   }
}

