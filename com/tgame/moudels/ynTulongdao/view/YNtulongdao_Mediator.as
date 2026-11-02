package com.tgame.moudels.ynTulongdao.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynTulongdao.YNtulongdao_ApplicationFacade;
   import com.tgame.moudels.ynTulongdao.model.YNtulongdao_MsgSendProxy;
   import com.tgame.shell.view.components.ynSpecial.YNtulongdaoPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNtulongdao_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNtulongdao_Mediator";
      
      private var _senderProxy:YNtulongdao_MsgSendProxy;
      
      public function YNtulongdao_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNtulongdao_ApplicationFacade.SHOW_YNTULONGDAOPANEL];
      }
      
      private function get senderProxy() : YNtulongdao_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNtulongdao_MsgSendProxy.NAME) as YNtulongdao_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNtulongdao_ApplicationFacade.SHOW_YNTULONGDAOPANEL:
               this.senderProxy.send_81121(_loc2_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNtulongdaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynTulongdaoPanel);
         }
         return viewComponent as YNtulongdaoPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNtulongdaoPanel,function():void
         {
            panel.addEventListener(YNtulongdaoPanel.UI_YN_TULONGDAOJIHUO_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNtulongdaoPanel,function():void
         {
            panel.removeEventListener(YNtulongdaoPanel.UI_YN_TULONGDAOJIHUO_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNtulongdaoPanel.UI_YN_TULONGDAOJIHUO_CLICK:
               this.senderProxy.send_81123(param1.data);
         }
      }
      
      public function setData(param1:Array, param2:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setData(param1,param2);
      }
   }
}

