package com.tgame.manager
{
   public class NumberFormatter
   {
      
      public function NumberFormatter()
      {
         super();
      }
      
      public static function formatThousands(param1:Number) : String
      {
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc2_:String = Math.abs(param1).toString();
         var _loc3_:Array = new String(_loc2_).split(".");
         var _loc4_:int = String(_loc3_[0]).length;
         if(_loc4_ > 3)
         {
            _loc5_ = int(Math.floor(_loc4_ / 3));
            if(_loc4_ % 3 == 0)
            {
               _loc5_--;
            }
            _loc6_ = _loc4_;
            _loc7_ = _loc6_ - 3;
            _loc8_ = [];
            _loc9_ = 0;
            while(_loc9_ <= _loc5_)
            {
               _loc8_[_loc9_] = _loc3_[0].slice(_loc7_,_loc6_);
               _loc7_ = int(Math.max(_loc7_ - 3,0));
               _loc6_ = int(Math.max(_loc6_ - 3,1));
               _loc9_++;
            }
            _loc8_.reverse();
            _loc3_[0] = _loc8_.join(",");
         }
         _loc2_ = _loc3_.join(".");
         return _loc2_.toString();
      }
   }
}

