package com.tgame.moudels.scene.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.net.socket.TSocket;
   import com.tgame.common.net.socket.TSocketEvent;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ProcessManager;
   import com.zcp.common.log.ZLog;
   import com.zcp.manager.TimerManager;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Scene_ChatSocketProxy extends Proxy
   {
      
      public static const NAME:String = "Login_ChatSocketProxy";
      
      public function Scene_ChatSocketProxy()
      {
         super(NAME,NetWorkManager.chatSocket);
      }
      
      override public function onRegister() : void
      {
         this.socket.addEventListener(TSocketEvent.LOGIN_SUCCESS,this.socketLoginSuccessHandler);
         this.socket.addEventListener(TSocketEvent.LOGIN_FAILURE,this.socketLoginFailureHandler);
         this.socket.addEventListener(TSocketEvent.CLOSE,this.socketCloseHandler);
      }
      
      override public function onRemove() : void
      {
         this.socket.removeEventListener(TSocketEvent.LOGIN_SUCCESS,this.socketLoginSuccessHandler);
         this.socket.removeEventListener(TSocketEvent.LOGIN_FAILURE,this.socketLoginFailureHandler);
         this.socket.removeEventListener(TSocketEvent.CLOSE,this.socketCloseHandler);
      }
      
      protected function get socket() : TSocket
      {
         return data as TSocket;
      }
      
      private function socketLoginSuccessHandler(param1:TSocketEvent = null) : void
      {
         ZLog.add("连接聊天服务器成功");
         ProcessManager.enterChat();
      }
      
      private function socketLoginFailureHandler(param1:TSocketEvent = null) : void
      {
         var e:TSocketEvent = param1;
         ZLog.add("连接聊天服务器失败");
         if(GameConfig.chatServerPortArr.length > 0)
         {
            TimerManager.createOneOffTimer(100,1,function():void
            {
               GameConfig.chatServerPort = GameConfig.chatServerPortArr.shift();
               NetWorkManager.connectChat();
            });
         }
         else
         {
            NoticeManager.notify(NoticeManager.SYSTEM_CHAT,LanResManager.getLanTextWords(this,"请刷新网页重新连接"));
         }
      }
      
      private function socketCloseHandler(param1:TSocketEvent = null) : void
      {
         ZLog.add("聊天服务器已断开");
         if(NetWorkManager.lineSocket.connected)
         {
            NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"请刷新网页重新连接1"));
         }
      }
   }
}

