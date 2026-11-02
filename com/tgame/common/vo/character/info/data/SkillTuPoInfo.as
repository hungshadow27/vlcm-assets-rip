package com.tgame.common.vo.character.info.data
{
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   
   public class SkillTuPoInfo
   {
      
      public var tupoGoods:String;
      
      public var tupoZhenqi:int;
      
      public var tupoCopper:int;
      
      public var tupoTime:int;
      
      public var tupoGailv:int;
      
      public function SkillTuPoInfo()
      {
         super();
      }
      
      public function getTupoGoods() : Array
      {
         var _loc2_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:GoodsRes = null;
         if(this.tupoGoods == "")
         {
            return [];
         }
         var _loc1_:Array = this.tupoGoods.split(";");
         var _loc3_:int = int(_loc1_.length);
         var _loc4_:Array = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc5_ = _loc1_[_loc2_].split(",");
            _loc6_ = GoodsResManager.getGoodsRes(_loc5_[0]);
            _loc4_.push("【" + _loc6_.name + "】" + " X " + _loc5_[1]);
            _loc2_++;
         }
         return _loc4_;
      }
   }
}

