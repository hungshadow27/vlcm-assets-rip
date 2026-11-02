package com.tgame.moudels.twitchGift.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TwitchGift_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "TwitchGift_MsgSendProxy";
      
      public function TwitchGift_MsgSendProxy()
      {
         super(NAME,null);
      }
      
      public function send_60101(param1:* = null) : void
      {
         ZLog.add("60101：请求抽奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1 as int);
         NetWorkManager.sendMsg(60101,_loc2_);
      }
      
      public function send_60107(param1:* = null, param2:int = 0) : void
      {
         ZLog.add("60107：领奖");
         var _loc3_:ByteArray = new ByteArray();
         _loc3_.writeInt(param1 as int);
         _loc3_.writeByte(param2);
         NetWorkManager.sendMsg(60107,_loc3_);
      }
      
      public function send_60109(param1:* = null) : void
      {
         ZLog.add("60109：上次未领奖");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1 as int);
         NetWorkManager.sendMsg(60109,_loc2_);
      }
      
      public function send_60111(param1:* = null) : void
      {
         ZLog.add("60111：藏宝图请求宝箱数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1 as int);
         NetWorkManager.sendMsg(60111,_loc2_);
      }
      
      public function send_60115(param1:* = null) : void
      {
         ZLog.add("60115：松鼠宝箱请求祝福值");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1 as int);
         NetWorkManager.sendMsg(60115,_loc2_);
      }
      
      public function send_60117(param1:* = null) : void
      {
         ZLog.add("60117：松鼠宝箱请求友好度");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60117,_loc2_);
      }
      
      public function send_60119(param1:* = null) : void
      {
         ZLog.add("60119：松鼠宝箱领取金松果");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60119,_loc2_);
      }
      
      public function send_60121(param1:* = null) : void
      {
         ZLog.add("60121：查询是否有未领取的奖品");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60121,_loc2_);
      }
      
      public function send_53101(param1:* = null) : void
      {
         ZLog.add("53101：卡号兑换礼品请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(53101,_loc2_);
      }
      
      public function send_53103(param1:* = null) : void
      {
         ZLog.add("53103：领取奖品请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(53103,_loc2_);
      }
      
      public function send_53501(param1:* = null) : void
      {
         ZLog.add("53501：面板打开请求状态");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53501,_loc2_);
      }
      
      public function send_53503(param1:* = null) : void
      {
         ZLog.add("53503：千锤百炼装备成功率等查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.useMenu);
         _loc2_.writeInt(param1.useChuiZiID);
         NetWorkManager.sendMsg(53503,_loc2_);
      }
      
      public function send_53505(param1:* = null) : void
      {
         ZLog.add("53505：千锤百炼装备合成开始（蓄力）");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.useMenu);
         _loc2_.writeInt(param1.useChuiZiID);
         NetWorkManager.sendMsg(53505,_loc2_);
      }
      
      public function send_53507(param1:* = null) : void
      {
         ZLog.add("53507：千锤百炼领取奖励实物（落锤）");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53507,_loc2_);
      }
      
      public function send_53509(param1:* = null) : void
      {
         ZLog.add("53509：千锤百炼锻造锤换经验");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53509,_loc2_);
      }
      
      public function send_53511(param1:* = null) : void
      {
         ZLog.add("53511：千锤百炼请求历练值（原祝福值）");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53511,_loc2_);
      }
      
      public function send_53513(param1:* = null) : void
      {
         ZLog.add("53513：千锤百炼领取奖励实物（原领取金松果）");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(53513,_loc2_);
      }
      
      public function send_53515(param1:* = null) : void
      {
         ZLog.add("53515：锤子奖励查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53515,_loc2_);
      }
      
      public function send_53517(param1:* = null) : void
      {
         ZLog.add("53517：声望商店购买普通锤子查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(53517,_loc2_);
      }
      
      public function send_60125(param1:* = null) : void
      {
         ZLog.add("60125：新一轮开始或刷新，请求乾坤卡牌奖池数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.goodsID);
         _loc2_.writeByte(param1.state);
         _loc2_.writeByte(param1.isShuaXin);
         NetWorkManager.sendMsg(60125,_loc2_);
      }
      
      public function send_60127(param1:* = null) : void
      {
         ZLog.add("60127：开始翻牌");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.goodsID);
         _loc2_.writeByte(param1.state);
         _loc2_.writeByte(param1.index);
         NetWorkManager.sendMsg(60127,_loc2_);
      }
      
      public function send_60129(param1:* = null) : void
      {
         ZLog.add("60129：请求剩余奖池数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.goodsID);
         _loc2_.writeByte(param1.state);
         NetWorkManager.sendMsg(60129,_loc2_);
      }
      
      public function send_60131(param1:* = null) : void
      {
         ZLog.add("60131：请求各种幻境奖池数据及中奖结果");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.goodsID);
         _loc2_.writeByte(param1.state);
         NetWorkManager.sendMsg(60131,_loc2_);
      }
      
      public function send_60133(param1:* = null) : void
      {
         ZLog.add("60133：领取奖池奖品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.goodsID);
         _loc2_.writeByte(param1.state);
         _loc2_.writeByte(param1.isGetXuanHuangShi);
         NetWorkManager.sendMsg(60133,_loc2_);
      }
      
      public function send_55003(param1:* = null) : void
      {
         ZLog.add("55003：发送炼丹炉界面 刷新/确认  消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(55003,_loc2_);
      }
      
      public function send_55023(param1:* = null) : void
      {
         ZLog.add("55023：领取宝箱奖品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(55023,_loc2_);
      }
      
      public function send_55015(param1:* = null) : void
      {
         ZLog.add("55015：最终勋章炉 确认领取，刷新");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         if(param1[0] == 0)
         {
            _loc2_.writeInt(param1[1]);
         }
         NetWorkManager.sendMsg(55015,_loc2_);
      }
      
      public function send_60143(param1:* = null) : void
      {
         ZLog.add("60143：请求转盘旋转");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60143,_loc2_);
      }
      
      public function send_60145(param1:* = null) : void
      {
         ZLog.add("60145：请求转盘领取奖励");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(60145,_loc2_);
      }
      
      public function send_60147(param1:* = null) : void
      {
         ZLog.add("60147：请求对应龙元id的领奖抽奖信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(60147,_loc2_);
      }
   }
}

