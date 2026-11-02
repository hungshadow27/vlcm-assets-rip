package com.tgame.moudels.partyTask.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.partyTask.model.PartyTask_MsgSenderProxy;
   import com.tgame.shell.view.components.Party_task_InvitePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PartyTaskInvite_Mediator extends Mediator
   {
      
      public static const NAME:String = "PartyTaskInvite_Mediator";
      
      private var _senderProxy:PartyTask_MsgSenderProxy;
      
      public function PartyTaskInvite_Mediator()
      {
         super(NAME);
      }
      
      public function get uiPanel() : Party_task_InvitePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyTaskInvitePanel);
         }
         return viewComponent as Party_task_InvitePanel;
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
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:int = int(param1.getBody());
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
         UIEventsRegisterManager.addUIRegisterEvent(Party_task_InvitePanel,function():void
         {
            uiPanel.addEventListener(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK,uiHandle);
            uiPanel.addEventListener(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK_OK,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Party_task_InvitePanel,function():void
         {
            uiPanel.removeEventListener(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK,uiHandle);
            uiPanel.removeEventListener(Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK_OK,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK:
               this.senderProxy.send_53735(_loc3_);
               break;
            case Party_task_InvitePanel.UI_PARTYTASK_JIEQURENWU_CLICK_OK:
               this.senderProxy.send_53737(_loc3_);
         }
      }
   }
}

