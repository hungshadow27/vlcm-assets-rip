package com.zcp.manager
{
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.log.ZLog;
   import flash.events.Event;
   
   public class HandlerManager
   {
      
      private static var _defaultHandlerThread:HandlerThread = new HandlerThread(new Array(),true);
      
      private static var _handlerThreadArr:Array = [_defaultHandlerThread];
      
      public function HandlerManager()
      {
         super();
         throw new Event("静态类");
      }
      
      public static function getHandlerThreadsNum() : int
      {
         return _handlerThreadArr.length;
      }
      
      public static function getHandlersNum() : int
      {
         var _loc2_:HandlerThread = null;
         var _loc1_:Number = 0;
         for each(_loc2_ in _handlerThreadArr)
         {
            _loc1_ += _loc2_.getHandlersNum();
         }
         return _loc1_;
      }
      
      public static function creatNewHandlerThread(param1:Array = null, param2:Boolean = true) : HandlerThread
      {
         var $handlerArr:Array = param1;
         var $isQueue:Boolean = param2;
         var ht:HandlerThread = _handlerThreadArr[_handlerThreadArr.length] = new HandlerThread($handlerArr,$isQueue);
         try
         {
            ZLog.add("HandlerManager.creatNewHandlerThread::_handlerThreadArr.length:" + getHandlerThreadsNum());
         }
         catch(e:Error)
         {
         }
         return ht;
      }
      
      public static function push(param1:Function, param2:Array = null, param3:Number = 0, param4:Boolean = true, param5:Boolean = true, param6:Boolean = false, param7:HandlerThread = null) : HandlerThread
      {
         var _loc8_:HandlerThread = null;
         if(param7 != null)
         {
            _loc8_ = param7;
            if(!hasHandlerThread(_loc8_))
            {
               _handlerThreadArr.push(_loc8_);
               ZLog.add("HandlerManager.push::_handlerThreadArr.length:" + getHandlerThreadsNum());
            }
         }
         else
         {
            _loc8_ = _defaultHandlerThread;
         }
         _loc8_.push(param1,param2,param3,param4,param5,param6);
         return _loc8_;
      }
      
      public static function execute(param1:Function, param2:Array = null) : *
      {
         return HandlerHelper.execute(param1,param2);
      }
      
      public static function getDefaultHandlerThread() : HandlerThread
      {
         return _defaultHandlerThread;
      }
      
      public static function removeAllHandlerThreads() : void
      {
         removeAllHandlers();
         _handlerThreadArr = [];
         ZLog.add("HandlerManager.removeAllHandlerThreads::_handlerThreadArr.length:0");
      }
      
      public static function removeAllHandlers() : void
      {
         var _loc1_:HandlerThread = null;
         for each(_loc1_ in _handlerThreadArr)
         {
            _loc1_.removeAllHandlers();
         }
      }
      
      public static function removeHandlerThread(param1:HandlerThread) : void
      {
         var _loc2_:HandlerThread = null;
         if(!param1)
         {
            return;
         }
         for each(_loc2_ in _handlerThreadArr)
         {
            if(_loc2_ == param1)
            {
               _loc2_.removeAllHandlers();
               _handlerThreadArr.splice(_handlerThreadArr.indexOf(_loc2_),1);
               ZLog.add("HandlerManager.removeHandlerThread::_handlerThreadArr.length:" + getHandlerThreadsNum());
               break;
            }
         }
      }
      
      public static function removeHandler(param1:Function) : void
      {
         var _loc2_:HandlerThread = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in _handlerThreadArr)
         {
            _loc2_.removeHandler(param1);
         }
      }
      
      public static function hasHandlerThread(param1:HandlerThread) : Boolean
      {
         return _handlerThreadArr.indexOf(param1) != -1;
      }
      
      public static function hasHandler(param1:Function) : Boolean
      {
         var _loc2_:HandlerThread = null;
         for each(_loc2_ in _handlerThreadArr)
         {
            if(_loc2_.hasHandler(param1))
            {
               return true;
            }
         }
         return false;
      }
   }
}

