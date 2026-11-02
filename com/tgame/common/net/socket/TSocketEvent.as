package com.tgame.common.net.socket
{
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   
   public class TSocketEvent extends BaseEvent
   {
      
      public static const LOGIN_SUCCESS:String = "TSocketEvent..loginSuccess";
      
      public static const LOGIN_FAILURE:String = "TSocketEvent..loginFailure";
      
      public static const CLOSE:String = "TSocketEvent..close";
      
      public function TSocketEvent(param1:String, param2:String = "", param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
      
      override public function clone() : Event
      {
         return new TSocketEvent(type,action,data,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return "[TSocketEvent]";
      }
   }
}

