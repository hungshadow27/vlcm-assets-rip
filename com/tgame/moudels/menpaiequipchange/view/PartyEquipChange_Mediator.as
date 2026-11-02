package com.tgame.moudels.menpaiequipchange.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.menpaiequipchange.PartyEquipChange_ApplicationFacade;
   import com.tgame.moudels.menpaiequipchange.model.PartyEquipChange_MsgSenderProxy;
   import com.tgame.shell.view.components.xidushidai.EquipPartyChangePanel;
   import com.tgame.shell.view.components.xidushidai.jinruBaituoshanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PartyEquipChange_Mediator extends Mediator
   {
      
      public static const NAME:String = "PartyEquipChange_Mediator";
      
      private var index:int;
      
      private var data:Object = {};
      
      private var _jinruBaituoshanPanel:jinruBaituoshanPanel;
      
      private var _senderProxy:PartyEquipChange_MsgSenderProxy;
      
      public function PartyEquipChange_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : PartyEquipChange_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(PartyEquipChange_MsgSenderProxy.NAME) as PartyEquipChange_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get partyEquipChangePanel() : EquipPartyChangePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.partyEquipChangePanel);
         }
         return viewComponent as EquipPartyChangePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [PartyEquipChange_ApplicationFacade.BAITUOSHANXIA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case PartyEquipChange_ApplicationFacade.BAITUOSHANXIA:
               this.setBaituoshanPanel();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(EquipPartyChangePanel,function():void
         {
            partyEquipChangePanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            partyEquipChangePanel.addEventListener(EquipPartyChangePanel.UI_EQUIP_PUT_CLICK,handler);
            partyEquipChangePanel.addEventListener(EquipPartyChangePanel.UI_EQUIP_GET_CLICK,handler);
            partyEquipChangePanel.addEventListener(EquipPartyChangePanel.UI_ZHUANHUAN_START_CLICK,handler);
            partyEquipChangePanel.addEventListener(FCloseEvent.CLOSE,panelClose);
            partyEquipChangePanel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(EquipPartyChangePanel,function():void
         {
            partyEquipChangePanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            partyEquipChangePanel.removeEventListener(EquipPartyChangePanel.UI_EQUIP_PUT_CLICK,handler);
            partyEquipChangePanel.removeEventListener(EquipPartyChangePanel.UI_EQUIP_GET_CLICK,handler);
            partyEquipChangePanel.removeEventListener(EquipPartyChangePanel.UI_ZHUANHUAN_START_CLICK,handler);
            partyEquipChangePanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            partyEquipChangePanel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      public function panelClose(param1:* = null) : void
      {
         this.resumMouseStatus();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.partyEquipChangePanel,GameInstance.uiInstance.backpack);
               this.partyEquipChangePanel.reset();
               break;
            case EquipPartyChangePanel.UI_EQUIP_PUT_CLICK:
               this.index = _loc2_.data as int;
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case EquipPartyChangePanel.UI_EQUIP_GET_CLICK:
               this.getItems();
               break;
            case EquipPartyChangePanel.UI_ZHUANHUAN_START_CLICK:
               this.senderProxy.send_70565(this.data);
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.partyEquipChangePanel,GameInstance.uiInstance.backpack);
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
            if(param2.res.kind != GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               return;
            }
         }
         this.data.position = param2.position;
         this.data.ID = param2.id;
         this.data.index = this.index;
         this.senderProxy.send_70563(this.data);
         this.mouseToNormal();
      }
      
      public function setEquip(param1:int, param2:int) : void
      {
         var _loc3_:Goods = new Goods(param1);
         var _loc4_:Goods = new Goods(param2);
         this.partyEquipChangePanel.setEquip(_loc3_,_loc4_);
      }
      
      public function setEnergyExpendItem(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         this.partyEquipChangePanel.setEnergyExpendItem(param2,param3,param4,_loc5_.count > 0,_loc5_);
      }
      
      private function getItems() : void
      {
         this.partyEquipChangePanel.reset();
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
      }
      
      public function onClosePanel() : void
      {
         this.partyEquipChangePanel.onClosePanel();
      }
      
      public function setBaituoshanPanel() : void
      {
         if(this._jinruBaituoshanPanel == null)
         {
            this._jinruBaituoshanPanel = new jinruBaituoshanPanel();
            this._jinruBaituoshanPanel.addEventListener(jinruBaituoshanPanel.UI_JINRUBAITUOSHAN_CLICK,function(param1:Event):void
            {
               senderProxy.send_70567();
            });
         }
         this._jinruBaituoshanPanel.x = (GameConfig.sceneWidth - this._jinruBaituoshanPanel.width) / 2;
         this._jinruBaituoshanPanel.y = (GameConfig.sceneHeight - this._jinruBaituoshanPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jinruBaituoshanPanel);
      }
   }
}

