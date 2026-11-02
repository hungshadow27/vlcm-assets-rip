package com.tgame.moudels.ynLianhuanchongzhi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNlianhuanchongzhi_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNlianhuanchongzhi_MsgSendProxy";
      
      public function YNlianhuanchongzhi_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_79651(param1:* = null) : void
      {
         ZLog.add("79651：请求显示连环充值面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79651,_loc2_);
      }
      
      public function send_79653(param1:* = null) : void
      {
         ZLog.add("79653：请求领取当日礼包");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(79653,_loc2_);
      }
      
      public function send_79655(param1:* = null) : void
      {
         ZLog.add("79655：请求领取终极礼包");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79655,_loc2_);
      }
   }
}

