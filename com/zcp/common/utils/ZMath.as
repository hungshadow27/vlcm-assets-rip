package com.zcp.common.utils
{
   import flash.geom.Point;
   
   public class ZMath
   {
      
      private static var abs:Function = Math.abs;
      
      private static var sin:Function = Math.sin;
      
      private static var cos:Function = Math.cos;
      
      private static var sqrt:Function = Math.sqrt;
      
      private static var PI:Number = Math.PI;
      
      public static var toDeg:Number = 180 / PI;
      
      public static var toRad:Number = PI / 180;
      
      public function ZMath()
      {
         super();
      }
      
      public static function getRandomNumber(param1:Number, param2:Number) : Number
      {
         return Math.floor(Math.random() * (param2 - param1 + 1)) + param1;
      }
      
      public static function getDistanceSquare(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return (param1 - param3) * (param1 - param3) + (param2 - param4) * (param2 - param4);
      }
      
      public static function getRotPoint(param1:Point, param2:Point, param3:Number) : Point
      {
         param3 *= ZMath.toRad;
         var _loc4_:Point = new Point();
         _loc4_.x = Math.cos(param3) * (param1.x - param2.x) - Math.sin(param3) * (param1.y - param2.y) + param2.x;
         _loc4_.y = Math.cos(param3) * (param1.y - param2.y) + Math.sin(param3) * (param1.x - param2.x) + param2.y;
         return _loc4_;
      }
      
      public static function getTowPointsAngle(param1:Point, param2:Point) : Number
      {
         var _loc3_:Number = Math.atan2(param2.y - param1.y,param2.x - param1.x);
         if(_loc3_ < 0)
         {
            _loc3_ += 2 * Math.PI;
         }
         return _loc3_ * 180 / Math.PI;
      }
      
      public static function getNearAngel(param1:Number, param2:int = 8) : int
      {
         param1 = (param1 % 360 + 360) % 360;
         var _loc3_:Number = 360 / param2;
         var _loc4_:int = Math.floor(param1 / _loc3_);
         var _loc5_:Number = _loc4_ * _loc3_;
         var _loc6_:Number = (_loc4_ + 1) * _loc3_;
         return (param1 - _loc5_ <= _loc6_ - param1 ? _loc5_ : _loc6_) % 360;
      }
   }
}

