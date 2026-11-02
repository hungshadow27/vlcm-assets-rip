package com.tgame.moudels.yn2016newyear.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN2016newyear_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YN2016newyear_MsgSendProxy";
      
      public function YN2016newyear_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_80923(param1:* = null) : void
      {
         ZLog.add("80923：请求2016春节活动彩果面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80923,_loc2_);
      }
      
      public function send_80925(param1:* = null) : void
      {
         ZLog.add("80925：请求2016春节活动领取彩果");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80925,_loc2_);
      }
      
      public function send_80927(param1:* = null) : void
      {
         ZLog.add("80927：请求2016春节活动在线领奖面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80927,_loc2_);
      }
      
      public function send_80929(param1:* = null) : void
      {
         ZLog.add("80929：请求2016春节活动在线领奖时间");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80929,_loc2_);
      }
      
      public function send_80931(param1:* = null) : void
      {
         ZLog.add("80931：请求2016春节活动在线领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80931,_loc2_);
      }
   }
}

