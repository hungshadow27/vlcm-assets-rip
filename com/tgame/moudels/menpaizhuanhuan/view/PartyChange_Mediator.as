package com.tgame.moudels.menpaizhuanhuan.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.menpaizhuanhuan.model.PartyChange_MsgSenderProxy;
   import com.tgame.shell.view.components.xidushidai.OKChangePanel;
   import com.tgame.shell.view.components.xidushidai.PartyChangePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PartyChange_Mediator extends Mediator
   {
      
      public static const NAME:String = "PartyChange_Mediator";
      
      private var _OKChangePanel:OKChangePanel;
      
      private var index:int;
      
      private var _senderProxy:PartyChange_MsgSenderProxy;
      
      public function PartyChange_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : PartyChange_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(PartyChange_MsgSenderProxy.NAME) as PartyChange_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get partyChangePanel() : PartyChangePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyChangePanel);
         }
         return viewComponent as PartyChangePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PartyChangePanel,function():void
         {
            partyChangePanel.addEventListener(PartyChangePanel.UI_QUEDINGZHUANGHUAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PartyChangePanel,function():void
         {
            partyChangePanel.removeEventListener(PartyChangePanel.UI_QUEDINGZHUANGHUAN_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var e:Event = param1;
         var evt:BaseEvent = e as BaseEvent;
         this.index = evt.data as int;
         if(this._OKChangePanel == null)
         {
            this._OKChangePanel = new OKChangePanel();
            this._OKChangePanel.addEventListener(OKChangePanel.UI_QUEDING_CLICK,function(param1:Event):void
            {
               senderProxy.send_70561(index);
            });
         }
         this._OKChangePanel.setParty(this.index);
         this._OKChangePanel.x = (GameConfig.sceneWidth - this._OKChangePanel.width) / 2;
         this._OKChangePanel.y = (GameConfig.sceneHeight - this._OKChangePanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._OKChangePanel);
      }
   }
}

