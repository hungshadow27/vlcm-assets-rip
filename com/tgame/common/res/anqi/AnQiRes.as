package com.tgame.common.res.anqi
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.vo.item.Goods;
   
   public class AnQiRes
   {
      
      public var id:int;
      
      public var name:String;
      
      public var grade:int;
      
      public var xiu_grade:int;
      
      public var mastery:int;
      
      public var hidden_weaponscol:int;
      
      public var attackDis:int;
      
      public var attackTargets:int;
      
      public var tribLv:int;
      
      public var tribRealValue:int;
      
      public var spcialType:String;
      
      public var spcialDesc:String;
      
      public var upgradeNeedCopper:int;
      
      public var upgradeNeedZhenqi:int;
      
      public var upgradeNeedGoods:String;
      
      public var upgradeTribLv:int;
      
      public var upgradeTribRealLv:int;
      
      public var upgradeMinCnt:int;
      
      public var upgradeMaxCnt:int;
      
      public var method:String;
      
      public var skillID:int;
      
      public function AnQiRes()
      {
         super();
      }
      
      public function getUpgradeGoodInfo() : String
      {
         var _loc3_:int = 0;
         if(this.upgradeNeedGoods == "")
         {
            return "";
         }
         var _loc1_:String = "";
         var _loc2_:Array = this.getUpgradeGood();
         var _loc4_:int = int(_loc2_.length);
         var _loc5_:GoodsRes = GoodsResManager.getGoodsRes(_loc2_[_loc3_][0]);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc1_ += _loc5_.name + _loc2_[_loc3_][1] + LanResManager.getLanCommonTextWords("个");
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function getUpgradeGood() : Array
      {
         var _loc3_:String = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:int = 0;
         var _loc1_:Array = [];
         var _loc2_:Array = this.upgradeNeedGoods.split(";");
         var _loc7_:int = int(_loc2_.length);
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            _loc3_ = _loc2_[_loc5_];
            _loc4_ = _loc3_.split(",");
            _loc1_.push([Number(_loc4_[0]),Number(_loc4_[1])]);
            _loc5_++;
         }
         return _loc1_;
      }
      
      public function hasGood() : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc1_:Array = this.getUpgradeGood();
         var _loc3_:int = int(_loc1_.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc1_[_loc2_][0],true);
            if(_loc4_.count == 0)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function isGetUpgradeGood() : Boolean
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc1_:Array = this.getUpgradeGood();
         var _loc3_:int = int(_loc1_.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc1_[_loc2_][0],true);
            if(_loc4_.count < _loc1_[_loc2_][1])
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      public function getBigICOPath() : String
      {
         var _loc1_:SkillRes = SkillResManager.getSkillRes(this.skillID);
         return ResPathManager.getBigICOPath(_loc1_.id_ico_big);
      }
      
      public function getBigICOName() : String
      {
         var _loc1_:SkillRes = SkillResManager.getSkillRes(this.skillID);
         return _loc1_.id_ico_big.toString();
      }
   }
}

