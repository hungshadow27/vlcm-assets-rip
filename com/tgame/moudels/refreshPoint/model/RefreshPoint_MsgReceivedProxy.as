package com.tgame.moudels.refreshPoint.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.refreshPoint.view.RefreshPoint_RefreshPointMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class RefreshPoint_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "RefreshPoint_MsgReceivedProxy";
      
      private var _refreshPoint_RefreshPointMediator:RefreshPoint_RefreshPointMediator;
      
      public function RefreshPoint_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([],NAME);
      }
      
      private function get refreshPoint_RefreshPointMediator() : RefreshPoint_RefreshPointMediator
      {
         if(this._refreshPoint_RefreshPointMediator == null)
         {
            this._refreshPoint_RefreshPointMediator = facade.retrieveMediator(RefreshPoint_RefreshPointMediator.NAME) as RefreshPoint_RefreshPointMediator;
         }
         return this._refreshPoint_RefreshPointMediator;
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
   }
}

