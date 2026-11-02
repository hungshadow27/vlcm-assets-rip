package com.zcp.manager
{
   import com.zcp.common.events.helper.EventDispatchHelper;
   import com.zcp.common.events.helper.EventListenHelper;
   import com.zcp.common.events.vo.EventListenData;
   import com.zcp.common.log.ZLog;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class EventManager
   {
      
      private static var _eventArr:Array = [];
      
      public function EventManager()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function dispatchEvent(param1:Event, param2:EventDispatcher = null) : void
      {
         EventDispatchHelper.dispatchEvent(param1,param2);
      }
      
      public static function addEvent(param1:String, param2:Function, param3:EventDispatcher = null, param4:Boolean = false, param5:int = 0, param6:Boolean = false) : void
      {
         var _loc7_:EventListenData = null;
         if(hasSameEvent(param1,param2,param3,param4,param5,param6))
         {
            return;
         }
         _eventArr[_eventArr.length] = new EventListenData(param1,param2,param3,param4,param5,param6);
         EventListenHelper.addEvent(param1,param2,param3,param4,param5,param6);
      }
      
      public static function removeEvent(param1:String, param2:Function, param3:EventDispatcher = null, param4:Boolean = false) : void
      {
         var _loc5_:EventListenData = null;
         for each(_loc5_ in _eventArr)
         {
            if(_loc5_.type == param1 && _loc5_.listener == param2 && _loc5_.dispatcher == param3 && _loc5_.useCapture == param4)
            {
               _eventArr.splice(_eventArr.indexOf(_loc5_),1);
               ZLog.add("EventManager.removeEvent::_eventArr.length:" + getEventsNum());
               break;
            }
         }
         EventListenHelper.removeEvent(param1,param2,param3,param4);
      }
      
      public static function hasEvent(param1:String, param2:EventDispatcher = null) : Boolean
      {
         return EventListenHelper.hasEvent(param1,param2);
      }
      
      public static function willTrigger(param1:String, param2:EventDispatcher = null) : Boolean
      {
         return EventListenHelper.willTrigger(param1,param2);
      }
      
      public static function getEventsNum() : int
      {
         return _eventArr.length;
      }
      
      public static function getEventsNumByDispatcher(param1:EventDispatcher) : int
      {
         var _loc3_:EventListenData = null;
         var _loc2_:int = 0;
         for each(_loc3_ in _eventArr)
         {
            if(_loc3_.dispatcher == param1)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      public static function addEvents(param1:Array, param2:Function, param3:EventDispatcher = null, param4:Boolean = false, param5:int = 0, param6:Boolean = false) : void
      {
         var _loc7_:String = null;
         if(!param1 || param1.length == 0)
         {
            return;
         }
         for each(_loc7_ in param1)
         {
            addEvent(_loc7_,param2,param3,param4,param5,param6);
         }
      }
      
      public static function removeEvents(param1:Array, param2:Function, param3:EventDispatcher = null, param4:Boolean = false) : void
      {
         var _loc5_:String = null;
         if(!param1 || param1.length == 0)
         {
            return;
         }
         for each(_loc5_ in param1)
         {
            removeEvent(_loc5_,param2,param3,param4);
         }
      }
      
      public static function removeAllEvents() : void
      {
         var _loc1_:EventListenData = null;
         for each(_loc1_ in _eventArr)
         {
            EventListenHelper.removeEvent(_loc1_.type,_loc1_.listener,_loc1_.dispatcher,_loc1_.useCapture);
         }
         _eventArr = [];
      }
      
      public static function removeEventsByDispatcher(param1:EventDispatcher) : void
      {
         var _loc2_:int = 0;
         var _loc3_:EventListenData = null;
         _loc2_ = 0;
         while(_loc2_ < _eventArr.length)
         {
            _loc3_ = _eventArr[_loc2_];
            if(_loc3_.dispatcher == param1)
            {
               EventListenHelper.removeEvent(_loc3_.type,_loc3_.listener,_loc3_.dispatcher,_loc3_.useCapture);
               _eventArr.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      public static function hasSameEvent(param1:String, param2:Function, param3:EventDispatcher = null, param4:Boolean = false, param5:int = 0, param6:Boolean = false) : Boolean
      {
         var _loc8_:EventListenData = null;
         var _loc7_:Boolean = false;
         for each(_loc8_ in _eventArr)
         {
            if(_loc8_.equals(param1,param2,param3,param4,param5,param6))
            {
               _loc7_ = true;
               break;
            }
         }
         return _loc7_ && hasEvent(param1);
      }
   }
}

