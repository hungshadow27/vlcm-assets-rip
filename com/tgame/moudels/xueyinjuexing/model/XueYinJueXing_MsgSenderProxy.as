package com.tgame.moudels.xueyinjuexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XueYinJueXing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XueYinJueXing_MsgSenderProxy";
      
      public function XueYinJueXing_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_74371(param1:* = null) : void
      {
         ZLog.add("74371：请求玩家血饮觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74371,_loc2_);
      }
      
      public function send_74373(param1:* = null) : void
      {
         ZLog.add("74373：请求血饮觉醒突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74373,_loc2_);
      }
      
      public function send_74375(param1:* = null) : void
      {
         ZLog.add("74375：请求玩家血饮觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74375,_loc2_);
      }
   }
}

