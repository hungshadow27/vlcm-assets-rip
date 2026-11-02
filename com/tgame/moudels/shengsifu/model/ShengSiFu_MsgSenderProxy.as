package com.tgame.moudels.shengsifu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShengSiFu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "ShengSiFu_MsgSenderProxy";
      
      public function ShengSiFu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73501(param1:* = null) : void
      {
         ZLog.add("73501：请求玩家生死符详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73501,_loc2_);
      }
      
      public function send_73503(param1:* = null) : void
      {
         ZLog.add("73503：请求生死符突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73503,_loc2_);
      }
      
      public function send_73505(param1:* = null) : void
      {
         ZLog.add("73505：请求玩家生死符详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73505,_loc2_);
      }
   }
}

