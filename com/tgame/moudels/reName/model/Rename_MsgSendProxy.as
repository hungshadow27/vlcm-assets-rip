package com.tgame.moudels.reName.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Rename_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "FengZhengJie_MsgSendProxy";
      
      public function Rename_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73611(param1:* = null) : void
      {
         ZLog.add("73611：请求换名");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73611,_loc2_);
      }
   }
}

