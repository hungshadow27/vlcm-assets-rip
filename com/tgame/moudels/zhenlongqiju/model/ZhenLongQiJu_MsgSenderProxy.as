package com.tgame.moudels.zhenlongqiju.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhenLongQiJu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ZhenLongQiJu_MsgSenderProxy";
      
      public function ZhenLongQiJu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73371(param1:* = null) : void
      {
         ZLog.add("73371：请求玩家珍珑棋局详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73371,_loc2_);
      }
      
      public function send_73373(param1:* = null) : void
      {
         ZLog.add("73373：请求珍珑棋局突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73373,_loc2_);
      }
      
      public function send_73375(param1:* = null) : void
      {
         ZLog.add("73375：请求玩家珍珑棋局详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73375,_loc2_);
      }
   }
}

