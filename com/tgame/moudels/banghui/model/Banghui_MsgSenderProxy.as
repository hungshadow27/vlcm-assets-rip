package com.tgame.moudels.banghui.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Banghui_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Banghui_MsgSenderProxy";
      
      public function Banghui_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_51031(param1:* = null) : void
      {
         ZLog.add("51031：请求帮会列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(51031,_loc2_);
      }
      
      public function send_51033(param1:* = null) : void
      {
         ZLog.add("51033：请求指定帮会ID的帮会信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51033,_loc2_);
      }
      
      public function send_51035(param1:* = null) : void
      {
         ZLog.add("51035：请求主角的帮会成员列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(51035,_loc2_);
      }
      
      public function send_51069(param1:* = null) : void
      {
         ZLog.add("51069：检测重名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(51069,_loc2_);
      }
      
      public function send_51037(param1:* = null) : void
      {
         ZLog.add("51037：请求创建帮会");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1[0]);
         _loc2_.writeUTF(param1[1]);
         _loc2_.writeUTF(param1[2]);
         _loc2_.writeByte(param1[3]);
         _loc2_.writeUTF(param1[4]);
         NetWorkManager.sendMsg(51037,_loc2_);
      }
      
      public function send_51077(param1:* = null) : void
      {
         ZLog.add("51077：申请入帮A-S");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51077,_loc2_);
      }
      
      public function send_51039(param1:* = null) : void
      {
         ZLog.add("51039：申请入帮A-S");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51039,_loc2_);
      }
      
      public function send_51041(param1:* = null) : void
      {
         ZLog.add("51041：是否接受申请入帮B-S");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(51041,_loc2_);
      }
      
      public function send_51043(param1:* = null) : void
      {
         ZLog.add("51043：邀请入帮B-S");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         _loc2_.writeDouble(getTimer());
         NetWorkManager.sendMsg(51043,_loc2_);
      }
      
      public function send_51045(param1:* = null) : void
      {
         ZLog.add("51045：是否接受邀请入帮A-S");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(51045,_loc2_);
      }
      
      public function send_51047(param1:* = null) : void
      {
         ZLog.add("51047：查询玩家A-S");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(51047,_loc2_);
      }
      
      public function send_51049(param1:* = null) : void
      {
         ZLog.add("51049：开除出帮B-S");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51049,_loc2_);
      }
      
      public function send_51053(param1:* = null) : void
      {
         ZLog.add("51053：请求解散帮会B-S");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51053,_loc2_);
      }
      
      public function send_51057(param1:* = null) : void
      {
         ZLog.add("51057：请求退帮A-S");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51057,_loc2_);
      }
      
      public function send_51059(param1:* = null) : void
      {
         ZLog.add("51059：更改职务");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(51059,_loc2_);
      }
      
      public function send_51061(param1:* = null) : void
      {
         ZLog.add("51061：更改称号");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(51061,_loc2_);
      }
      
      public function send_51063(param1:* = null) : void
      {
         ZLog.add("51063：更改公告");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(51063,_loc2_);
      }
      
      public function send_51065(param1:* = null) : void
      {
         ZLog.add("51065：设置是否自动同意任意帮主向我发出的入帮申请(该选项在帮会列表主界面，和系统设置面板内)");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(51065,_loc2_);
      }
      
      public function send_51067(param1:* = null) : void
      {
         ZLog.add("51067：设置自动同意任意玩家向本帮发出的入帮申请");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(51067,_loc2_);
      }
      
      public function send_51099(param1:* = null) : void
      {
         ZLog.add("51099：设置是否跳过帮助信息界面(byte，1跳过0不跳过，角色初始默认0)");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(51099,_loc2_);
      }
      
      public function send_51079(param1:* = null) : void
      {
         ZLog.add("51079：请求帮旗信息面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51079,_loc2_);
      }
      
      public function send_51081(param1:* = null) : void
      {
         ZLog.add("51081：请求帮贡记录列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(51081,_loc2_);
      }
      
      public function send_51083(param1:* = null) : void
      {
         ZLog.add("51083：请求所有地图的帮旗安插信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(51083,_loc2_);
      }
      
      public function send_51085(param1:* = null) : void
      {
         ZLog.add("51085：请求帮旗改名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(51085,_loc2_);
      }
      
      public function send_51087(param1:* = null) : void
      {
         ZLog.add("51087：请求帮旗更换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(51087,_loc2_);
      }
      
      public function send_51089(param1:* = null) : void
      {
         ZLog.add("51089：请求帮旗升级");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(51089,_loc2_);
      }
      
      public function send_51091(param1:* = null) : void
      {
         ZLog.add("51091：请求贡献铜钱");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(param1);
         NetWorkManager.sendMsg(51091,_loc2_);
      }
      
      public function send_51093(param1:* = null) : void
      {
         ZLog.add("51093：请求贡献令牌");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:Array = param1 as Array;
         var _loc4_:int = int(_loc3_.length);
         _loc2_.writeByte(_loc4_);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_.writeShort(_loc3_[_loc5_][0]);
            _loc2_.writeInt(_loc3_[_loc5_][1]);
            _loc2_.writeInt(_loc3_[_loc5_][2]);
            _loc5_++;
         }
         NetWorkManager.sendMsg(51093,_loc2_);
      }
      
      public function send_51095(param1:* = null) : void
      {
         ZLog.add("51095：请求安插帮旗");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51095,_loc2_);
      }
      
      public function send_51097(param1:* = null) : void
      {
         ZLog.add("51097：请求恢复帮旗血量");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51097,_loc2_);
      }
      
      public function send_51103(param1:* = null) : void
      {
         ZLog.add("51103：请求襄阳归属面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51103,_loc2_);
      }
      
      public function send_51143(param1:* = null) : void
      {
         ZLog.add("51143：提交领取专属奖励（紫松果）");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(51143,_loc2_);
      }
      
      public function send_51145(param1:* = null) : void
      {
         ZLog.add("51145：修改城主公告");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(51145,_loc2_);
      }
      
      public function send_51105(param1:* = null) : void
      {
         ZLog.add("51105：请求攻城日程查询");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51105,_loc2_);
      }
      
      public function send_51147(param1:* = null) : void
      {
         ZLog.add("51147：请求当前申请什么时候可以开战");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51147,_loc2_);
      }
      
      public function send_51107(param1:* = null) : void
      {
         ZLog.add("51107：提交攻城申请");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51107,_loc2_);
      }
      
      public function send_51109(param1:* = null) : void
      {
         ZLog.add("51109：请求税率与税收面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51109,_loc2_);
      }
      
      public function send_51111(param1:* = null) : void
      {
         ZLog.add("51111：请求修改税率");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51111,_loc2_);
      }
      
      public function send_51113(param1:* = null) : void
      {
         ZLog.add("51113：请求领取税收");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51113,_loc2_);
      }
      
      public function send_51115(param1:* = null) : void
      {
         ZLog.add("51115：请求火炮军团界面");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(51115,_loc2_);
      }
      
      public function send_51117(param1:* = null) : void
      {
         ZLog.add("51117：提交购买炮弹");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(51117,_loc2_);
      }
      
      public function send_51119(param1:* = null) : void
      {
         ZLog.add("51119：提交发炮");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeShort(param1[2]);
         _loc2_.writeShort(param1[3]);
         NetWorkManager.sendMsg(51119,_loc2_);
      }
      
      public function send_51123(param1:* = null) : void
      {
         ZLog.add("51123：提交拔剑");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51123,_loc2_);
      }
      
      public function send_51133(param1:* = null) : void
      {
         ZLog.add("51133：请求传送至藏龙潭");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51133,_loc2_);
      }
      
      public function send_51135(param1:* = null) : void
      {
         ZLog.add("51135：请求传送至论剑台");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(51135,_loc2_);
      }
      
      public function send_51217(param1:* = null) : void
      {
         ZLog.add("51217：越南 请求 兑换帮派扩展符");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51217,_loc2_);
      }
      
      public function send_71021(param1:* = null) : void
      {
         ZLog.add("71021：请求其他帮派荣誉城池列表信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71021,_loc2_);
      }
      
      public function send_71023(param1:* = null) : void
      {
         ZLog.add("71023：请求其他帮派荣誉城池列表信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71023,_loc2_);
      }
   }
}

