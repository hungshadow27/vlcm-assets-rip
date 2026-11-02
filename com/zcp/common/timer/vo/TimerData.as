package com.zcp.common.timer.vo
{
   import flash.utils.Timer;
   
   public class TimerData
   {
      
      private var _timer:Timer;
      
      private var _destroy:Function;
      
      public function TimerData(param1:Timer, param2:Function)
      {
         super();
         this._timer = param1;
         this._destroy = param2;
      }
      
      public function get timer() : Timer
      {
         return this._timer;
      }
      
      public function get destroy() : Function
      {
         return this._destroy;
      }
   }
}

