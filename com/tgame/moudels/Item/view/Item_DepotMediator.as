package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemMenuStatus;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_ItemProxy;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.DepotPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_DepotMediator extends Mediator
   {
      
      public static const NAME:String = "Item_DepotMediator";
      
      private var itemMenu:Menu;
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _readyActiveCount:int;
      
      private var _allowSort:Boolean = true;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _itemProxy:Item_ItemProxy;
      
      public function Item_DepotMediator()
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
      
      protected function get depot() : DepotPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.depot);
         }
         return viewComponent as DepotPanel;
      }
      
      private function get backPack() : Backpack
      {
         return GameInstance.uiInstance.backpack;
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
         return [Item_ApplicationFacade.NPC_REQ_FUNCTION,Item_ApplicationFacade.GUIHUN_XUNZHANG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc3_ = Number(_loc2_);
               if(_loc3_ != NpcFunctionType.DEPOT)
               {
                  return;
               }
               if(!Fun.isVisible(GameInstance.uiInstance._depot))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
               }
               break;
            case Item_ApplicationFacade.GUIHUN_XUNZHANG:
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,_loc2_ as int,ItemPositionRange.CONTAINER_HUNHUAN]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function initDepot() : void
      {
         if(GameInstance.uiInstance._depot != null)
         {
            this.depot.setDepotCount(GameInstance.mainCharData.attributeInfo.depotCount);
            this.depot.setMoney(GameInstance.mainCharData.moneyInfo.depotCopper);
         }
      }
      
      public function updateMoney() : void
      {
         if(GameInstance.uiInstance._depot != null)
         {
            this.depot.setMoney(GameInstance.mainCharData.moneyInfo.depotCopper);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DepotPanel,function():void
         {
            depot.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            depot.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_CLICK,onDepotPanelClick);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_DRAG_STRAT,onStartDragClick);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_NEATEN,onUpdateDepot);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_SAVEBTN_CLICK,onShowSaveMoneyPanel);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_GETBTN_CLICK,onShowGetMoneyPanel);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_GET,onGetMoneyPanel);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_SAVE,onSaveMoneyPanel);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_BATCHSAVE_GET,onGetOrSaveItem);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_JIHUO_DEPOT,onActiveDepot);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_GET_ITEM,onSwitchDepot);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_RIDEDEPOTPANELBTN_CLICK,onClickRideDepotPanel);
            depot.addEventListener(DepotPanel.UI_DEPOTPANEL_JIHUO_DEPOT_OK,onClickActiveDepotOK);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DepotPanel,function():void
         {
            depot.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            depot.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_CLICK,onDepotPanelClick);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_DRAG_STRAT,onStartDragClick);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_NEATEN,onUpdateDepot);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_SAVEBTN_CLICK,onShowSaveMoneyPanel);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_GETBTN_CLICK,onShowGetMoneyPanel);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_GET,onGetMoneyPanel);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_SAVE,onSaveMoneyPanel);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_BATCHSAVE_GET,onGetOrSaveItem);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_JIHUO_DEPOT,onActiveDepot);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_GET_ITEM,onSwitchDepot);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_RIDEDEPOTPANELBTN_CLICK,onClickRideDepotPanel);
            depot.removeEventListener(DepotPanel.UI_DEPOTPANEL_JIHUO_DEPOT_OK,onClickActiveDepotOK);
         });
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         TCursorManager.resumFullMouse();
         if(this.itemMenu != null)
         {
            this.itemMenu.destroy();
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.initDepot();
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.depot,this.backPack);
         if(Fun.isVisible(GameInstance.uiInstance._rideDepotPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_RIDE_DEPOT_PANEL);
         }
         var _loc2_:Array = GameInstance.mainCharData.goodsInfo.pageDepot(0);
         this.depot.setItem(_loc2_);
      }
      
      private function onClickRideDepotPanel(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_RIDE_DEPOT_PANEL);
      }
      
      private function onSwitchDepot(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.showItemDepot(_loc2_ - 1);
         ExchangePositionManager.depotCount = _loc2_;
      }
      
      private function onActiveDepot(param1:BaseEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.attributeInfo.depotCount + 1;
         var _loc3_:int = _loc2_ <= 5 ? SpecialGoodsID.KUOZHANFU : SpecialGoodsID.KUOZHANFU_SUPER;
         var _loc4_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc3_,true);
         var _loc5_:Goods = new Goods(_loc3_);
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc3_,true,true);
         _loc5_.count = _loc4_;
         if(_loc2_ == 2 && _loc4_ < 2)
         {
            this.depot.showJiHuoPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ == 3 && _loc4_ < 6)
         {
            this.depot.showJiHuoPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ == 4 && _loc4_ < 18)
         {
            this.depot.showJiHuoPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ == 5 && _loc4_ < 50)
         {
            this.depot.showJiHuoPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ >= 6 && _loc4_ < 1)
         {
            this.depot.showJiHuoPanel(_loc2_,_loc5_,false);
            return;
         }
         this._readyActiveCount = _loc2_;
         this.depot.showJiHuoPanel(_loc2_,_loc6_);
      }
      
      private function onClickActiveDepotOK(param1:BaseEvent) : void
      {
         this.sender.send_11191(this._readyActiveCount);
      }
      
      public function r_activeDepot(param1:int) : void
      {
         this.depot.setDepotCount(param1);
      }
      
      private function onGetOrSaveItem(param1:BaseEvent) : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.resumFullMouse();
            TCursorManager.showCursor(TCursorManager.CURSOR_PLCQ);
            TCursorManager.lockOnMouseStatus();
         }
      }
      
      private function onSaveMoneyPanel(param1:BaseEvent) : void
      {
         this.sender.send_11193(Number(param1.data));
      }
      
      private function onShowSaveMoneyPanel(param1:BaseEvent) : void
      {
         this.depot.showSavePanel(GameInstance.mainCharData.moneyInfo.copper);
      }
      
      private function onGetMoneyPanel(param1:BaseEvent) : void
      {
         this.sender.send_11195(Number(param1.data));
      }
      
      private function onShowGetMoneyPanel(param1:BaseEvent) : void
      {
         this.depot.showGetPanel(GameInstance.mainCharData.moneyInfo.depotCopper);
      }
      
      private function onUpdateDepot(param1:BaseEvent) : void
      {
         var evt:BaseEvent = param1;
         if(this._allowSort)
         {
            this.sender.send_11187();
            this._allowSort = false;
            TimerManager.createOneOffExactTimer(3,1,10,null,function():void
            {
               _allowSort = true;
            });
         }
      }
      
      private function onDepotPanelClick(param1:BaseEvent) : void
      {
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:Array = param1.data as Array;
         var _loc3_:ItemFace = _loc2_[0].target as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            if(!_loc3_)
            {
               return;
            }
            TCursorManager.currentItemFace = new ItemFace(_loc3_.getBaseItem());
            _loc4_ = TCursorManager.currentItemFace.getBaseItem() as Goods;
            _loc5_ = _loc4_.res.repeat;
            _loc6_ = _loc4_.res.kind;
            if(_loc6_ == 2)
            {
               this.itemMenu = this.initMenu([{
                  "name":ItemMenuStatus.USE2,
                  "state":1
               },{
                  "name":ItemMenuStatus.MOVE,
                  "state":1
               },{
                  "name":ItemMenuStatus.DESTROY,
                  "state":1
               }],_loc2_[0]);
            }
            else if(_loc5_ != 1)
            {
               if(SpecialGoodsID.BUXIANSHISHIYONGGOODSID.indexOf(_loc3_.getBaseItem().id) != -1)
               {
                  this.itemMenu = this.initMenu([{
                     "name":ItemMenuStatus.MOVE,
                     "state":1
                  },{
                     "name":ItemMenuStatus.SPLIT,
                     "state":1
                  },{
                     "name":ItemMenuStatus.DESTROY,
                     "state":1
                  }],_loc2_[0]);
               }
               else
               {
                  this.itemMenu = this.initMenu([{
                     "name":ItemMenuStatus.USE,
                     "state":1
                  },{
                     "name":ItemMenuStatus.MOVE,
                     "state":1
                  },{
                     "name":ItemMenuStatus.SPLIT,
                     "state":1
                  },{
                     "name":ItemMenuStatus.DESTROY,
                     "state":1
                  }],_loc2_[0]);
               }
            }
            else if(SpecialGoodsID.BUXIANSHISHIYONGGOODSID.indexOf(_loc3_.getBaseItem().id) != -1)
            {
               this.itemMenu = this.initMenu([{
                  "name":ItemMenuStatus.MOVE,
                  "state":1
               },{
                  "name":ItemMenuStatus.DESTROY,
                  "state":1
               }],_loc2_[0]);
            }
            else
            {
               this.itemMenu = this.initMenu([{
                  "name":ItemMenuStatus.USE,
                  "state":1
               },{
                  "name":ItemMenuStatus.MOVE,
                  "state":1
               },{
                  "name":ItemMenuStatus.DESTROY,
                  "state":1
               }],_loc2_[0]);
            }
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
         {
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOREN);
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
            sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,_loc3_,_loc2_[1],ItemPositionRange.CONTAINER_DEPOT]);
            TCursorManager.currentItemFace = null;
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_PLCQ)
         {
            if(!_loc3_)
            {
               return;
            }
            sendNotification(Item_ApplicationFacade.ITEM_MOVE,[_loc3_,null,0,ItemPositionRange.CONTAINER_BAG]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            if(_loc3_)
            {
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,_loc3_.getBaseItem().position,ItemPositionRange.CONTAINER_DEPOT]);
            }
            else
            {
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,_loc2_[1],ItemPositionRange.CONTAINER_DEPOT]);
            }
         }
      }
      
      private function onStartDragClick(param1:BaseEvent) : void
      {
         var _loc2_:ItemFace = param1.data as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.currentItemFace = _loc2_;
            TCursorManager.showItem(_loc2_.itemBD);
            TCursorManager.source = 3;
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
            TCursorManager.lockOnMouseStatus();
         }
      }
      
      private function onItemMenuClick(param1:BaseEvent) : void
      {
         var _loc2_:String = param1.data.toString();
         switch(_loc2_)
         {
            case ItemMenuStatus.USE:
               break;
            case ItemMenuStatus.MOVE:
               TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOVE);
               this.itemMove();
               break;
            case ItemMenuStatus.DESTROY:
               this.backPackMediator.showDestroyItem(TCursorManager.currentItemFace.getBaseItem());
               break;
            case ItemMenuStatus.SPLIT:
               this.backPackMediator.showSplitItem(TCursorManager.currentItemFace.getBaseItem());
         }
      }
      
      private function initMenu(param1:Array, param2:MouseEvent) : Menu
      {
         if(this.itemMenu != null)
         {
            this.itemMenu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
         }
         this.itemMenu = Menu.addMenuItem(param1,param2);
         if(!this.itemMenu.hasEventListener(Menu.MENUITEM_CLICK))
         {
            this.itemMenu.addEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
         }
         return this.itemMenu;
      }
      
      private function itemMove() : void
      {
         TCursorManager.showItem(TCursorManager.currentItemFace.itemBD);
         TCursorManager.lockOnMouseStatus();
      }
      
      public function updateCopper(param1:Number) : void
      {
         GameInstance.mainCharData.moneyInfo.depotCopper = param1;
         this.initDepot();
      }
      
      public function showItemDepot(param1:int = 0) : void
      {
         var _loc2_:Array = null;
         if(Fun.isVisible(GameInstance.uiInstance._depot))
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.pageDepot(param1);
            this.depot.setItem(_loc2_);
         }
      }
   }
}

