package com.tgame.moudels.huangtubaye.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HuangTuBaYe_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "HuangTuBaYe_MsgSenderProxy";
      
      public function HuangTuBaYe_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71001(param1:* = null) : void
      {
         ZLog.add("71001\t\t请求皇途霸业详细数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71001,_loc2_);
      }
      
      public function send_71003(param1:* = null) : void
      {
         ZLog.add("71003\t\t请求江山社稷详细数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71003,_loc2_);
      }
      
      public function send_71005(param1:* = null) : void
      {
         ZLog.add("71005\t\t请求江山社稷-查看信息详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71005,_loc2_);
      }
      
      public function send_71007(param1:* = null) : void
      {
         ZLog.add("71007\t\t请求膜拜皇主");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71007,_loc2_);
      }
      
      public function send_71009(param1:* = null) : void
      {
         ZLog.add("71009\t  请求领取俸禄");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71009,_loc2_);
      }
      
      public function send_71011(param1:* = null) : void
      {
         ZLog.add("71011  请求奖励设置面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(71011,_loc2_);
      }
      
      public function send_71013(param1:* = null) : void
      {
         ZLog.add("71013  请求进入战场");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71013,_loc2_);
      }
      
      public function send_71053(param1:* = null) : void
      {
         ZLog.add("71053  踩中陷阱");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71053,_loc2_);
      }
   }
}

