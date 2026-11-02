package com.tgame.moudels.taohuazhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TaoHuaZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TaoHuaZhen_MsgSenderProxy";
      
      public function TaoHuaZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73521(param1:* = null) : void
      {
         ZLog.add("73521：请求玩家桃花阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73521,_loc2_);
      }
      
      public function send_73523(param1:* = null) : void
      {
         ZLog.add("73523：请求桃花阵突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73523,_loc2_);
      }
      
      public function send_73525(param1:* = null) : void
      {
         ZLog.add("73525：请求玩家桃花阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73525,_loc2_);
      }
   }
}

