package com.tgame.moudels.jianghun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class JiangHun_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "JiangHun_MsgSenderProxy";
      
      public function JiangHun_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_81641(param1:* = null) : void
      {
         ZLog.add("81641\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81641,_loc2_);
      }
      
      public function send_81643(param1:* = null) : void
      {
         ZLog.add("81643\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(81643,_loc2_);
      }
      
      public function send_81645(param1:* = null) : void
      {
         ZLog.add("81645\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(81645,_loc2_);
      }
      
      public function send_81647(param1:* = null) : void
      {
         ZLog.add("81647\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(81647,_loc2_);
      }
      
      public function send_81649(param1:* = null) : void
      {
         ZLog.add("81649\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81649,_loc2_);
      }
      
      public function send_81781(param1:* = null) : void
      {
         ZLog.add("81781\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81781,_loc2_);
      }
      
      public function send_81783(param1:* = null) : void
      {
         ZLog.add("81783\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(81783,_loc2_);
      }
      
      public function send_81785(param1:* = null) : void
      {
         ZLog.add("81785\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(81785,_loc2_);
      }
      
      public function send_81787(param1:* = null) : void
      {
         ZLog.add("81787\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(81787,_loc2_);
      }
      
      public function send_81789(param1:* = null) : void
      {
         ZLog.add("81789\t\t请求将魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81789,_loc2_);
      }
      
      public function send_81811(param1:* = null) : void
      {
         ZLog.add("81811\t\t请求纯净专属积分商城");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81811,_loc2_);
      }
      
      public function send_81813(param1:* = null) : void
      {
         ZLog.add("81813\t\t请求纯净专属积分商城奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81813,_loc2_);
      }
      
      public function send_73005(param1:* = null) : void
      {
         ZLog.add("73005：请求玩家独孤求败换装");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[0]);
         NetWorkManager.sendMsg(73005,_loc2_);
      }
      
      public function send_82551(param1:* = null) : void
      {
         ZLog.add("82551:请求九劫星图");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(82551,_loc2_);
      }
      
      public function send_82553(param1:* = null) : void
      {
         ZLog.add("82553:请求九劫星图日常任务");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82553,_loc2_);
      }
      
      public function send_82555(param1:* = null) : void
      {
         ZLog.add("82555:请求九劫星图培养");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(82555,_loc2_);
      }
      
      public function send_82557(param1:* = null) : void
      {
         ZLog.add("82557:请求九劫星图");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82557,_loc2_);
      }
      
      public function send_82559(param1:* = null) : void
      {
         ZLog.add("82559:请求九劫星图");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82559,_loc2_);
      }
      
      public function send_82561(param1:* = null) : void
      {
         ZLog.add("82561:请求开启神元宝箱");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(82561,_loc2_);
      }
   }
}

