package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.EquipRepairPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_RepairMediator extends Mediator
   {
      
      public static const NAME:String = "Item_RepairMediator";
      
      private var _sender:Item_MsgSenderProxy;
      
      public function Item_RepairMediator()
      {
         super(NAME);
      }
      
      protected function get repairPanel() : EquipRepairPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.repairPanel);
         }
         return viewComponent as EquipRepairPanel;
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.NPC_REQ_FUNCTION];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.NPC_REQ_FUNCTION:
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(EquipRepairPanel,function():void
         {
            repairPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            repairPanel.addEventListener(EquipRepairPanel.UI_EQUIPREPAIR_COMMONREPAIRBTN_CLICK,onListener);
            repairPanel.addEventListener(EquipRepairPanel.UI_EQUIPREPAIR_SPECIALREPAIRBTN_CLICK,onListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipRepairPanel,function():void
         {
            repairPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            repairPanel.removeEventListener(EquipRepairPanel.UI_EQUIPREPAIR_COMMONREPAIRBTN_CLICK,onListener);
            repairPanel.removeEventListener(EquipRepairPanel.UI_EQUIPREPAIR_SPECIALREPAIRBTN_CLICK,onListener);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.sender.send_50221(GameInstance.lockOnChar.id);
      }
      
      private function onListener(param1:BaseEvent) : void
      {
         switch(param1.type)
         {
            case EquipRepairPanel.UI_EQUIPREPAIR_COMMONREPAIRBTN_CLICK:
               this.sender.send_50223([1,GameInstance.lockOnChar.id]);
               break;
            case EquipRepairPanel.UI_EQUIPREPAIR_SPECIALREPAIRBTN_CLICK:
               this.sender.send_50223([2,GameInstance.lockOnChar.id]);
         }
      }
      
      public function showPrice(param1:int, param2:int) : void
      {
         this.repairPanel.setRepairPrice(param1,param2);
      }
      
      public function closeWindow() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._repair))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_REPAIR_PANEL);
         }
      }
   }
}

