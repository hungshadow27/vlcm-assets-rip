package com.tgame.moudels.dongxiao.model.vo
{
   public class DongXiaoInfo
   {
      
      public var lv:int;
      
      public var name:String;
      
      public var add_ap:int;
      
      public var add_dp:int;
      
      public var add_hp:int;
      
      public var add_mp:int;
      
      public var add_pp:int;
      
      public var isOpen:Boolean;
      
      public var nowXiulian:int;
      
      public var maxXiulian:int;
      
      public var status:int;
      
      public var des:String;
      
      public var skillArr:Array;
      
      public var tupoGoodsID:int;
      
      public var tupoGoodsCount:int;
      
      public var jilv:int;
      
      public var nowXingyun:int;
      
      public var maxXingyun:int;
      
      public var nextXiaoName:String;
      
      public var visible:Boolean;
      
      public var isJihuo:int;
      
      public var jihuoJindu:int;
      
      public var addJihuoGongji:int;
      
      public var addJihuoFangyu:int;
      
      public var addJihuoShengming:int;
      
      public var isZhanyin:Boolean;
      
      public function DongXiaoInfo()
      {
         super();
      }
      
      public static function getShowLv(param1:int) : int
      {
         var _loc2_:int = param1 % 4;
         return _loc2_ != 0 ? _loc2_ : 4;
      }
      
      public function get duan() : int
      {
         return Math.ceil(this.lv / 4);
      }
   }
}

