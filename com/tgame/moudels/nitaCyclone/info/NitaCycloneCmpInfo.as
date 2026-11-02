package com.tgame.moudels.nitaCyclone.info
{
   import flash.utils.IDataInput;
   
   public class NitaCycloneCmpInfo
   {
      
      public var curtNitaID:uint;
      
      public var stuffID:uint;
      
      public var stuffCnt:uint;
      
      public var probability:uint;
      
      public var luckCnt:uint;
      
      public var luckAllCnt:uint;
      
      public var daojishi:int;
      
      public function NitaCycloneCmpInfo(param1:IDataInput)
      {
         super();
         if(param1)
         {
            this.curtNitaID = param1.readByte();
            this.luckCnt = param1.readInt();
            this.luckAllCnt = param1.readInt();
            this.probability = param1.readInt() * 0.01;
            this.stuffID = param1.readInt();
            this.stuffCnt = param1.readInt();
            this.daojishi = param1.readInt();
         }
      }
   }
}

