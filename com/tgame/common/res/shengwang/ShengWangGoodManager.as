package com.tgame.common.res.shengwang
{
   public class ShengWangGoodManager
   {
      
      private static var goodsContainer:Object = new Object();
      
      public function ShengWangGoodManager()
      {
         super();
      }
      
      public static function parseTransRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc4_:ShengWangGoodRes = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.shop_shengwangs.shop_shengwang)
         {
            _loc4_ = new ShengWangGoodRes();
            _loc4_.id = _loc3_.@id;
            _loc4_.goodsID = _loc3_.@goodmodel_id;
            _loc4_.desc = _loc3_.desc;
            _loc4_.use_desc = _loc3_.use_desc;
            goodsContainer[_loc4_.id] = _loc4_;
         }
      }
      
      public static function getShengWangGoods(param1:int) : ShengWangGoodRes
      {
         var _loc2_:ShengWangGoodRes = null;
         for each(_loc2_ in goodsContainer)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

