package com.tgame.moudels.VIP.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class VIP_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:* = "VIP_MsgSenderProxy";
      
      public function VIP_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_72801(param1:* = null) : void
      {
         ZLog.add("72801：请求VIP界面");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72801,_loc2_);
      }
      
      public function send_72803(param1:* = null) : void
      {
         ZLog.add("72803：请求领取成就礼包");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(72803,_loc2_);
      }
      
      public function send_82711(param1:* = null) : void
      {
         ZLog.add("82711：请求元宝返还");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82711,_loc2_);
      }
      
      public function send_82713(param1:* = null) : void
      {
         ZLog.add("82713：请求金票返还");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82713,_loc2_);
      }
   }
}

