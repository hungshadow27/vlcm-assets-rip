package com.tgame.moudels.hamagong.info
{
   import com.tgame.common.vo.item.Skill;
   import flash.display.Sprite;
   
   public class HaMaGongVO extends Sprite
   {
      
      public var act:int;
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var isKnow:Boolean = false;
      
      public var skillID:int;
      
      public var skill:Skill;
      
      public var isUseSkill:Boolean = false;
      
      public var isUse:Boolean;
      
      public var yuDuGong:Boolean;
      
      public var chuanyi:Boolean;
      
      public function HaMaGongVO()
      {
         super();
      }
   }
}

