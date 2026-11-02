package com.tgame.moudels.menpaiequipchange.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.menpaiequipchange.view.PartyEquipChange_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PartyEquipChange_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "PartyEquipChange_MsgReceivedProxy";
      
      private var _partyEquipChangeMediator:PartyEquipChange_Mediator;
      
      public function PartyEquipChange_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get partyEquipChangeMediator() : PartyEquipChange_Mediator
      {
         if(!this._partyEquipChangeMediator)
         {
            this._partyEquipChangeMediator = facade.retrieveMediator(PartyEquipChange_Mediator.NAME) as PartyEquipChange_Mediator;
         }
         return this._partyEquipChangeMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70564,70566],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70564,70566],NAME);
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
      
      public function received_70564(param1:ByteArray) : void
      {
         ZLog.add("70564：放入装备返回");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.partyEquipChangeMediator.setEquip(_loc2_,_loc3_);
         this.partyEquipChangeMediator.setEnergyExpendItem(_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_70566(param1:ByteArray) : void
      {
         ZLog.add("70566：装备转换是否成功");
         var _loc2_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc2_)
         {
            this.partyEquipChangeMediator.onClosePanel();
         }
      }
   }
}

