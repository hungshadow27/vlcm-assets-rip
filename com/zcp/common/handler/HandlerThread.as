package com.zcp.common.handler
{
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.handler.vo.HandlerData;
   import com.zcp.manager.TimerManager;
   
   public class HandlerThread
   {
      
      private var _handlerDataArr:Array;
      
      private var _handlerDataReadyArr:Array;
      
      private var _isRunning:Boolean;
      
      private var _canRun:Boolean;
      
      private var _isQueue:Boolean;
      
      private var _next:HandlerData;
      
      public function HandlerThread(param1:Array = null, param2:Boolean = true)
      {
         super();
         this._handlerDataArr = param1 || [];
         this._handlerDataReadyArr = [];
         this._isQueue = param2;
         this._isRunning = false;
         this._canRun = true;
         this._next = null;
      }
      
      public function get isRunning() : Boolean
      {
         return this._isRunning;
      }
      
      public function getHandlersNum() : int
      {
         return this._handlerDataArr.length;
      }
      
      public function push(param1:Function, param2:Array = null, param3:Number = 0, param4:Boolean = true, param5:Boolean = true, param6:Boolean = false) : HandlerData
      {
         var _loc7_:HandlerData = new HandlerData(param1,param2,param3,param4);
         if(param6)
         {
            this._handlerDataArr.unshift(_loc7_);
         }
         else
         {
            this._handlerDataArr.push(_loc7_);
         }
         if(this._canRun && param5 && !this._isRunning)
         {
            this.executeNext();
         }
         return _loc7_;
      }
      
      public function removeAllHandlers() : void
      {
         this._handlerDataArr.length = 0;
         this._handlerDataReadyArr.length = 0;
         this._isRunning = false;
      }
      
      public function removeHandler(param1:Function) : void
      {
         var _loc2_:HandlerData = null;
         if(param1 == null)
         {
            return;
         }
         var _loc3_:* = int(this._handlerDataArr.length);
         while(_loc3_-- > 0)
         {
            _loc2_ = this._handlerDataArr[_loc3_];
            if(_loc2_.handler == param1)
            {
               this._handlerDataArr.splice(_loc3_,1);
            }
         }
         _loc3_ = int(this._handlerDataReadyArr.length);
         while(_loc3_-- > 0)
         {
            _loc2_ = this._handlerDataReadyArr[_loc3_];
            if(_loc2_.handler == param1)
            {
               this._handlerDataReadyArr.splice(_loc3_,1);
            }
         }
         if(this._handlerDataArr.length == 0 && this._handlerDataReadyArr.length == 0)
         {
            this._isRunning = false;
         }
      }
      
      public function hasHandler(param1:Function) : Boolean
      {
         var _loc2_:HandlerData = null;
         for each(_loc2_ in this._handlerDataArr)
         {
            if(_loc2_.handler == param1)
            {
               return true;
            }
         }
         for each(_loc2_ in this._handlerDataReadyArr)
         {
            if(_loc2_.handler == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function start() : void
      {
         this._canRun = true;
         if(!this._isRunning)
         {
            this.executeNext();
         }
      }
      
      public function stop() : void
      {
         this._canRun = false;
      }
      
      private function setNotRunning() : void
      {
         this._isRunning = false;
      }
      
      private function executeNext() : void
      {
         var newHandler:Function;
         if(!this._canRun)
         {
            this._isRunning = false;
            return;
         }
         if(this._handlerDataArr.length == 0)
         {
            this._isRunning = false;
            return;
         }
         this._isRunning = true;
         this._next = (this._isQueue ? this._handlerDataArr.shift() : this._handlerDataArr.pop()) as HandlerData;
         if(this._next)
         {
            if(this._next.delay > 0)
            {
               newHandler = function():void
               {
                  if(removeReadyHD(_next))
                  {
                     HandlerHelper.execute(_next.handler,_next.parameters);
                  }
                  if(_next.doNext)
                  {
                     executeNext();
                  }
                  else
                  {
                     setNotRunning();
                  }
               };
               this.addReadyHD(this._next);
               TimerManager.createOneOffTimer(this._next.delay,1,newHandler,null,null,null,true);
            }
            else
            {
               HandlerHelper.execute(this._next.handler,this._next.parameters);
               if(this._next.doNext)
               {
                  this.executeNext();
               }
               else
               {
                  this.setNotRunning();
               }
            }
         }
         else
         {
            this.executeNext();
         }
      }
      
      private function addReadyHD(param1:HandlerData) : void
      {
         if(this._handlerDataReadyArr.indexOf(param1) != -1)
         {
            return;
         }
         this._handlerDataReadyArr.push(param1);
      }
      
      private function removeReadyHD(param1:HandlerData) : Boolean
      {
         var _loc2_:int = this._handlerDataReadyArr.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._handlerDataReadyArr.splice(_loc2_,1);
            return true;
         }
         return false;
      }
   }
}

