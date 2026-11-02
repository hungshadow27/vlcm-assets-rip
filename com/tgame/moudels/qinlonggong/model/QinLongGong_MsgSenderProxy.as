package com.tgame.moudels.qinlonggong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QinLongGong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QinLongGong_MsgSenderProxy";
      
      public function QinLongGong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_61841(param1:* = null) : void
      {
         ZLog.add("61841：请求玩家擒龙功阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(61841,_loc2_);
      }
      
      public function send_61843(param1:* = null) : void
      {
         ZLog.add("61843：请求擒龙功突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(61843,_loc2_);
      }
      
      public function send_61845(param1:* = null) : void
      {
         ZLog.add("61845：请求玩家擒龙功阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(61845,_loc2_);
      }
   }
}

