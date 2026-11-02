package com.tgame.moudels.yiJinJing.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class YiJinJingVO
   {
      
      public var act:int;
      
      public var def:int;
      
      public var hp:int;
      
      public var mp:int;
      
      public var cp:int;
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var isKnow:Boolean = false;
      
      public var skillID:int;
      
      public var defTime:int;
      
      public var skill:Skill;
      
      public var otherSkillNameArr:Array = [];
      
      public var isUseSkill:Boolean = false;
      
      public var baoliandeng:Boolean = false;
      
      public var sanshengmu:Boolean = false;
      
      public var isZhongJi:Boolean;
      
      public function YiJinJingVO()
      {
         super();
      }
      
      public function getSkillAddStr() : String
      {
         var _loc3_:Skill = null;
         if(!this.otherSkillNameArr)
         {
            return "";
         }
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.otherSkillNameArr.length)
         {
            _loc3_ = this.otherSkillNameArr[_loc2_][0] as Skill;
            _loc1_ += _loc3_.res.name + ":+" + this.otherSkillNameArr[_loc2_][1] + ";";
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

