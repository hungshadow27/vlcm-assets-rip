package com.tgame.moudels.ynAojianzhizao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNAojianzhizao_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNAojianzhizao_MsgSendProxy";
      
      public function YNAojianzhizao_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_74051(param1:* = null) : void
      {
         ZLog.add("74051：请求傲剑制造面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(74051,_loc2_);
      }
      
      public function send_74053(param1:* = null) : void
      {
         ZLog.add("74053：请求属性确认");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(74053,_loc2_);
      }
   }
}

