package com.tgame.moudels.jinSheJianFa.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class JinSheJianFaVO
   {
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var curMiaoShu:String = "";
      
      public var isKnow:Boolean = false;
      
      public var isUseJiNeng:Boolean = true;
      
      public var act:Number;
      
      public var def:Number;
      
      public var hp:Number;
      
      public var baoJi:Number;
      
      public var shanBi:Number;
      
      public var jiNengId:int;
      
      public var skill:Skill;
      
      public var jiNengMiaoShu:String = "";
      
      public var isCanUse:Boolean;
      
      public var isCheck1:Boolean;
      
      public function JinSheJianFaVO()
      {
         super();
      }
   }
}

