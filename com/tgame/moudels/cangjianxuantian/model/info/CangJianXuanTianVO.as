package com.tgame.moudels.cangjianxuantian.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class CangJianXuanTianVO
   {
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var curMiaoShu:String = "";
      
      public var isKnow:Boolean = false;
      
      public var isUseJiNeng:Boolean = true;
      
      public var act:int;
      
      public var def:int;
      
      public var hp:int;
      
      public var baoJi:int;
      
      public var shanBi:int;
      
      public var jiNengId:int;
      
      public var skill:Skill;
      
      public var jiNengMiaoShu:String = "";
      
      public var isHuanZHuang:Boolean = false;
      
      public var isCanUse:Boolean;
      
      public function CangJianXuanTianVO()
      {
         super();
      }
   }
}

