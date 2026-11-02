package com.tgame.moudels.equipPudding.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.equipPudding.view.UI_MainCharEquipPuddingPanelMediator;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class EquipPudding_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "EquipPudding_MsgSendProxy";
      
      private var _equipPuddingPanelMediator:UI_MainCharEquipPuddingPanelMediator;
      
      public function EquipPudding_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_50103(param1:* = null) : void
      {
         ZLog.add("50103:装备强化");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50103,_loc2_);
      }
      
      public function send_50107(param1:* = null) : void
      {
         ZLog.add("50107:强化重置");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50107,_loc2_);
      }
      
      public function send_50109(param1:* = null) : void
      {
         ZLog.add("50109:属性重置");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50109,_loc2_);
      }
      
      public function send_50111(param1:* = null) : void
      {
         ZLog.add("50111:宝石合成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.equipXY);
         _loc2_.writeInt(param1.equipID);
         _loc2_.writeShort(param1.stoneXY);
         _loc2_.writeInt(param1.stoneID);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50111,_loc2_);
      }
      
      public function send_50115(param1:* = null) : void
      {
         ZLog.add("50115:宝石合成替换确认");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.equipXY);
         _loc2_.writeInt(param1.equipID);
         _loc2_.writeShort(param1.newStoneXY);
         _loc2_.writeInt(param1.newStoneID);
         _loc2_.writeInt(param1.oldStoneID);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50115,_loc2_);
      }
      
      public function send_50171(param1:* = null) : void
      {
         ZLog.add("50171:强化附加属性确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         NetWorkManager.sendMsg(50171,_loc2_);
      }
      
      public function send_50125(param1:* = null) : void
      {
         ZLog.add("50125:消费真气，合成概率查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(50125,_loc2_);
      }
      
      public function send_50191(param1:* = null) : void
      {
         ZLog.add("重置附加属性选择确认");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(EquipPudding_MsgReceivedProxy.index_50192);
         _loc2_.writeByte(param1.isOK);
         EquipPudding_MsgReceivedProxy.index_50192 = 0;
         NetWorkManager.sendMsg(50191,_loc2_);
      }
      
      public function send_53057(param1:* = null) : void
      {
         ZLog.add("53057：发出 请求装备兑换宝石");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(53057,_loc2_);
      }
      
      public function send_53539(param1:* = null) : void
      {
         ZLog.add("53539:请求100级装备升阶信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(53539,_loc2_);
      }
      
      public function send_53541(param1:* = null) : void
      {
         ZLog.add("53541:请求100级装备升阶");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeInt(param1[2]);
         NetWorkManager.sendMsg(53541,_loc2_);
      }
      
      public function send_53561(param1:* = null) : void
      {
         ZLog.add("53561:请求装备养成面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(53561,_loc2_);
      }
      
      public function send_53563(param1:* = null) : void
      {
         ZLog.add("53563:发送装备养成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(53563,_loc2_);
      }
      
      public function send_57101(param1:* = null) : void
      {
         ZLog.add("57101:请求装备四圣兽刻纹面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57101,_loc2_);
      }
      
      public function send_57103(param1:* = null) : void
      {
         ZLog.add("57103:装备四圣兽刻纹  放入装备请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(57103,_loc2_);
      }
      
      public function send_57105(param1:* = null) : void
      {
         ZLog.add("57105:装备四圣兽刻纹 请求刻画打造");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(57105,_loc2_);
      }
      
      public function send_57107(param1:* = null) : void
      {
         ZLog.add("57107:装备四圣兽刻纹 请求去除");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1[0]);
         NetWorkManager.sendMsg(57107,_loc2_);
      }
      
      public function send_57151(param1:* = null) : void
      {
         ZLog.add("57151:请求装备复制面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(57151,_loc2_);
      }
      
      public function send_57153(param1:* = null) : void
      {
         ZLog.add("57153:请求装备复制面板 放入装备请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(57153,_loc2_);
      }
      
      public function send_57155(param1:* = null) : void
      {
         ZLog.add("57155:请求装备复制");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeShort(param1[1]);
         NetWorkManager.sendMsg(57155,_loc2_);
      }
   }
}

