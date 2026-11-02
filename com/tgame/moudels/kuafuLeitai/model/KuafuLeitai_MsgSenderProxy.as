package com.tgame.moudels.kuafuLeitai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class KuafuLeitai_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "KuafuLeitai_MsgSenderProxy";
      
      public function KuafuLeitai_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_54551(param1:* = null) : void
      {
         ZLog.add("54551：请求跨服擂台标签");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(54551,_loc2_);
      }
      
      public function send_54553(param1:* = null) : void
      {
         ZLog.add("54553：请求跨服擂台信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54553,_loc2_);
      }
      
      public function send_54555(param1:* = null) : void
      {
         ZLog.add("54555：进入");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(54555,_loc2_);
      }
   }
}

