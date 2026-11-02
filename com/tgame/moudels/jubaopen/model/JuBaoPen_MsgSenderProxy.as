package com.tgame.moudels.jubaopen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JuBaoPen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JuBaoPen_MsgSenderProxy";
      
      public function JuBaoPen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_59511(param1:* = null) : void
      {
         ZLog.add("59511：请求聚宝盆活动时间、领奖时间、返利金票");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59511,_loc2_);
      }
      
      public function send_59513(param1:* = null) : void
      {
         ZLog.add("59513：领奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59513,_loc2_);
      }
   }
}

