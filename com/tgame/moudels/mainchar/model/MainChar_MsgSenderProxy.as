package com.tgame.moudels.mainchar.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MainChar_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "MainChar_MsgSenderProxy";
      
      public function MainChar_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_10129(param1:* = null) : void
      {
         ZLog.add("10129: 请求npc动态提示信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(10129,_loc2_);
      }
   }
}

