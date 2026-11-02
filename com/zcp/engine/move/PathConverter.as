package com.zcp.engine.move
{
   import flash.utils.ByteArray;
   
   public class PathConverter
   {
      
      public function PathConverter()
      {
         super();
      }
      
      public static function convertToVector(param1:Array) : ByteArray
      {
         var _loc8_:int = 0;
         var _loc2_:ByteArray = new ByteArray();
         if(param1.length < 2)
         {
            return _loc2_;
         }
         _loc2_.writeShort(param1[0][0]);
         _loc2_.writeShort(param1[0][1]);
         var _loc3_:int = int(param1[0][0]);
         var _loc4_:int = int(param1[0][1]);
         var _loc5_:int = param1.length - 1;
         _loc2_.writeByte(_loc5_);
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = getNextDirection(_loc3_,_loc4_,param1[_loc7_ + 1][0],param1[_loc7_ + 1][1]);
            _loc3_ = int(param1[_loc7_ + 1][0]);
            _loc4_ = int(param1[_loc7_ + 1][1]);
            if(_loc7_ % 2 == 0)
            {
               _loc6_ = _loc8_ << 4;
            }
            else
            {
               _loc6_ |= _loc8_;
               _loc2_.writeByte(_loc6_);
            }
            _loc7_++;
         }
         if(_loc5_ % 2 == 1)
         {
            _loc2_.writeByte(_loc6_);
         }
         _loc2_.position = 0;
         return _loc2_;
      }
      
      public static function convertToPoint(param1:ByteArray) : Array
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = new Array();
         _loc5_[0] = [_loc2_,_loc3_];
         var _loc6_:int = 1;
         var _loc7_:int = _loc4_ % 2 == 0 ? int(_loc4_ / 2) : int(_loc4_ / 2 + 1);
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc9_ = param1.readByte();
            _loc10_ = (_loc9_ & 0xF0) >> 4;
            _loc5_[_loc6_] = [getNextDirectionX(_loc2_,_loc10_),getNextDirectionY(_loc3_,_loc10_)];
            _loc2_ = int(_loc5_[_loc6_][0]);
            _loc3_ = int(_loc5_[_loc6_][1]);
            if(++_loc6_ < _loc4_ + 1)
            {
               _loc10_ = _loc9_ & 0x0F;
               _loc5_[_loc6_] = [getNextDirectionX(_loc2_,_loc10_),getNextDirectionY(_loc3_,_loc10_)];
               _loc2_ = int(_loc5_[_loc6_][0]);
               _loc3_ = int(_loc5_[_loc6_][1]);
               _loc6_++;
            }
            _loc8_++;
         }
         return _loc5_;
      }
      
      private static function getNextDirectionX(param1:int, param2:int) : int
      {
         if(param2 == 0 || param2 == 6 || param2 == 7)
         {
            return param1 - 1;
         }
         if(param2 == 1 || param2 == 5)
         {
            return param1;
         }
         if(param2 == 2 || param2 == 3 || param2 == 4)
         {
            return param1 + 1;
         }
         return -1;
      }
      
      private static function getNextDirection(param1:int, param2:int, param3:int, param4:int) : int
      {
         if(param3 < param1)
         {
            if(param4 < param2)
            {
               return 0;
            }
            if(param4 == param2)
            {
               return 7;
            }
            return 6;
         }
         if(param3 == param1)
         {
            if(param4 < param2)
            {
               return 1;
            }
            return 5;
         }
         if(param4 < param2)
         {
            return 2;
         }
         if(param4 == param2)
         {
            return 3;
         }
         return 4;
      }
      
      private static function getNextDirectionY(param1:int, param2:int) : int
      {
         if(param2 == 0 || param2 == 1 || param2 == 2)
         {
            return param1 - 1;
         }
         if(param2 == 3 || param2 == 7)
         {
            return param1;
         }
         if(param2 == 4 || param2 == 5 || param2 == 6)
         {
            return param1 + 1;
         }
         return -1;
      }
   }
}

