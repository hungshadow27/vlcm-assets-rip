package com.tgame.moudels.ynOnline.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNonline_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNonline_MsgSendProxy";
      
      public function YNonline_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74271(param1:* = null) : void
      {
         ZLog.add("74271：请求在线奖励面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74271,_loc2_);
      }
      
      public function send_74273(param1:* = null) : void
      {
         ZLog.add("74273：请求领取在线奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74273,_loc2_);
      }
   }
}

