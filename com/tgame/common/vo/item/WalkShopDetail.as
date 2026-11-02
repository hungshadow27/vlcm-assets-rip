package com.tgame.common.vo.item
{
   public class WalkShopDetail extends WalkShop
   {
      
      public var goods:Array = [];
      
      public var mounts:Array = [];
      
      public function WalkShopDetail()
      {
         super();
      }
      
      public function getDetailByIndex(param1:int) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.goods.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.goods[_loc2_].index == param1)
            {
               return this.goods[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function getDetailByIDMount(param1:int) : Object
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.mounts.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.mounts[_loc2_].label == param1)
            {
               return this.mounts[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
   }
}

