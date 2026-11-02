package com.tgame.moudels.ynChongzhidafa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNchongzhidafa_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNchongzhidafa_MsgSendProxy";
      
      public function YNchongzhidafa_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_80931(param1:* = null) : void
      {
         ZLog.add("80931：请求充值大发领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80931,_loc2_);
      }
      
      public function send_80933(param1:* = null) : void
      {
         ZLog.add("80933：请求充值大发面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80933,_loc2_);
      }
   }
}

