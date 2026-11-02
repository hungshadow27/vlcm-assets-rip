package com.tgame.moudels.tianshangzhihun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianShangZhiHun_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:* = "TianShangZhiHun_MsgSenderProxy";
      
      public function TianShangZhiHun_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71811(param1:* = null) : void
      {
         ZLog.add("71811：请求天殇之魂合成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71811,_loc2_);
      }
   }
}

