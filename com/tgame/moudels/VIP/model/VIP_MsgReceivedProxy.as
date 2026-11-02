package com.tgame.moudels.VIP.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.VIP.view.VIP_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class VIP_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "VIP_MsgReceivedProxy";
      
      private var _vipMediator:VIP_Mediator;
      
      public function VIP_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get vipMediator() : VIP_Mediator
      {
         if(!this._vipMediator)
         {
            this._vipMediator = facade.retrieveMediator(VIP_Mediator.NAME) as VIP_Mediator;
         }
         return this._vipMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72802,72804],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72802,72804],NAME);
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
      
      public function received_72802(param1:ByteArray) : void
      {
         ZLog.add("72802：返回vip面板");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readInt();
         var _loc8_:Array = [];
         var _loc9_:int = 0;
         while(_loc9_ < _loc7_)
         {
            _loc8_.push(param1.readInt());
            _loc9_++;
         }
         var _loc10_:int = param1.readByte();
         this.vipMediator.setInit(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_ == 1 ? true : false,_loc8_,_loc10_);
      }
      
      public function received_72804(param1:ByteArray) : void
      {
         ZLog.add("72804：vip是否过期");
      }
   }
}

