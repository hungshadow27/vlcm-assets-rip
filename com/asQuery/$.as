package com.asQuery
{
   import flash.display.DisplayObjectContainer;
   
   public function $(param1:* = null, param2:DisplayObjectContainer = null, param3:Boolean = true) : ASQueryObject
   {
      return new ASQueryObject(param2 == null ? ASQueryConfig.stage : param2,param1 == null ? ASQueryConfig.stage : param1,param3);
   }
}

