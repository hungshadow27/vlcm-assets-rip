package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class MountQuality
   {
      
      public static var QUALITY1:int = 1;
      
      public static var QUALITY2:int = 2;
      
      public static var QUALITY3:int = 3;
      
      public static var QUALITY4:int = 4;
      
      public static var QUALITY5:int = 5;
      
      private static var mapping:Array = [[QUALITY1,"普通"],[QUALITY2,"优良"],[QUALITY3,"稀有"],[QUALITY4,"神级"],[QUALITY5,"传说"]];
      
      public function MountQuality()
      {
         super();
      }
      
      public static function init() : void
      {
         mapping = [[QUALITY1,LanResManager.getLanCommonTextWords("普通")],[QUALITY2,LanResManager.getLanCommonTextWords("优良")],[QUALITY3,LanResManager.getLanCommonTextWords("稀有")],[QUALITY4,LanResManager.getLanCommonTextWords("神级")],[QUALITY5,LanResManager.getLanCommonTextWords("传说")]];
      }
      
      public static function getName(param1:int, param2:String = "") : String
      {
         var _loc3_:Array = null;
         for each(_loc3_ in mapping)
         {
            if(_loc3_[0] == param1)
            {
               return _loc3_[1].toString().split("").join(param2);
            }
         }
         return "";
      }
      
      public static function getID(param1:String) : int
      {
         var _loc2_:Array = null;
         for each(_loc2_ in mapping)
         {
            if(param1 == _loc2_[1])
            {
               return _loc2_[0];
            }
         }
         return 0;
      }
   }
}

