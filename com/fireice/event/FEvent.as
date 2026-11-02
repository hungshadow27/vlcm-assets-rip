package com.fireice.event
{
   import flash.events.Event;
   
   public class FEvent extends Event
   {
      
      public static const COMPLETE:String = "BaseEventComplete";
      
      private var _data:Object;
      
      private var _type:String;
      
      public function FEvent(param1:String, param2:String, param3:Object)
      {
         super(param1);
         this._data = param3;
         this._type = param2;
      }
      
      public function get eventData() : Object
      {
         return this._data;
      }
      
      public function get eventType() : String
      {
         return this._type;
      }
   }
}

