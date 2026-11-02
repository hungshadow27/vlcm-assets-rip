package com.tgame.moudels.Item.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_ItemProxy;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.OtherPlayerShopPanel;
   import com.tgame.shell.view.components.TradingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_TradeMediator extends Mediator
   {
      
      public static const NAME:String = "Item_TradeMediator";
      
      private var _backPackMediator:Item_BackpackMediator;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _itemProxy:Item_ItemProxy;
      
      private var _rideAttrPanel:Item_RideAttrMediator;
      
      private var _roleID:int;
      
      private var _otherCharWalkShop:OtherPlayerShopPanel;
      
      private var _currentTradeGoods:Array = [];
      
      private var _currentTargetTradeGoods:Array = [];
      
      private var _currentMainCharMount:Mount;
      
      private var _currentOtherCharMount:Mount;
      
      private var _currentMainCharCopper:Number;
      
      private var _currentOtherCharCopper:Number;
      
      private var _currentMainCharGold:int;
      
      private var _currentOtherCharGold:int;
      
      public function Item_TradeMediator()
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
      
      private function get rideAttrPanel() : Item_RideAttrMediator
      {
         if(this._rideAttrPanel == null)
         {
            this._rideAttrPanel = facade.retrieveMediator(Item_RideAttrMediator.NAME) as Item_RideAttrMediator;
         }
         return this._rideAttrPanel;
      }
      
      protected function get tradePanel() : TradingPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tradePanel);
         }
         return viewComponent as TradingPanel;
      }
      
      protected function get backpack() : Backpack
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
         return [Item_ApplicationFacade.START_TRADE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.START_TRADE:
               this.sender.send_10821(Number(_loc2_));
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TradingPanel,function():void
         {
            tradePanel.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            tradePanel.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_TRADING,onClickTradeOrCancel);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_ITEM_SHOWBTN_CLICK,onClickAddGoods);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_CLICK,onClickTradeZone);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_COPPER_CLICK,onClickCopper);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_COPPER,onInputCopper);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_SILVER_CLICK,onClickGold);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_SILVER,onInputGold);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_RIDELISTPANEL_SHOW,onClickMountList);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_RIDE_SHOWBTN_CLICK,onClickMountAdd);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_LOCK,onClickLock);
            tradePanel.addEventListener(TradingPanel.UI_TRADINGPANEL_RIDE_LOOKBTN_CLICK,onClickRideAttr);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TradingPanel,function():void
         {
            tradePanel.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            tradePanel.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_TRADING,onClickTradeOrCancel);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_ITEM_SHOWBTN_CLICK,onClickAddGoods);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_CLICK,onClickTradeZone);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_COPPER_CLICK,onClickCopper);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_COPPER,onInputCopper);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_SILVER_CLICK,onClickGold);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_INPUT_SILVER,onInputGold);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_RIDELISTPANEL_SHOW,onClickMountList);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_RIDE_SHOWBTN_CLICK,onClickMountAdd);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_LOCK,onClickLock);
            tradePanel.removeEventListener(TradingPanel.UI_TRADINGPANEL_RIDE_LOOKBTN_CLICK,onClickRideAttr);
         });
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.onClickMountList(null);
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         TCursorManager.resumFullMouse();
      }
      
      private function onClickRideAttr(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         var _loc3_:String = param1.action;
         if(_loc3_ == "0")
         {
            this.rideAttrPanel.show(GameInstance.mainChar.id,_loc2_);
         }
         else
         {
            this.rideAttrPanel.show(this._roleID,_loc2_);
         }
      }
      
      private function onClickLock(param1:BaseEvent) : void
      {
         this.sender.send_10829();
      }
      
      private function onClickMountAdd(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.sender.send_10845(_loc2_);
      }
      
      private function onClickMountList(param1:BaseEvent) : void
      {
         var _loc4_:int = 0;
         var _loc6_:PureMount = null;
         var _loc7_:XML = null;
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
            if(_loc6_.fightStatus == 0)
            {
               _loc7_.@state = LanResManager.getLanCommonTextWords("休息");
            }
            else if(_loc6_.fightStatus == 1)
            {
               _loc7_.@state = LanResManager.getLanCommonTextWords("骑乘");
            }
            else if(_loc6_.fightStatus == 2)
            {
               _loc7_.@state = LanResManager.getLanCommonTextWords("展示");
            }
            _loc3_.appendChild(_loc7_);
            _loc4_++;
         }
         this.tradePanel.showRideListPanel(_loc3_);
      }
      
      private function onClickCopper(param1:BaseEvent) : void
      {
         this.tradePanel.showCopperTradingPanel(GameInstance.mainCharData.moneyInfo.copper);
      }
      
      private function onInputCopper(param1:BaseEvent) : void
      {
         this.sender.send_10843([1,Number(param1.data)]);
      }
      
      private function onClickGold(param1:BaseEvent) : void
      {
         this.tradePanel.showSilverTradingPanel(GameInstance.mainCharData.moneyInfo.gold);
      }
      
      private function onInputGold(param1:BaseEvent) : void
      {
         this.sender.send_10843([2,Number(param1.data)]);
      }
      
      public function updateMoney(param1:int, param2:Number, param3:Number) : void
      {
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1);
         if(!_loc4_)
         {
            return;
         }
         if(_loc4_ == GameInstance.mainChar)
         {
            this._currentMainCharCopper = param2;
            this._currentMainCharGold = param3;
            this.tradePanel.setSelfItem(this._currentTradeGoods,null,param2,param3);
         }
         else
         {
            this._currentOtherCharCopper = param2;
            this._currentOtherCharGold = param3;
            this.tradePanel.setTargetItem(this._currentTargetTradeGoods,null,param2,param3);
         }
      }
      
      private function onClickTradeZone(param1:BaseEvent) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:Goods = null;
         var _loc4_:PureMount = null;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            _loc2_ = TCursorManager.currentItemFace;
            this.sender.send_10841([_loc2_.getBaseItem().position,0]);
         }
         else if(param1.data is Goods)
         {
            if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
            {
               _loc2_ = TCursorManager.currentItemFace;
               this.sender.send_10841([_loc2_.getBaseItem().position,0]);
               TCursorManager.resumFullMouse();
            }
            else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
            {
               _loc3_ = param1.data as Goods;
               this.sender.send_10847([_loc3_.position,this.getTradeIndex(_loc3_.position)]);
            }
         }
         else if(param1.data == null)
         {
            if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
            {
               _loc2_ = TCursorManager.currentItemFace;
               this.sender.send_10841([_loc2_.getBaseItem().position,0]);
               TCursorManager.resumFullMouse();
            }
         }
         else if(param1.data is Mount)
         {
            _loc4_ = param1.data as PureMount;
            this.sender.send_10851(_loc4_.id);
         }
      }
      
      private function onClickAddGoods(param1:BaseEvent) : void
      {
         TCursorManager.resumFullMouse();
         TCursorManager.showCursor(TCursorManager.CURSOR_SHANGJIA_WJJJY);
         TCursorManager.lockOnMouseStatus();
      }
      
      private function onClickTradeOrCancel(param1:BaseEvent) : void
      {
         var _loc2_:Boolean = Boolean(param1.data);
         if(_loc2_)
         {
            this.tradePanel.setOKEnabled(false);
            this.sender.send_10831();
         }
         else
         {
            this.sender.send_10833();
            this.closeTrade();
         }
      }
      
      public function receivedOtherCharTrade(param1:int, param2:String) : void
      {
         var $roleID:int = param1;
         var $name:String = param2;
         GameInstance.uiInstance.mainUI.showICOTip(MainUI.TYPE_TRADING_TIP,function():void
         {
            FAlert.show(LanResManager.getLanTextWords(Item_TradeMediator,"交易请求",[$name]),"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  sender.send_10825([1,$roleID]);
               }
               else if(param1.eventData == FAlert.CANCEL)
               {
                  sender.send_10825([0,$roleID]);
               }
            });
         });
      }
      
      public function r_openTradePanel(param1:int, param2:String, param3:int) : void
      {
         this._roleID = param1;
         if(this.tradePanel.parent == null || this.tradePanel.visible == false)
         {
            this.closeTrade();
            PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            if(!Fun.isVisible(GameInstance.uiInstance._backpack))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
            }
            ResizeManager.showDoublePanel(this.tradePanel,this.backpack);
         }
         this.tradePanel.setTarget(param2,param3);
      }
      
      public function addGoodsClick(param1:BaseItem) : void
      {
         this.sender.send_10841([param1.position,0]);
      }
      
      public function addGoods(param1:int, param2:Array) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1);
         if(!_loc3_)
         {
            return;
         }
         if(_loc3_ == GameInstance.mainChar)
         {
            this._currentTradeGoods = param2;
            this.tradePanel.setSelfItem(this._currentTradeGoods,null,this._currentMainCharCopper,this._currentMainCharGold);
         }
         else
         {
            this._currentTargetTradeGoods = param2;
            this.tradePanel.setTargetItem(this._currentTargetTradeGoods,null,this._currentOtherCharCopper,this._currentOtherCharGold);
         }
      }
      
      private function getTradeIndex(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc4_:Goods = null;
         var _loc3_:int = int(this._currentTradeGoods.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._currentTradeGoods[_loc2_].item;
            if(_loc4_.position == param1)
            {
               return this._currentTradeGoods[_loc2_].tradeIndex;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function closeTrade() : void
      {
         if(this.tradePanel.parent != null)
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
         }
         this.tradePanel.clear();
         this.tradePanel.setSelfItem([],null,0,0);
         this.tradePanel.setTargetItem([],null,0,0);
         this.tradePanel.setOKEnabled(false);
         this.tradePanel.lockSelf(false);
         this.tradePanel.lockTarget(false);
         this.tradePanel.setSelfItem([]);
         this.tradePanel.setTargetItem([]);
         this._currentTradeGoods = [];
         this._currentTargetTradeGoods = [];
         this._currentMainCharCopper = 0;
         this._currentMainCharGold = 0;
         this._currentOtherCharCopper = 0;
         this._currentOtherCharGold = 0;
         this._currentMainCharMount = null;
         this._currentOtherCharMount = null;
         TCursorManager.resumFullMouse();
      }
      
      public function updateMount(param1:int, param2:int, param3:int) : void
      {
         var _loc5_:PureMount = null;
         var _loc4_:SceneCharacter = GameInstance.scene.getCharByID(param1);
         if(!_loc4_)
         {
            return;
         }
         if(_loc4_ == GameInstance.mainChar)
         {
            if(param2 == -1)
            {
               _loc5_ = null;
            }
            else
            {
               _loc5_ = new PureMount(param2);
               _loc5_.id = param3;
            }
            this._currentMainCharMount = _loc5_;
            this.tradePanel.setSelfItem(this._currentTradeGoods,_loc5_,this._currentMainCharCopper,this._currentMainCharGold);
         }
         else
         {
            if(param2 == -1)
            {
               _loc5_ = null;
            }
            else
            {
               _loc5_ = new PureMount(param2);
               _loc5_.id = param3;
            }
            this._currentOtherCharMount = _loc5_;
            this.tradePanel.setTargetItem(this._currentTargetTradeGoods,this._currentOtherCharMount,this._currentOtherCharCopper,this._currentOtherCharGold);
         }
      }
      
      public function updateTradeStatus(param1:int, param2:int) : void
      {
         var _loc3_:SceneCharacter = GameInstance.scene.getCharByID(param1);
         if(!_loc3_)
         {
            return;
         }
         if(_loc3_ == GameInstance.mainChar)
         {
            this.tradePanel.lockSelf(true);
         }
         else
         {
            this.tradePanel.lockTarget(true);
         }
         if(this.tradePanel.getLockSelf() && this.tradePanel.getLockTarget())
         {
            this.tradePanel.setOKEnabled(true);
         }
         if(param1 == GameInstance.mainChar.id && param2 == 2)
         {
            this.tradePanel.setOKEnabled(false);
         }
      }
   }
}

