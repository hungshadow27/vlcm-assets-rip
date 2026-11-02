package com.tgame.moudels.scene.model
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.net.socket.TSocket;
   import com.tgame.common.net.socket.TSocketEvent;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.utils.ZMath;
   import com.zcp.manager.TimerManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Scene_LineSocketProxy extends Proxy
   {
      
      public static const NAME:String = "Scene_LineSocketProxy";
      
      private var _msgSenderProxy:Scene_MsgSenderProxy;
      
      public function Scene_LineSocketProxy()
      {
         super(NAME,NetWorkManager.lineSocket);
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
      
      private function get msgSenderProxy() : Scene_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Scene_MsgSenderProxy.NAME) as Scene_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function socketLoginSuccessHandler(param1:TSocketEvent = null) : void
      {
         ZLog.add("连接分线服务器成功");
         TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"请求进入分线服务器"),0.6);
         this.msgSenderProxy.send_10105();
      }
      
      private function socketLoginFailureHandler(param1:TSocketEvent = null) : void
      {
         var e:TSocketEvent = param1;
         ZLog.add("连接分线服务器失败");
         if(GameConfig.lineServerPortArr.length > 0)
         {
            TimerManager.createOneOffTimer(100,1,function():void
            {
               GameConfig.lineServerPort = GameConfig.lineServerPortArr.shift();
               NetWorkManager.connectLine();
            });
         }
         else
         {
            TPreLoader.updateLoadingUI(LanResManager.getLanTextWords(this,"请刷新网页重新连接2"),1);
         }
      }
      
      private function socketCloseHandler(param1:TSocketEvent = null) : void
      {
         var count:int = 0;
         var alert:FAlert = null;
         var timer:Timer = null;
         var timerHandler:Function = null;
         var e:TSocketEvent = param1;
         ZLog.add("分线服务器已断开");
         if(ReloginManager.isDing || ReloginManager.isInKuafu)
         {
            NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanTextWords(this,"请刷新网页重新连接3"),false);
         }
         else
         {
            timerHandler = function(param1:TimerEvent = null):void
            {
               if(count == 0)
               {
                  if(timer != null)
                  {
                     timer.stop();
                     timer.removeEventListener(TimerEvent.TIMER,timerHandler);
                     timer = null;
                  }
                  ReloginManager.autoReLoad();
               }
               alert.Text = LanResManager.getLanTextWords(Scene_LineSocketProxy,"您的连接已断开， $0 秒钟后自动刷新网页重新连接",[count]);
               --count;
            };
            count = ZMath.getRandomNumber(20 * 60,30 * 60);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("立刻重连");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消重连");
            alert = FAlert.show(LanResManager.getLanTextWords(Scene_LineSocketProxy,"您的连接已断开， $0 秒钟后自动刷新网页重新连接",[count]),"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  ReloginManager.autoReLoad();
               }
               else if(timer != null)
               {
                  timer.stop();
                  timer.removeEventListener(TimerEvent.TIMER,timerHandler);
                  timer = null;
               }
            });
            timer = new Timer(1000);
            timer.addEventListener(TimerEvent.TIMER,timerHandler);
            timer.start();
            timerHandler();
         }
      }
   }
}

