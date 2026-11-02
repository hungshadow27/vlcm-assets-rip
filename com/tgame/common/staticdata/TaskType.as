package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class TaskType
   {
      
      public static const MAIN:int = 1;
      
      public static const LATERAL:int = 2;
      
      public static const DAY_LOOP:int = 3;
      
      public static const DAY_YABIAO:int = 4;
      
      public static const WEEK_LOOP:int = 5;
      
      public static const LV_LOOP:int = 6;
      
      public static const CISHA:int = 7;
      
      public static var valueName:Array = [[TaskType.MAIN,"主线"],[TaskType.LATERAL,"支线"],[TaskType.DAY_LOOP,"日环"],[TaskType.DAY_YABIAO,"押镖"],[TaskType.WEEK_LOOP,"周环"],[TaskType.LV_LOOP,"循环"],[TaskType.CISHA,"刺杀"]];
      
      public function TaskType()
      {
         super();
      }
      
      public static function init() : void
      {
         valueName = [[TaskType.MAIN,LanResManager.getLanCommonTextWords("主线")],[TaskType.LATERAL,LanResManager.getLanCommonTextWords("支线")],[TaskType.DAY_LOOP,LanResManager.getLanCommonTextWords("日环")],[TaskType.DAY_YABIAO,LanResManager.getLanCommonTextWords("押镖")],[TaskType.WEEK_LOOP,LanResManager.getLanCommonTextWords("周环")],[TaskType.LV_LOOP,LanResManager.getLanCommonTextWords("循环")],[TaskType.CISHA,LanResManager.getLanCommonTextWords("刺杀")]];
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

