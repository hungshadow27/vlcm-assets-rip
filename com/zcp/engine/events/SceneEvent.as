package com.zcp.engine.events
{
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   
   public class SceneEvent extends BaseEvent
   {
      
      public static const INTERACTIVE:String = "SceneEvent.interactive";
      
      public static const WALK:String = "SceneEvent.walk";
      
      public static const STATUS:String = "SceneEvent.status";
      
      public static const PROCESS:String = "SceneEvent.process";
      
      public function SceneEvent(param1:String, param2:String = "", param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         return new SceneEvent(type,action,data,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[SceneEvent]";
      }
   }
}

