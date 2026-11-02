package com.tgame.moudels.rulaishenzhang.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class RuLaiShenZhangVO
   {
      
      public var miaoshu:String;
      
      public var act:Number;
      
      public var def:Number;
      
      public var hp:Number;
      
      public var mp:Number;
      
      public var cp:Number;
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var isKnow:Boolean = false;
      
      public var skill:Skill;
      
      public function RuLaiShenZhangVO()
      {
         super();
      }
   }
}

