package com.tgame.moudels.stone.model
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Stone_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Stone_MsgSendProxy";
      
      public function Stone_MsgSendProxy()
      {
         super(NAME);
      }
      
      public function send_50125(param1:* = null) : void
      {
         PipeManager.sendMsg(PipeConstants.EQUIP_STONE_SEND_50125,param1);
      }
      
      public function send_50193(param1:* = null) : void
      {
         ZLog.add("50193:新宝石合成");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.isBandStonePlayer ? 1 : 0);
         NetWorkManager.sendMsg(50193,_loc2_);
      }
      
      public function send_50195(param1:* = null) : void
      {
         ZLog.add("50195:宝石镶嵌");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.equipXY);
         _loc2_.writeInt(param1.equipID);
         _loc2_.writeShort(param1.stoneXY);
         _loc2_.writeInt(param1.stoneID);
         _loc2_.writeByte(param1.xingYunJingNum);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(50195,_loc2_);
      }
      
      public function send_50197(param1:* = null) : void
      {
         ZLog.add("50197:宝石拔除");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.equipXY);
         _loc2_.writeInt(param1.equipID);
         _loc2_.writeByte(param1.useYuZao);
         _loc2_.writeByte(param1.xingYunJingNum);
         _loc2_.writeByte(param1.stoneID);
         _loc2_.writeByte(param1.type);
         NetWorkManager.sendMsg(50197,_loc2_);
      }
      
      public function send_50173(param1:* = null) : void
      {
         ZLog.add("50173:活动：10颗5品宝石换6品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1.id);
         NetWorkManager.sendMsg(50173,_loc2_);
      }
      
      public function send_50163(param1:* = null) : void
      {
         ZLog.add("50163:活动：限时加工：5，6品宝类型转换查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeInt(param1.ID);
         NetWorkManager.sendMsg(50163,_loc2_);
      }
      
      public function send_50165(param1:* = null) : void
      {
         ZLog.add("50165:活动：限时加工：5，6品宝类型转换开始");
         var _loc2_:Array = [undefined,6501,6502,6503,6504,6505,6506];
         var _loc3_:Array = [undefined,6601,6602,6603,6604,6605,6606];
         var _loc4_:Array = [undefined,6701,6702,6703,6704,6705,6706];
         if(_loc2_.indexOf(param1.willID) >= 0)
         {
            param1.willID = _loc2_.indexOf(param1.willID);
         }
         else if(_loc3_.indexOf(param1.willID) >= 0)
         {
            param1.willID = _loc3_.indexOf(param1.willID);
         }
         else if(_loc4_.indexOf(param1.willID) >= 0)
         {
            param1.willID = _loc4_.indexOf(param1.willID);
         }
         var _loc5_:ByteArray = new ByteArray();
         _loc5_.writeShort(param1.index);
         _loc5_.writeInt(param1.ID);
         _loc5_.writeByte(param1.willID);
         NetWorkManager.sendMsg(50165,_loc5_);
      }
      
      public function send_50167(param1:* = null) : void
      {
         ZLog.add("50167:限时加工6品宝石生命加100开始");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeInt(param1.ID);
         NetWorkManager.sendMsg(50167,_loc2_);
      }
      
      public function send_50199(param1:* = null) : void
      {
         ZLog.add("50199:六品宝石升七品");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         NetWorkManager.sendMsg(50199,_loc2_);
      }
      
      public function send_53543(param1:* = null) : void
      {
         var _loc3_:int = 0;
         ZLog.add("53543:徽章与打造石打造");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeByte(param1.type);
         if(param1.type == 1)
         {
            _loc3_ = param1.isBind ? 1 : 0;
            _loc2_.writeByte(_loc3_);
         }
         NetWorkManager.sendMsg(53543,_loc2_);
      }
      
      public function send_53569(param1:* = null) : void
      {
         ZLog.add("53569:徽章与打造石打造");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(53569,_loc2_);
      }
      
      public function send_53581(param1:* = null) : void
      {
         ZLog.add("53581:藏宝阁勋章宝石拔除");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1);
         NetWorkManager.sendMsg(53581,_loc2_);
      }
      
      public function send_53583(param1:* = null) : void
      {
         ZLog.add("53583:宝石镶嵌");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(int(param1[0]));
         _loc2_.writeShort(int(param1[1]));
         NetWorkManager.sendMsg(53583,_loc2_);
      }
   }
}

