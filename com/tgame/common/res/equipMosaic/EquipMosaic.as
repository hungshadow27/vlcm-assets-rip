package com.tgame.common.res.equipMosaic
{
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   
   public class EquipMosaic
   {
      
      private static var equipMosaicObj:Object = {};
      
      public function EquipMosaic()
      {
         super();
      }
      
      public static function parseRes(param1:Object) : void
      {
         var _loc3_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc3_ in _loc2_.equipmenplayconfig)
         {
            equipMosaicObj["" + _loc3_.@goodmodel_id] = (_loc3_.ronghe_condition as XMLList).toString();
         }
      }
      
      public static function checkWeapon(param1:int) : Boolean
      {
         var _loc2_:GoodsRes = GoodsResManager.getGoodsRes(param1);
         if(_loc2_.position == ItemPositionRange.POSTION_SHENQI)
         {
            return true;
         }
         if(_loc2_.position == ItemPositionRange.POSTION_ZHANJIA)
         {
            return true;
         }
         if(param1 == SpecialGoodsID.SHEN_LONG_HU_SHEN_FU)
         {
            return true;
         }
         if(param1 == SpecialGoodsID.CHUANSHUO_SHEN_LONG_HU_SHEN_FU)
         {
            return true;
         }
         if(param1 == SpecialGoodsID.ZHAN_XUESHOU_HU_SHEN_FU)
         {
            return true;
         }
         var _loc3_:int = 0;
         while(_loc3_ < ItemPositionRange.POSITION_NB_WEAPON_ARR.length)
         {
            if(_loc2_.position == ItemPositionRange.POSITION_NB_WEAPON_ARR[_loc3_])
            {
               return true;
            }
            _loc3_++;
         }
         return false;
      }
      
      public static function getEquipMosaicData(param1:int) : int
      {
         if(EquipMosaic.checkWeapon(param1))
         {
            return 0;
         }
         if(equipMosaicObj["" + param1] == undefined || equipMosaicObj["" + param1] == "0" || equipMosaicObj["" + param1] == "")
         {
            return 0;
         }
         if(String(equipMosaicObj["" + param1]) == LanResManager.getLanCommonTextWords("金身舍利"))
         {
            return 1;
         }
         return 2;
      }
   }
}

