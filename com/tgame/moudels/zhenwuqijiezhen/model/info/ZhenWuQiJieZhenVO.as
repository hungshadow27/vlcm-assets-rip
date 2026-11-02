package com.tgame.moudels.zhenwuqijiezhen.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class ZhenWuQiJieZhenVO
   {
      
      public var miaoshu:String;
      
      public var act:int;
      
      public var actNum:int;
      
      public var def:int;
      
      public var defNum:int;
      
      public var hp:int;
      
      public var hpNum:int;
      
      public var bj:int;
      
      public var bjNum:int;
      
      public var sb:int;
      
      public var sbNum:int;
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var isKnow:Boolean = false;
      
      public var skill:Skill;
      
      public var isLearn:Boolean;
      
      public var wugongStr:String = "";
      
      public var isZhenwuZonggang:Boolean = false;
      
      public var isZhenwuFuti:Boolean = false;
      
      public var isZuoQi:Boolean = false;
      
      public var isWuQi:Boolean = false;
      
      public var isZuoQi2:Boolean = false;
      
      public var isWuQi2:Boolean = false;
      
      public function ZhenWuQiJieZhenVO()
      {
         super();
      }
   }
}

