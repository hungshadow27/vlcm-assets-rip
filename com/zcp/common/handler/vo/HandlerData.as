package com.zcp.common.handler.vo
{
   public class HandlerData
   {
      
      private var _handler:Function;
      
      private var _parameters:Array;
      
      private var _delay:Number;
      
      private var _doNext:Boolean;
      
      public function HandlerData(param1:Function, param2:Array = null, param3:Number = 0, param4:Boolean = true)
      {
         super();
         this._handler = param1;
         this._parameters = param2;
         this._delay = param3;
         this._doNext = param4;
      }
      
      public function get handler() : Function
      {
         return this._handler;
      }
      
      public function get parameters() : Array
      {
         return this._parameters;
      }
      
      public function get delay() : Number
      {
         return this._delay;
      }
      
      public function get doNext() : Boolean
      {
         return this._doNext;
      }
   }
}

