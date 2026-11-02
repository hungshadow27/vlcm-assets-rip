package com.tgame.moudels.liekongjuexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LieKongJueXing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LieKongJueXing_MsgSenderProxy";
      
      public function LieKongJueXing_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_73731(param1:* = null) : void
      {
         ZLog.add("73731：请求玩家裂空觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73731,_loc2_);
      }
      
      public function send_73733(param1:* = null) : void
      {
         ZLog.add("73733：请求裂空觉醒突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73733,_loc2_);
      }
      
      public function send_73735(param1:* = null) : void
      {
         ZLog.add("73735：请求玩家裂空觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73735,_loc2_);
      }
   }
}

