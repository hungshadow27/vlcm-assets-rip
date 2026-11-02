package com.tgame.moudels.chaojilaba.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.chaojilaba.ChaoJiLaBa_ApplicationFacade;
   import com.tgame.moudels.chaojilaba.model.ChaoJiLaBa_MsgSendProxy;
   import com.tgame.shell.view.components.ChaoJiLaBaPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChaoJiLaBa_Mediator extends Mediator
   {
      
      public static const NAME:String = "ChaoJiLaBa_Mediator";
      
      private var _senderProxy:ChaoJiLaBa_MsgSendProxy;
      
      public function ChaoJiLaBa_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ChaoJiLaBa_ApplicationFacade.GET_CHAOJILABA_PANEL];
      }
      
      private function get senderProxy() : ChaoJiLaBa_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ChaoJiLaBa_MsgSendProxy.NAME) as ChaoJiLaBa_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ChaoJiLaBa_ApplicationFacade.GET_CHAOJILABA_PANEL:
               this.senderProxy.send_73771();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : ChaoJiLaBaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.chaojilabaPanel);
         }
         return viewComponent as ChaoJiLaBaPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ChaoJiLaBaPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(ChaoJiLaBaPanel.UI_CHAOJILABA_QUEREN,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ChaoJiLaBaPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(ChaoJiLaBaPanel.UI_CHAOJILABA_QUEREN,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:String = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case ChaoJiLaBaPanel.UI_CHAOJILABA_QUEREN:
               _loc3_ = _loc2_.data as String;
               this.senderProxy.send_73771(_loc3_);
         }
      }
      
      public function update() : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_CHAOJILABA_PANEL);
      }
   }
}

