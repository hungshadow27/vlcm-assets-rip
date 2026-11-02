package com.tgame.moudels.shishizhankuang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shishizhankuang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Shishizhankuang_MsgSenderProxy";
      
      public function Shishizhankuang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_51963() : void
      {
         ZLog.add("51963：请求实时战况信息");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51963,_loc1_);
      }
   }
}

