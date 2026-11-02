package com.tgame.moudels.mount.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Mount_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Mount_MsgSenderProxy";
      
      public function Mount_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_50029(param1:* = null) : void
      {
         ZLog.add("50029：发送请求坐骑列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(50029,_loc2_);
      }
      
      public function send_50031(param1:* = null) : void
      {
         ZLog.add("50031：发送请求单个坐骑信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(50031,_loc2_);
      }
      
      public function send_50049(param1:* = null) : void
      {
         ZLog.add("50049：发送主角请求增加槽位");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(1);
         NetWorkManager.sendMsg(50049,_loc2_);
      }
      
      public function send_50033(param1:* = null) : void
      {
         ZLog.add("50033：发送主角请求上马");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50033,_loc2_);
      }
      
      public function send_50035(param1:* = null) : void
      {
         ZLog.add("50035：发送主角请求下马");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50035,_loc2_);
      }
      
      public function send_50037(param1:* = null) : void
      {
         ZLog.add("50037：发送主角请求展示");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50037,_loc2_);
      }
      
      public function send_50039(param1:* = null) : void
      {
         ZLog.add("50039：发送主角请求收起");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50039,_loc2_);
      }
      
      public function send_50041(param1:* = null) : void
      {
         ZLog.add("50041：发送主角请求放生");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50041,_loc2_);
      }
      
      public function send_50043(param1:* = null) : void
      {
         ZLog.add("50043：发送主角请求捕获");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50043,_loc2_);
      }
      
      public function send_50011(param1:* = null) : void
      {
         ZLog.add("50011：请求坐骑对应属性界面..." + param1[1]);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(50011,_loc2_);
      }
      
      public function send_50027(param1:* = null) : void
      {
         ZLog.add("50027：请求提升坐骑对应属性");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(50027,_loc2_);
      }
      
      public function send_50047(param1:* = null) : void
      {
         ZLog.add("50047：请求使用神奇炼骨丹进行炼骨进阶");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(50047,_loc2_);
      }
      
      public function send_50051(param1:* = null) : void
      {
         ZLog.add("50051：请求使用神奇资质丹进行属性提升");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(50051,_loc2_);
      }
      
      public function send_52061(param1:* = null) : void
      {
         ZLog.add("52061：拖动技能到组合技槽位上");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(52061,_loc2_);
      }
      
      public function send_52063(param1:* = null) : void
      {
         ZLog.add("52063：去除组合技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(52063,_loc2_);
      }
      
      public function send_52065(param1:* = null) : void
      {
         ZLog.add("52065：请求重置面板坐骑列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52065,_loc2_);
      }
      
      public function send_52067(param1:* = null) : void
      {
         ZLog.add("52067：请求指定玩家某坐骑详细内容");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52067,_loc2_);
      }
      
      public function send_52069(param1:* = null) : void
      {
         ZLog.add("52069：请求重置坐骑技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(52069,_loc2_);
      }
      
      public function send_52099(param1:* = null) : void
      {
         ZLog.add("52099：请求激活坐骑隐藏属性");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52099,_loc2_);
      }
      
      public function send_52071(param1:* = null) : void
      {
         ZLog.add("52071：请求重置面板坐骑列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52071,_loc2_);
      }
      
      public function send_52073(param1:* = null) : void
      {
         ZLog.add("52073：请求指定玩家某坐骑详细内容");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(52073,_loc2_);
      }
      
      public function send_52075(param1:* = null) : void
      {
         ZLog.add("52075：请求重置坐骑技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(52075,_loc2_);
      }
      
      public function send_52077(param1:* = null) : void
      {
         ZLog.add("52077：请求坐骑梦幻丹面板坐骑列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(52077,_loc2_);
      }
      
      public function send_52079(param1:* = null) : void
      {
         ZLog.add("52079：请求指定玩家某坐骑详细内容");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52079,_loc2_);
      }
      
      public function send_52081(param1:* = null) : void
      {
         ZLog.add("52081：请求使用坐骑梦幻丹");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(52081,_loc2_);
      }
      
      public function send_52083(param1:* = null) : void
      {
         ZLog.add("52083：圣兽升级加点");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeByte(param1.type);
         if(param1.type == 1)
         {
            _loc2_.writeInt(param1.act);
            _loc2_.writeInt(param1.def);
            _loc2_.writeInt(param1.spd);
            _loc2_.writeInt(param1.mps);
         }
         NetWorkManager.sendMsg(52083,_loc2_);
      }
      
      public function send_52085(param1:* = null) : void
      {
         ZLog.add("52085：圣兽喂食");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeShort(param1.index);
         NetWorkManager.sendMsg(52085,_loc2_);
      }
      
      public function send_52087(param1:* = null) : void
      {
         ZLog.add("52087：圣兽技能升级查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.mid);
         _loc2_.writeInt(param1.kid);
         NetWorkManager.sendMsg(52087,_loc2_);
      }
      
      public function send_52089(param1:* = null) : void
      {
         ZLog.add("52089：圣兽技能升级");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.mid);
         _loc2_.writeInt(param1.kid);
         NetWorkManager.sendMsg(52089,_loc2_);
      }
      
      public function send_52091(param1:* = null) : void
      {
         ZLog.add("52091：龙鳞兑换圣兽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.mid);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(52091,_loc2_);
      }
      
      public function send_52093(param1:* = null) : void
      {
         ZLog.add("52093：圣兽升级/兑换查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.mid);
         NetWorkManager.sendMsg(52093,_loc2_);
      }
      
      public function send_52095(param1:* = null) : void
      {
         ZLog.add("52095：圣兽转职");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.mid);
         NetWorkManager.sendMsg(52095,_loc2_);
      }
      
      public function send_52097(param1:* = null) : void
      {
         ZLog.add("52097：圣兽或者没收之间相互交换  具体是哪个兽由 panelID决定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.mid);
         _loc2_.writeByte(param1.type);
         _loc2_.writeByte(param1.panelID);
         NetWorkManager.sendMsg(52097,_loc2_);
      }
      
      public function send_52031(param1:* = null) : void
      {
         ZLog.add("52031：请求活动碎片兑换魔兽面板的信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(52031,_loc2_);
      }
      
      public function send_52033(param1:* = null) : void
      {
         ZLog.add("52033：申请用活动碎片兑换魔兽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(52033,_loc2_);
      }
      
      public function send_60603(param1:* = null) : void
      {
         ZLog.add("60603：请求消除记忆");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60603,_loc2_);
      }
      
      public function send_60605(param1:* = null) : void
      {
         ZLog.add("60605：请求兑换信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60605,_loc2_);
      }
      
      public function send_60607(param1:* = null) : void
      {
         ZLog.add("60607：请求兑换信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(60607,_loc2_);
      }
      
      public function send_60609(param1:* = null) : void
      {
         ZLog.add("60609：请求涅槃突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60609,_loc2_);
      }
      
      public function send_60611(param1:* = null) : void
      {
         ZLog.add("60611：请求涅槃");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60611,_loc2_);
      }
      
      public function send_60651(param1:* = null) : void
      {
         ZLog.add("60651：请求兽元信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60651,_loc2_);
      }
      
      public function send_60653(param1:* = null) : void
      {
         ZLog.add("60653：请求突破兽元");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(60653,_loc2_);
      }
      
      public function send_60681(param1:* = null) : void
      {
         ZLog.add("60681 请求月光宝盒坐骑列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60681,_loc2_);
      }
      
      public function send_60683(param1:* = null) : void
      {
         ZLog.add("60683 请求重新涅槃");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60683,_loc2_);
      }
      
      public function send_60661(param1:* = null) : void
      {
         ZLog.add("60661 请求查看玩家单条兽元加成信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(60661,_loc2_);
      }
      
      public function send_60685(param1:* = null) : void
      {
         ZLog.add("60685 请求血兽蜕变坐骑列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60685,_loc2_);
      }
      
      public function send_60687(param1:* = null) : void
      {
         ZLog.add("60687 请求血兽蜕变");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeUTF(param1[1]);
         NetWorkManager.sendMsg(60687,_loc2_);
      }
      
      public function send_74101(param1:* = null) : void
      {
         ZLog.add("74101 请求可幻化坐骑列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(74101,_loc2_);
      }
      
      public function send_74103(param1:* = null) : void
      {
         ZLog.add("74103\t\t 请求幻化坐骑详细信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74103,_loc2_);
      }
      
      public function send_74105(param1:* = null) : void
      {
         ZLog.add("74105\t\t 请求激活风雷兽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74105,_loc2_);
      }
      
      public function send_74151(param1:* = null) : void
      {
         ZLog.add("74151\t\t 请求玩家巅峰兽信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(74151,_loc2_);
      }
      
      public function send_74153(param1:* = null) : void
      {
         ZLog.add("74153\t\t 玩家请求激活巅峰兽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(74153,_loc2_);
      }
      
      public function send_74155(param1:* = null) : void
      {
         ZLog.add("74155\t\t 设置巅峰兽外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74155,_loc2_);
      }
      
      public function send_74157(param1:* = null) : void
      {
         ZLog.add("74157\t\t 玩家请求骑乘巅峰兽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[1]);
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(74157,_loc2_);
      }
      
      public function send_74159(param1:* = null) : void
      {
         ZLog.add("74159\t 玩家请求骑乘巅峰兽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(74159,_loc2_);
      }
   }
}

