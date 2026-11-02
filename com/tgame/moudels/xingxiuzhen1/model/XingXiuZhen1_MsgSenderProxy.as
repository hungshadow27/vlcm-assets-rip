package com.tgame.moudels.xingxiuzhen1.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XingXiuZhen1_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XingXiuZhen1_MsgSenderProxy";
      
      public function XingXiuZhen1_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_82221(param1:* = null) : void
      {
         ZLog.add("82221：请求玩家二十八星宿阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(82221,_loc2_);
      }
      
      public function send_82223(param1:* = null) : void
      {
         ZLog.add("82223：请求二十八星宿阵突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(82223,_loc2_);
      }
      
      public function send_82225(param1:* = null) : void
      {
         ZLog.add("82225：请求玩家二十八星宿阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(82225,_loc2_);
      }
   }
}

