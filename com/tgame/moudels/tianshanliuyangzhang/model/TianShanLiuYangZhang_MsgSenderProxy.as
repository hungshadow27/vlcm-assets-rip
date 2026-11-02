package com.tgame.moudels.tianshanliuyangzhang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianShanLiuYangZhang_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "TianShanLiuYangZhang_MsgSenderProxy";
      
      public function TianShanLiuYangZhang_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73901(param1:* = null) : void
      {
         ZLog.add("73901：请求玩家天山六阳掌详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73901,_loc2_);
      }
      
      public function send_73903(param1:* = null) : void
      {
         ZLog.add("73903：请求天山六阳掌突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73903,_loc2_);
      }
      
      public function send_73905(param1:* = null) : void
      {
         ZLog.add("73905：请求玩家天山六阳掌详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73905,_loc2_);
      }
   }
}

