package com.tgame.moudels.shangdian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shangdian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Shangdian_MsgSenderProxy";
      
      public function Shangdian_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_82181(param1:* = null) : void
      {
         ZLog.add("82181\t\t面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(82181,_loc2_);
      }
      
      public function send_82183(param1:* = null) : void
      {
         ZLog.add("82183\t\t翻页");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(82183,_loc2_);
      }
      
      public function send_82185(param1:* = null) : void
      {
         ZLog.add("82185\t\t购买");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(82185,_loc2_);
      }
   }
}

