package com.tgame.moudels.menpaizhuanhuan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class PartyChange_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:* = "PartyChange_MsgSenderProxy";
      
      public function PartyChange_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70561(param1:* = null) : void
      {
         ZLog.add("70561：请求门派转换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70561,_loc2_);
      }
   }
}

