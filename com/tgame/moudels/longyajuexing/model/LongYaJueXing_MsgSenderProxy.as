package com.tgame.moudels.longyajuexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LongYaJueXing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LongYaJueXing_MsgSenderProxy";
      
      public function LongYaJueXing_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71901(param1:* = null) : void
      {
         ZLog.add("71901：请求玩家龙牙觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71901,_loc2_);
      }
      
      public function send_71903(param1:* = null) : void
      {
         ZLog.add("71903：请求龙牙觉醒突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71903,_loc2_);
      }
      
      public function send_71905(param1:* = null) : void
      {
         ZLog.add("71905：请求玩家龙牙觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71905,_loc2_);
      }
   }
}

