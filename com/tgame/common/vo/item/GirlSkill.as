package com.tgame.common.vo.item
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.CoolingType;
   
   public class GirlSkill extends Skill
   {
      
      public var lv:int = 0;
      
      public var nowLvJianChengStr:String = "";
      
      public var nextLvJianChengStr:String = "";
      
      public var nextLvUpUseZhenQi:int = 0;
      
      public var nextLvUpUseCopper:int = 0;
      
      public function GirlSkill(param1:int, param2:int = 0, param3:int = 0, param4:Number = 0, param5:int = 0, param6:int = 0, param7:int = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7);
      }
      
      override public function getID() : *
      {
         if(GameInstance.mainCharData.girlInfo.currentFightGirl)
         {
            return GameInstance.mainCharData.girlInfo.currentFightGirl + "_" + this.getType() + "_" + id;
         }
         return "0" + "_" + this.getType() + "_" + id;
      }
      
      override public function getType() : int
      {
         return CoolingType.GIRL_SKILL;
      }
      
      override public function getCoolingtime() : int
      {
         if(GameInstance.mainCharData.girlInfo.currentFightGirl)
         {
            return res.coolingtime / (1 + GameInstance.mainCharData.girlInfo.currentFightGirl.res.attack_interval / 1000);
         }
         return res.coolingtime;
      }
      
      override public function getPublicCoolingtime() : int
      {
         if(GameInstance.mainCharData.girlInfo.currentFightGirl)
         {
            return res.public_time / (1 + GameInstance.mainCharData.girlInfo.currentFightGirl.res.attack_interval / 1000);
         }
         return res.public_time;
      }
      
      override public function getPublicCoolingtimeClass() : *
      {
         return this.getType() + "_" + res.public_type;
      }
      
      public function getID1(param1:int) : *
      {
         return param1 + "_" + this.getType() + "_" + id;
      }
      
      public function getCoolingtime1(param1:Number) : int
      {
         return res.coolingtime / (1 + param1 / 1000);
      }
   }
}

