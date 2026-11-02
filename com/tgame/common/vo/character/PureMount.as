package com.tgame.common.vo.character
{
   public class PureMount extends Mount
   {
      
      public var id:int;
      
      public var name:String;
      
      public var saleCopper:int;
      
      public var saleGold:int;
      
      public var fightStatus:int;
      
      public var isDianFengShou:Boolean;
      
      public var nowHate:int;
      
      public var maxHate:int;
      
      public var skillID:int;
      
      public var skillContent:String;
      
      public var isHave:Boolean;
      
      public var isDefaultShow:Boolean;
      
      public var needGongXun:int;
      
      public var ynGoodID:int;
      
      public var ynState:int;
      
      public function PureMount(param1:int)
      {
         super(null,param1);
      }
   }
}

