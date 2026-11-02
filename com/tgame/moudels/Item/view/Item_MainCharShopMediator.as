package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_ItemProxy;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.PlayerShopPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_MainCharShopMediator extends Mediator
   {
      
      public static const NAME:String = "Item_MainCharShopMediator";
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _rideAttrPanel:Item_RideAttrMediator;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _itemProxy:Item_ItemProxy;
      
      private var _readyAddGood:Goods;
      
      private var _readyAddMount:PureMount;
      
      public function Item_MainCharShopMediator()
      {
         super(NAME);
      }
      
      public function get sender() : Item_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         }
         return this._sender;
      }
      
      public function get itemProxy() : Item_ItemProxy
      {
         if(this._itemProxy == null)
         {
            this._itemProxy = facade.retrieveProxy(Item_ItemProxy.NAME) as Item_ItemProxy;
         }
         return this._itemProxy;
      }
      
      protected function get shopPanel() : PlayerShopPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.mainCharShop);
         }
         return viewComponent as PlayerShopPanel;
      }
      
      private function get rideAttrPanel() : Item_RideAttrMediator
      {
         if(this._rideAttrPanel == null)
         {
            this._rideAttrPanel = facade.retrieveMediator(Item_RideAttrMediator.NAME) as Item_RideAttrMediator;
         }
         return this._rideAttrPanel;
      }
      
      protected function get backPackMediator() : Item_BackpackMediator
      {
         if(this._backPackMediator == null)
         {
            this._backPackMediator = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMediator;
      }
      
      protected function get backpack() : Backpack
      {
         return GameInstance.uiInstance.backpack;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.UPDATE_MOUNT_SHOP,Item_ApplicationFacade.SHOW_MOUNT_ATTR_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.UPDATE_MOUNT_SHOP:
               this.showMountShop();
               break;
            case Item_ApplicationFacade.SHOW_MOUNT_ATTR_PANEL:
               _loc3_ = _loc2_ as Array;
               this.rideAttrPanel.show(_loc3_[0],_loc3_[1]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PlayerShopPanel,function():void
         {
            shopPanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            shopPanel.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEMCANVAS_SHOW,showHandle);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDECANVAS_SHOW,showHandle);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEM_SHOWBTN_CLICK,onClickGoodUp);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEM_HIDE_OK,onClickGoodDown);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEM_SHOW_OK,onClickGoodUpComplete);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_NAME_MODIFY,onUpdateShopNameClick);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDELISTBTN_CLICK,onClickMountList);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDE_SHOWBTN_CLICK,onClickAddMount);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDE_SHOW_OK,onClickAddMountOK);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDE_HIDE_OK,onClickMountCancel);
            shopPanel.addEventListener(PlayerShopPanel.UI_SHOPPANEL_LOOK_RIDE_INFO,onClickRideDetail);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PlayerShopPanel,function():void
         {
            shopPanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            shopPanel.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEMCANVAS_SHOW,showHandle);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDECANVAS_SHOW,showHandle);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEM_SHOWBTN_CLICK,onClickGoodUp);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEM_HIDE_OK,onClickGoodDown);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_ITEM_SHOW_OK,onClickGoodUpComplete);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_NAME_MODIFY,onUpdateShopNameClick);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDELISTBTN_CLICK,onClickMountList);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDE_SHOWBTN_CLICK,onClickAddMount);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDE_SHOW_OK,onClickAddMountOK);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_RIDE_HIDE_OK,onClickMountCancel);
            shopPanel.removeEventListener(PlayerShopPanel.UI_SHOPPANEL_LOOK_RIDE_INFO,onClickRideDetail);
         });
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         TCursorManager.resumFullMouse();
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.showWalkShops();
         this.shopPanel.shopShowName = GameInstance.mainCharData.moneyInfo.shopName;
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.shopPanel,this.backpack);
      }
      
      private function showHandle(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case PlayerShopPanel.UI_SHOPPANEL_ITEMCANVAS_SHOW:
               this.showWalkShops();
               break;
            case PlayerShopPanel.UI_SHOPPANEL_RIDECANVAS_SHOW:
               this.showMountShop();
         }
      }
      
      private function onClickRideDetail(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.rideAttrPanel.show(GameInstance.mainChar.id,_loc2_);
      }
      
      private function onClickMountCancel(param1:BaseEvent) : void
      {
         var _loc2_:PureMount = param1.data as PureMount;
         this.sender.send_13019(_loc2_.id);
      }
      
      private function onClickAddMountOK(param1:BaseEvent) : void
      {
         this.sender.send_13007([this._readyAddMount.id,param1.data[0],param1.data[1]]);
      }
      
      private function onClickAddMount(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this._readyAddMount = GameInstance.mainCharData.mountInfo.getMount(_loc2_);
         this.shopPanel.showRideShowPanel(this._readyAddMount);
      }
      
      public function addMount(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:PureMount = new PureMount(param1);
         _loc4_.saleCopper = param2;
         _loc4_.saleGold = param3;
         GameInstance.mainCharData.mountInfo.mountShopArray.push(_loc4_);
         this.showMountShop();
      }
      
      private function onClickMountList(param1:BaseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc6_:PureMount = null;
         var _loc7_:XML = null;
         if(GameInstance.uiInstance._mainCharShop == null)
         {
            return;
         }
         var _loc2_:Array = GameInstance.mainCharData.mountInfo.mountArr;
         var _loc3_:XML = <list/>;
         var _loc5_:int = int(_loc2_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc6_ = _loc2_[_loc4_];
            _loc7_ = <node/>;
            _loc7_.@label = _loc6_.id;
            _loc7_.@rideName = _loc6_.name;
            _loc7_.@level = _loc6_.mountAttributeInfo.lv;
            _loc7_.@quality = _loc6_.mountAttributeInfo.quality;
            _loc7_.@state = _loc6_.fightStatus;
            _loc3_.appendChild(_loc7_);
            _loc4_++;
         }
         this.shopPanel.showRideListPanel(_loc3_);
      }
      
      private function onUpdateShopNameClick(param1:BaseEvent) : void
      {
         var _loc2_:String = param1.data.toString();
         this.sender.send_13015(_loc2_);
      }
      
      private function onClickGoodDown(param1:BaseEvent) : void
      {
         var _loc2_:Goods = param1.data as Goods;
         sendNotification(Item_ApplicationFacade.ITEM_MOVE,[new ItemFace(_loc2_),null,0,ItemPositionRange.CONTAINER_BAG]);
      }
      
      private function onClickGoodUpComplete(param1:BaseEvent) : void
      {
         if(!this._readyAddGood)
         {
            return;
         }
         this.sender.send_13001([this._readyAddGood.position,Number(param1.data[0]),Number(param1.data[1]),0]);
      }
      
      private function onClickGoodUp(param1:BaseEvent) : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.resumFullMouse();
            TCursorManager.showCursor(TCursorManager.CURSOR_SHANGJIA);
            TCursorManager.lockOnMouseStatus();
         }
         else
         {
            TCursorManager.resumFullMouse();
         }
      }
      
      public function showGoodAddedPanel(param1:BaseItem) : void
      {
         if(GameInstance.mainCharData.goodsInfo.goodsWalkShopArr.length >= 10)
         {
            NoticeManager.notify(NoticeManager.ALERT,LanResManager.getLanCommonTextWords("在售物品已经达到上限10件，请先下架部分货物!"));
            return;
         }
         this._readyAddGood = param1 as Goods;
         this.shopPanel.showItemShowPanel(this._readyAddGood);
      }
      
      public function showWalkShops() : void
      {
         var _loc1_:Array = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Goods = null;
         if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
         {
            _loc1_ = GameInstance.mainCharData.goodsInfo.goodsWalkShopArr;
            _loc3_ = int(_loc1_.length);
            _loc5_ = [];
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc6_ = _loc1_[_loc2_];
               _loc4_ = new Object();
               _loc4_.label = _loc6_.id;
               _loc4_.item = _loc6_;
               _loc4_.copper = _loc6_.saleCopper;
               _loc4_.silver = _loc6_.saleGold;
               _loc5_.push(_loc4_);
               _loc2_++;
            }
            this.shopPanel.showItem();
            this.shopPanel.setitemList(_loc5_);
         }
      }
      
      public function updateShopName(param1:String) : void
      {
         GameInstance.mainCharData.moneyInfo.shopName = param1;
         this.shopPanel.shopShowName = param1;
      }
      
      private function showMountShop() : void
      {
         var _loc3_:int = 0;
         var _loc5_:Object = null;
         if(GameInstance.uiInstance._mainCharShop == null)
         {
            return;
         }
         if(!Fun.isVisible(GameInstance.uiInstance._mainCharShop))
         {
            return;
         }
         var _loc1_:Array = GameInstance.mainCharData.mountInfo.mountShopArray;
         var _loc2_:Array = [];
         var _loc4_:int = int(_loc1_.length);
         _loc3_ = 0;
         while(_loc3_ < _loc4_)
         {
            _loc5_ = new Object();
            _loc5_.label = _loc1_[_loc3_].id;
            _loc5_.ride = _loc1_[_loc3_];
            _loc5_.copper = _loc1_[_loc3_].saleCopper;
            _loc5_.silver = _loc1_[_loc3_].saleGold;
            _loc2_.push(_loc5_);
            _loc3_++;
         }
         this.shopPanel.showRide();
         this.shopPanel.setRideList(_loc2_);
      }
      
      public function showSaleConfig(param1:String) : void
      {
         this.shopPanel.setSellLog(param1);
      }
   }
}

