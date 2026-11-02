package com.tgame.moudels.chaojilaba.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.chaojilaba.view.ChaoJiLaBa_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChaoJiLaBa_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ChaoJiLaBa_MsgReceivedProxy";
      
      private var _mediator:ChaoJiLaBa_Mediator;
      
      public function ChaoJiLaBa_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73774],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73774],NAME);
      }
      
      private function get mediator() : ChaoJiLaBa_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(ChaoJiLaBa_Mediator.NAME) as ChaoJiLaBa_Mediator;
         }
         return this._mediator;
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
      
      public function received_73774(param1:ByteArray) : void
      {
         ZLog.add("73774：打开超级喇叭");
         this.mediator.update();
      }
   }
}

