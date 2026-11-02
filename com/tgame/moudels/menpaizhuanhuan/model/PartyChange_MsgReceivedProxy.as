package com.tgame.moudels.menpaizhuanhuan.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.FightManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.menpaizhuanhuan.view.PartyChange_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PartyChange_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "PartyChange_MsgReceivedProxy";
      
      private var _partyChangeMediator:PartyChange_Mediator;
      
      public function PartyChange_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get partyChangeMediator() : PartyChange_Mediator
      {
         if(!this._partyChangeMediator)
         {
            this._partyChangeMediator = facade.retrieveMediator(PartyChange_Mediator.NAME) as PartyChange_Mediator;
         }
         return this._partyChangeMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70562],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70562],NAME);
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
      
      public function received_70562(param1:ByteArray) : void
      {
         ZLog.add("70562：返回门派转换成功或失败");
         var _loc2_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_)
         {
            FightManager.be_blackWhite(GameInstance.mainChar,false,"ui.darken",true);
         }
      }
   }
}

