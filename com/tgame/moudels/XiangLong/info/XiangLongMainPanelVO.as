package com.tgame.moudels.XiangLong.info
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.vo.item.Skill;
   
   public class XiangLongMainPanelVO
   {
      
      public var isZuoQi:Boolean;
      
      public var isHuanZhuang1:Boolean;
      
      public var isHuanZhuang2:Boolean;
      
      public var effectID:int;
      
      public var isLingwu:int = 0;
      
      public var addAttack:int;
      
      public var addDefend:int;
      
      public var addLifeMax:int;
      
      public var addNeiliMax:int;
      
      public var addTiliMax:int;
      
      public var addCrystal:int;
      
      public var addFlee:int;
      
      public var curShowLevel:int = 1;
      
      public var jihuoJindu:int;
      
      public var addJihuoGongji:int;
      
      public var addJihuoFangyu:int;
      
      public var addJihuoShengming:int;
      
      public var curLearnLevel:int = 0;
      
      public var curLevelName:String;
      
      public var info:String = "";
      
      public var jiacheng:String = "";
      
      public var addWuxue1:int;
      
      public var addWuxue2:int;
      
      public var addWuxue3:int;
      
      private var _addWuxueTip1:String = "";
      
      private var _addWuxueTip2:String = "";
      
      private var _addWuxueTip3:String = "";
      
      private var _addWuxueTip4:String = "";
      
      public var unlockNum:int;
      
      public var skill:Skill;
      
      public var mixSkill1:Skill;
      
      public var mixSkill2:Skill;
      
      public var mixSkill3:Skill;
      
      public var mixSkill4:Skill;
      
      public var skill2:Skill;
      
      public var canUseSkll2:Boolean;
      
      public var isDouble:Boolean = false;
      
      public var isLongshengong:Boolean;
      
      public function XiangLongMainPanelVO()
      {
         super();
      }
      
      public function setJiaCheng() : void
      {
         this.jiacheng += this.addAttack ? LanResManager.getLanCommonTextWords("攻击：+") + this.addAttack + ";" : "";
         this.jiacheng += this.addDefend ? LanResManager.getLanCommonTextWords("防御：+") + this.addDefend + ";" : "";
         this.jiacheng += this.addLifeMax ? LanResManager.getLanCommonTextWords("生命：+") + this.addLifeMax + ";" : "";
         this.jiacheng += this.addNeiliMax ? LanResManager.getLanCommonTextWords("内力: +") + this.addNeiliMax + ";" : "";
         this.jiacheng += this.addTiliMax ? LanResManager.getLanCommonTextWords("体力: +") + this.addTiliMax + ";" : "";
         this.jiacheng += this.addCrystal ? LanResManager.getLanCommonTextWords("暴击: +") + this.addCrystal + ";" : "";
         this.jiacheng += this.addFlee ? LanResManager.getLanCommonTextWords("闪避: +") + this.addFlee + ";" : "";
      }
      
      public function get addWuxueTip1() : String
      {
         return this._addWuxueTip1;
      }
      
      public function set addWuxueTip1(param1:String) : void
      {
         if(param1 == "" || !param1)
         {
            this._addWuxueTip1 = "";
            return;
         }
         var _loc2_:Array = param1.split(";");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            this._addWuxueTip1 += SkillResManager.getSkillRes(int(_loc2_[_loc3_])).name;
            this._addWuxueTip1 += ";";
            if((_loc3_ + 1) % 4 == 0)
            {
               this._addWuxueTip1 += "\n";
            }
            _loc3_++;
         }
      }
      
      public function get addWuxueTip2() : String
      {
         return this._addWuxueTip2;
      }
      
      public function set addWuxueTip2(param1:String) : void
      {
         if(param1 == "" || !param1)
         {
            this._addWuxueTip2 = "";
            return;
         }
         var _loc2_:Array = param1.split(";");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            this._addWuxueTip2 += SkillResManager.getSkillRes(int(_loc2_[_loc3_])).name;
            this._addWuxueTip2 += ";";
            if((_loc3_ + 1) % 4 == 0)
            {
               this._addWuxueTip2 += "\n";
            }
            _loc3_++;
         }
      }
      
      public function get addWuxueTip3() : String
      {
         return this._addWuxueTip3;
      }
      
      public function set addWuxueTip3(param1:String) : void
      {
         if(param1 == "" || !param1)
         {
            this._addWuxueTip3 = "";
            return;
         }
         var _loc2_:Array = param1.split(";");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            this._addWuxueTip3 += SkillResManager.getSkillRes(int(_loc2_[_loc3_])).name;
            this._addWuxueTip3 += ";";
            if((_loc3_ + 1) % 4 == 0)
            {
               this._addWuxueTip3 += "\n";
            }
            _loc3_++;
         }
      }
      
      public function get addWuxueTip4() : String
      {
         return this._addWuxueTip4;
      }
      
      public function set addWuxueTip4(param1:String) : void
      {
         if(param1 == "" || !param1)
         {
            this._addWuxueTip4 = "";
            return;
         }
         var _loc2_:Array = param1.split(";");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            this._addWuxueTip4 += SkillResManager.getSkillRes(int(_loc2_[_loc3_])).name;
            this._addWuxueTip4 += ";";
            if((_loc3_ + 1) % 4 == 0)
            {
               this._addWuxueTip4 += "\n";
            }
            _loc3_++;
         }
      }
   }
}

