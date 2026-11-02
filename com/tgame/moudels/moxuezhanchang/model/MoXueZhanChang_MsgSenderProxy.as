package com.tgame.moudels.moxuezhanchang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MoXueZhanChang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "MoXueZhanChang_MsgSenderProxy";
      
      public function MoXueZhanChang_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71961(param1:* = null) : void
      {
         ZLog.add("71961：请求魔血战场进入");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71961,_loc2_);
      }
   }
}

