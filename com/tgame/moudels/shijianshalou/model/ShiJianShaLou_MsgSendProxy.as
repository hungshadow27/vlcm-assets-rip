package com.tgame.moudels.shijianshalou.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShiJianShaLou_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "ShiJianShaLou_MsgSendProxy";
      
      public function ShiJianShaLou_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_82211(param1:* = null) : void
      {
         ZLog.add("82211 \t查询时间沙漏信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82211,_loc2_);
      }
      
      public function send_82213(param1:* = null) : void
      {
         ZLog.add("82213\t\t查询时间沙漏信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82213,_loc2_);
      }
      
      public function send_81125(param1:* = null) : void
      {
         ZLog.add("81125\t\t请求神器升级");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81125,_loc2_);
      }
      
      public function send_81127(param1:* = null) : void
      {
         ZLog.add("81127\t\t请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81127,_loc2_);
      }
      
      public function send_81133(param1:* = null) : void
      {
         ZLog.add("81133\t\t请求养成道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81133,_loc2_);
      }
   }
}

