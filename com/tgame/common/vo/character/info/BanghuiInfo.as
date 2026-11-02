package com.tgame.common.vo.character.info
{
   public class BanghuiInfo
   {
      
      public var banghuiId:int;
      
      public var banghuiName:String;
      
      public var zhiwu:int;
      
      public var bangqiLv:int;
      
      public var bangqiName:String;
      
      public var bangqiImgID:int;
      
      public var bangqiImgColor:Array;
      
      public var banggong:Number;
      
      public function BanghuiInfo()
      {
         super();
         this.clear();
      }
      
      public function clear() : void
      {
         this.banghuiId = 0;
         this.banghuiName = "";
         this.zhiwu = 0;
         this.bangqiLv = 0;
         this.bangqiName = "";
         this.bangqiImgID = 0;
         this.bangqiImgColor = [];
         this.banggong = 0;
      }
      
      public function isTongbang(param1:int) : Boolean
      {
         return this.banghuiId != 0 && this.banghuiId == param1;
      }
   }
}

