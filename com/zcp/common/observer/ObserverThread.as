package com.zcp.common.observer
{
   public class ObserverThread
   {
      
      private var _observerMap:Object = {};
      
      public function ObserverThread()
      {
         super();
      }
      
      public function clear() : void
      {
         this._observerMap = {};
      }
      
      public function registerObserver(param1:*, param2:Observer) : void
      {
         if(this._observerMap[param1] != null)
         {
            this._observerMap[param1].push(param2);
         }
         else
         {
            this._observerMap[param1] = [param2];
         }
      }
      
      public function removeObserver(param1:*, param2:*) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Array = this._observerMap[param1] as Array;
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            if(Observer(_loc3_[_loc4_]).compareNotifyContext(param2))
            {
               _loc3_.splice(_loc4_,1);
               break;
            }
            _loc4_++;
         }
         if(_loc3_.length == 0)
         {
            delete this._observerMap[param1];
         }
      }
      
      public function notifyObservers(param1:Notification) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Observer = null;
         var _loc5_:int = 0;
         var _loc2_:Array = this._observerMap[param1.name] as Array;
         if(_loc2_ != null)
         {
            _loc3_ = new Array();
            _loc5_ = 0;
            while(_loc5_ < _loc2_.length)
            {
               _loc4_ = _loc2_[_loc5_];
               _loc3_.push(_loc4_);
               _loc5_++;
            }
            _loc5_ = 0;
            while(_loc5_ < _loc3_.length)
            {
               _loc4_ = _loc3_[_loc5_] as Observer;
               _loc4_.notifyObserver(param1);
               _loc5_++;
            }
         }
      }
   }
}

