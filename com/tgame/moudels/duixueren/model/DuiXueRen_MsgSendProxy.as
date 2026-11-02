package com.tgame.moudels.duixueren.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuiXueRen_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "DuiXueRen_MsgSendProxy";
      
      public function DuiXueRen_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_80321(param1:* = null) : void
      {
         ZLog.add("80321：请求堆雪人数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80321,_loc2_);
      }
      
      public function send_80323(param1:* = null) : void
      {
         ZLog.add("80323：请求地图雪人数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(80323,_loc2_);
      }
      
      public function send_80325(param1:* = null) : void
      {
         ZLog.add("80325：请求全名在线数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80325,_loc2_);
      }
      
      public function send_80327(param1:* = null) : void
      {
         ZLog.add("80327：请求全名在线抽奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80327,_loc2_);
      }
      
      public function send_80329(param1:* = null) : void
      {
         ZLog.add("80329：领取全名在线奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80329,_loc2_);
      }
      
      public function send_80331(param1:* = null) : void
      {
         ZLog.add("80331：请求全民抽奖数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80331,_loc2_);
      }
      
      public function send_80333(param1:* = null) : void
      {
         ZLog.add("80333：请求全民抽奖抽奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80333,_loc2_);
      }
      
      public function send_80335(param1:* = null) : void
      {
         ZLog.add("80335：领取全民抽奖奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80335,_loc2_);
      }
      
      public function send_80337(param1:* = null) : void
      {
         ZLog.add("80337：请求排行榜");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(80337,_loc2_);
      }
      
      public function send_80339(param1:* = null) : void
      {
         ZLog.add("80339：领取排行榜奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80339,_loc2_);
      }
      
      public function send_80341(param1:* = null) : void
      {
         ZLog.add("80341：提交堆雪人道具");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(80341,_loc2_);
      }
      
      public function send_80343(param1:* = null) : void
      {
         ZLog.add("80343：兑换堆雪人奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(80343,_loc2_);
      }
   }
}

