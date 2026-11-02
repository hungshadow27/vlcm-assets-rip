package com.tgame.moudels.nitaCyclone.info
{
   import flash.utils.IDataInput;
   
   public class NitaCycloneCmpResultInfo
   {
      
      public var isSuccess:int;
      
      public function NitaCycloneCmpResultInfo(param1:IDataInput)
      {
         super();
         if(param1)
         {
            this.isSuccess = param1.readByte();
         }
      }
   }
}

