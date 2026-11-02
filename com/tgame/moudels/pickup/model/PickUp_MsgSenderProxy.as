package com.tgame.moudels.pickup.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PickUp_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "PickUp_MsgSenderProxy";
      
      public function PickUp_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_11163(param1:* = null) : void
      {
         ZLog.add("11163：捡取怪物包裹中的物品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(getTimer());
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(11163,_loc2_);
      }
   }
}

