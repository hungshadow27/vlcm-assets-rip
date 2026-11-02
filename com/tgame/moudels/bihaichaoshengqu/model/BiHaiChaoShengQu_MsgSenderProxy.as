package com.tgame.moudels.bihaichaoshengqu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BiHaiChaoShengQu_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BiHaiChaoShengQu_MsgSenderProxy";
      
      public function BiHaiChaoShengQu_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_70151(param1:* = null) : void
      {
         ZLog.add("70151：请求玩家碧海潮生曲阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70151,_loc2_);
      }
      
      public function send_70153(param1:* = null) : void
      {
         ZLog.add("70153：请求碧海潮生曲突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(70153,_loc2_);
      }
      
      public function send_70155(param1:* = null) : void
      {
         ZLog.add("70155：请求玩家碧海潮生曲阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70155,_loc2_);
      }
   }
}

