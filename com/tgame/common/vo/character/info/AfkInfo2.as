package com.tgame.common.vo.character.info
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.vo.item.Skill;
   
   public class AfkInfo2
   {
      
      public var isSupplyHP:int;
      
      public var hpCount:int;
      
      public var hpType:int;
      
      public var isSupplyMP:int;
      
      public var mpCount:int;
      
      public var mpType:int;
      
      public var isSupplySP:int;
      
      public var spCount:int;
      
      public var spType:int;
      
      public var isAutoUseCharExp:int;
      
      public var isAutoUseCharZhenqi:int;
      
      public var isAutoUseMountExp:int;
      
      public var isAutoPickUpEquip:int;
      
      public var equipMenpai:int;
      
      public var equipLevel:int;
      
      public var equipPinZhi:int;
      
      public var isAutoPickUpTask:int;
      
      public var isAutoPickUpDrug:int;
      
      public var isAutoPickUpCaiLiao:int;
      
      public var isAutoPickUpOther:int;
      
      public var charSkillArr:Array;
      
      public var isAutoUseCharSkill:Skill;
      
      public var mountSkillArr:Array;
      
      public var isAutoUseMountSkill:Skill;
      
      public var isAutoUseWuShenLinTi:int;
      
      public var isAutoUseZhanYiJiAng:int;
      
      public var afkRangeCount:int;
      
      public var afkTime:int;
      
      public var isAfkOverComeback:int;
      
      public var isHideBoss:int;
      
      public var isAutoUseFlower:int;
      
      public var isAutoUseMountCaoLiao:int;
      
      public var isAutoUseHuoLiShenDan:int;
      
      public var isAutoUseDaMoShi:int;
      
      public var isAutoPickUpMoney:int;
      
      public var isStart:Boolean;
      
      public var isAutoUseGeKongDuQi:int;
      
      public var isAutoUsePuDuCiHang:int;
      
      public var isAutoUseFuQiShouHu:int;
      
      public var isAutoUsePoXueKuangSha:int;
      
      public var isAutoUseNingXueLiHun:int;
      
      public var isAutoUseAllSKill:int;
      
      public function AfkInfo2()
      {
         super();
      }
      
      public function setCharSkill(param1:int) : void
      {
         if(param1 != 0)
         {
            this.isAutoUseCharSkill = new Skill(param1);
         }
      }
      
      public function setMountSkill(param1:int) : void
      {
         if(param1 != 0)
         {
            this.isAutoUseMountSkill = new Skill(param1);
         }
      }
      
      public function setCharSkillArray() : Array
      {
         this.charSkillArr = GameInstance.mainCharData.skillInfo.findWuGong([OtherConst.SKILL_GEKONGDUQI,OtherConst.SKILL_PUDUCIHANG,OtherConst.SKILL_WUSHENLINTI,OtherConst.SKILL_ZHANYIJIANG]);
         return this.charSkillArr;
      }
      
      public function setMountSkillArray() : Array
      {
         if(GameInstance.mainCharData.mountInfo.currentFightMount != null)
         {
            this.mountSkillArr = GameInstance.mainCharData.mountInfo.currentFightMount.mountSkillInfo.findWuGongMount([OtherConst.SKILL_HUICHUN,OtherConst.SKILL_HUIFU,OtherConst.SKILL_HUISHENG]);
         }
         return this.mountSkillArr;
      }
      
      public function update(param1:AfkInfo2) : void
      {
         this.isSupplyHP = param1.isSupplyHP;
         this.hpCount = param1.hpCount;
         this.hpType = param1.hpType;
         this.isSupplyMP = param1.isSupplyMP;
         this.mpCount = param1.mpCount;
         this.mpType = param1.mpType;
         this.isSupplySP = param1.isSupplySP;
         this.spCount = param1.spCount;
         this.spType = param1.spType;
         this.isAutoUseCharExp = param1.isAutoUseCharExp;
         this.isAutoUseCharZhenqi = param1.isAutoUseCharZhenqi;
         this.isAutoUseMountExp = param1.isAutoUseMountExp;
         this.isAutoPickUpEquip = param1.isAutoPickUpEquip;
         this.equipMenpai = param1.equipMenpai;
         this.equipLevel = param1.equipLevel;
         this.equipPinZhi = param1.equipPinZhi;
         this.isAutoPickUpTask = param1.isAutoPickUpTask;
         this.isAutoPickUpDrug = param1.isAutoPickUpDrug;
         this.isAutoPickUpCaiLiao = param1.isAutoPickUpCaiLiao;
         this.isAutoPickUpOther = param1.isAutoPickUpOther;
         this.charSkillArr = param1.charSkillArr;
         this.isAutoUseCharSkill = param1.isAutoUseCharSkill;
         this.mountSkillArr = param1.mountSkillArr;
         this.isAutoUseMountSkill = param1.isAutoUseMountSkill;
         this.isAutoUseWuShenLinTi = param1.isAutoUseWuShenLinTi;
         this.isAutoUseZhanYiJiAng = param1.isAutoUseZhanYiJiAng;
         this.afkRangeCount = param1.afkRangeCount;
         this.afkTime = param1.afkTime;
         this.isAfkOverComeback = param1.isAfkOverComeback;
         this.isHideBoss = param1.isHideBoss;
         this.isAutoUseFlower = param1.isAutoUseFlower;
         this.isAutoUseMountCaoLiao = param1.isAutoUseMountCaoLiao;
         this.isStart = param1.isStart;
      }
   }
}

