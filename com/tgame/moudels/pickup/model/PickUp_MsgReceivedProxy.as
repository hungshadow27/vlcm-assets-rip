package com.tgame.moudels.pickup.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PickUp_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "PickUp_MsgReceivedProxy";
      
      private var _pickUpProxy:PickUp_PickUpProxy;
      
      public function PickUp_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get pickUpProxy() : PickUp_PickUpProxy
      {
         if(!this._pickUpProxy)
         {
            this._pickUpProxy = facade.retrieveProxy(PickUp_PickUpProxy.NAME) as PickUp_PickUpProxy;
         }
         return this._pickUpProxy;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([11160,11162,11164,11166],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([11160,11162,11164,11166],NAME);
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
      
      public function received_11160(param1:ByteArray) : void
      {
         ZLog.add("11160：向场景添加掉落物品（场景中已经存在的包裹）");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readShort();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readByte();
         this.pickUpProxy.addPickUpBag(-1,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_11162(param1:ByteArray) : void
      {
         ZLog.add("11162：向场景添加掉落物品（某怪物死亡触发掉落）");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readShort();
         var _loc6_:int = _loc2_.readShort();
         var _loc7_:int = _loc2_.readInt();
         var _loc8_:int = _loc2_.readInt();
         var _loc9_:int = _loc2_.readByte();
         this.pickUpProxy.addPickUpBag(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_11164(param1:ByteArray) : void
      {
         ZLog.add("11164：从场景移除掉落物品");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         this.pickUpProxy.removePickUpBag(_loc3_);
      }
      
      public function received_11166(param1:ByteArray) : void
      {
         ZLog.add("11166：自动拾取的包裹ID");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         this.pickUpProxy.autoPickUpBag(_loc3_);
      }
   }
}

