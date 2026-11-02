package com.tgame.moudels.quanshenjuexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QuanShenJueXing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QuanShenJueXing_MsgSenderProxy";
      
      public function QuanShenJueXing_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_72001(param1:* = null) : void
      {
         ZLog.add("72001：请求玩家龙牙觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72001,_loc2_);
      }
      
      public function send_72003(param1:* = null) : void
      {
         ZLog.add("72003：请求龙牙觉醒突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72003,_loc2_);
      }
      
      public function send_72005(param1:* = null) : void
      {
         ZLog.add("72005：请求玩家龙牙觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72005,_loc2_);
      }
   }
}

