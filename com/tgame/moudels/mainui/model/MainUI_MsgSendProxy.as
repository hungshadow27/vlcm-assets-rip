package com.tgame.moudels.mainui.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MainUI_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "MainUI_MsgSendProxy";
      
      public var waitTodoLoadBuffer:LoadBuffer;
      
      private var isSend40011:Boolean = false;
      
      public function MainUI_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_10131(param1:* = null) : void
      {
         ZLog.add("10131：发送主角跨地图传送查询消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         NetWorkManager.sendMsg(10131,_loc2_);
      }
      
      public function send_10133(param1:* = null) : void
      {
         ZLog.add("10133：发送主角跨地图传送开始消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(getTimer());
         _loc2_.writeInt(param1.id);
         NetWorkManager.sendMsg(10133,_loc2_);
      }
      
      public function send_40011(param1:* = null) : void
      {
         ZLog.add("40011：征服目标");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40011,_loc2_);
      }
      
      public function send_40023(param1:* = null) : void
      {
         ZLog.add("40023：跨服论剑天下第一");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.id);
         _loc2_.writeUTF(param1.str);
         NetWorkManager.sendMsg(40023,_loc2_);
      }
      
      public function send_40025(param1:* = null) : void
      {
         ZLog.add("40025：请求跨服论剑天下第一中我的上榜状态");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40025,_loc2_);
      }
      
      public function send_40027(param1:* = null) : void
      {
         ZLog.add("40027：请求领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40027,_loc2_);
      }
      
      public function send_40033(param1:* = null) : void
      {
         ZLog.add("40033：3v3");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.id);
         _loc2_.writeUTF(param1.str);
         NetWorkManager.sendMsg(40033,_loc2_);
      }
      
      public function send_40035(param1:* = null) : void
      {
         ZLog.add("40035：请求3v3我的上榜状态");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40035,_loc2_);
      }
      
      public function send_40037(param1:* = null) : void
      {
         ZLog.add("40037：请求3v3领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40037,_loc2_);
      }
      
      public function send_40031(param1:* = null) : void
      {
         if(this.waitTodoLoadBuffer)
         {
            return;
         }
         ZLog.add("40031：待办事宜");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40031,_loc2_);
         if(!this.waitTodoLoadBuffer)
         {
            this.waitTodoLoadBuffer = LoadBuffer.show(GameInstance.uiInstance.waitTodoPanel);
         }
      }
      
      public function send_40209(param1:* = null) : void
      {
         ZLog.add("40209：线路查询");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(40209,_loc2_);
      }
      
      public function send_10111(param1:* = null) : void
      {
         ZLog.add("10111：请求切线");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(10111,_loc2_);
      }
      
      public function send_54701(param1:* = null) : void
      {
         ZLog.add("54701：更改主角头顶滑块");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(54701,_loc2_);
      }
      
      public function send_10049(param1:* = null) : void
      {
         ZLog.add("10049：更改主角头像");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.num);
         NetWorkManager.sendMsg(10049,_loc2_);
      }
      
      public function send_53851(param1:* = null) : void
      {
         ZLog.add("53851：请求32强列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         _loc2_.writeUTF("");
         NetWorkManager.sendMsg(53851,_loc2_);
      }
      
      public function send_53855(param1:* = null) : void
      {
         ZLog.add("53855：助威");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(53855,_loc2_);
      }
      
      public function send_53857(param1:* = null) : void
      {
         ZLog.add("53857：领奖");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53857,_loc2_);
      }
      
      public function send_53859(param1:* = null) : void
      {
         ZLog.add("53859：传入比赛地图");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53859,_loc2_);
      }
      
      public function send_53863(param1:* = null) : void
      {
         ZLog.add("53863：请求比赛日期");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53863,_loc2_);
      }
      
      public function send_53865(param1:* = null) : void
      {
         ZLog.add("53865：比武大会报名");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53865,_loc2_);
      }
      
      public function send_53867(param1:* = null) : void
      {
         ZLog.add("53867：比武大会观战");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1[1]);
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(53867,_loc2_);
      }
      
      public function send_53871(param1:* = null) : void
      {
         ZLog.add("53871：离开战场");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53871,_loc2_);
      }
      
      public function send_51961(param1:* = null) : void
      {
         ZLog.add("51961：襄阳战场报名");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51961,_loc2_);
      }
      
      public function send_51965(param1:* = null) : void
      {
         ZLog.add("51965：是否接受邀请报名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(51965,_loc2_);
      }
      
      public function send_57451(param1:* = null) : void
      {
         ZLog.add("57451：刺杀成功任务奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57451,_loc2_);
      }
      
      public function send_51971(param1:* = null) : void
      {
         ZLog.add("51971：再次进入襄阳战场");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(51971,_loc2_);
      }
      
      public function send_20511(param1:* = null) : void
      {
         ZLog.add("20511：夫妻竞技下注");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(20511,_loc2_);
      }
      
      public function send_20513(param1:* = null) : void
      {
         ZLog.add("20513：退出夫妻竞技");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(20513,_loc2_);
      }
      
      public function send_61041(param1:* = null) : void
      {
         ZLog.add("61041\t\t请求夫妻竞技排行榜信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61041,_loc2_);
      }
      
      public function send_61043(param1:* = null) : void
      {
         ZLog.add("61043\t\t请求玩家换装信息");
         var _loc2_:ByteArray = new ByteArray();
         var _loc3_:int = 0;
         while(_loc3_ < (param1 as Array).length)
         {
            _loc2_.writeInt(param1[_loc3_]);
            _loc3_++;
         }
         NetWorkManager.sendMsg(61043,_loc2_);
      }
      
      public function send_61045(param1:* = null) : void
      {
         ZLog.add("61045\t\t请求领取夫妻竞技奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61045,_loc2_);
      }
      
      public function send_61047(param1:* = null) : void
      {
         ZLog.add("61047\t\t请求进入夫妻竞技场");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61047,_loc2_);
      }
      
      public function send_71835(param1:* = null) : void
      {
         ZLog.add("71835：万宝阁中换装是跳跃还是地滚");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71835,_loc2_);
      }
      
      public function send_30201(param1:* = null) : void
      {
         ZLog.add("30201：请求将玩家禁言");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(30201,_loc2_);
      }
      
      public function send_11219(param1:* = null) : void
      {
         ZLog.add("11219\t\t请求选中新勋章id");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(11219,_loc2_);
      }
      
      public function send_80341(param1:* = null) : void
      {
         ZLog.add("80341:提交堆雪人道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeByte(param1.index);
         NetWorkManager.sendMsg(80341,_loc2_);
      }
      
      public function send_81837(param1:* = null) : void
      {
         ZLog.add("81837:请求八卦快捷菜单");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81837,_loc2_);
      }
      
      public function send_79493(param1:* = null) : void
      {
         ZLog.add("79493：请求倚天屠龙榜单");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(79493,_loc2_);
      }
      
      public function send_79491(param1:* = null) : void
      {
         ZLog.add("79491：请求退出倚天屠龙副本");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(79491,_loc2_);
      }
   }
}

