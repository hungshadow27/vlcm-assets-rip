package com.tgame.moudels.duanwujie.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuanWuJie_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "DuanWuJie_MsgSendProxy";
      
      public function DuanWuJie_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73701(param1:* = null) : void
      {
         ZLog.add("73701：打开端午节面板请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73701,_loc2_);
      }
      
      public function send_73703(param1:* = null) : void
      {
         ZLog.add("73703：请求端午节排行榜数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73703,_loc2_);
      }
      
      public function send_73705(param1:* = null) : void
      {
         ZLog.add("73705：请求排行榜");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73705,_loc2_);
      }
      
      public function send_73707(param1:* = null) : void
      {
         ZLog.add("73707：签到");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73707,_loc2_);
      }
      
      public function send_73709(param1:* = null) : void
      {
         ZLog.add("73709：领取勋章");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73709,_loc2_);
      }
      
      public function send_73711(param1:* = null) : void
      {
         ZLog.add("73711：请求兑换粽子");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73711,_loc2_);
      }
      
      public function send_73713(param1:* = null) : void
      {
         ZLog.add("73713：请求提交粽子");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73713,_loc2_);
      }
      
      public function send_73715(param1:* = null) : void
      {
         ZLog.add("73715：领取活跃奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73715,_loc2_);
      }
      
      public function send_73717(param1:* = null) : void
      {
         ZLog.add("73717：领取木马");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73717,_loc2_);
      }
   }
}

