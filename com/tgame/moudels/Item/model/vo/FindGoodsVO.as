package com.tgame.moudels.Item.model.vo
{
   public class FindGoodsVO
   {
      
      public var goodId:int;
      
      public var num:int;
      
      public var price:int;
      
      public var shopId:int;
      
      public function FindGoodsVO(param1:int, param2:int, param3:int = 0, param4:int = 0)
      {
         super();
         this.goodId = param1;
         this.num = param2;
         this.price = param3;
         this.shopId = param4;
      }
      
      public function clon() : FindGoodsVO
      {
         return new FindGoodsVO(this.goodId,this.num,this.price,this.shopId);
      }
   }
}

