package com.tgame.common.utils
{
   import flash.filters.ColorMatrixFilter;
   
   public class FilterUtil
   {
      
      public function FilterUtil()
      {
         super();
      }
      
      public static function getFilter_ChiXueMoZhen() : ColorMatrixFilter
      {
         var _loc1_:Array = new Array(0.6,0.2,0.2,0,0,0,0.1,0.1,0,0,0,0.1,0.1,0,0,0,0,0,1,0);
         return new ColorMatrixFilter(_loc1_);
      }
      
      public static function getFilter_EMoZhiShou() : ColorMatrixFilter
      {
         var _loc1_:Array = new Array(0.258460460327369,0.113670389761907,-0.022130850089276,0,18.525,0.038668894432426,0.289301487594373,0.0220296179732011,0,18.525,0.0725823835307775,0.0615238420085274,0.215893774460695,0,18.525,0,0,0,1,0);
         return new ColorMatrixFilter(_loc1_);
      }
      
      public static function getFilter_bantouming() : ColorMatrixFilter
      {
         var _loc1_:Array = new Array(1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0.5,0);
         return new ColorMatrixFilter(_loc1_);
      }
   }
}

