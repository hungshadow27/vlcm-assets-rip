package com.tgame.moudels.Item.model
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.tianMenZhen.view.BuZhen_Mediator;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Item_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Item_MsgSenderProxy";
      
      public function Item_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_50031(param1:* = null) : void
      {
         ZLog.add("50031：发送请求单个坐骑信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(50031,_loc2_);
      }
      
      public function send_11201(param1:* = null) : void
      {
         ZLog.add("11201：发送主角使用道具的消息");
         PipeManager.sendMsg(PipeConstants.ITEM_SWAP_OR_MOVE,[param1[0]]);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(11201,_loc2_);
      }
      
      public function send_10075(param1:* = null) : void
      {
         ZLog.add("10075：发送道具挪动消息");
         PipeManager.sendMsg(PipeConstants.ITEM_SWAP_OR_MOVE,[param1[0],param1[2]]);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[4]);
         _loc2_.writeShort(param1[2]);
         _loc2_.writeInt(param1[3]);
         NetWorkManager.sendMsg(10075,_loc2_);
      }
      
      public function send_50101(param1:* = null) : void
      {
         ZLog.add("50101：发送道具提示消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeInt(param1[3]);
         NetWorkManager.sendMsg(50101,_loc2_);
      }
      
      public function send_60105(param1:* = null) : void
      {
         ZLog.add("60105：发送宝箱道具提示消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60105,_loc2_);
      }
      
      public function send_60207(param1:* = null) : void
      {
         ZLog.add("60207：发送在护身符中的舍利子提示消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(60207,_loc2_);
      }
      
      public function send_50133(param1:* = null) : void
      {
         ZLog.add("50133：发送道具提示消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(50133,_loc2_);
      }
      
      public function send_10179(param1:* = null) : void
      {
         ZLog.add("10179：发送道具拖动到快捷栏消息");
         PipeManager.sendMsg(PipeConstants.ITEM_SWAP_OR_MOVE,[param1[0]]);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(10179,_loc2_);
      }
      
      public function send_11181(param1:* = null) : void
      {
         ZLog.add("11181：发送销毁道具消息");
         PipeManager.sendMsg(PipeConstants.ITEM_SWAP_OR_MOVE,[param1[0]]);
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(11181,_loc2_);
      }
      
      public function send_11183(param1:* = null) : void
      {
         ZLog.add("11183：发送拆分道具消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(11183,_loc2_);
      }
      
      public function send_11185(param1:* = null) : void
      {
         ZLog.add("11185：发送整理包裹消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(getTimer());
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(11185,_loc2_);
      }
      
      public function send_11187(param1:* = null) : void
      {
         ZLog.add("11187：发送整理仓库消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(11187,_loc2_);
      }
      
      public function send_11189(param1:* = null) : void
      {
         ZLog.add("11189：发送激活包裹消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(11189,_loc2_);
      }
      
      public function send_11191(param1:* = null) : void
      {
         ZLog.add("11191：发送激活仓库消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(11191,_loc2_);
      }
      
      public function send_11193(param1:* = null) : void
      {
         ZLog.add("11193：发送存钱消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(param1);
         NetWorkManager.sendMsg(11193,_loc2_);
      }
      
      public function send_11195(param1:* = null) : void
      {
         ZLog.add("11195：发送取钱消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeDouble(param1);
         NetWorkManager.sendMsg(11195,_loc2_);
      }
      
      public function send_13001(param1:* = null) : void
      {
         ZLog.add("13001：发送物品上架消息");
         var _loc2_:ByteArray = new ByteArray();
         PipeManager.sendMsg(PipeConstants.ITEM_SWAP_OR_MOVE,[param1[0]]);
         _loc2_.writeShort(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeShort(param1[3]);
         NetWorkManager.sendMsg(13001,_loc2_);
      }
      
      public function send_11203(param1:* = null) : void
      {
         ZLog.add("11203：发送使用快捷栏道具消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(11203,_loc2_);
      }
      
      public function send_11197(param1:* = null) : void
      {
         ZLog.add("11197：发送坐骑挪动消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(11197,_loc2_);
      }
      
      public function send_50049(param1:* = null) : void
      {
         ZLog.add("50049：发送扩充坐骑槽位消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(2);
         NetWorkManager.sendMsg(50049,_loc2_);
      }
      
      public function send_13005(param1:* = null) : void
      {
         ZLog.add("13005：发送请求摊位列表消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeUTF(param1[2]);
         NetWorkManager.sendMsg(13005,_loc2_);
      }
      
      public function send_13011(param1:* = null) : void
      {
         ZLog.add("13011：发送请求某个玩家摊位详情消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(13011,_loc2_);
      }
      
      public function send_13015(param1:* = null) : void
      {
         ZLog.add("13015：发送修改摊位名消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(13015,_loc2_);
      }
      
      public function send_10821(param1:* = null) : void
      {
         ZLog.add("10821：发送申请交易消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10821,_loc2_);
      }
      
      public function send_10825(param1:* = null) : void
      {
         ZLog.add("10825：发送是否接收其他玩家的交易申请消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(10825,_loc2_);
      }
      
      public function send_10833(param1:* = null) : void
      {
         ZLog.add("10833：发送中断交易消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10833,_loc2_);
      }
      
      public function send_13003(param1:* = null) : void
      {
         ZLog.add("13003：发送购买摊位物品消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeInt(param1[3]);
         _loc2_.writeInt(param1[4]);
         _loc2_.writeInt(param1[5]);
         NetWorkManager.sendMsg(13003,_loc2_);
      }
      
      public function send_13007(param1:* = null) : void
      {
         ZLog.add("13007：发送摊位坐骑上架消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(13007,_loc2_);
      }
      
      public function send_13019(param1:* = null) : void
      {
         ZLog.add("13019：发送摊位坐骑下架消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(13019,_loc2_);
      }
      
      public function send_13013(param1:* = null) : void
      {
         ZLog.add("13013：发送购买摊位坐骑消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeInt(param1[3]);
         _loc2_.writeInt(param1[4]);
         NetWorkManager.sendMsg(13013,_loc2_);
      }
      
      public function send_10841(param1:* = null) : void
      {
         ZLog.add("10841：发送交易物品上架消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(10841,_loc2_);
      }
      
      public function send_10847(param1:* = null) : void
      {
         ZLog.add("10847：发送交易物品下架消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(10847,_loc2_);
      }
      
      public function send_10843(param1:* = null) : void
      {
         ZLog.add("10843：发送金钱放入交易栏消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeDouble(param1[1]);
         NetWorkManager.sendMsg(10843,_loc2_);
      }
      
      public function send_10845(param1:* = null) : void
      {
         ZLog.add("10845：发送坐骑放入交易栏消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10845,_loc2_);
      }
      
      public function send_10851(param1:* = null) : void
      {
         ZLog.add("10851：发送坐骑取消交易栏消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10851,_loc2_);
      }
      
      public function send_10829(param1:* = null) : void
      {
         ZLog.add("10829：发送锁定交易栏消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10829,_loc2_);
      }
      
      public function send_10831(param1:* = null) : void
      {
         ZLog.add("10831：发送交易确定消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(10831,_loc2_);
      }
      
      public function send_10881(param1:* = null) : void
      {
         ZLog.add("10881：发送从NPC处购买道具消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(10881,_loc2_);
      }
      
      public function send_10883(param1:* = null) : void
      {
         ZLog.add("10883：发送向NPC处售卖道具消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeInt(param1[2]);
         _loc2_.writeShort(param1[3]);
         NetWorkManager.sendMsg(10883,_loc2_);
      }
      
      public function send_50061(param1:* = null) : void
      {
         ZLog.add("50061：发送请求单个坐骑信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(50061,_loc2_);
      }
      
      public function send_10377(param1:* = null) : void
      {
         ZLog.add("10377：发送赠花信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         var _loc3_:Array = param1[1];
         _loc2_.writeByte(_loc3_.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_.writeShort(_loc3_[_loc4_].position);
            _loc4_++;
         }
         NetWorkManager.sendMsg(10377,_loc2_);
      }
      
      public function send_10279(param1:* = null) : void
      {
         ZLog.add("10279：发送设置主技能信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10279,_loc2_);
      }
      
      public function send_10281(param1:* = null) : void
      {
         ZLog.add("10281：发送设置坐骑主技能信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10281,_loc2_);
      }
      
      public function send_50221(param1:* = null) : void
      {
         ZLog.add("50221：发送取得修理信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(50221,_loc2_);
      }
      
      public function send_50223(param1:* = null) : void
      {
         ZLog.add("50223：发送修理信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(50223,_loc2_);
      }
      
      public function send_50131(param1:* = null) : void
      {
         ZLog.add("50131：发送查看售卖道具信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(50131,_loc2_);
      }
      
      public function send_10277(param1:* = null) : void
      {
         ZLog.add("10277：发送设定技能快捷键消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(10277,_loc2_);
      }
      
      public function send_53059(param1:* = null) : void
      {
         ZLog.add("53059：神秘炼骨礼盒换炼骨丹");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeInt(param1.id);
         NetWorkManager.sendMsg(53059,_loc2_);
      }
      
      public function send_53091(param1:* = null) : void
      {
         ZLog.add("53091：特殊物品使用");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.posID);
         _loc2_.writeUTF(param1.str);
         NetWorkManager.sendMsg(53091,_loc2_);
      }
      
      public function send_53201(param1:* = null) : void
      {
         ZLog.add("53201：发送跨服包裹请求消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53201,_loc2_);
      }
      
      public function send_53203(param1:* = null) : void
      {
         ZLog.add("53203：发送领取收益消息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53203,_loc2_);
      }
      
      public function send_53771(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1 as int);
         NetWorkManager.sendMsg(53771,_loc2_);
      }
      
      public function send_53773(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeInt(param1.id);
         NetWorkManager.sendMsg(53773,_loc2_);
      }
      
      public function send_49993(param1:* = null) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         _loc2_.writeByte(param1.isReceived);
         NetWorkManager.sendMsg(49993,_loc2_);
      }
      
      public function send_55903(param1:* = null) : void
      {
         ZLog.add("55903:一键吞噬");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(55903,_loc2_);
      }
      
      public function send_55905(param1:* = null) : void
      {
         ZLog.add("55905:乾坤袋锁定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(55905,_loc2_);
      }
      
      public function send_55839(param1:* = null) : void
      {
         ZLog.add("55839:身上往包裹拖入");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(55839,_loc2_);
      }
      
      public function send_60221(param1:* = null) : void
      {
         ZLog.add("60221：发送请求安全锁状态");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60221,_loc2_);
      }
      
      public function send_60223(param1:* = null) : void
      {
         ZLog.add("60223：请求创建密码");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(Base64.encode(param1[0]));
         _loc2_.writeUTF(Base64.encode(param1[1]));
         NetWorkManager.sendMsg(60223,_loc2_);
      }
      
      public function send_60225(param1:* = null) : void
      {
         ZLog.add("60225：请求修改密码");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(Base64.encode(param1[0]));
         _loc2_.writeUTF(Base64.encode(param1[1]));
         _loc2_.writeUTF(Base64.encode(param1[2]));
         NetWorkManager.sendMsg(60225,_loc2_);
      }
      
      public function send_60227(param1:* = null) : void
      {
         ZLog.add("60227：请求验证密码");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(Base64.encode(param1));
         NetWorkManager.sendMsg(60227,_loc2_);
      }
      
      public function send_60229(param1:* = null) : void
      {
         ZLog.add("60229：请求锁定");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60229,_loc2_);
      }
      
      public function send_60231(param1:* = null) : void
      {
         ZLog.add("60231：请求遗忘密码");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60231,_loc2_);
      }
      
      public function send_60233(param1:* = null) : void
      {
         ZLog.add("60233：请求遗忘密码");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60233,_loc2_);
      }
      
      public function send_60235(param1:* = null) : void
      {
         ZLog.add("60235：请求遗忘密码");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60235,_loc2_);
      }
      
      public function send_70013(param1:* = null) : void
      {
         ZLog.add("70013：请求销毁逍遥御风技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(70013,_loc2_);
      }
      
      public function send_70115(param1:* = null) : void
      {
         ZLog.add("70115：请求勋章拖出布阵图");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(BuZhen_Mediator.zhenType);
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(70115,_loc2_);
      }
      
      public function send_73135(param1:int) : void
      {
         ZLog.add("73135：使用道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73135,_loc2_);
      }
      
      public function send_73469(param1:int) : void
      {
         ZLog.add("73469：使用斗地主道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73469,_loc2_);
      }
      
      public function send_73719(param1:int) : void
      {
         ZLog.add("73719：使用飞镖道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73719,_loc2_);
      }
      
      public function send_72137(param1:* = null) : void
      {
         ZLog.add("72137：请求销毁弟子快捷键技能\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(72137,_loc2_);
      }
      
      public function send_74309(param1:int) : void
      {
         ZLog.add("74309：使用情书道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74309,_loc2_);
      }
      
      public function send_74311(param1:int) : void
      {
         ZLog.add("74311：使用心雨道具");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74311,_loc2_);
      }
      
      public function send_83075(param1:int) : void
      {
         ZLog.add("83075：使用花灯礼物");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(83075,_loc2_);
      }
   }
}

