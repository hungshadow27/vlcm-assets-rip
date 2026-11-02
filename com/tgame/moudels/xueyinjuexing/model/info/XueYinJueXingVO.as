package com.tgame.moudels.xueyinjuexing.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class XueYinJueXingVO
   {
      
      public var act:Number;
      
      public var def:Number;
      
      public var baoji:Number;
      
      public var shanbi:Number;
      
      public var hp:Number;
      
      public var attack:int;
      
      public var lv:int;
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var skill:Skill;
      
      public var isWuQi:Boolean;
      
      public function XueYinJueXingVO()
      {
         super();
      }
   }
}

