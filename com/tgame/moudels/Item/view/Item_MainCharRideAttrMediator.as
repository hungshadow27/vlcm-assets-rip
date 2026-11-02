package com.tgame.moudels.Item.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.Item_TipProxy;
   import com.tgame.shell.view.components.RidePanel;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_MainCharRideAttrMediator extends Mediator
   {
      
      public static const NAME:String = "Item_MainChatRideAttrMediator";
      
      private var _itemTipProxy:Item_TipProxy;
      
      private var _sender:Item_MsgSenderProxy;
      
      public function Item_MainCharRideAttrMediator()
      {
         super(NAME);
      }
      
      public function get itemTipProxy() : Item_TipProxy
      {
         if(this._itemTipProxy == null)
         {
            this._itemTipProxy = facade.retrieveProxy(Item_TipProxy.NAME) as Item_TipProxy;
         }
         return this._itemTipProxy;
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      protected function get mainCharRidePanel() : RidePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ridePanel);
         }
         return viewComponent as RidePanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(RidePanel,function():void
         {
            mainCharRidePanel.addEventListener(RidePanel.UI_RIDE_EQUIP_CLICK,onClickEquipZone);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RidePanel,function():void
         {
            mainCharRidePanel.removeEventListener(RidePanel.UI_RIDE_EQUIP_CLICK,onClickEquipZone);
         });
      }
      
      private function onClickEquipZone(param1:*) : void
      {
         var itemFace:ItemFace = null;
         var good:Goods = null;
         var $evt:* = param1;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            itemFace = TCursorManager.currentItemFace;
            good = itemFace.getBaseItem() as Goods;
            if(good.quality >= 4 && good.bind == 0)
            {
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):*
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,0,ItemPositionRange.CONTAINER_MOUNT,GameInstance.mainCharData.mountInfo.selectedMountID]);
                  }
               },true);
            }
            else
            {
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,0,ItemPositionRange.CONTAINER_MOUNT,GameInstance.mainCharData.mountInfo.selectedMountID]);
            }
         }
         else if($evt.data.target is ItemFace)
         {
            sendNotification(Item_ApplicationFacade.ITEM_MOVE,[$evt.data.target,null,0,ItemPositionRange.CONTAINER_BAG,0,GameInstance.mainCharData.mountInfo.selectedMountID]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE && GameInstance.mainCharData.mountInfo.selectedMountID != -1)
         {
            itemFace = TCursorManager.currentItemFace;
            good = itemFace.getBaseItem() as Goods;
            if(good.quality >= 4 && good.bind == 0)
            {
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):*
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,0,ItemPositionRange.CONTAINER_MOUNT,GameInstance.mainCharData.mountInfo.selectedMountID]);
                     TCursorManager.resumFullMouse();
                  }
               },true);
            }
            else
            {
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,0,ItemPositionRange.CONTAINER_MOUNT,GameInstance.mainCharData.mountInfo.selectedMountID]);
               TCursorManager.resumFullMouse();
            }
         }
      }
      
      public function show() : void
      {
         var _loc1_:PureMount = GameInstance.mainCharData.mountInfo.selectedMount;
         var _loc2_:Array = _loc1_.mountGoodsInfo.fullGoodsArr;
         this.mainCharRidePanel.setRideEquip(_loc2_);
      }
   }
}

