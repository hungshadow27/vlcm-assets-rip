package com.tgame.moudels.orangeEquip.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.orangeEquip.view.OrangeEquip_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class OrangeEquip_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "OrangeEquip_MsgReceivedProxy";
      
      private var _orangeEquip_Mediator:OrangeEquip_Mediator;
      
      public function OrangeEquip_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53030,53522],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53030,53522],NAME);
      }
      
      private function get orangeEquip_Mediator() : OrangeEquip_Mediator
      {
         if(!this._orangeEquip_Mediator)
         {
            this._orangeEquip_Mediator = facade.retrieveMediator(OrangeEquip_Mediator.NAME) as OrangeEquip_Mediator;
         }
         return this._orangeEquip_Mediator;
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
            ZLog.add("收到消息：" + _loc2_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_53030(param1:ByteArray) : void
      {
         var index:int = 0;
         var t:Timer = null;
         var timerEnd:Function = null;
         var $data:ByteArray = param1;
         timerEnd = function(param1:TimerEvent):void
         {
            orangeEquip_Mediator.equipUpDataCommplete(index);
            t.removeEventListener(TimerEvent.TIMER,timerEnd);
         };
         var isSucc:Boolean = $data.readByte() == 0 ? false : true;
         index = -1;
         if(isSucc)
         {
            index = $data.readShort();
         }
         t = new Timer(500,1);
         t.start();
         t.addEventListener(TimerEvent.TIMER,timerEnd);
      }
      
      public function received_53522(param1:ByteArray) : void
      {
         var index:int = 0;
         var t:Timer = null;
         var timerEnd:Function = null;
         var $data:ByteArray = param1;
         timerEnd = function(param1:TimerEvent):void
         {
            orangeEquip_Mediator.equipChangeCommplete(index);
            t.removeEventListener(TimerEvent.TIMER,timerEnd);
         };
         var isSucc:Boolean = $data.readByte() == 0 ? false : true;
         index = -1;
         if(isSucc)
         {
            index = $data.readShort();
         }
         t = new Timer(500,1);
         t.start();
         t.addEventListener(TimerEvent.TIMER,timerEnd);
      }
   }
}

