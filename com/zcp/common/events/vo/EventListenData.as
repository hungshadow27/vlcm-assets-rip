package com.zcp.common.events.vo
{
   import flash.events.EventDispatcher;
   
   public class EventListenData
   {
      
      private var _type:String;
      
      private var _listener:Function;
      
      private var _dispatcher:EventDispatcher;
      
      private var _useCapture:Boolean;
      
      private var _priority:int;
      
      private var _useWeakReference:Boolean;
      
      public function EventListenData(param1:String, param2:Function, param3:EventDispatcher = null, param4:Boolean = false, param5:int = 0, param6:Boolean = false)
      {
         super();
         this._type = param1;
         this._listener = param2;
         this._dispatcher = param3;
         this._useCapture = param4;
         this._priority = param5;
         this._useWeakReference = param6;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get listener() : Function
      {
         return this._listener;
      }
      
      public function get dispatcher() : EventDispatcher
      {
         return this._dispatcher;
      }
      
      public function get useCapture() : Boolean
      {
         return this._useCapture;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function get useWeakReference() : Boolean
      {
         return this._useWeakReference;
      }
      
      public function equals(param1:String, param2:Function, param3:EventDispatcher = null, param4:Boolean = false, param5:int = 0, param6:Boolean = false) : Boolean
      {
         return this._type == param1 && this._listener == param2 && this._dispatcher == param3 && this._useCapture == param4 && this._priority == param5 && this._useWeakReference == param6;
      }
   }
}

