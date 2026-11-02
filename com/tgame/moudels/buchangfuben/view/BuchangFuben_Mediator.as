package com.tgame.moudels.buchangfuben.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.buchangfuben.BuchangFuben_ApplicationFacade;
   import com.tgame.moudels.buchangfuben.model.BuchangFuben_MsgSendProxy;
   import com.tgame.shell.view.components.BuchangFubenPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BuchangFuben_Mediator extends Mediator
   {
      
      public static const NAME:String = "BuchangFuben_Mediator";
      
      private var _senderProxy:BuchangFuben_MsgSendProxy;
      
      public function BuchangFuben_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BuchangFuben_ApplicationFacade.SHOW_BUCHANGFUBEN_PANEL];
      }
      
      private function get senderProxy() : BuchangFuben_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BuchangFuben_MsgSendProxy.NAME) as BuchangFuben_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BuchangFuben_ApplicationFacade.SHOW_BUCHANGFUBEN_PANEL:
               if(!Fun.isVisible(this.panel))
               {
                  this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
                  this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(this.panel);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : BuchangFubenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.buchangfubenPanel);
         }
         return viewComponent as BuchangFubenPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BuchangFubenPanel,function():void
         {
            panel.addEventListener(BuchangFubenPanel.UI_BUCHANGFUBENJINRU_CLICK,onHandle);
            panel.addEventListener(BuchangFubenPanel.UI_BUCHANGFUBENLINGQU_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(BuchangFubenPanel,function():void
         {
            panel.removeEventListener(BuchangFubenPanel.UI_BUCHANGFUBENJINRU_CLICK,onHandle);
            panel.removeEventListener(BuchangFubenPanel.UI_BUCHANGFUBENLINGQU_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case BuchangFubenPanel.UI_BUCHANGFUBENJINRU_CLICK:
               this.senderProxy.send_74363();
               break;
            case BuchangFubenPanel.UI_BUCHANGFUBENLINGQU_CLICK:
               this.senderProxy.send_74361();
         }
      }
   }
}

