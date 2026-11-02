package com.tgame.moudels.Item.view
{
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.Item_TipProxy;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.FriendPanel;
   import com.tgame.shell.view.components.friend.LargessFlowerPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_SendFlowerMediator extends Mediator
   {
      
      public static const NAME:String = "Item_SendFlowerMediator";
      
      private var _currentFlowers:Array = [];
      
      private var _itemTipProxy:Item_TipProxy;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var roleID:int;
      
      public function Item_SendFlowerMediator()
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
      
      protected function get friendPanel() : FriendPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.friendPanel);
         }
         return viewComponent as FriendPanel;
      }
      
      private function get backPack() : Backpack
      {
         return GameInstance.uiInstance.backpack;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.SHOW_SEND_FLOWER_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.SHOW_SEND_FLOWER_PANEL:
               this.clear();
               _loc3_ = _loc2_ as Array;
               this.roleID = _loc3_[0];
               this.friendPanel.showLargessFlwoerPanel(_loc3_[0],_loc3_[1],_loc3_[2]);
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.friendPanel,this.backPack);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(FriendPanel,function():void
         {
            friendPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            friendPanel.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_LARGEWW_FLOWER_PANEL_CLICK,onClickFlowerZone);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FriendPanel,function():void
         {
            friendPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            friendPanel.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_LARGEWW_FLOWER_PANEL_CLICK,onClickFlowerZone);
         });
         UIEventsRegisterManager.addUIRegisterEvent(LargessFlowerPanel,function():void
         {
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_LARGESS_OK_BTN_CLICK,onClickSendFlower);
            friendPanel.addEventListener(FriendPanel.UI_FRIEND_SELECT_FLOWER_BTN_CLICK,onClickSelectFlower);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LargessFlowerPanel,function():void
         {
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_LARGESS_OK_BTN_CLICK,onClickSendFlower);
            friendPanel.removeEventListener(FriendPanel.UI_FRIEND_SELECT_FLOWER_BTN_CLICK,onClickSelectFlower);
         });
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         TCursorManager.resumFullMouse();
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.clear();
         ResizeManager.showDoublePanel(this.friendPanel,this.backPack);
      }
      
      private function clear() : void
      {
         this._currentFlowers = [];
         this.friendPanel.setFlowers(this._currentFlowers);
      }
      
      private function onClickSelectFlower(param1:BaseEvent) : void
      {
         TCursorManager.resumFullMouse();
         TCursorManager.showCursor(TCursorManager.CURSOR_XUANZEHUA);
         TCursorManager.lockOnMouseStatus();
      }
      
      private function onClickSendFlower(param1:BaseEvent) : void
      {
         this.sender.send_10377([this.roleID,this._currentFlowers]);
         this.clear();
         TCursorManager.resumFullMouse();
      }
      
      private function onClickFlowerZone(param1:BaseEvent) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:ItemFace = param1.data.target as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            _loc2_ = TCursorManager.currentItemFace;
            this.addFlower(_loc2_.getBaseItem());
         }
         else if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getBaseItem() as Goods;
            this.removeFlowerGoods(_loc3_);
            this.friendPanel.setFlowers(this._currentFlowers);
         }
      }
      
      public function addFlower(param1:BaseItem) : void
      {
         var _loc2_:Goods = param1 as Goods;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.id != SpecialGoodsID.FLOWER_1 && _loc2_.id != SpecialGoodsID.FLOWER_2 && _loc2_.id != SpecialGoodsID.FLOWER_3 && _loc2_.id != SpecialGoodsID.FLOWER_4 && _loc2_.id != SpecialGoodsID.FLOWER_5 && _loc2_.id != SpecialGoodsID.FLOWER_6)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("该道具不是玫瑰花，不能赠送！"));
            return;
         }
         if(this._currentFlowers.length >= 6)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("玫瑰花已满，不能再添加了！"));
            return;
         }
         if(this.addFlowerGoods(_loc2_))
         {
            this.friendPanel.setFlowers(this._currentFlowers);
         }
      }
      
      private function addFlowerGoods(param1:Goods) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._currentFlowers.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this._currentFlowers[_loc2_].position == param1.position)
            {
               return false;
            }
            _loc2_++;
         }
         this._currentFlowers.push(param1);
         return true;
      }
      
      private function removeFlowerGoods(param1:Goods) : void
      {
         var _loc2_:int = this._currentFlowers.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._currentFlowers.splice(_loc2_,1);
         }
      }
   }
}

