package com.tgame.manager
{
   import com.zcp.common.events.BaseEvent;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class DoubleClickManager extends EventDispatcher
   {
      
      public static const DOUBLE_CLICK:String = "DoubleClickManager.DOUBLE_CLICK";
      
      private var _timer:Timer;
      
      private var _switch:int;
      
      public function DoubleClickManager()
      {
         super();
         this._timer = new Timer(500,1);
         this._timer.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
      }
      
      public static function createDC() : DoubleClickManager
      {
         return new DoubleClickManager();
      }
      
      public function trig(param1:*) : void
      {
         if(this._switch == 0)
         {
            this._switch = 1;
            this._timer.reset();
            this._timer.start();
         }
         else
         {
            dispatchEvent(new BaseEvent(DOUBLE_CLICK,"",param1));
         }
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this._switch = 0;
         this._timer.reset();
         this._timer.stop();
      }
   }
}

