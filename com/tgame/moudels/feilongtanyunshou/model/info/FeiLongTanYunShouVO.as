package com.tgame.moudels.feilongtanyunshou.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class FeiLongTanYunShouVO
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
      
      public var MiaoShu:String;
      
      public var skill:Skill;
      
      public var isUseSkill:Boolean = false;
      
      public var jihuoJindu:int;
      
      public var addJihuoGongji:int;
      
      public var addJihuoFangyu:int;
      
      public var addJihuoShengming:int;
      
      public var lkzx:int;
      
      public var zhongJi:Boolean;
      
      public var isDanTian:Boolean;
      
      public var YN_Qixuan:Boolean;
      
      public var YN_QixuanState:Boolean;
      
      public function FeiLongTanYunShouVO()
      {
         super();
      }
   }
}

