package com.tgame.moudels.changshengjue.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChangShengJue_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ChangShengJue_MsgSenderProxy";
      
      public function ChangShengJue_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73151(param1:* = null) : void
      {
         ZLog.add("73151：请求玩家长生诀详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73151,_loc2_);
      }
      
      public function send_73153(param1:* = null) : void
      {
         ZLog.add("73153：请求长生诀突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73153,_loc2_);
      }
      
      public function send_73155(param1:* = null) : void
      {
         ZLog.add("73155：请求玩家长生诀详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73155,_loc2_);
      }
   }
}

