package com.tgame.moudels.login.model
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.net.socket.TSocket;
   import com.tgame.common.net.socket.TSocketEvent;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.login.Login_ApplicationFacade;
   import com.zcp.common.log.ZLog;
   import com.zcp.manager.TimerManager;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Login_LoginSocketManager extends Proxy
   {
      
      public static const NAME:String = "Login_LoginSocketProxy";
      
      public function Login_LoginSocketManager()
      {
         super(NAME,NetWorkManager.loginSocket);
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
         ZLog.add("连接登陆服务器成功");
         TPreLoader.hidePreLoadingUI();
         sendNotification(Login_ApplicationFacade.SHOW_LOGINUI);
      }
      
      private function socketLoginFailureHandler(param1:TSocketEvent = null) : void
      {
         var e:TSocketEvent = param1;
         ZLog.add("连接登陆服务器失败");
         if(GameConfig.loginServerPortArr.length > 0)
         {
            TimerManager.createOneOffTimer(100,1,function():void
            {
               GameConfig.loginServerPort = GameConfig.loginServerPortArr.shift();
               NetWorkManager.connectLogin();
            });
         }
         else
         {
            TPreLoader.showPreLoadingUI(LanResManager.getLanTextWords(this,"连接登陆服务器失败"));
            TPreLoader.updatePreLoadingUI(1);
         }
      }
      
      private function socketCloseHandler(param1:TSocketEvent = null) : void
      {
         ZLog.add("登陆服务器已断开");
         NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"登陆服务器已断开"));
      }
   }
}

