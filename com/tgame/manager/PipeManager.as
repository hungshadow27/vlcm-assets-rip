package com.tgame.manager
{
   import com.zcp.common.observer.Notification;
   import com.zcp.common.observer.Observer;
   import com.zcp.common.observer.ObserverThread;
   
   public class PipeManager
   {
      
      private static var _msgObserverThread:ObserverThread = new ObserverThread();
      
      public function PipeManager()
      {
         super();
      }
      
      public static function registerMsg(param1:String, param2:Function, param3:*) : void
      {
         var _loc4_:Observer = new Observer(param2,param3);
         _msgObserverThread.registerObserver(param1,_loc4_);
      }
      
      public static function registerMsgs(param1:Array, param2:Function, param3:*) : void
      {
         var _loc4_:* = undefined;
         for each(_loc4_ in param1)
         {
            registerMsg(_loc4_,param2,param3);
         }
      }
      
      public static function removeMsg(param1:String, param2:*) : void
      {
         _msgObserverThread.removeObserver(param1,param2);
      }
      
      public static function removeMsgs(param1:Array, param2:*) : void
      {
         var _loc3_:* = undefined;
         for each(_loc3_ in param1)
         {
            removeMsg(_loc3_,param2);
         }
      }
      
      public static function sendMsg(param1:String, param2:Object = null) : void
      {
         var _loc3_:Notification = new Notification(param1,param2);
         _msgObserverThread.notifyObservers(_loc3_);
      }
   }
}

