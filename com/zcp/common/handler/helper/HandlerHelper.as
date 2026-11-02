package com.zcp.common.handler.helper
{
   import flash.events.Event;
   
   public class HandlerHelper
   {
      
      public function HandlerHelper()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function execute(param1:Function, param2:Array = null) : *
      {
         if(param1 == null)
         {
            return null;
         }
         return param1.apply(null,param2);
      }
   }
}

