package com.tgame.moudels.partyTask.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.partyTask.PartyTask_ApplicationFacade;
   import com.tgame.moudels.partyTask.model.PartyTask_MsgSenderProxy;
   import com.tgame.shell.view.components.Party_task_PrisePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PartyTaskComplete_Mediator extends Mediator
   {
      
      public static const NAME:String = "PartyTaskComplete_Mediator";
      
      private var _senderProxy:PartyTask_MsgSenderProxy;
      
      public function PartyTaskComplete_Mediator()
      {
         super(NAME);
      }
      
      public function get uipanel() : Party_task_PrisePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyTaskCompletePanel);
         }
         return viewComponent as Party_task_PrisePanel;
      }
      
      private function get senderProxy() : PartyTask_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(PartyTask_MsgSenderProxy.NAME) as PartyTask_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [PartyTask_ApplicationFacade.OPEN_JIAO_YABIAO_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:int = int(param1.getBody());
         switch(param1.getName())
         {
            case PartyTask_ApplicationFacade.OPEN_JIAO_YABIAO_PANEL:
               this.senderProxy.send_53739();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(Party_task_PrisePanel,function():void
         {
            uipanel.addEventListener(Party_task_PrisePanel.UI_PARTYTASK_COMPELERENWU_CLICK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Party_task_PrisePanel,function():void
         {
            uipanel.removeEventListener(Party_task_PrisePanel.UI_PARTYTASK_COMPELERENWU_CLICK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case Party_task_PrisePanel.UI_PARTYTASK_COMPELERENWU_CLICK:
               this.senderProxy.send_53741(_loc3_);
         }
      }
   }
}

