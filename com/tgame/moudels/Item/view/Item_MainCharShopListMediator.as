package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.WalkShop;
   import com.tgame.common.vo.item.WalkShopDetail;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_ItemProxy;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.OtherPlayerShopPanel;
   import com.tgame.shell.view.components.PlayerShopListPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_MainCharShopListMediator extends Mediator
   {
      
      public static const NAME:String = "Item_MainCharShopListMediator";
      
      private var _currentWalkShopDetail:WalkShopDetail;
      
      private var _currentPage:int = 1;
      
      private var _pageTotal:int;
      
      private var _otherRoleID:int;
      
      private var _currentBuyGood:Goods;
      
      private var _currentBuyMount:PureMount;
      
      private var _searchType:int = 10;
      
      private var _searchTxt:String = "";
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _rideAttrMeditor:Item_RideAttrMediator;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _itemProxy:Item_ItemProxy;
      
      private var _otherCharWalkShop:OtherPlayerShopPanel;
      
      private var _loadBuffer:LoadBuffer;
      
      public function Item_MainCharShopListMediator()
      {
         super(NAME);
      }
      
      protected function get rideAttrMeditor() : Item_RideAttrMediator
      {
         if(this._rideAttrMeditor == null)
         {
            this._rideAttrMeditor = facade.retrieveMediator(Item_RideAttrMediator.NAME) as Item_RideAttrMediator;
         }
         return this._rideAttrMeditor;
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
      
      private function get otherCharWalkShop() : OtherPlayerShopPanel
      {
         if(this._otherCharWalkShop == null)
         {
            this._otherCharWalkShop = GameInstance.uiInstance.otherCharShop;
         }
         return this._otherCharWalkShop;
      }
      
      protected function get shopListPanel() : PlayerShopListPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.walkShopListPanel);
         }
         return viewComponent as PlayerShopListPanel;
      }
      
      protected function get backPackMediator() : Item_BackpackMediator
      {
         if(this._backPackMediator == null)
         {
            this._backPackMediator = facade.retrieveMediator(Item_BackpackMediator.NAME) as Item_BackpackMediator;
         }
         return this._backPackMediator;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.LOOK_OTHERCHAR_SHOP_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.LOOK_OTHERCHAR_SHOP_PANEL:
               this.onShowDetailWalkShopClick(new BaseEvent("","",_loc2_));
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(PlayerShopListPanel,function():void
         {
            shopListPanel.addEventListener(Event.ADDED_TO_STAGE,onAdded);
            shopListPanel.addEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_LOOKBTN_CLICK,onShowDetailWalkShopClick);
            shopListPanel.addEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_PAGE,onPageClick);
            shopListPanel.addEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_REFRESHBTN_CLICK,onRefreshClick);
            shopListPanel.addEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_INFOBTN_CLICK,onLookPlayerInfo);
            shopListPanel.addEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_SEARCH,onSearchClick);
         });
         UIEventsRegisterManager.addUIRemovedEvent(PlayerShopListPanel,function():void
         {
            shopListPanel.removeEventListener(Event.ADDED_TO_STAGE,onAdded);
            shopListPanel.removeEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_LOOKBTN_CLICK,onShowDetailWalkShopClick);
            shopListPanel.removeEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_PAGE,onPageClick);
            shopListPanel.removeEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_REFRESHBTN_CLICK,onRefreshClick);
            shopListPanel.removeEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_INFOBTN_CLICK,onLookPlayerInfo);
            shopListPanel.removeEventListener(PlayerShopListPanel.UI_BACKPACK_PLAYERSHOPLIST_SEARCH,onSearchClick);
         });
         UIEventsRegisterManager.addUIRegisterEvent(OtherPlayerShopPanel,function():void
         {
            otherCharWalkShop.addEventListener(Event.ADDED_TO_STAGE,onAddedOtherCharWalkShop);
            otherCharWalkShop.addEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_ITEMCANVAS_SHOW,showHandle);
            otherCharWalkShop.addEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_RIDECANVAS_SHOW,showHandle);
            otherCharWalkShop.addEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_ITEM_BUY,onItemBuyOK);
            otherCharWalkShop.addEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_ITEM_BUYBTN_CLICK,onItemBuyClick);
            otherCharWalkShop.addEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_RIDE_BUYBTN_CLICK,onClickBuyMount);
            otherCharWalkShop.addEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_RIDE_BUY,onClickBuyMountOK);
            otherCharWalkShop.addEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_LOOK_RIDE_INFO,onClickRideDetail);
         });
         UIEventsRegisterManager.addUIRemovedEvent(OtherPlayerShopPanel,function():void
         {
            otherCharWalkShop.removeEventListener(Event.ADDED_TO_STAGE,onAddedOtherCharWalkShop);
            otherCharWalkShop.removeEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_ITEMCANVAS_SHOW,showHandle);
            otherCharWalkShop.removeEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_RIDECANVAS_SHOW,showHandle);
            otherCharWalkShop.removeEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_ITEM_BUY,onItemBuyOK);
            otherCharWalkShop.removeEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_ITEM_BUYBTN_CLICK,onItemBuyClick);
            otherCharWalkShop.removeEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_RIDE_BUYBTN_CLICK,onClickBuyMount);
            otherCharWalkShop.removeEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_RIDE_BUY,onClickBuyMountOK);
            otherCharWalkShop.removeEventListener(OtherPlayerShopPanel.UI_SHOPPANEL_LOOK_RIDE_INFO,onClickRideDetail);
         });
      }
      
      private function showHandle(param1:Event) : void
      {
         var _loc2_:String = null;
         if(this._otherRoleID > 0)
         {
            _loc2_ = param1.type;
            switch(_loc2_)
            {
               case OtherPlayerShopPanel.UI_SHOPPANEL_ITEMCANVAS_SHOW:
                  this.otherCharWalkShop.showItem();
                  this.sender.send_13011(this._otherRoleID);
                  break;
               case OtherPlayerShopPanel.UI_SHOPPANEL_RIDECANVAS_SHOW:
                  this.otherCharWalkShop.showRide();
                  this.sender.send_13011(this._otherRoleID);
            }
         }
      }
      
      private function onSearchClick(param1:BaseEvent) : void
      {
         var _loc2_:Array = param1.data as Array;
         this._searchType = _loc2_[0];
         this._searchTxt = _loc2_[1];
         this._currentPage = 1;
         this.sender.send_13005([this._currentPage,this._searchType,this._searchTxt]);
      }
      
      private function onLookPlayerInfo(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         GameInstance.lookPlayerID = _loc2_;
         if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
         }
         PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
      }
      
      private function onRefreshClick(param1:BaseEvent) : void
      {
         this._searchType = 10;
         this._searchTxt = "";
         this.sender.send_13005([this._currentPage,this._searchType,this._searchTxt]);
      }
      
      private function onClickRideDetail(param1:BaseEvent) : void
      {
         this.rideAttrMeditor.show(this._otherRoleID,Number(param1.data));
      }
      
      private function onAdded(param1:Event) : void
      {
         this.onRefreshClick(null);
      }
      
      private function onAddedOtherCharWalkShop(param1:Event) : void
      {
         this.clear();
         this.otherCharWalkShop.showItem();
      }
      
      private function onClickBuyMount(param1:BaseEvent) : void
      {
         var _loc2_:PureMount = param1.data as PureMount;
         this._currentBuyMount = _loc2_;
         var _loc3_:Object = this._currentWalkShopDetail.getDetailByIDMount(this._currentBuyMount.id);
         this.otherCharWalkShop.showRideBuyPanel(this._currentBuyMount,_loc3_.copper,_loc3_.silver);
      }
      
      private function onClickBuyMountOK(param1:BaseEvent) : void
      {
         var _loc2_:Object = this._currentWalkShopDetail.getDetailByIDMount(this._currentBuyMount.id);
         this.sender.send_13013([this._otherRoleID,this._currentBuyMount.id,this._currentBuyMount.res.id_kind,_loc2_.copper,_loc2_.silver]);
      }
      
      private function onItemBuyOK(param1:BaseEvent) : void
      {
         var _loc2_:int = param1.data as int;
         var _loc3_:Object = this._currentWalkShopDetail.getDetailByIndex(this._currentBuyGood.position);
         this.sender.send_13003([this._otherRoleID,this._currentBuyGood.position,_loc3_.label,_loc3_.copper,_loc3_.silver,_loc2_]);
      }
      
      private function onItemBuyClick(param1:BaseEvent) : void
      {
         var _loc2_:Goods = param1.data as Goods;
         this._currentBuyGood = _loc2_;
         var _loc3_:Object = this._currentWalkShopDetail.getDetailByIndex(this._currentBuyGood.position);
         this.otherCharWalkShop.showItemBuyPanel(this._currentBuyGood,_loc3_.copper,_loc3_.silver);
      }
      
      private function onPageClick(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         if(_loc2_ == 1)
         {
            this._currentPage = 1;
         }
         else if(_loc2_ == 2)
         {
            --this._currentPage;
         }
         else if(_loc2_ == 3)
         {
            ++this._currentPage;
         }
         else if(_loc2_ == 4)
         {
            this._currentPage = this._pageTotal;
         }
         this.sender.send_13005([this._currentPage,this._searchType,this._searchTxt]);
         this._loadBuffer = LoadBuffer.show(this.shopListPanel);
      }
      
      private function onShowDetailWalkShopClick(param1:BaseEvent) : void
      {
         this._otherRoleID = Number(param1.data);
         if(this._otherRoleID > 0)
         {
            if(!Fun.isVisible(GameInstance.uiInstance._otherCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_OTHERCHAR_SHOP_PANEL);
            }
            this.sender.send_13011(this._otherRoleID);
         }
      }
      
      public function updateList(param1:Array, param2:int, param3:int, param4:int) : void
      {
         var xml:XML;
         var len:int;
         var i:int = 0;
         var walkShop:WalkShop = null;
         var singleXML:XML = null;
         var $walkShopArray:Array = param1;
         var $pageTotal:int = param2;
         var $pageCurrent:int = param3;
         var $tanweiTotal:int = param4;
         this._pageTotal = $pageTotal;
         xml = <xml/>;
         len = int($walkShopArray.length);
         i = 0;
         while(i < len)
         {
            walkShop = $walkShopArray[i];
            singleXML = <node/>;
            singleXML.@label = walkShop.roleID;
            singleXML.@shopNO = ($pageCurrent - 1) * 10 + i;
            singleXML.@shopName = walkShop.shopName;
            singleXML.@shopper = walkShop.roleName;
            singleXML.@level = walkShop.roleLevel;
            singleXML.@itemCount = walkShop.saleGoodCount;
            singleXML.@rideCount = walkShop.saleMountCount;
            xml.appendChild(singleXML);
            i++;
         }
         this._currentPage = $pageCurrent;
         if($pageCurrent == $pageTotal)
         {
            this.shopListPanel.setShopList(xml,$pageTotal,$pageCurrent,false,true);
         }
         else if($pageCurrent == 1)
         {
            this.shopListPanel.setShopList(xml,$pageTotal,$pageCurrent,true,false);
         }
         else
         {
            this.shopListPanel.setShopList(xml,$pageTotal,$pageCurrent);
         }
         this.shopListPanel.setShopTotal($tanweiTotal);
         TimerManager.createOneOffTimer(1000,1,null,null,function():void
         {
            if(_loadBuffer)
            {
               _loadBuffer.close();
            }
         });
      }
      
      public function updateDetail(param1:WalkShopDetail) : void
      {
         this.clear();
         this._currentWalkShopDetail = param1;
         this.otherCharWalkShop.setitemList(this._currentWalkShopDetail.goods);
         this.otherCharWalkShop.setRideList(this._currentWalkShopDetail.mounts);
         this.otherCharWalkShop.shopShowName = this._currentWalkShopDetail.shopName;
      }
      
      public function clear() : void
      {
         this.otherCharWalkShop.setitemList([]);
         this.otherCharWalkShop.setRideList([]);
         this.otherCharWalkShop.shopShowName = LanResManager.getLanCommonTextWords("无");
      }
   }
}

