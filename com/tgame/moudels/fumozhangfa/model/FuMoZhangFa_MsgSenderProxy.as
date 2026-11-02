package com.tgame.moudels.fumozhangfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FuMoZhangFa_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "FuMoZhangFa_MsgSenderProxy";
      
      public function FuMoZhangFa_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_73611(param1:* = null) : void
      {
         ZLog.add("73611：请求玩家伏魔杖法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(73611,_loc2_);
      }
      
      public function send_73613(param1:* = null) : void
      {
         ZLog.add("73613：请求伏魔杖法突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(73613,_loc2_);
      }
      
      public function send_73615(param1:* = null) : void
      {
         ZLog.add("73615：请求玩家伏魔杖法详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(73615,_loc2_);
      }
   }
}

