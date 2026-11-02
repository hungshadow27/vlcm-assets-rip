package com.tgame.moudels.ynHuangdaoZhuanpan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNhuangdaozhuanpan_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNhuangdaozhuanpan_MsgSendProxy";
      
      public function YNhuangdaozhuanpan_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74275(param1:* = null) : void
      {
         ZLog.add("74275：请求勋章面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74275,_loc2_);
      }
   }
}

