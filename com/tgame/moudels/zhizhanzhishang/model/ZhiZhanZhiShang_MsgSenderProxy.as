package com.tgame.moudels.zhizhanzhishang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhiZhanZhiShang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ZhiZhanZhiShang_MsgSenderProxy";
      
      public function ZhiZhanZhiShang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_59001(param1:* = null) : void
      {
         ZLog.add("59001：请求进入止战之殇地图");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59001,_loc2_);
      }
      
      public function send_59007(param1:* = null) : void
      {
         ZLog.add("59007：请求领取止战之殇奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59007,_loc2_);
      }
      
      public function send_59051(param1:* = null) : void
      {
         ZLog.add("59051：止战之殇 请求击鼓页面");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(59051,_loc2_);
      }
      
      public function send_59053(param1:* = null) : void
      {
         ZLog.add("59053：止战之殇 请求击鼓");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         NetWorkManager.sendMsg(59053,_loc2_);
      }
      
      public function send_59057(param1:* = null) : void
      {
         ZLog.add("59057：止战之殇 请求历史战况");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(59057,_loc2_);
      }
   }
}

