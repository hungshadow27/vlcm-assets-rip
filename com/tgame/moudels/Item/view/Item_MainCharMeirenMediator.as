package com.tgame.moudels.Item.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.shell.view.components.MeiRenPanel;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_MainCharMeirenMediator extends Mediator
   {
      
      public static const NAME:String = "Item_MainCharMeirenMediator";
      
      private var _backPackMediator:Item_BackpackMediator;
      
      public function Item_MainCharMeirenMediator()
      {
         super(NAME);
      }
      
      protected function get backPackMediator() : Item_BackpackMediator
      {
         if(this._backPackMediator == null)
         {
            this._backPackMediator = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMediator;
      }
      
      protected function get meirenPanel() : MeiRenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.meiren);
         }
         return viewComponent as MeiRenPanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(MeiRenPanel,function():void
         {
            meirenPanel.addEventListener(MeiRenPanel.UI_MEIRENPANEL_EQUIP_CLICK,onClickEquipZone);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MeiRenPanel,function():void
         {
            meirenPanel.removeEventListener(MeiRenPanel.UI_MEIRENPANEL_EQUIP_CLICK,onClickEquipZone);
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
            if(good != null)
            {
               if(good.quality >= 4 && good.bind == 0)
               {
                  FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,itemFace.getBaseItem().position1,ItemPositionRange.CONTAINER_GIRL,GameInstance.mainCharData.girlInfo.selectedGirlID]);
                     }
                  },true);
               }
               else
               {
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,itemFace.getBaseItem().position1,ItemPositionRange.CONTAINER_GIRL,GameInstance.mainCharData.girlInfo.selectedGirlID]);
               }
            }
         }
         else
         {
            itemFace = $evt.data.target as ItemFace;
            if(itemFace != null)
            {
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
               {
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOREN);
                  TCursorManager.removeLockOnMouseStatus();
                  TCursorManager.resumMouse();
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,itemFace.getBaseItem().position1,ItemPositionRange.CONTAINER_GIRL,GameInstance.mainCharData.girlInfo.selectedGirlID]);
                  TCursorManager.currentItemFace = null;
               }
               else
               {
                  this.backPackMediator.showItemMenu([$evt.data,itemFace.getBaseItem().position1,1]);
               }
            }
            else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE && GameInstance.mainCharData.girlInfo.selectedGirlID != -1)
            {
               itemFace = TCursorManager.currentItemFace;
               good = itemFace.getBaseItem() as Goods;
               FAlert.show("<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("该装备佩戴后将与您绑定。确定佩戴么？") + "</font>","",2,function(param1:FAlertEvent):*
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     sendNotification(Item_ApplicationFacade.ITEM_MOVE,[itemFace,null,itemFace.getBaseItem().position1,ItemPositionRange.CONTAINER_GIRL,GameInstance.mainCharData.girlInfo.selectedGirlID]);
                     TCursorManager.resumFullMouse();
                  }
               },true);
            }
         }
      }
   }
}

