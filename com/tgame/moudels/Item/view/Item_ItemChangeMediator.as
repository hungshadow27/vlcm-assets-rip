package com.tgame.moudels.Item.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.WuxieZhijingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_ItemChangeMediator extends Mediator
   {
      
      public static const NAME:String = "Item_ItemChangeMediator";
      
      private var item:Goods;
      
      private var _sender:Item_MsgSenderProxy;
      
      public function Item_ItemChangeMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : WuxieZhijingPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.wuxieZhijingPanel);
         }
         return viewComponent as WuxieZhijingPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.GOODS_CHANGE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.GOODS_CHANGE:
               if(!Fun.isVisible(GameInstance.uiInstance._wuxieZhijingPanel) || !this.item)
               {
                  return;
               }
               _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.item.position);
               if(_loc3_ != this.item)
               {
                  this.quChu();
               }
         }
      }
      
      public function setChangeItem(param1:int, param2:Array) : void
      {
         var _loc3_:int = 0;
         if(!this.item)
         {
            return;
         }
         if(GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1) != this.item)
         {
            return;
         }
         _loc3_ = 0;
         while(_loc3_ < param2.length)
         {
            if(param2[_loc3_].id == this.item.id)
            {
               param2.splice(_loc3_,1);
               break;
            }
            _loc3_++;
         }
         this.panel.setGoods1(this.item);
         this.panel.SetInitializeUi(param2);
      }
      
      public function itemChangeComplete(param1:int) : void
      {
         this.quChu();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WuxieZhijingPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.addEventListener(WuxieZhijingPanel.UI_WUPINE_OPTION_PANEL_STONE_CLICK,panelHandle);
            panel.addEventListener(WuxieZhijingPanel.UI_WUPIN_OPTION_PANEL_DRAG_ENTER,panelHandle);
            panel.addEventListener(WuxieZhijingPanel.UI_WUXIEZHIJING_CLICK,panelHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WuxieZhijingPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.removeEventListener(WuxieZhijingPanel.UI_WUPINE_OPTION_PANEL_STONE_CLICK,panelHandle);
            panel.removeEventListener(WuxieZhijingPanel.UI_WUPIN_OPTION_PANEL_DRAG_ENTER,panelHandle);
            panel.removeEventListener(WuxieZhijingPanel.UI_WUXIEZHIJING_CLICK,panelHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null) : void
      {
         ResizeManager.hideDoublePanel();
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.openBackpack();
               break;
            case WuxieZhijingPanel.UI_WUPINE_OPTION_PANEL_STONE_CLICK:
               this.quChu();
               break;
            case WuxieZhijingPanel.UI_WUPIN_OPTION_PANEL_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.item = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.sender.send_53771(this.item.position);
               }
               break;
            case WuxieZhijingPanel.UI_WUXIEZHIJING_CLICK:
               if(!this.item)
               {
                  return;
               }
               this.sender.send_53773({
                  "index":this.item.position,
                  "id":_loc2_.data as int
               });
         }
      }
      
      private function quChu() : void
      {
         this.item = null;
         this.panel.setGoods1();
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
   }
}

