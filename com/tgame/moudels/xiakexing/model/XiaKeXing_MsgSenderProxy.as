package com.tgame.moudels.xiakexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiaKeXing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XiaKeXing_MsgSenderProxy";
      
      public function XiaKeXing_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_73561(param1:* = null) : void
      {
         ZLog.add("73561：请求玩家侠客行详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73561,_loc2_);
      }
      
      public function send_73563(param1:* = null) : void
      {
         ZLog.add("73563：请求玩家侠客行突破");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(73563,_loc2_);
      }
   }
}

