package com.zcp.common.loader.vo
{
   public class RslLoadingInfo
   {
      
      public var loadList:Array;
      
      public var callBack:Function;
      
      public var priority:int;
      
      public function RslLoadingInfo(param1:Array, param2:Function, param3:int)
      {
         super();
         this.loadList = param1;
         this.callBack = param2;
         this.priority = param3;
      }
   }
}

