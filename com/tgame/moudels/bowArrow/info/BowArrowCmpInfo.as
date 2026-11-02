package com.tgame.moudels.bowArrow.info
{
   import flash.utils.IDataInput;
   
   public class BowArrowCmpInfo
   {
      
      public var curtBowArrowName:String;
      
      public var curtBowArrowID:uint;
      
      public var nextBowArrowID:uint;
      
      public var nextBowArrowName:String;
      
      public var luckCnt:uint;
      
      public var coinsCost:uint;
      
      public var stuffID:uint;
      
      public var stuffCnt:uint;
      
      public var probability:uint;
      
      public var luckAllCnt:uint;
      
      public var daojishi:uint;
      
      public function BowArrowCmpInfo(param1:IDataInput)
      {
         super();
         if(param1)
         {
            this.curtBowArrowID = param1.readInt();
            this.curtBowArrowName = param1.readUTF();
            this.nextBowArrowID = param1.readInt();
            this.nextBowArrowName = param1.readUTF();
            this.luckCnt = param1.readInt();
            this.coinsCost = param1.readInt();
            this.stuffID = param1.readInt();
            this.stuffCnt = param1.readInt();
            this.probability = param1.readInt();
            this.luckAllCnt = param1.readInt();
            this.daojishi = param1.readInt();
         }
      }
   }
}

