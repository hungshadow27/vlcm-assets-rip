package com.tgame.moudels.shibatongren.model.info
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Skill;
   
   public class ShiBaTongRenMainPanelVO
   {
      
      public var userID:int = 0;
      
      public var learnedSkillID:int = 0;
      
      public var viewSkillID:int = 1;
      
      public var viewSkillName:String;
      
      public var viewSkillDesc:String;
      
      public var isLingwu:int = 0;
      
      public var addAttack:int = 0;
      
      public var addDefend:int = 0;
      
      public var addLifeMax:int = 0;
      
      public var addNeiliMax:int = 0;
      
      public var addTiliMax:int = 0;
      
      public var bigSkillID:int = 0;
      
      public var bigSkillValue:int = 0;
      
      public var isZuoQi:Boolean = false;
      
      public var isHuanZhuang:Boolean = false;
      
      public var isDanTian:Boolean = false;
      
      public var YN_Qixuan:Boolean;
      
      public var YN_QixuanState:Boolean;
      
      public var bigSkill:Skill;
      
      public var jiacheng:String = "";
      
      public function ShiBaTongRenMainPanelVO()
      {
         super();
      }
      
      public function setJiaCheng() : void
      {
         this.jiacheng = "";
         if(this.learnedSkillID == 0 && this.userID != -1)
         {
            this.addAttack = 0;
            this.addDefend = 0;
            this.addLifeMax = 0;
            this.addNeiliMax = 0;
            this.addTiliMax = 0;
         }
         this.jiacheng += this.addAttack ? LanResManager.getLanCommonTextWords("攻击：+") + this.addAttack + ";" : "";
         this.jiacheng += this.addDefend ? LanResManager.getLanCommonTextWords("防御：+") + this.addDefend + ";" : "";
         this.jiacheng += this.addLifeMax ? LanResManager.getLanCommonTextWords("生命：+") + this.addLifeMax + ";" : "";
         this.jiacheng += this.addNeiliMax ? LanResManager.getLanCommonTextWords("内力: +") + this.addNeiliMax + ";" : "";
         this.jiacheng += this.addTiliMax ? LanResManager.getLanCommonTextWords("体力: +") + this.addTiliMax + ";" : "";
      }
   }
}

