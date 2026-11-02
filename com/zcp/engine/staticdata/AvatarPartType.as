package com.zcp.engine.staticdata
{
   public class AvatarPartType
   {
      
      public static var BODY:String = "body";
      
      public static var WEAPON:String = "weapon";
      
      public static var BOW:String = "bow";
      
      public static var ZHENHUN:String = "zhenhun";
      
      public static var SWING:String = "swing";
      
      public static var HEAD:String = "head";
      
      public static var MOUNT:String = "mount";
      
      public static var MAGIC_RING:String = "magic_ring";
      
      public static var MAGIC:String = "magic";
      
      public static var MAGIC_PASS:String = "magic_pass";
      
      private static const defautRepeatArr:Array = [[MOUNT,0],[BODY,0],[WEAPON,0],[BOW,0],[SWING,0],[HEAD,0],[MAGIC_RING,0],[MAGIC_PASS,0],[MAGIC,1]];
      
      private static const depth01267Arr:Array = [[MOUNT,-100],[SWING,-23],[HEAD,-22],[BOW,-21],[BODY,0],[WEAPON,22],[MAGIC_RING,29],[MAGIC_PASS,30],[MAGIC,31]];
      
      private static const depth345Arr:Array = [[MOUNT,-100],[BODY,0],[BOW,21],[WEAPON,22],[HEAD,23],[SWING,24],[MAGIC_RING,29],[MAGIC_PASS,30],[MAGIC,31]];
      
      public static const mouseFloodArr:Array = [BODY,WEAPON,BOW,SWING,HEAD,MOUNT];
      
      public function AvatarPartType()
      {
         super();
      }
      
      public static function getDefaultRepeat(param1:String) : int
      {
         var _loc2_:Array = null;
         for each(_loc2_ in defautRepeatArr)
         {
            if(_loc2_[0] == param1)
            {
               return _loc2_[1];
            }
         }
         return 0;
      }
      
      public static function getDefaultDepth(param1:String, param2:int = 0) : int
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         if(param2 == 3 || param2 == 4 || param2 == 5)
         {
            _loc4_ = depth345Arr;
         }
         else
         {
            _loc4_ = depth01267Arr;
         }
         for each(_loc3_ in _loc4_)
         {
            if(_loc3_[0] == param1)
            {
               return _loc3_[1];
            }
         }
         return 0;
      }
   }
}

