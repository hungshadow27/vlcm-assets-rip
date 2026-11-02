package com.tgame.moudels.longyinjuexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LongYinJueXing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LongYinJueXing_MsgSenderProxy";
      
      public function LongYinJueXing_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_72301(param1:* = null) : void
      {
         ZLog.add("72301：请求玩家龙吟觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72301,_loc2_);
      }
      
      public function send_72303(param1:* = null) : void
      {
         ZLog.add("72303：请求龙吟觉醒突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72303,_loc2_);
      }
      
      public function send_72305(param1:* = null) : void
      {
         ZLog.add("72305：请求玩家龙吟觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72305,_loc2_);
      }
   }
}

