package com.zcp.common.events.helper
{
   import com.zcp.common.events.EventDispatchCenter;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class EventListenHelper
   {
      
      private static var _eventDispatchCenter:EventDispatchCenter = EventDispatchCenter.getInstance();
      
      public function EventListenHelper()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function addEvent(param1:String, param2:Function, param3:EventDispatcher = null, param4:Boolean = false, param5:int = 0, param6:Boolean = false) : void
      {
         var _loc7_:EventDispatcher = param3 || _eventDispatchCenter;
         _loc7_.addEventListener(param1,param2,param4,param5,param6);
      }
      
      public static function removeEvent(param1:String, param2:Function, param3:EventDispatcher = null, param4:Boolean = false) : void
      {
         var _loc5_:EventDispatcher = param3 || _eventDispatchCenter;
         _loc5_.removeEventListener(param1,param2,param4);
      }
      
      public static function hasEvent(param1:String, param2:EventDispatcher = null) : Boolean
      {
         var _loc3_:EventDispatcher = param2 || _eventDispatchCenter;
         return _loc3_.hasEventListener(param1);
      }
      
      public static function willTrigger(param1:String, param2:EventDispatcher = null) : Boolean
      {
         var _loc3_:EventDispatcher = param2 || _eventDispatchCenter;
         return _loc3_.willTrigger(param1);
      }
   }
}

