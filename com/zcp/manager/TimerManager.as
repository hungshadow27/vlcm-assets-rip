package com.zcp.manager
{
   import com.zcp.common.log.ZLog;
   import com.zcp.common.timer.helper.TimerHelper;
   import com.zcp.common.timer.vo.TimerData;
   import flash.events.Event;
   
   public class TimerManager
   {
      
      private static var _timerArr:Array = [];
      
      public function TimerManager()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function getTimersNum() : int
      {
         return _timerArr.length;
      }
      
      public static function createOneOffTimer(param1:Number, param2:Number, param3:Function, param4:Array = null, param5:Function = null, param6:Array = null, param7:Boolean = true) : void
      {
         TimerHelper.createTimer(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public static function createTimer(param1:Number, param2:Number, param3:Function, param4:Array = null, param5:Function = null, param6:Array = null, param7:Boolean = true) : TimerData
      {
         var _loc8_:TimerData = TimerHelper.createTimer(param1,param2,param3,param4,param5,param6,param7);
         _timerArr[_timerArr.length] = _loc8_;
         ZLog.add("TimerManager.createTimer::_timerArr.length:" + getTimersNum());
         return _loc8_;
      }
      
      public static function createOneOffExactTimer(param1:Number, param2:Number, param3:Number, param4:Function = null, param5:Function = null, param6:Number = 0) : void
      {
         TimerHelper.createExactTimer(param1,param2,param3,param4,param5,param6);
      }
      
      public static function createExactTimer(param1:Number, param2:Number, param3:Number, param4:Function = null, param5:Function = null, param6:Number = 0) : TimerData
      {
         var _loc7_:TimerData = TimerHelper.createExactTimer(param1,param2,param3,param4,param5,param6);
         _timerArr[_timerArr.length] = _loc7_;
         ZLog.add("TimerManager.createTimer::_timerArr.length:" + getTimersNum());
         return _loc7_;
      }
      
      public static function deleteTimer(param1:TimerData) : void
      {
         var _loc2_:TimerData = null;
         var _loc3_:* = int(_timerArr.length);
         while(_loc3_-- > 0)
         {
            _loc2_ = _timerArr[_loc3_];
            if(_loc2_ == param1)
            {
               _timerArr.splice(_loc3_,1);
               ZLog.add("TimerManager.deleteTimer::_timerArr.length:" + getTimersNum());
               _loc2_.destroy();
               break;
            }
         }
      }
      
      public static function deleteAllTimers() : void
      {
         var _loc1_:TimerData = null;
         for each(_loc1_ in _timerArr)
         {
            _loc1_.destroy();
         }
         _timerArr = [];
         ZLog.add("TimerManager.deleteAllTimers::_timerArr.length:0");
      }
      
      public static function addDelayCallBack(param1:Number, param2:Function) : void
      {
         TimerHelper.addDelayCallBack(param1,param2);
      }
      
      public static function removeDelayCallBack(param1:Function) : void
      {
         TimerHelper.removeDelayCallBack(param1);
      }
   }
}

