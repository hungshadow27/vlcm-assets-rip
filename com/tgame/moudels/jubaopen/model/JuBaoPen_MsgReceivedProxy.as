package com.tgame.moudels.jubaopen.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.jubaopen.view.JuBaoPen_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JuBaoPen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "JuBaoPen_MsgReceivedProxy";
      
      private var _juBaoPen_Mediator:JuBaoPen_Mediator;
      
      private var _msgSender:JuBaoPen_MsgSenderProxy;
      
      public function JuBaoPen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([59512,59514],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([59512,59514],NAME);
      }
      
      private function get juBaoPenMediator() : JuBaoPen_Mediator
      {
         if(this._juBaoPen_Mediator == null)
         {
            this._juBaoPen_Mediator = facade.retrieveMediator(JuBaoPen_Mediator.NAME) as JuBaoPen_Mediator;
         }
         return this._juBaoPen_Mediator;
      }
      
      private function get msgSender() : JuBaoPen_MsgSenderProxy
      {
         if(this._msgSender == null)
         {
            this._msgSender = facade.retrieveProxy(JuBaoPen_MsgSenderProxy.NAME) as JuBaoPen_MsgSenderProxy;
         }
         return this._msgSender;
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
      
      public function received_59512(param1:ByteArray) : void
      {
         ZLog.add("59512：返回聚宝盆活动时间(string),领奖时间(string),返利金票(int)");
         var _loc2_:Object = {};
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = param1.readUTF();
         var _loc5_:Number = param1.readDouble();
         var _loc6_:int = param1.readInt();
         this.juBaoPenMediator.setDate(_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_59514(param1:ByteArray) : void
      {
         ZLog.add("59514：领奖结果返回");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            GameInstance.uiInstance.mainUI.hideJuBaoPenBtn();
         }
      }
   }
}

