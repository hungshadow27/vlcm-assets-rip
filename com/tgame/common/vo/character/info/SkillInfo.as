package com.tgame.common.vo.character.info
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   
   public class SkillInfo
   {
      
      public var mainSkillItemFace:ItemFace;
      
      public var mainSkill:Skill;
      
      public var rideMainSkillItemFace:ItemFace;
      
      public var rideMainSkill:Skill;
      
      public var skillLevel:Number;
      
      public var skillObj:Object;
      
      public function SkillInfo()
      {
         super();
         this.init({});
      }
      
      public function getSkillLevelID() : int
      {
         if(this.skillLevel >= 20000000000)
         {
            return 7;
         }
         if(this.skillLevel >= 18000000000)
         {
            return 6;
         }
         if(this.skillLevel >= 14000000000)
         {
            return 5;
         }
         if(this.skillLevel >= 10000000000)
         {
            return 4;
         }
         if(this.skillLevel >= 5000000000)
         {
            return 3;
         }
         if(this.skillLevel >= 2000000000)
         {
            return 2;
         }
         if(this.skillLevel >= 500000000)
         {
            return 1;
         }
         return 0;
      }
      
      public function init(param1:Object) : void
      {
         if(!param1)
         {
            return;
         }
         this.skillObj = param1;
      }
      
      public function getSkillByPosition(param1:int) : Skill
      {
         var _loc2_:Skill = null;
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.position == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getSkillByQuickbarindex(param1:int) : Skill
      {
         var _loc2_:Skill = null;
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.quickbarindex == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getSkillByID(param1:int) : Skill
      {
         var _loc2_:Skill = null;
         if(this.skillObj[param1] != null)
         {
            return this.skillObj[param1];
         }
         return null;
      }
      
      public function isLearningSkill(param1:int) : Boolean
      {
         var _loc2_:Skill = this.getSkillByID(param1);
         return _loc2_ != null && _loc2_.isLearn == 1;
      }
      
      public function addSkill_batch(param1:Array) : void
      {
         var _loc2_:Skill = null;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            this.addSkill(_loc2_);
         }
      }
      
      public function addSkill(param1:Skill) : void
      {
         if(this.getSkillByID(param1.id) != null)
         {
            return;
         }
         this.skillObj[param1.id] = param1;
      }
      
      public function deleteSkillByID(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(this.skillObj[param1] != null)
         {
            this.skillObj[param1] = null;
            return;
         }
      }
      
      public function findWuGong(param1:Array = null) : Array
      {
         var _loc3_:Skill = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.skillObj)
         {
            if(_loc3_.res.wugong_type != 0)
            {
               if(Boolean(_loc3_.id == OtherConst.DEFAULT_SKILL_ID) || Boolean(_loc3_.id == OtherConst.XIANGLONG_SKILL_ID_1 && _loc3_.isLearn) || Boolean(_loc3_.id == OtherConst.XIANGLONG_SKILL_ID_2) && Boolean(_loc3_.isLearn) || Boolean(_loc3_.id == OtherConst.XIANGLONG_SKILL_ID_3) && Boolean(_loc3_.isLearn) || Boolean(_loc3_.id == OtherConst.WUXINGQUAN_HUHESHUANGXING_SKILL_ID) && Boolean(_loc3_.isLearn) || Boolean(_loc3_.res.useway == 1 && _loc3_.isLearn) && (Boolean(_loc3_.res.wugong_type >= 1 && _loc3_.res.wugong_type <= 4 && _loc3_.res.wugong_type != 3)))
               {
                  if(param1 != null && param1.indexOf(_loc3_.id) == -1)
                  {
                     _loc2_.push(_loc3_);
                  }
               }
            }
         }
         return _loc2_;
      }
      
      public function findWuGongMount(param1:Array = null) : Array
      {
         var _loc3_:Skill = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.skillObj)
         {
            if(_loc3_.res.useway == 1 && Boolean(_loc3_.isLearn))
            {
               if(param1 != null && param1.indexOf(_loc3_.id) == -1)
               {
                  _loc2_.push(_loc3_);
               }
            }
         }
         return _loc2_;
      }
      
      public function getWuGong2() : Array
      {
         var _loc2_:Skill = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.res.useway == 1 && Boolean(_loc2_.isLearn))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function findXinFa() : Array
      {
         var _loc2_:Skill = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.skillObj)
         {
            if(Boolean(_loc2_.res.useway == 2 && _loc2_.isLearn) && (Boolean(_loc2_.res.wugong_type >= 1 && _loc2_.res.wugong_type <= 4)) && _loc2_.id <= 600000)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getMenPaiSkill() : Array
      {
         var _loc2_:Skill = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.res.wugong_type == 1 && _loc2_.id != OtherConst.DEFAULT_SKILL_ID)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getJiangHuSkill() : Array
      {
         var _loc2_:Skill = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.res.wugong_type == 2)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getOtherSkill() : Array
      {
         var _loc2_:Skill = null;
         var _loc1_:Array = [];
         _loc1_.push(this.getSkillByID(OtherConst.DEFAULT_SKILL_ID));
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.res.wugong_type == 3 || _loc2_.res.wugong_type == 4 || _loc2_.res.wugong_type == 5)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getPartySkill() : Array
      {
         var _loc2_:Skill = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.res.wugong_type == 4)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getCanUpSkillList() : Array
      {
         var _loc2_:Skill = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.skillObj)
         {
            if(_loc2_.isLearn == 1 && _loc2_.id != OtherConst.DEFAULT_SKILL_ID && (_loc2_.res.wugong_type == 1 || _loc2_.res.wugong_type == 2 || _loc2_.res.wugong_type == 4))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function getGoodsBySkill(param1:int) : Goods
      {
         var _loc2_:Skill = this.getSkillByID(param1);
         return GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc2_.res.learningBook,true);
      }
      
      public function getYupeiSkill() : Array
      {
         var _loc1_:Skill = null;
         var _loc2_:Array = [];
         for each(_loc1_ in this.skillObj)
         {
            if(Boolean(_loc1_.isLearn) && _loc1_.res.wugong_type == 6)
            {
               _loc2_.push(_loc1_);
            }
         }
         return _loc2_;
      }
      
      public function getFuQiSkill() : Array
      {
         var _loc1_:Skill = null;
         var _loc2_:Array = [];
         for each(_loc1_ in this.skillObj)
         {
            if(_loc1_.res.wugong_type == 5)
            {
               _loc2_.push(_loc1_);
            }
         }
         return _loc2_;
      }
   }
}

