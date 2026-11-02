package com.tgame.moudels.tianMenZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianMenZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TianMenZhen_MsgSenderProxy";
      
      public function TianMenZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70101(param1:* = null) : void
      {
         ZLog.add("70101\t\t请求玩家天门阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70101,_loc2_);
      }
      
      public function send_70103(param1:* = null) : void
      {
         ZLog.add("70103\t\t玩家请求天门阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70103,_loc2_);
      }
      
      public function send_70105(param1:* = null) : void
      {
         ZLog.add("70105\t\t请求突破天门阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70105,_loc2_);
      }
      
      public function send_70117(param1:* = null) : void
      {
         ZLog.add("70117\t\t设置布阵图是否外显");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70117,_loc2_);
      }
      
      public function send_70107(param1:* = null) : void
      {
         ZLog.add("70107\t\t请求布阵面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70107,_loc2_);
      }
      
      public function send_70109(param1:* = null) : void
      {
         ZLog.add("70109\t\t请求布阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70109,_loc2_);
      }
      
      public function send_70111(param1:* = null) : void
      {
         ZLog.add("70111\t\t请求重新布阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70111,_loc2_);
      }
      
      public function send_70113(param1:* = null) : void
      {
         ZLog.add("70113\t\t请求布阵物品拖拽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeInt(int(param1[2]));
         _loc2_.writeInt(int(param1[3]));
         _loc2_.writeInt(int(param1[4]));
         NetWorkManager.sendMsg(70113,_loc2_);
      }
      
      public function send_70121(param1:* = null) : void
      {
         ZLog.add("70121\t\t请求天门阵爆发");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(70121,_loc2_);
      }
   }
}

