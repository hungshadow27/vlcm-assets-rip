package com.tgame.moudels.aojianshenjiangji.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianShenJiangJi_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "AoJianShenJiangJi_MsgSenderProxy";
      
      public function AoJianShenJiangJi_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_74061(param1:* = null) : void
      {
         ZLog.add("74061：请求玩家傲剑神将技详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(74061,_loc2_);
      }
   }
}

