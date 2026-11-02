package com.tgame.moudels.baguazhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.baguazhen.BaGuaZhen_ApplicationFacade;
   import com.tgame.moudels.baguazhen.model.BaGuaZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.baguazhen.BaGuaZhenPanel;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BaGuaZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "BaGuaZhen_Mediator";
      
      private var _senderProxy:BaGuaZhen_MsgSenderProxy;
      
      public function BaGuaZhen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : BaGuaZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BaGuaZhen_MsgSenderProxy.NAME) as BaGuaZhen_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : BaGuaZhenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.baGuaZhenPanel);
         }
         return viewComponent as BaGuaZhenPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BaGuaZhen_ApplicationFacade.GET_BAGUAZHEN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BaGuaZhen_ApplicationFacade.GET_BAGUAZHEN_PANEL:
               this.senderProxy.send_81831();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BaGuaZhenPanel,function():void
         {
            panel.addEventListener(BaGuaZhenPanel.BAGUAZHEN_JIHUO_CLICK,handler);
            panel.addEventListener(BaGuaZhenPanel.BAGUAZHEN_CHOOSE_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(BaGuaZhenPanel,function():void
         {
            panel.removeEventListener(BaGuaZhenPanel.BAGUAZHEN_JIHUO_CLICK,handler);
            panel.removeEventListener(BaGuaZhenPanel.BAGUAZHEN_CHOOSE_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case BaGuaZhenPanel.BAGUAZHEN_JIHUO_CLICK:
               this.senderProxy.send_81833(_loc2_.data as int);
               break;
            case BaGuaZhenPanel.BAGUAZHEN_CHOOSE_CLICK:
               this.senderProxy.send_81835(_loc2_.data as int);
         }
      }
      
      public function setBaGuaZhenData(param1:Object) : void
      {
         this.panel.setBaGuaZhenData(param1);
         UITools.showPanel(this.panel);
      }
   }
}

