package com.tgame.moudels.orangeEquip.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class OrangeEquip_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "OrangeEquip_MsgSenderProxy";
      
      public function OrangeEquip_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_53029(param1:* = null) : void
      {
         ZLog.add("53029:橙色装备打造");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         NetWorkManager.sendMsg(53029,_loc2_);
      }
      
      public function send_53521(param1:* = null) : void
      {
         ZLog.add("53521:橙色装备替换属性");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         NetWorkManager.sendMsg(53521,_loc2_);
      }
   }
}

