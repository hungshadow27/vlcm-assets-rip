package com.tgame.moudels.yn2016newyear.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yn2016newyear.YN2016newyear_ApplicationFacade;
   import com.tgame.moudels.yn2016newyear.model.YN2016newyear_MsgSendProxy;
   import com.tgame.shell.view.components.ynSpecial.YN2016cailushuPanel;
   import com.tgame.shell.view.components.ynSpecial.YN2016onlinePanle;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YN2016newyear_Mediator extends Mediator
   {
      
      public static const NAME:String = "YN2016newyear_Mediator";
      
      private var _senderProxy:YN2016newyear_MsgSendProxy;
      
      private var ty:int = -1;
      
      public function YN2016newyear_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [undefined,YN2016newyear_ApplicationFacade.SHOW_YN2016CGPANEL,YN2016newyear_ApplicationFacade.SHOW_YN2016DLPANEL,YN2016newyear_ApplicationFacade.SHOW_YN2016ONLINEPANEL,YN2016newyear_ApplicationFacade.SHOW_YNNEWYEARSHUOMING];
      }
      
      private function get senderProxy() : YN2016newyear_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YN2016newyear_MsgSendProxy.NAME) as YN2016newyear_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YN2016newyear_ApplicationFacade.SHOW_YN2016CGPANEL:
               this.senderProxy.send_80923();
               break;
            case YN2016newyear_ApplicationFacade.SHOW_YN2016DLPANEL:
               if(!Fun.isVisible(GameInstance.uiInstance.yn2016DLPanel))
               {
                  GameInstance.uiInstance.yn2016DLPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.yn2016DLPanel.width / 2;
                  GameInstance.uiInstance.yn2016DLPanel.y = GameConfig.sceneHeight / 2 - 466 / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.yn2016DLPanel);
               }
               break;
            case YN2016newyear_ApplicationFacade.SHOW_YN2016ONLINEPANEL:
               this.senderProxy.send_80927();
               break;
            case YN2016newyear_ApplicationFacade.SHOW_YNNEWYEARSHUOMING:
               if(!Fun.isVisible(GameInstance.uiInstance.yn2016newyearPanel))
               {
                  GameInstance.uiInstance.yn2016newyearPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.yn2016newyearPanel.width / 2;
                  GameInstance.uiInstance.yn2016newyearPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.yn2016newyearPanel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.yn2016newyearPanel);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YN2016cailushuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yn2016CGPanel);
         }
         return viewComponent as YN2016cailushuPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YN2016cailushuPanel,function():void
         {
            panel.addEventListener(YN2016cailushuPanel.YN2016NEWYEAR_CG_BTN_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016cailushuPanel,function():void
         {
            panel.removeEventListener(YN2016cailushuPanel.YN2016NEWYEAR_CG_BTN_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(YN2016onlinePanle,function():void
         {
            GameInstance.uiInstance.yn2016onlinePanel.addEventListener(YN2016onlinePanle.YN_2016ONLINE_BTN_CLICK,onClickonline);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016onlinePanle,function():void
         {
            GameInstance.uiInstance.yn2016onlinePanel.removeEventListener(YN2016onlinePanle.YN_2016ONLINE_BTN_CLICK,onClickonline);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YN2016cailushuPanel.YN2016NEWYEAR_CG_BTN_CLICK:
               this.senderProxy.send_80925(param1.data);
         }
      }
      
      private function onClickonline(param1:*) : void
      {
         switch(param1.type)
         {
            case YN2016onlinePanle.YN_2016ONLINE_BTN_CLICK:
               this.senderProxy.send_80929();
         }
      }
      
      public function setCGData(param1:Array, param2:Boolean, param3:Boolean) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yn2016CGPanel))
         {
            GameInstance.uiInstance.yn2016CGPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.yn2016CGPanel.width / 2;
            GameInstance.uiInstance.yn2016CGPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.yn2016CGPanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.yn2016CGPanel);
         }
         this.panel.setData(param1,param2,param3);
      }
      
      public function setOnline(param1:Array, param2:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yn2016onlinePanel))
         {
            GameInstance.uiInstance.yn2016onlinePanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.yn2016onlinePanel.width / 2;
            GameInstance.uiInstance.yn2016onlinePanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.yn2016onlinePanel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.yn2016onlinePanel);
         }
         GameInstance.uiInstance.yn2016onlinePanel.setleijidengluData(param1,param2);
      }
   }
}

