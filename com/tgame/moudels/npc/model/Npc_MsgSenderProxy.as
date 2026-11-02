package com.tgame.moudels.npc.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Npc_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Npc_MsgSenderProxy";
      
      public function Npc_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_53701(param1:* = null) : void
      {
         ZLog.add("53701：发送激活先天武境信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53701,_loc2_);
      }
      
      public function send_30001(param1:* = null) : void
      {
         ZLog.add("30001：NPC请求传送");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(30001,_loc2_);
      }
      
      public function send_53095(param1:* = null) : void
      {
         ZLog.add("53095：请求傲剑特殊活动");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         if(param1[0] == 3)
         {
            _loc2_.writeUTF(param1[1]);
         }
         if(param1[0] == 6)
         {
            _loc2_.writeUTF(param1[1]);
         }
         if(param1[0] == 5)
         {
            _loc2_.writeByte(int(param1[1]));
         }
         if(param1[0] == 7)
         {
            _loc2_.writeInt(int(param1[1]));
         }
         if(param1[0] == 9)
         {
            _loc2_.writeShort(int(param1[1]));
            _loc2_.writeUTF(param1[2]);
         }
         if(param1[0] == 12)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 13)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 22)
         {
            _loc2_.writeInt(param1[1]);
            _loc2_.writeUTF(param1[2]);
         }
         if(param1[0] == 24)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 25)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 27)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 43)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 44)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 45)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 47)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 50)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 52)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 59)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 60)
         {
            _loc2_.writeUTF(param1[1]);
         }
         if(param1[0] == 62)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 63)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 64)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 65)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 67)
         {
            _loc2_.writeInt(param1[1]);
            _loc2_.writeByte(param1[2]);
         }
         if(param1[0] == 68)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 69)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 70)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 71)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 72 || param1[0] == 76)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 80)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 81)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 82)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 83)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 84)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 85)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 86)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 87)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 88)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 89)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 90)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 91)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 92)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 93)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 94)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 95)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 96)
         {
            _loc2_.writeShort(param1[1]);
            _loc2_.writeInt(param1[2]);
         }
         if(param1[0] == 97)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 98)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 99)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 100)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 101)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 102)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 103)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 104)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 105)
         {
            _loc2_.writeByte(param1[1]);
            _loc2_.writeByte(param1[2]);
         }
         if(param1[0] == 106)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 107)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 108)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 109)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 110)
         {
         }
         if(param1[0] == 111)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 112)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 113)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 114)
         {
            _loc2_.writeInt(param1[1]);
         }
         if(param1[0] == 115)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 116)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 117)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 118)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 119)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 120)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 121)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 122)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 123)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 124)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 125)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 126)
         {
            _loc2_.writeByte(param1[1]);
         }
         if(param1[0] == 127)
         {
            _loc2_.writeShort(param1[1]);
            _loc2_.writeInt(param1[2]);
         }
         if(param1[0] == 128)
         {
            _loc2_.writeInt(param1[1]);
         }
         NetWorkManager.sendMsg(53095,_loc2_);
      }
      
      public function send_81661(param1:* = null) : void
      {
         ZLog.add("81661：请求越南 金钱树");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81661,_loc2_);
      }
      
      public function send_53097(param1:* = null) : void
      {
         ZLog.add("53097：请求越南 贺岁树");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53097,_loc2_);
      }
      
      public function send_53099(param1:* = null) : void
      {
         var _loc3_:ByteArray = null;
         ZLog.add("53099：傲剑越南 特殊活动 22222222222222");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         if(param1[0] == 23)
         {
            _loc2_.writeInt(param1[1]);
            _loc2_.writeShort(param1[2]);
         }
         else if(param1[0] != 75)
         {
            _loc2_.writeInt(param1[1]);
         }
         NetWorkManager.sendMsg(53099,_loc2_);
         if(param1[0] == 2)
         {
            _loc3_ = new ByteArray();
            NetWorkManager.sendMsg(82149,_loc3_);
         }
      }
      
      public function send_82241(param1:* = null) : void
      {
         ZLog.add("82241：统一请求当天充值数量");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(82241,_loc2_);
      }
      
      public function send_83021(param1:* = null) : void
      {
         ZLog.add("83021：兑换水果汁");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeByte(param1.num);
         NetWorkManager.sendMsg(83021,_loc2_);
      }
      
      public function send_83205(param1:* = null) : void
      {
         ZLog.add("83205：兑换绝世武器");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(83205,_loc2_);
      }
      
      public function send_83217(param1:* = null) : void
      {
         ZLog.add("83217：宝鼠宝箱");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(83217,_loc2_);
      }
   }
}

