package com.tgame.moudels.menpaiequipchange.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PartyEquipChange_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:* = "PartyEquipChange_MsgSenderProxy";
      
      public function PartyEquipChange_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70563(param1:* = null) : void
      {
         ZLog.add("70563：请求放入装备");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(int(param1.position));
         _loc2_.writeInt(int(param1.ID));
         _loc2_.writeByte(int(param1.index));
         NetWorkManager.sendMsg(70563,_loc2_);
      }
      
      public function send_70565(param1:* = null) : void
      {
         ZLog.add("70565：请求开始转换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(int(param1.position));
         _loc2_.writeInt(int(param1.ID));
         _loc2_.writeByte(int(param1.index));
         NetWorkManager.sendMsg(70565,_loc2_);
      }
      
      public function send_70567(param1:* = null) : void
      {
         ZLog.add("70567：请求进入白驼山");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(70567,_loc2_);
      }
   }
}

