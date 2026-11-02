package com.tgame.moudels.shenxingbaibian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShenXingBaiBian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ShenXingBaiBian_MsgSenderProxy";
      
      public function ShenXingBaiBian_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_72321(param1:* = null) : void
      {
         ZLog.add("72321：请求玩家神行百变详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72321,_loc2_);
      }
      
      public function send_72323(param1:* = null) : void
      {
         ZLog.add("72323：请求神行百变突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72323,_loc2_);
      }
      
      public function send_72325(param1:* = null) : void
      {
         ZLog.add("72325：请求玩家神行百变详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(72325,_loc2_);
      }
   }
}

