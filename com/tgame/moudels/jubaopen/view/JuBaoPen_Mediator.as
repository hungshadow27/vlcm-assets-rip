package com.tgame.moudels.jubaopen.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jubaopen.JuBaoPen_ApplicationFacade;
   import com.tgame.moudels.jubaopen.model.JuBaoPen_MsgSenderProxy;
   import com.tgame.shell.view.components.JuBaoPenPanel;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JuBaoPen_Mediator extends Mediator
   {
      
      public static const NAME:String = "JuBaoPen_Mediator";
      
      private var _msgSenderProxy:JuBaoPen_MsgSenderProxy;
      
      public function JuBaoPen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get juBaoPenPanel() : JuBaoPenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.juBaoPenPanel);
         }
         return viewComponent as JuBaoPenPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [JuBaoPen_ApplicationFacade.SHOW_JUBAOPEN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case JuBaoPen_ApplicationFacade.SHOW_JUBAOPEN_PANEL:
               this.msgSenderProxy.send_59511();
         }
      }
      
      private function get msgSenderProxy() : JuBaoPen_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(JuBaoPen_MsgSenderProxy.NAME) as JuBaoPen_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(JuBaoPenPanel,function():void
         {
            juBaoPenPanel.addEventListener(Event.ADDED_TO_STAGE,juBaoPenHandle);
            juBaoPenPanel.addEventListener(JuBaoPenPanel.UI_JUBAOPEN_LINGQU_CLICK,juBaoPenHandle);
            juBaoPenPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JuBaoPenPanel,function():void
         {
            juBaoPenPanel.removeEventListener(Event.ADDED_TO_STAGE,juBaoPenHandle);
            juBaoPenPanel.removeEventListener(JuBaoPenPanel.UI_JUBAOPEN_LINGQU_CLICK,juBaoPenHandle);
            juBaoPenPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function juBaoPenHandle(param1:*) : void
      {
         var _loc3_:Array = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case JuBaoPenPanel.UI_JUBAOPEN_LINGQU_CLICK:
               this.msgSenderProxy.send_59513();
         }
      }
      
      private function panelClose(param1:FCloseEvent = null) : void
      {
      }
      
      public function setDate(param1:String, param2:String, param3:Number, param4:int) : void
      {
         this.juBaoPenPanel.setDate(param1,param2,param3,param4);
      }
   }
}

