package com.tgame.moudels.ynZhuadayu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNzhuadayu_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNzhuadayu_MsgSendProxy";
      
      public function YNzhuadayu_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_81231(param1:* = null) : void
      {
         ZLog.add("81231：请求抓大鱼面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81231,_loc2_);
      }
      
      public function send_81233(param1:* = null) : void
      {
         ZLog.add("81233：请求抓鱼");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81233,_loc2_);
      }
      
      public function send_81235(param1:* = null) : void
      {
         ZLog.add("81235：请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81235,_loc2_);
      }
   }
}

