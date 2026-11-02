package com.tgame.moudels.tuTengCard.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TuTengCade_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "TuTengCade_MsgSendProxy";
      
      public function TuTengCade_MsgSendProxy()
      {
         super(NAME);
      }
      
      public function send_53023(param1:* = null) : void
      {
         ZLog.add("53023：查询");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         NetWorkManager.sendMsg(53023,_loc2_);
      }
      
      public function send_53025(param1:* = null) : void
      {
         ZLog.add("53025：更改");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeShort(param1.index);
         _loc2_.writeShort(param1.id);
         NetWorkManager.sendMsg(53025,_loc2_);
      }
   }
}

