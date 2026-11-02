package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class TaskPublishType
   {
      
      public static const NPC:int = 1;
      
      public static const CREAT_PLAYER:int = 2;
      
      public static const GOODS:int = 3;
      
      public static const SYSTEM:int = 4;
      
      public static const ADVENTURE:int = 5;
      
      private static var valueName:Array = [[NPC,"NPC发布"],[CREAT_PLAYER,"出生发布"],[GOODS,"道具发布"],[SYSTEM,"系统发布"],[ADVENTURE,"奇遇发布"]];
      
      public function TaskPublishType()
      {
         super();
      }
      
      public static function init() : void
      {
         valueName = [[NPC,LanResManager.getLanCommonTextWords("NPC发布")],[CREAT_PLAYER,LanResManager.getLanCommonTextWords("出生发布")],[GOODS,LanResManager.getLanCommonTextWords("道具发布")],[SYSTEM,LanResManager.getLanCommonTextWords("系统发布")],[ADVENTURE,LanResManager.getLanCommonTextWords("奇遇发布")]];
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

