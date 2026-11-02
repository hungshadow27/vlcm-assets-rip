package com.tgame.moudels.zhanWenKeHua.model
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhanWenKeHua_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "ZhanWenKeHua_MsgSendProxy";
      
      public function ZhanWenKeHua_MsgSendProxy()
      {
         super(NAME);
      }
      
      public function send_50125(param1:* = null) : void
      {
         PipeManager.sendMsg(PipeConstants.EQUIP_STONE_SEND_50125,param1);
      }
      
      public function send_50179(param1:* = null) : void
      {
         ZLog.add("50179:战纹刻画");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.zhenHunFuNum);
         NetWorkManager.sendMsg(50179,_loc2_);
      }
      
      public function send_50183(param1:* = null) : void
      {
         ZLog.add("50183:战纹刻画之重置附加属性数值确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50183,_loc2_);
      }
      
      public function send_50187(param1:* = null) : void
      {
         ZLog.add("50187:战纹刻画之增减附加属性确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.XY);
         _loc2_.writeInt(param1.ID);
         _loc2_.writeByte(param1.xingYunJingNum);
         NetWorkManager.sendMsg(50187,_loc2_);
      }
      
      public function send_50169(param1:* = null) : void
      {
         ZLog.add("50169:增删条目选择确认");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(ZhanWenKeHua_MsgReceiveProxy.index_50168_50178);
         _loc2_.writeByte(param1.isOK);
         ZhanWenKeHua_MsgReceiveProxy.index_50168_50178 = 0;
         NetWorkManager.sendMsg(50169,_loc2_);
      }
      
      public function send_50177(param1:* = null) : void
      {
         ZLog.add("50177:条目值选择确认");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(ZhanWenKeHua_MsgReceiveProxy.index_50168_50178);
         _loc2_.writeByte(param1.isOK);
         ZhanWenKeHua_MsgReceiveProxy.index_50168_50178 = 0;
         NetWorkManager.sendMsg(50177,_loc2_);
      }
      
      public function send_50189(param1:* = null) : void
      {
         ZLog.add("50189:图腾战纹是否替换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeByte(param1.isTiHuan);
         NetWorkManager.sendMsg(50189,_loc2_);
      }
      
      public function send_53523(param1:* = null) : void
      {
         ZLog.add("53523:金锤子");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         NetWorkManager.sendMsg(53523,_loc2_);
      }
   }
}

