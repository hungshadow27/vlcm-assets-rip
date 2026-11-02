package com.tgame.moudels.xingyunzhuanzhuanle.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XingYunZhuanZhuanLe_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XingYunZhuanZhuanLe_MsgSenderProxy";
      
      public function XingYunZhuanZhuanLe_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_82631(param1:* = null) : void
      {
         ZLog.add("82631：请求转盘信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82631,_loc2_);
      }
      
      public function send_82633(param1:* = null) : void
      {
         ZLog.add("82633：请求转盘抽奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82633,_loc2_);
      }
      
      public function send_82635(param1:* = null) : void
      {
         ZLog.add("82635：请求转盘领取");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82635,_loc2_);
      }
   }
}

