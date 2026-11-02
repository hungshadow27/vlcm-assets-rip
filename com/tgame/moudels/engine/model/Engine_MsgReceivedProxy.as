package com.tgame.moudels.engine.model
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Engine_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Engine_MsgReceivedProxy";
      
      public function Engine_MsgReceivedProxy()
      {
         super();
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([10052],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([10052],NAME);
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
      
      public function received_10052(param1:ByteArray) : void
      {
         var _buf:ByteArray;
         var msg:String;
         var x:int = 0;
         var y:int = 0;
         var $data:ByteArray = param1;
         ZLog.add("10052：返回确认传送提示框");
         _buf = $data;
         x = _buf.readShort();
         y = _buf.readShort();
         msg = _buf.readUTF();
         FAlert.show(msg,"",2,function(param1:FAlertEvent):void
         {
            var _loc2_:Engine_MsgSenderProxy = null;
            if(param1.eventData == FAlert.OK)
            {
               _loc2_ = facade.retrieveProxy(Engine_MsgSenderProxy.NAME) as Engine_MsgSenderProxy;
               _loc2_.send_10053([x,y]);
            }
         },true);
      }
   }
}

