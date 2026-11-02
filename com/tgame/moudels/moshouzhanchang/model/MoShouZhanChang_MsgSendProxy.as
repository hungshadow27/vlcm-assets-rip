package com.tgame.moudels.moshouzhanchang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MoShouZhanChang_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "MoShouZhanChang_MsgSendProxy";
      
      public function MoShouZhanChang_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_81381(param1:* = null) : void
      {
         ZLog.add("81381 \t跨服争夺战信息请求");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81381,_loc2_);
      }
      
      public function send_81383(param1:* = null) : void
      {
         ZLog.add("81383\t\t跨服争夺战报名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81383,_loc2_);
      }
      
      public function send_81389(param1:* = null) : void
      {
         ZLog.add("81389\t复活\t");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81313,_loc2_);
      }
      
      public function send_81561(param1:* = null) : void
      {
         ZLog.add("81561\t祭拜屈原\t");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81561,_loc2_);
      }
      
      public function send_81563(param1:* = null) : void
      {
         ZLog.add("81563\t提交糯米粽\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81563,_loc2_);
      }
      
      public function send_81565(param1:* = null) : void
      {
         ZLog.add("81565\t采集粽子\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81565,_loc2_);
      }
      
      public function send_81387(param1:* = null) : void
      {
         ZLog.add("81387\t魔兽战场领取奖励\t");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81387,_loc2_);
      }
      
      public function send_83061(param1:* = null) : void
      {
         ZLog.add("83061\t批量使用道具\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeInt(param1.id);
         _loc2_.writeInt(param1.position);
         _loc2_.writeInt(param1.count);
         NetWorkManager.sendMsg(83061,_loc2_);
      }
      
      public function send_83115(param1:* = null) : void
      {
         ZLog.add("83115\t锻炼勋章\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83115,_loc2_);
      }
      
      public function send_83161(param1:* = null) : void
      {
         ZLog.add("83161\t锻炼勋章\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(83161,_loc2_);
      }
      
      public function send_83163(param1:* = null) : void
      {
         ZLog.add("83163\t锻炼勋章\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83163,_loc2_);
      }
      
      public function send_83165(param1:* = null) : void
      {
         ZLog.add("83165\t点击神诞树\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83165,_loc2_);
      }
      
      public function send_83167(param1:* = null) : void
      {
         ZLog.add("83167\t点击神诞树养成\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83167,_loc2_);
      }
      
      public function send_83169(param1:* = null) : void
      {
         ZLog.add("83169\t点击神诞树领奖\t");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(83169,_loc2_);
      }
   }
}

