package com.tgame.moudels.shiJieBei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShiJieBei_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ShiJieBei_MsgSenderProxy";
      
      public function ShiJieBei_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_73801(param1:* = null) : void
      {
         ZLog.add("73801\t\t请求世界杯面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73801,_loc2_);
      }
      
      public function send_73803(param1:* = null) : void
      {
         ZLog.add("73803\t\t请求冠军竞猜下注");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73803,_loc2_);
      }
      
      public function send_73805(param1:* = null) : void
      {
         ZLog.add("73805\t\t请求领取冠军竞猜奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73805,_loc2_);
      }
      
      public function send_73811(param1:* = null) : void
      {
         ZLog.add("73811\t\t请求胜负竞猜信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73811,_loc2_);
      }
      
      public function send_73813(param1:* = null) : void
      {
         ZLog.add("73813\t\t请求胜负竞猜下注");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73813,_loc2_);
      }
      
      public function send_73815(param1:* = null) : void
      {
         ZLog.add("73815\t\t请求领取胜负竞猜奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73815,_loc2_);
      }
   }
}

