package com.tgame.moudels.bowArrow.info
{
   import flash.utils.IDataInput;
   
   public class BowArrowCmpResultInfo
   {
      
      public var isSuccess:int;
      
      public var curtBowArrowID:uint;
      
      public var luckCnt:uint;
      
      public var luckAllCnt:uint;
      
      public var buffLuckCnt:uint;
      
      public function BowArrowCmpResultInfo(param1:IDataInput)
      {
         super();
         if(param1)
         {
            this.isSuccess = param1.readByte();
            this.curtBowArrowID = param1.readByte();
            this.luckCnt = param1.readByte();
            this.luckAllCnt = param1.readInt();
            this.buffLuckCnt = param1.readInt();
         }
      }
   }
}

