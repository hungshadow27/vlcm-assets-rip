package com.tgame.moudels.chaojilaba.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChaoJiLaBa_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "ChaoJiLaBa_MsgSendProxy";
      
      public function ChaoJiLaBa_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_73771(param1:* = null) : void
      {
         ZLog.add("73771：确认说话");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1);
         NetWorkManager.sendMsg(73771,_loc2_);
      }
   }
}

