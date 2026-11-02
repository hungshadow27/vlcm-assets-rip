package com.tgame.common.vo.item
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class MallGoods extends Goods
   {
      
      public static var Goods_Type:Array = ["特惠类","丹药类","材料类","其他类","礼金类"];
      
      public var f_id:int;
      
      private var f_goods_type:int;
      
      public var f_sale_type:int;
      
      public var f_goods_price:int;
      
      public var f_goods_price_org:int;
      
      public var f_hot_mark:int;
      
      public var f_abate_mark:int;
      
      public var f_order:int;
      
      public var f_type:int;
      
      public function MallGoods(param1:int, param2:int)
      {
         super(param2);
         this.f_id = param1;
         this.f_goods_type = 1;
      }
      
      public static function init() : void
      {
         Goods_Type = [LanResManager.getLanCommonTextWords("特惠类"),LanResManager.getLanCommonTextWords("丹药类"),LanResManager.getLanCommonTextWords("材料类"),LanResManager.getLanCommonTextWords("其他类"),LanResManager.getLanCommonTextWords("礼金类")];
      }
      
      public function get f_goods_type_name() : String
      {
         return Goods_Type[this.f_goods_type];
      }
   }
}

