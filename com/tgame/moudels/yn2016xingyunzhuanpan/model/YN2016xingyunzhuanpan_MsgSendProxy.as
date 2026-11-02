package com.tgame.moudels.yn2016xingyunzhuanpan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN2016xingyunzhuanpan_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YN2016xingyunzhuanpan_MsgSendProxy";
      
      public function YN2016xingyunzhuanpan_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_81061(param1:* = null) : void
      {
         ZLog.add("81061：请求幸运转盘面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81061,_loc2_);
      }
      
      public function send_81063(param1:* = null) : void
      {
         ZLog.add("81063：请求开始抽奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81063,_loc2_);
      }
      
      public function send_81065(param1:* = null) : void
      {
         ZLog.add("81065：请求领奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81065,_loc2_);
      }
      
      public function send_81067(param1:* = null) : void
      {
         ZLog.add("81067：请求兑换物品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81067,_loc2_);
      }
      
      public function send_81069(param1:* = null) : void
      {
         ZLog.add("81069：请求记录");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81069,_loc2_);
      }
   }
}

