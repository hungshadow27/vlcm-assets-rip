package com.tgame.common.staticdata
{
   public class HeadResChange
   {
      
      public function HeadResChange()
      {
         super();
      }
      
      public static function headResChangeToInt(param1:String) : int
      {
         var _loc2_:Array = param1.split("_");
         param1 = "";
         var _loc3_:int = 1;
         while(_loc3_ < _loc2_.length)
         {
            param1 += String(_loc2_[_loc3_]);
            _loc3_++;
         }
         return int(param1);
      }
      
      public static function headResChangeToString(param1:int) : String
      {
         var _loc2_:Array = String(param1).split("");
         var _loc3_:String = "ui.login.head.head";
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ += "_" + _loc2_[_loc4_];
            _loc4_++;
         }
         return _loc3_;
      }
   }
}

