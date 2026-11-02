package com.tgame.moudels.mall.model.vo
{
   import com.tgame.common.vo.item.Goods;
   
   public class MallLunJianGoodsVO
   {
      
      public var type:int;
      
      public var mallID:int;
      
      public var goods:Goods;
      
      public var shengWangType:int;
      
      public var shengWang:int;
      
      public var desc:String;
      
      public var use_desc:String;
      
      public function MallLunJianGoodsVO()
      {
         super();
      }
   }
}

