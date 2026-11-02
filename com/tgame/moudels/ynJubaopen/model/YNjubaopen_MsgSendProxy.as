package com.tgame.moudels.ynJubaopen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNjubaopen_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNjubaopen_MsgSendProxy";
      
      public function YNjubaopen_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73601(param1:* = null) : void
      {
         ZLog.add("73601：请求是否显示聚宝盆面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73601,_loc2_);
      }
      
      public function send_73605(param1:* = null) : void
      {
         ZLog.add("73605：放入元宝");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73605,_loc2_);
      }
      
      public function send_73607(param1:* = null) : void
      {
         ZLog.add("73607：请求领取金票");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73607,_loc2_);
      }
   }
}

