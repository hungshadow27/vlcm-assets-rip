package com.zcp.common.events.helper
{
   import com.zcp.common.events.EventDispatchCenter;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class EventDispatchHelper
   {
      
      private static var _eventDispatchCenter:EventDispatchCenter = EventDispatchCenter.getInstance();
      
      public function EventDispatchHelper()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function dispatchEvent(param1:Event, param2:EventDispatcher = null) : void
      {
         var _loc3_:EventDispatcher = param2 || _eventDispatchCenter;
         _loc3_.dispatchEvent(param1);
      }
   }
}

