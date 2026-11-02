package com.tgame.moudels.MonthSignIn.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MonthSignIn_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:* = "MonthSignIn_MsgSenderProxy";
      
      public function MonthSignIn_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_60421(param1:* = null) : void
      {
         ZLog.add("60421：请求月历界面");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60421,_loc2_);
      }
      
      public function send_60423(param1:* = null) : void
      {
         ZLog.add("60423：请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60423,_loc2_);
      }
      
      public function send_60425(param1:* = null) : void
      {
         ZLog.add("60425：请求签到");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60425,_loc2_);
      }
   }
}

