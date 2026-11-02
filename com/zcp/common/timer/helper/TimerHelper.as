package com.zcp.common.timer.helper
{
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.HandlerManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   import gs.TweenLite;
   import gs.easing.Linear;
   
   public class TimerHelper
   {
      
      private static var timeSprite:Sprite = new Sprite();
      
      private static var delayCallBackList:Array = new Array();
      
      public function TimerHelper()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function createTimer(param1:Number, param2:Number, param3:Function, param4:Array = null, param5:Function = null, param6:Array = null, param7:Boolean = true) : TimerData
      {
         var timer:Timer = null;
         var timerHandler:Function = null;
         var timerCompleteHandler:Function = null;
         var destroy:Function = null;
         var $delay:Number = param1;
         var $repeat:Number = param2;
         var $timerHandler:Function = param3;
         var $timerHandlerParameters:Array = param4;
         var $timerCompleteHandler:Function = param5;
         var $timerCompleteHandlerParameters:Array = param6;
         var $autoStart:Boolean = param7;
         timerHandler = function(param1:TimerEvent):void
         {
            HandlerManager.execute($timerHandler,$timerHandlerParameters);
         };
         timerCompleteHandler = function(param1:TimerEvent):void
         {
            destroy();
            HandlerManager.execute($timerCompleteHandler,$timerCompleteHandlerParameters);
         };
         destroy = function():void
         {
            if(timer)
            {
               timer.stop();
               timer.removeEventListener(TimerEvent.TIMER,timerHandler);
               timer.removeEventListener(TimerEvent.TIMER_COMPLETE,timerCompleteHandler);
               timer = null;
            }
         };
         timer = new Timer($delay,$repeat);
         if($timerHandler != null)
         {
            timer.addEventListener(TimerEvent.TIMER,timerHandler);
         }
         if($timerCompleteHandler != null)
         {
            timer.addEventListener(TimerEvent.TIMER_COMPLETE,timerCompleteHandler);
         }
         if($autoStart)
         {
            timer.start();
         }
         return new TimerData(timer,destroy);
      }
      
      public static function createExactTimer(param1:Number, param2:Number, param3:Number, param4:Function = null, param5:Function = null, param6:Number = 0) : TimerData
      {
         var obj:Object = null;
         var i:Number = NaN;
         var absUpdateStep:Number = NaN;
         var onUpdate1:Function = null;
         var onUpdate2:Function = null;
         var onComplete:Function = null;
         var destroy:Function = null;
         var $duration:Number = param1;
         var $from:Number = param2;
         var $to:Number = param3;
         var $onUpdate:Function = param4;
         var $onComplete:Function = param5;
         var $updateStep:Number = param6;
         onUpdate1 = function():void
         {
            if(Math.abs(obj.i - i) >= absUpdateStep)
            {
               i = obj.i;
               if($onUpdate != null)
               {
                  $onUpdate(obj.i);
               }
            }
         };
         onUpdate2 = function():void
         {
            if($onUpdate != null)
            {
               $onUpdate(obj.i);
            }
         };
         onComplete = function():void
         {
            if($onUpdate != null)
            {
               $onUpdate(obj.i);
            }
            if($onComplete != null)
            {
               $onComplete();
            }
         };
         destroy = function():void
         {
            TweenLite.killTweensOf(obj);
         };
         obj = {"i":$from};
         var onUpdate:Function = $updateStep != 0 ? onUpdate1 : onUpdate2;
         TweenLite.to(obj,$duration,{
            "i":$to,
            "onUpdate":onUpdate,
            "onComplete":onComplete,
            "ease":Linear.easeNone
         });
         i = $from;
         absUpdateStep = Math.abs($updateStep);
         return new TimerData(null,destroy);
      }
      
      public static function addDelayCallBack(param1:Number, param2:Function) : void
      {
         if(param1 <= 0)
         {
            param2();
            return;
         }
         var _loc3_:Array = [param1,param2,getTimer()];
         delayCallBackList.unshift(_loc3_);
         delayCallBackList[param2] = _loc3_;
         if(delayCallBackList.length == 1)
         {
            timeSprite.addEventListener(Event.ENTER_FRAME,updateDelayCallBack);
         }
      }
      
      public static function removeDelayCallBack(param1:Function) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = delayCallBackList[param1];
         if(_loc2_ != null)
         {
            delayCallBackList[param1] = null;
            delete delayCallBackList[param1];
            _loc3_ = delayCallBackList.indexOf(_loc2_);
            if(_loc3_ != -1)
            {
               delayCallBackList.splice(_loc3_,1);
            }
         }
         if(delayCallBackList.length == 0)
         {
            timeSprite.removeEventListener(Event.ENTER_FRAME,updateDelayCallBack);
         }
      }
      
      private static function updateDelayCallBack(param1:Event) : void
      {
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:Function = null;
         var _loc8_:int = 0;
         var _loc2_:int = getTimer();
         var _loc3_:int = int(delayCallBackList.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = delayCallBackList[_loc4_];
            _loc6_ = int(_loc5_[0]);
            _loc7_ = _loc5_[1];
            _loc8_ = int(_loc5_[2]);
            if(_loc2_ - _loc8_ >= _loc6_)
            {
               delayCallBackList[_loc7_] = null;
               delete delayCallBackList[_loc7_];
               delayCallBackList.splice(_loc4_,1);
               if(delayCallBackList.length == 0)
               {
                  timeSprite.removeEventListener(Event.ENTER_FRAME,updateDelayCallBack);
               }
               _loc7_();
            }
            _loc4_--;
         }
      }
   }
}

