package com.tgame.moudels.cuqiankungfu.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class CuQianKungFuVO
   {
      
      public var miaoshu:String;
      
      public var act:Number;
      
      public var def:Number;
      
      public var hp:Number;
      
      public var bj:Number;
      
      public var sb:Number;
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var skill:Skill;
      
      public var nowChallenge:int;
      
      public var maxChallenge:int;
      
      public var isFire:Boolean;
      
      public var tili:int;
      
      public var saodiValid:Boolean;
      
      public function CuQianKungFuVO()
      {
         super();
      }
   }
}

