package com.tgame.moudels.yn2014zhongqiu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN2014Zhongqiu_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YN2014Zhongqiu_MsgSendProxy";
      
      public function YN2014Zhongqiu_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74601(param1:* = null) : void
      {
         ZLog.add("74601：请求中秋领奖面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74601,_loc2_);
      }
   }
}

