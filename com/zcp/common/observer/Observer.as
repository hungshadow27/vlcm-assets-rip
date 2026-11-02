package com.zcp.common.observer
{
   public class Observer
   {
      
      public var notifyMethod:Function;
      
      public var notifyContext:*;
      
      public function Observer(param1:Function, param2:*)
      {
         super();
         this.notifyMethod = param1;
         this.notifyContext = param2;
      }
      
      public function notifyObserver(param1:Notification) : void
      {
         this.notifyMethod.apply(this.notifyContext,[param1]);
      }
      
      public function compareNotifyContext(param1:*) : Boolean
      {
         return param1 === this.notifyContext;
      }
   }
}

