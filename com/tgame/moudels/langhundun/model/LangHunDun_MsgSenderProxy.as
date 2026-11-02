package com.tgame.moudels.langhundun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LangHunDun_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LangHunDun_MsgSenderProxy";
      
      public function LangHunDun_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_72491(param1:* = null) : void
      {
         ZLog.add("72491：请求玩家狼魂盾详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72491,_loc2_);
      }
      
      public function send_72493(param1:* = null) : void
      {
         ZLog.add("72493：请求玩家狼魂盾突破");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72493,_loc2_);
      }
   }
}

