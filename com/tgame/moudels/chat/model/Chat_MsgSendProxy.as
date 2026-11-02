package com.tgame.moudels.chat.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Chat_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "Chat_MsgSendProxy";
      
      public function Chat_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_30105(param1:Object) : void
      {
         ZLog.add("30105：发送聊天消息--私聊");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.trageName);
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(30105,_loc2_,NetWorkManager.chatSocket);
      }
      
      public function send_30107(param1:Object) : void
      {
         ZLog.add("30107：发送聊天消息--帮会");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(30107,_loc2_,NetWorkManager.chatSocket);
      }
      
      public function send_30109(param1:Object) : void
      {
         ZLog.add("30109：发送聊天消息--组队");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(30109,_loc2_,NetWorkManager.chatSocket);
      }
      
      public function send_30111(param1:Object) : void
      {
         ZLog.add("30111：发送聊天消息--普通");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(30111,_loc2_,NetWorkManager.chatSocket);
      }
      
      public function send_30113(param1:Object) : void
      {
         ZLog.add("30113：发送聊天消息--世界");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(30113,_loc2_,NetWorkManager.chatSocket);
      }
      
      public function send_30151(param1:Object) : void
      {
         ZLog.add("30151：发送聊天消息--喇叭");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(30151,_loc2_,NetWorkManager.lineSocket);
      }
      
      public function send_65530(param1:Object) : void
      {
         ZLog.add("65530：发送聊天消息--test");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(65530,_loc2_,NetWorkManager.chatSocket);
      }
      
      public function send_GM(param1:Object) : void
      {
         ZLog.add("30105：发送聊天消息--GM");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeUTF(param1.chatContent);
         NetWorkManager.sendMsg(30105,_loc2_,NetWorkManager.lineSocket);
      }
   }
}

