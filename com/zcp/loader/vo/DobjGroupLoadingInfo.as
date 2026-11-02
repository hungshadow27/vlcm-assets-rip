package com.zcp.loader.vo
{
   public class DobjGroupLoadingInfo
   {
      
      public var loadList:Array;
      
      public var callBack:Function;
      
      public var priority:int;
      
      public function DobjGroupLoadingInfo(param1:Array, param2:Function, param3:int)
      {
         super();
         this.loadList = param1;
         this.callBack = param2;
         this.priority = param3;
      }
   }
}

