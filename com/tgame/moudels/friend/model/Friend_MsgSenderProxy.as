package com.tgame.moudels.friend.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.info.TeamInfo;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Friend_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Friend_MsgSenderProxy";
      
      public function Friend_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      private function get myTeam() : TeamInfo
      {
         return GameInstance.mainCharData.teamInfo;
      }
      
      public function send_10307() : void
      {
         ZLog.add("10307：发出 请求好友列表 ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10307,_loc1_);
      }
      
      public function send_10303(param1:int) : void
      {
         ZLog.add("10303：发出 添加好友id= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10303,_loc2_);
      }
      
      public function send_10301(param1:int, param2:String) : void
      {
         ZLog.add("10301：发出 请求在线玩家列表$name= " + param2);
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeShort(param1);
         _loc3_.writeUTF(param2);
         NetWorkManager.sendMsg(10301,_loc3_);
      }
      
      public function send_10309(param1:int) : void
      {
         ZLog.add("10309：发出 删除好友$id= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10309,_loc2_);
      }
      
      public function send_10331() : void
      {
         ZLog.add("10331：发出 请求最近联系人列表 ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10331,_loc1_);
      }
      
      public function send_10333(param1:int) : void
      {
         ZLog.add("10333：发出  删除最近联系人请求id=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10333,_loc2_);
      }
      
      public function send_10341() : void
      {
         ZLog.add("10341：发出请求仇人列表  ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10341,_loc1_);
      }
      
      public function send_10343(param1:int) : void
      {
         ZLog.add("10343：发出 删除仇人请求   ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10343,_loc2_);
      }
      
      public function send_10353(param1:int) : void
      {
         ZLog.add("10353：发出添加玩家到黑名单   ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10353,_loc2_);
      }
      
      public function send_10357() : void
      {
         ZLog.add("10357：发出请求黑名单列表 ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10357,_loc1_);
      }
      
      public function send_10359(param1:int) : void
      {
         ZLog.add("10359：发出 删除黑名单id=" + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10359,_loc2_);
      }
      
      public function send_10365() : void
      {
         ZLog.add("10365：发出请求自己心情表情，配偶信息");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10365,_loc1_);
      }
      
      public function send_10371(param1:String) : void
      {
         ZLog.add("10371：修改玩家的表情= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(10371,_loc2_);
      }
      
      public function send_10373(param1:String) : void
      {
         ZLog.add("10373：修改玩家的心情文字= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(10373,_loc2_);
      }
      
      public function send_10375(param1:int) : void
      {
         ZLog.add("10375：查看玩家心情id= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10375,_loc2_);
      }
      
      public function send_10377(param1:int, param2:int, param3:int) : void
      {
         ZLog.add("10377：送花 玩家id= " + param1);
         var _loc4_:ByteArray = new ByteArray();
         _loc4_.writeInt(param1);
         _loc4_.writeByte(param2);
         _loc4_.writeShort(param3);
         NetWorkManager.sendMsg(10377,_loc4_);
      }
      
      public function send_10381(param1:int) : void
      {
         ZLog.add("10381：打探仇人id= " + param1);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10381,_loc2_);
      }
      
      public function send_10383() : void
      {
         ZLog.add("10383：发出 请求师徒列表 ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10383,_loc1_);
      }
      
      public function send_10387() : void
      {
         ZLog.add("10387：发出 退出师门 ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10387,_loc1_);
      }
      
      public function send_10389() : void
      {
         ZLog.add("10389：发出 请求领取药剂 ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10389,_loc1_);
      }
      
      public function send_10393(param1:int) : void
      {
         ZLog.add("10393：发出 请求驱逐师门 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10393,_loc2_);
      }
      
      public function send_10395() : void
      {
         ZLog.add("10395：发出 请求发放药剂 ");
         var _loc1_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10395,_loc1_);
      }
      
      public function send_11005(param1:* = null) : void
      {
         ZLog.add("11005：发出 更改徒弟称号请求 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(11005,_loc2_);
      }
      
      public function send_10397(param1:* = null) : void
      {
         ZLog.add("10397：发出 请求我要拜师/收徒列表 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(10397,_loc2_);
      }
      
      public function send_10399(param1:* = null) : void
      {
         ZLog.add("10399：发出 自动同意玩家拜师/收徒 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeBoolean(param1[1]);
         NetWorkManager.sendMsg(10399,_loc2_);
      }
      
      public function send_11001(param1:int) : void
      {
         ZLog.add("11001：发出 请求我要拜师/收徒列表 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(11001,_loc2_);
      }
      
      public function send_11019(param1:int) : void
      {
         ZLog.add("11019：发出 请求领取奖励 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(11019,_loc2_);
      }
      
      public function send_11025(param1:int) : void
      {
         ZLog.add("11025：发出 求领取声望 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(11025,_loc2_);
      }
      
      public function send_11021(param1:* = null) : void
      {
         ZLog.add("11021：发出 向被选中角色发出拜师请求 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(11021,_loc2_);
      }
      
      public function send_11023(param1:* = null) : void
      {
         ZLog.add("11023：发出 请求同意拜师/收徒 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeByte(param1[3]);
         NetWorkManager.sendMsg(11023,_loc2_);
      }
      
      public function send_11009(param1:int) : void
      {
         ZLog.add("11009：发出 请求奖励列表 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(11009,_loc2_);
      }
      
      public function send_11011(param1:int) : void
      {
         ZLog.add("11011：发出 请求领取奖励 ");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(11011,_loc2_);
      }
      
      public function send_11017(param1:* = null) : void
      {
         ZLog.add("11017：发出 使用恩师令 ");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(11017,_loc2_);
      }
   }
}

