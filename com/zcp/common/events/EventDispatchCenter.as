package com.zcp.common.events
{
   import flash.events.EventDispatcher;
   
   public class EventDispatchCenter extends EventDispatcher
   {
      
      private static var _instance:EventDispatchCenter;
      
      public function EventDispatchCenter()
      {
         super();
         if(_instance != null)
         {
            throw new Error("单例!");
         }
         _instance = this;
      }
      
      public static function getInstance() : EventDispatchCenter
      {
         if(_instance == null)
         {
            _instance = new EventDispatchCenter();
         }
         return _instance;
      }
   }
}

