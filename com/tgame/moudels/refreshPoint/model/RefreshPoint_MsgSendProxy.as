package com.tgame.moudels.refreshPoint.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class RefreshPoint_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "RefreshPoint_MsgSendProxy";
      
      public function RefreshPoint_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_49991(param1:* = null) : void
      {
         ZLog.add("50301:洗点");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0] * -1);
         _loc2_.writeInt(param1[1] * -1);
         _loc2_.writeInt(param1[2] * -1);
         _loc2_.writeInt(param1[3] * -1);
         NetWorkManager.sendMsg(49991,_loc2_);
      }
   }
}

