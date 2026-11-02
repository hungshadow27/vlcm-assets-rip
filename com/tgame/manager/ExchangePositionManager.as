package com.tgame.manager
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.character.info.SkillInfo;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   
   public class ExchangePositionManager
   {
      
      public static var bagCount:int = 1;
      
      public static var depotCount:int = 1;
      
      public function ExchangePositionManager()
      {
         super();
      }
      
      public static function exchangeGoodsPosition(param1:int, param2:int) : void
      {
         var _loc3_:Player = GameInstance.mainChar.data as Player;
         var _loc4_:GoodsInfo = _loc3_.goodsInfo;
         var _loc5_:Goods = _loc4_.getGoodsByPosition(param1);
         var _loc6_:Goods = _loc4_.getGoodsByPosition(param2);
         if(_loc5_ != null && _loc6_ != null)
         {
            _loc5_.position = param2;
            _loc6_.position = param1;
         }
         else if(_loc5_ != null)
         {
            _loc5_.position = param2;
         }
         else if(_loc6_ != null)
         {
            _loc6_.position = param1;
         }
      }
      
      public static function exchangeItemQuickbarindex(param1:int, param2:int) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:Array = null;
         var _loc8_:Skill = null;
         var _loc9_:Array = null;
         var _loc10_:Skill = null;
         if(param1 == 0 && param2 == 0)
         {
            return;
         }
         var _loc3_:Player = GameInstance.mainChar.data as Player;
         var _loc4_:GoodsInfo = _loc3_.goodsInfo;
         var _loc5_:SkillInfo = _loc3_.skillInfo;
         if(param1 != 0 && param2 != 0)
         {
            _loc7_ = _loc4_.getGoodsByQuickbarindex(param1);
            _loc8_ = _loc5_.getSkillByQuickbarindex(param1);
            _loc9_ = _loc4_.getGoodsByQuickbarindex(param2);
            _loc10_ = _loc5_.getSkillByQuickbarindex(param2);
            for each(_loc6_ in _loc7_)
            {
               _loc6_.quickbarindex = param2;
            }
            if(_loc8_ != null)
            {
               _loc8_.quickbarindex = param2;
            }
            for each(_loc6_ in _loc9_)
            {
               _loc6_.quickbarindex = param1;
            }
            if(_loc10_ != null)
            {
               _loc10_.quickbarindex = param1;
            }
         }
         else if(param1 != 0)
         {
            _loc7_ = _loc4_.getGoodsByQuickbarindex(param1);
            _loc8_ = _loc5_.getSkillByQuickbarindex(param1);
            for each(_loc6_ in _loc7_)
            {
               _loc6_.quickbarindex = 0;
            }
            if(_loc8_ != null)
            {
               _loc8_.quickbarindex = 0;
            }
         }
         else if(param2 != 0)
         {
            _loc9_ = _loc4_.getGoodsByQuickbarindex(param2);
            _loc10_ = _loc5_.getSkillByQuickbarindex(param2);
            for each(_loc6_ in _loc9_)
            {
               _loc6_.quickbarindex = 0;
            }
            if(_loc10_ != null)
            {
               _loc10_.quickbarindex = 0;
            }
         }
      }
      
      public static function setShortKey(param1:BaseItem, param2:int) : void
      {
         param1.quickbarindex = param2;
         getShortIndexItem();
      }
      
      public static function setShortKey2(param1:int, param2:int) : void
      {
         var _loc3_:Player = GameInstance.mainChar.data as Player;
         var _loc4_:SkillInfo = _loc3_.skillInfo;
         var _loc5_:Skill = _loc4_.getSkillByID(param1);
         if(!_loc5_)
         {
            return;
         }
         deleteSkillsOfQuickBar(_loc5_);
         _loc5_.quickbarindex = param2;
         addSkillsOfQuickBar(_loc5_);
         getShortIndexItem();
      }
      
      public static function getShortIndexItem() : void
      {
         var _loc5_:Goods = null;
         var _loc6_:Skill = null;
         var _loc1_:Player = GameInstance.mainChar.data as Player;
         var _loc2_:GoodsInfo = _loc1_.goodsInfo;
         var _loc3_:SkillInfo = _loc1_.skillInfo;
         var _loc4_:Array = [];
         for each(_loc5_ in _loc2_.goodsOfQuickBar)
         {
            if(_loc5_.quickbarindex != 0)
            {
               _loc4_[_loc4_.length] = _loc5_;
            }
         }
         for each(_loc6_ in _loc2_.skillsOfQuickBar)
         {
            if(_loc6_.isLearn == 1 && _loc6_.quickbarindex != 0)
            {
               _loc4_[_loc4_.length] = _loc6_;
            }
         }
         GameInstance.uiInstance.mainUI.setShortcutBarItem(_loc4_);
         setCurrentMainSkill();
      }
      
      public static function getRealShortIndex(param1:int) : int
      {
         return param1 == 0 ? 10 : param1;
      }
      
      public static function checkItemShortIndex(param1:int) : BaseItem
      {
         var _loc6_:Array = null;
         param1 = getRealShortIndex(param1);
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:SkillInfo = _loc2_.skillInfo;
         var _loc4_:GoodsInfo = _loc2_.goodsInfo;
         var _loc5_:BaseItem = _loc3_.getSkillByQuickbarindex(param1);
         if(_loc5_ == null)
         {
            _loc6_ = _loc4_.getGoodsByQuickbarindex(param1);
            if(_loc6_.length != 0)
            {
               _loc5_ = _loc6_[0];
            }
         }
         return _loc5_;
      }
      
      public static function checkBlankShortIndex() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = 9;
         _loc1_ = 1;
         while(_loc1_ <= 10)
         {
            if(!checkItemShortIndex(_loc1_))
            {
               return _loc1_;
            }
            _loc1_++;
         }
         return -1;
      }
      
      public static function checkItemShortIndexByMount(param1:int) : BaseItem
      {
         var _loc2_:PureMount = GameInstance.mainCharData.mountInfo.currentFightMount;
         var _loc3_:SkillInfo = _loc2_.mountSkillInfo;
         return _loc3_.getSkillByQuickbarindex(param1);
      }
      
      public static function setCurrentMainSkill() : void
      {
         var _loc1_:Player = null;
         var _loc2_:SkillInfo = null;
         var _loc3_:Skill = null;
         var _loc4_:ItemFace = null;
         if(GameInstance.mainCharData.skillInfo.mainSkillItemFace)
         {
            GameInstance.mainCharData.skillInfo.mainSkillItemFace.Select = false;
            _loc1_ = GameInstance.mainChar.data as Player;
            _loc2_ = _loc1_.skillInfo;
            _loc3_ = GameInstance.mainCharData.skillInfo.mainSkill;
            _loc4_ = GameInstance.uiInstance.mainUI.getItemFaceByBaseItem(_loc3_);
            if(!_loc4_)
            {
               return;
            }
            GameInstance.mainCharData.skillInfo.mainSkillItemFace = _loc4_;
            GameInstance.mainCharData.skillInfo.mainSkillItemFace.Select = true;
         }
      }
      
      public static function setInitMainSkill(param1:int) : void
      {
         if(GameInstance.mainCharData.skillInfo.mainSkillItemFace)
         {
            GameInstance.mainCharData.skillInfo.mainSkillItemFace.Select = false;
         }
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:SkillInfo = _loc2_.skillInfo;
         var _loc4_:Skill = _loc3_.getSkillByID(param1);
         GameInstance.mainCharData.skillInfo.mainSkill = _loc4_;
         var _loc5_:ItemFace = GameInstance.uiInstance.mainUI.getItemFaceByBaseItem(_loc4_);
         if(!_loc5_)
         {
            return;
         }
         GameInstance.mainCharData.skillInfo.mainSkillItemFace = _loc5_;
         GameInstance.mainCharData.skillInfo.mainSkillItemFace.Select = true;
      }
      
      public static function setRideMainSkill(param1:int) : void
      {
         var _loc2_:PureMount = null;
         var _loc3_:Skill = null;
         var _loc4_:ItemFace = null;
         if(GameInstance.mainCharData.mountInfo.currentFightMount)
         {
            if(GameInstance.mainCharData.skillInfo.rideMainSkillItemFace)
            {
               GameInstance.mainCharData.skillInfo.rideMainSkillItemFace.Select = false;
            }
            _loc2_ = GameInstance.mainCharData.mountInfo.currentFightMount;
            _loc3_ = _loc2_.mountSkillInfo.getSkillByID(param1);
            _loc4_ = GameInstance.uiInstance.mainUI.getItemFaceByBaseItem(_loc3_);
            if(!_loc4_)
            {
               return;
            }
            GameInstance.mainCharData.skillInfo.rideMainSkillItemFace = _loc4_;
            GameInstance.mainCharData.skillInfo.rideMainSkillItemFace.Select = true;
            GameInstance.mainCharData.skillInfo.rideMainSkill = _loc3_;
         }
      }
      
      public static function parseSkillStatus() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Skill = null;
         var _loc1_:Object = GameInstance.mainCharData.skillInfo.skillObj;
         for each(_loc3_ in _loc1_)
         {
            if(_loc3_.isLearn)
            {
               if(_loc3_.isTop != 1 && (_loc3_.id != OtherConst.DEFAULT_SKILL_ID && _loc3_.res.wugong_type != 3 && _loc3_.level < GameInstance.mainCharData.attributeInfo.lv - 1 && _loc3_.zhenqi <= GameInstance.mainCharData.attributeInfo.gqNow && _loc3_.copper <= GameInstance.mainCharData.moneyInfo.copper || _loc3_.shulianCurrent == _loc3_.shulianTotal && _loc3_.res.wugong_type != 3 && _loc3_.id != OtherConst.DEFAULT_SKILL_ID))
               {
                  _loc3_.isLevelUp = 1;
               }
               else
               {
                  _loc3_.isLevelUp = 0;
               }
            }
            else if(_loc3_.studyLevel <= GameInstance.mainCharData.attributeInfo.lv)
            {
               _loc3_.isStudy = 1;
            }
            else
            {
               _loc3_.isStudy = 0;
            }
            if(_loc3_.level >= GameInstance.mainCharData.attributeInfo.lv)
            {
               _loc3_.isStudy = 0;
               _loc3_.isLevelUp = 0;
            }
            if(_loc3_.res.wugong_type == 5 || _loc3_.res.wugong_type == 6)
            {
               _loc3_.isStudy = 0;
               _loc3_.isLevelUp = 0;
            }
         }
      }
      
      public static function checkUseDrugSound(param1:Goods) : void
      {
         if(param1.res.drug_kind != 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_DRUG_USE);
         }
      }
      
      public static function getEquipStatus(param1:Array, param2:Function = null, param3:Function = null, param4:Function = null) : Array
      {
         var _loc6_:int = 0;
         var _loc8_:Goods = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:Boolean = false;
         var _loc21_:Boolean = false;
         var _loc22_:Boolean = false;
         var _loc23_:Boolean = false;
         var _loc24_:Boolean = false;
         var _loc25_:Boolean = false;
         var _loc26_:Boolean = false;
         var _loc27_:Boolean = false;
         var _loc28_:Boolean = false;
         var _loc29_:Boolean = false;
         var _loc5_:Array = param1;
         var _loc7_:int = int(_loc5_.length);
         if(_loc7_ > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < _loc7_)
            {
               _loc8_ = _loc5_[_loc6_];
               if(!(!ItemPositionRange.inBody(_loc8_.res.position) || !(_loc8_.res.position > 0 && _loc8_.res.position < 13)))
               {
                  if(_loc10_ == 0)
                  {
                     _loc10_ = int(_loc5_[_loc6_].res.grade);
                  }
                  if(_loc8_.res.grade == _loc10_)
                  {
                     _loc9_++;
                  }
                  if(_loc8_.quality >= 4)
                  {
                     _loc11_++;
                  }
                  if(_loc8_.isFullStar == 1)
                  {
                     _loc12_++;
                  }
                  if(_loc8_.isBaoshiTOP == 1)
                  {
                     _loc13_++;
                  }
                  if(_loc8_.isFullTianshen == 1)
                  {
                     _loc14_++;
                  }
                  if(_loc8_.res.grade == 7)
                  {
                     _loc15_++;
                  }
                  if(_loc8_.res.grade == 8)
                  {
                     _loc16_++;
                  }
                  if(_loc8_.res.grade == 9)
                  {
                     _loc17_++;
                  }
                  if(_loc8_.isFullStone == 1)
                  {
                     _loc18_++;
                  }
                  if(_loc8_.isFullStone == 2)
                  {
                     _loc19_++;
                  }
               }
               _loc6_++;
            }
            if(_loc9_ >= 12)
            {
               _loc20_ = true;
               if(param2 != null)
               {
                  param2();
               }
            }
            if(_loc11_ >= 12)
            {
               _loc21_ = true;
               if(param3 != null)
               {
                  param3();
               }
            }
            if(_loc12_ >= 12)
            {
               _loc22_ = true;
               if(param4 != null)
               {
                  param4();
               }
            }
            if(_loc13_ >= 12)
            {
               _loc23_ = true;
            }
            if(_loc14_ >= 12)
            {
               _loc24_ = true;
            }
            if(_loc15_ >= 12)
            {
               _loc25_ = true;
            }
            if(_loc16_ >= 12)
            {
               _loc26_ = true;
            }
            if(_loc17_ >= 12)
            {
               _loc27_ = true;
            }
            return [[_loc20_,_loc9_],[_loc21_,_loc11_],[_loc22_,_loc12_],[_loc23_,_loc13_],[_loc24_,_loc14_],[_loc25_,_loc15_],[_loc26_,_loc16_],[_loc27_,_loc17_]];
         }
         return [];
      }
      
      public static function getSiShengShouStatus(param1:Array) : Array
      {
         var _loc3_:int = 0;
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc2_:Array = param1;
         var _loc4_:int = int(_loc2_.length);
         if(_loc4_ > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _loc2_[_loc3_];
               if(_loc5_.res.position > 0 && _loc5_.res.position < 13)
               {
                  if(_loc5_.isSiShengShou == 1)
                  {
                     _loc6_++;
                  }
                  if(_loc5_.isSiShengShou == 2)
                  {
                     _loc7_++;
                  }
                  if(_loc5_.isSiShengShou == 3)
                  {
                     _loc8_++;
                  }
                  if(_loc5_.isSiShengShou == 4)
                  {
                     _loc9_++;
                  }
               }
               _loc3_++;
            }
            return [_loc6_,_loc7_,_loc8_,_loc9_];
         }
         return [];
      }
      
      public static function getWanbaogeShortIndexItem() : void
      {
         var _loc4_:Skill = null;
         var _loc1_:Player = GameInstance.mainChar.data as Player;
         var _loc2_:GoodsInfo = _loc1_.goodsInfo;
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_.skillsOfQuickBar)
         {
            if(_loc4_.quickbarindex != 0)
            {
               _loc3_[_loc3_.length] = _loc4_;
            }
         }
         GameInstance.uiInstance.mainUI.setwanbaogeShortcutBarItem(_loc3_);
         setCurrentMainSkill();
      }
      
      public static function addGoodsOfQuickBar(param1:Goods) : void
      {
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:GoodsInfo = _loc2_.goodsInfo;
         _loc3_.goodsOfQuickBar.push(param1);
      }
      
      public static function deleteGoodsOfQuickBar(param1:Goods) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:GoodsInfo = _loc2_.goodsInfo;
         _loc4_ = _loc3_.goodsOfQuickBar;
         _loc5_ = int(_loc4_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc4_[_loc6_] == param1)
            {
               _loc4_.splice(_loc6_,1);
               return;
            }
            _loc6_++;
         }
      }
      
      public static function addSkillsOfQuickBar(param1:Skill) : void
      {
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:GoodsInfo = _loc2_.goodsInfo;
         _loc3_.skillsOfQuickBar.push(param1);
      }
      
      public static function deleteSkillsOfQuickBar(param1:Skill) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Player = GameInstance.mainChar.data as Player;
         var _loc3_:GoodsInfo = _loc2_.goodsInfo;
         _loc4_ = _loc3_.skillsOfQuickBar;
         _loc5_ = int(_loc4_.length);
         _loc6_ = 0;
         while(_loc6_ < _loc5_)
         {
            if(_loc4_[_loc6_] == param1)
            {
               _loc4_.splice(_loc6_,1);
               return;
            }
            _loc6_++;
         }
      }
      
      public function setGoodsQuickbarindex(param1:int, param2:int) : void
      {
         var _loc6_:Array = null;
         var _loc7_:Goods = null;
         var _loc8_:Skill = null;
         var _loc3_:Player = GameInstance.mainChar.data as Player;
         var _loc4_:GoodsInfo = _loc3_.goodsInfo;
         var _loc5_:SkillInfo = _loc3_.skillInfo;
         if(param2 != 0)
         {
            _loc6_ = _loc4_.getGoodsByQuickbarindex(param2);
            for each(_loc7_ in _loc6_)
            {
               _loc7_.quickbarindex = 0;
            }
            _loc8_ = _loc5_.getSkillByQuickbarindex(param2);
            if(_loc8_ != null)
            {
               _loc8_.quickbarindex = 0;
            }
         }
         _loc6_ = _loc4_.getGoodsArrByID(param1);
         for each(_loc7_ in _loc6_)
         {
            _loc7_.quickbarindex = param2;
         }
      }
      
      public function setSkillQuickbarindex(param1:int, param2:int) : void
      {
         var _loc6_:Array = null;
         var _loc7_:Goods = null;
         var _loc8_:Skill = null;
         var _loc3_:Player = GameInstance.mainChar.data as Player;
         var _loc4_:GoodsInfo = _loc3_.goodsInfo;
         var _loc5_:SkillInfo = _loc3_.skillInfo;
         if(param2 != 0)
         {
            _loc6_ = _loc4_.getGoodsByQuickbarindex(param2);
            _loc8_ = _loc5_.getSkillByQuickbarindex(param2);
            for each(_loc7_ in _loc6_)
            {
               _loc7_.quickbarindex = 0;
            }
            if(_loc8_ != null)
            {
               _loc8_.quickbarindex = 0;
            }
         }
         _loc8_ = _loc5_.getSkillByID(param1);
         if(_loc8_ != null)
         {
            _loc8_.quickbarindex = param2;
         }
      }
   }
}

