package com.zcp.common.vo
{
   import flash.geom.Rectangle;
   
   public class Bounds
   {
      
      private static const max:Function = Math.max;
      
      private static const min:Function = Math.min;
      
      public var left:int;
      
      public var right:int;
      
      public var top:int;
      
      public var bottom:int;
      
      public function Bounds(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0)
      {
         super();
         this.left = param1;
         this.right = param2;
         this.top = param3;
         this.bottom = param4;
      }
      
      public static function toRectangle(param1:Bounds) : Rectangle
      {
         return new Rectangle(param1.left,param1.top,param1.right - param1.left,param1.bottom - param1.top);
      }
      
      public static function fromRectangle(param1:Rectangle) : Bounds
      {
         return new Bounds(param1.left,param1.right,param1.top,param1.bottom);
      }
      
      public function isEmpty() : Boolean
      {
         return this.right <= this.left || this.bottom <= this.top;
      }
      
      public function areaSize() : int
      {
         return (this.right - this.left) * (this.bottom - this.top);
      }
      
      public function contains(param1:Bounds) : Boolean
      {
         return param1.left >= this.left && param1.right <= this.right && param1.top >= this.top && param1.bottom <= this.bottom;
      }
      
      public function equals(param1:Bounds) : Boolean
      {
         return param1.left == this.left && param1.right == this.right && param1.top == this.top && param1.bottom == this.bottom;
      }
      
      public function intersects(param1:Bounds) : Boolean
      {
         var _loc2_:int = max(this.left,param1.left);
         var _loc3_:int = min(this.right,param1.right);
         var _loc4_:int = max(this.top,param1.top);
         var _loc5_:int = min(this.bottom,param1.bottom);
         if(_loc2_ < _loc3_ && _loc4_ < _loc5_)
         {
            return true;
         }
         return false;
      }
      
      public function intersection(param1:Bounds) : Bounds
      {
         var _loc2_:int = max(this.left,param1.left);
         var _loc3_:int = min(this.right,param1.right);
         var _loc4_:int = max(this.top,param1.top);
         var _loc5_:int = min(this.bottom,param1.bottom);
         if(_loc2_ < _loc3_ && _loc4_ < _loc5_)
         {
            return new Bounds(_loc2_,_loc3_,_loc4_,_loc5_);
         }
         return null;
      }
      
      public function union(param1:Bounds) : Bounds
      {
         var _loc2_:int = min(this.left,param1.left);
         var _loc3_:int = max(this.right,param1.right);
         var _loc4_:int = min(this.top,param1.top);
         var _loc5_:int = max(this.bottom,param1.bottom);
         return new Bounds(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function extend(param1:Bounds) : void
      {
         this.left = min(this.left,param1.left);
         this.right = max(this.right,param1.right);
         this.top = min(this.top,param1.top);
         this.bottom = max(this.bottom,param1.bottom);
      }
      
      public function clone() : Bounds
      {
         return new Bounds(this.left,this.right,this.top,this.bottom);
      }
   }
}

