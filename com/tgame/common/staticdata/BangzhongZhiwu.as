package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class BangzhongZhiwu
   {
      
      public static const ZW0:uint = 0;
      
      public static const ZW1:uint = 1;
      
      public static const ZW2:uint = 2;
      
      public static const ZW3:uint = 3;
      
      public static const ZW4:uint = 4;
      
      public static const ZW5:uint = 5;
      
      public static var valueName:Array = [[ZW0,"无"],[ZW1,"帮主"],[ZW2,"副帮主"],[ZW3,"大长老"],[ZW4,"大师兄"],[ZW5,"大师姐"]];
      
      public function BangzhongZhiwu()
      {
         super();
      }
      
      public static function init() : void
      {
         valueName = [[ZW0,LanResManager.getLanCommonTextWords("无")],[ZW1,LanResManager.getLanCommonTextWords("帮主")],[ZW2,LanResManager.getLanCommonTextWords("副帮主")],[ZW3,LanResManager.getLanCommonTextWords("大长老")],[ZW4,LanResManager.getLanCommonTextWords("大师兄")],[ZW5,LanResManager.getLanCommonTextWords("大师姐")]];
      }
      
      public static function getNameByValue(param1:int) : String
      {
         var _loc2_:Array = null;
         for each(_loc2_ in valueName)
         {
            if(_loc2_[0] == param1)
            {
               return _loc2_[1];
            }
         }
         return "";
      }
      
      public static function getValueByName(param1:String) : int
      {
         var _loc2_:Array = null;
         for each(_loc2_ in valueName)
         {
            if(_loc2_[1] == param1)
            {
               return _loc2_[0];
            }
         }
         return -1;
      }
   }
}

