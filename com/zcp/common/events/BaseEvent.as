package com.zcp.common.events
{
   import flash.events.Event;
   
   public class BaseEvent extends Event
   {
      
      public static const INIT_COMPLETE:String = "BaseEvent.initComplete";
      
      public static const UPDATE:String = "BaseEvent.update";
      
      public static const COMPLETE:String = "BaseEvent.complete";
      
      public var action:String;
      
      public var data:Object;
      
      public function BaseEvent(param1:String, param2:String = "", param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this.action = param2;
         this.data = param3;
      }
      
      override public function clone() : Event
      {
         return new BaseEvent(type,this.action,this.data,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[BaseEvent]";
      }
   }
}

