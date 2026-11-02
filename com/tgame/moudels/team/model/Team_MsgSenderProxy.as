package com.tgame.moudels.team.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Team_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Team_MsgSenderProxy";
      
      public function Team_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_10225(param1:int, param2:String) : void
      {
         ZLog.add("10225：发出 请求在线玩家列表$name= " + param2);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeShort(param1);
         _loc3_.writeUTF(param2);
         NetWorkManager.sendMsg(10225,_loc3_);
      }
      
      public function send_10197() : void
      {
         ZLog.add("10197：发出 自建队伍请求");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10197,_loc1_);
      }
      
      public function send_10211() : void
      {
         ZLog.add("10211：发出 发送组队面板设置信息");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10211,_loc1_);
      }
      
      public function send_10213(param1:int = 1, param2:String = "") : void
      {
         ZLog.add("10213：发出 查找附近玩家列表 page=" + param1);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeShort(param1);
         _loc3_.writeUTF(param2);
         NetWorkManager.sendMsg(10213,_loc3_);
      }
      
      public function send_10215(param1:int = 1) : void
      {
         ZLog.add("10215：发出 查找附近队伍列表 page=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(10215,_loc2_);
      }
      
      public function send_10209(param1:int) : void
      {
         ZLog.add("10209：发出 请求队伍信息 id=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10209,_loc2_);
      }
      
      public function send_10181(param1:int = 0, param2:int = -1, param3:String = "") : void
      {
         ZLog.add("10181：发出 主动邀请别的玩家加入你的队伍");
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeByte(param1);
         if(param1 == 0 && param2 != -1)
         {
            _loc4_.writeInt(param2);
         }
         else if(param1 == 1 && param3.length > 0)
         {
            _loc4_.writeUTF(param3);
         }
         NetWorkManager.sendMsg(10181,_loc4_);
      }
      
      public function send_10185(param1:int, param2:int) : void
      {
         ZLog.add("10185：发出 我是否接受别的玩家邀请入队");
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         _loc3_.writeInt(param2);
         NetWorkManager.sendMsg(10185,_loc3_);
      }
      
      public function send_10187(param1:int) : void
      {
         ZLog.add("10187：发出 申请加入队伍" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10187,_loc2_);
      }
      
      public function send_10191(param1:int, param2:int) : void
      {
         ZLog.add("10191：发出  队长发送是否同意申请信息");
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         _loc3_.writeInt(param2);
         NetWorkManager.sendMsg(10191,_loc3_);
      }
      
      public function send_10193(param1:int, param2:int) : void
      {
         ZLog.add("10193：发出  设置组队操作参数");
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         _loc3_.writeByte(param2);
         NetWorkManager.sendMsg(10193,_loc3_);
      }
      
      public function send_10195(param1:String) : void
      {
         ZLog.add("10195：发出  修改队伍宣言");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(10195,_loc2_);
      }
      
      public function send_10199() : void
      {
         ZLog.add("10199：发出 离开队伍");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10199,_loc1_);
      }
      
      public function send_10201(param1:int) : void
      {
         ZLog.add("10201：发出 更换队长");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10201,_loc2_);
      }
      
      public function send_10205(param1:int, param2:int) : void
      {
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeByte(param1);
         _loc3_.writeInt(param2);
         NetWorkManager.sendMsg(10205,_loc3_);
         ZLog.add("10205：发出是否同意升级为队长" + param1 + param2);
      }
      
      public function send_10217(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10217,_loc2_);
         ZLog.add("10217：发出  队长 踢掉玩家" + param1);
      }
      
      public function send_10251() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10251,_loc1_);
         ZLog.add("10251：发出  请求阵法列表 ");
      }
      
      public function send_10255(param1:int) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(10255,_loc2_);
         ZLog.add("10255：发出  开启阵法  " + param1);
      }
      
      public function send_10257() : void
      {
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10257,_loc1_);
         ZLog.add("10257：发出 关闭阵法 ");
      }
      
      public function send_10711(param1:* = null) : void
      {
         ZLog.add("10711：发出今日进入副本次数");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10711,_loc2_);
      }
      
      public function send_10701(param1:* = null) : void
      {
         ZLog.add("10701：发出npc传送请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         _loc2_.writeByte(param1[3]);
         NetWorkManager.sendMsg(10701,_loc2_);
      }
      
      public function send_10721(param1:* = null) : void
      {
         ZLog.add("10721：发出npc使用副本令进入副本请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(10721,_loc2_);
      }
      
      public function send_10705(param1:* = null) : void
      {
         ZLog.add("10705：发出队友确认是否进行创送");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(10705,_loc2_);
      }
      
      public function send_10723(param1:* = null) : void
      {
         ZLog.add("10723：领取副本奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10723,_loc2_);
      }
      
      public function send_52059(param1:* = null) : void
      {
         ZLog.add("52059：领取迷踪阵通关经验奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52059,_loc2_);
      }
      
      public function send_10729(param1:* = null) : void
      {
         ZLog.add("10729：发出获取古墓密室列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(10729,_loc2_);
      }
      
      public function send_10731(param1:* = null) : void
      {
         ZLog.add("10731：发出进入古墓密室次数");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(10731,_loc2_);
      }
   }
}

