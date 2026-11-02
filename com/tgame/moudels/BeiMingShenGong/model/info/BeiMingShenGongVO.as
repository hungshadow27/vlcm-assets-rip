package com.tgame.moudels.BeiMingShenGong.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class BeiMingShenGongVO
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
      
      public var mp:int;
      
      public var cp:int;
      
      public var miaoshu:String;
      
      public var curJingMai:int;
      
      public var maxJingMai:int;
      
      public var jingMaiMiaoShu:String = "";
      
      public var curQiHai:int;
      
      public var maxQiHai:int;
      
      public var qiHaiMiaoShu:String = "";
      
      public var curDanTian:int;
      
      public var maxDanTian:int;
      
      public var danTianMiaoShu:String = "";
      
      public var curRouShen:int;
      
      public var maxRouShen:int;
      
      public var rouShenMiaoShu:String = "";
      
      public var jiNengId:int;
      
      public var skill:Skill;
      
      public var jiNengMiaoShu:String = "";
      
      public var isCanUse:Boolean;
      
      public var isUseDan:Boolean;
      
      public var wuJiGongFa:Boolean;
      
      public var isHuanZhuang:Boolean;
      
      public var isWuQi:Boolean;
      
      public var isDanTian:Boolean;
      
      public function BeiMingShenGongVO()
      {
         super();
      }
   }
}

