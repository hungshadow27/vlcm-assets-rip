package com.tgame.manager
{
   public class TimeManager
   {
      
      public function TimeManager()
      {
         super();
      }
      
      public static function getTime1(param1:int) : Array
      {
         param1 /= 1000;
         return [Math.floor(param1 / 3600),Math.floor(param1 / 60) % 60,Math.floor(param1 % 60)];
      }
      
      public static function millisecond2Str2(param1:int, param2:String = ":") : String
      {
         var _loc3_:Array = getTime2(param1);
         return _loc3_.join(param2);
      }
      
      public static function getTime2(param1:Number) : Array
      {
         param1 /= 1000;
         return [TimeManager.setFormat(Math.floor(param1 / 3600)),TimeManager.setFormat(Math.floor(param1 / 60) % 60),TimeManager.setFormat(Math.floor(param1 % 60))];
      }
      
      public static function setFormat(param1:int) : String
      {
         if(param1 > 9)
         {
            return String(param1);
         }
         return "0" + String(param1);
      }
   }
}

