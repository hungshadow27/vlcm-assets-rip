package com.tgame.moudels.jileizhi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiLeiZhi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:* = "JiLeiZhi_MsgSenderProxy";
      
      public function JiLeiZhi_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_12131(param1:* = null) : void
      {
         ZLog.add("12131：请求月历界面");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(12131,_loc2_);
      }
      
      public function send_12133(param1:* = null) : void
      {
         ZLog.add("12133：请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(12133,_loc2_);
      }
   }
}

