package com.tgame.moudels.sanshiliushou.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class SanShiLiuShou_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "SanShiLiuShou_MsgSenderProxy";
      
      public function SanShiLiuShou_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_60151(param1:* = null) : void
      {
         ZLog.add("60151：请求玩家36手详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60151,_loc2_);
      }
      
      public function send_60153(param1:* = null) : void
      {
         ZLog.add("60153：玩家请求36手突破数据");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(60153,_loc2_);
      }
      
      public function send_60155(param1:* = null) : void
      {
         ZLog.add("60155：请求突破36手");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(60155,_loc2_);
      }
   }
}

