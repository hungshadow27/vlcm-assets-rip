package com.tgame.moudels.Item.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.equipMosaic.EquipMosaic;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.DrugsKind;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemMenuStatus;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.DoubleClickManager;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_ItemProxy;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.Item_TipProxy;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.tgame.shell.view.components.Backpack;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.DestroyTiShiCanvas;
   import com.tgame.shell.view.components.GiftPanel;
   import com.tgame.shell.view.components.InstanceConvectionPanel;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.active.ActiveActiveCanvas;
   import com.tgame.shell.view.components.gift.ItemSpecialUseAlert;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.manager.CDFaceManager;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_BackpackMediator extends Mediator
   {
      
      public static const NAME:String = "Item_BackpackMediator";
      
      private var itemMenu:Menu;
      
      private var _itemTipProxy:Item_TipProxy;
      
      private var _itemProxy:Item_ItemProxy;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _mainCharShopMediator:Item_MainCharShopMediator;
      
      private var _mainCharTradeMediator:Item_TradeMediator;
      
      private var _mainCharSendFlower:Item_SendFlowerMediator;
      
      private var tishiCanvas:DestroyTiShiCanvas;
      
      private var _readyActiveCount:int;
      
      private var _readyDestroyItem:BaseItem;
      
      private var _npcShop:Item_NPCShopMediator;
      
      private var _loadBuffer:LoadBuffer;
      
      private var _dc:DoubleClickManager;
      
      public function Item_BackpackMediator()
      {
         super(NAME);
         this._dc = new DoubleClickManager();
         this._dc.addEventListener(DoubleClickManager.DOUBLE_CLICK,this.onDoubleClick);
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      public function get itemProxy() : Item_ItemProxy
      {
         if(this._itemProxy == null)
         {
            this._itemProxy = facade.retrieveProxy(Item_ItemProxy.NAME) as Item_ItemProxy;
         }
         return this._itemProxy;
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
      
      public function get mainCharSendFlower() : Item_SendFlowerMediator
      {
         if(this._mainCharSendFlower == null)
         {
            this._mainCharSendFlower = facade.retrieveMediator(Item_SendFlowerMediator.NAME) as Item_SendFlowerMediator;
         }
         return this._mainCharSendFlower;
      }
      
      public function get mainCharShopMediator() : Item_MainCharShopMediator
      {
         if(this._mainCharShopMediator == null)
         {
            this._mainCharShopMediator = facade.retrieveMediator(Item_MainCharShopMediator.NAME) as Item_MainCharShopMediator;
         }
         return this._mainCharShopMediator;
      }
      
      protected function get npcShop() : Item_NPCShopMediator
      {
         if(this._npcShop == null)
         {
            this._npcShop = facade.retrieveMediator(Item_NPCShopMediator.NAME) as Item_NPCShopMediator;
         }
         return this._npcShop;
      }
      
      public function get mainCharTradeMediator() : Item_TradeMediator
      {
         if(this._mainCharTradeMediator == null)
         {
            this._mainCharTradeMediator = facade.retrieveMediator(Item_TradeMediator.NAME) as Item_TradeMediator;
         }
         return this._mainCharTradeMediator;
      }
      
      protected function get backpack() : Backpack
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.backpack);
         }
         return viewComponent as Backpack;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.MOUSE_ITEM_MOVE,Item_ApplicationFacade.SHORT_KEY,Item_ApplicationFacade.CTRL_SHORT_KEY,Item_ApplicationFacade.USE_BAG,Item_ApplicationFacade.ITEMTIP_CLEAR,Item_ApplicationFacade.UPDATE_ITEM_BAG,Item_ApplicationFacade.SHOW_GOODS_PANEL,Item_ApplicationFacade.KUAFU_STATUS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var noteBody:Object = null;
         var good:Goods = null;
         var tag:int = 0;
         var isInKuaFu:Boolean = false;
         var note:INotification = param1;
         noteBody = note.getBody();
         switch(note.getName())
         {
            case Item_ApplicationFacade.MOUSE_ITEM_MOVE:
               this.showDestroyItem(TCursorManager.currentItemFace.getBaseItem());
               break;
            case Item_ApplicationFacade.SHORT_KEY:
               this.useShortKey(note.getType(),note.getBody());
               break;
            case Item_ApplicationFacade.CTRL_SHORT_KEY:
               this.useShortKey2(note.getType(),note.getBody());
               break;
            case Item_ApplicationFacade.USE_BAG:
               tag = Number(noteBody);
               if(tag)
               {
                  this.backpack.functionBtnEnalbe = true;
               }
               else
               {
                  this.backpack.functionBtnEnalbe = false;
               }
               break;
            case Item_ApplicationFacade.ITEMTIP_CLEAR:
               this.itemTipProxy.removeTipAll();
               break;
            case Item_ApplicationFacade.UPDATE_ITEM_BAG:
               this.showItemBag(ExchangePositionManager.bagCount - 1);
               break;
            case Item_ApplicationFacade.SHOW_GOODS_PANEL:
               good = noteBody as Goods;
               if(SpecialGoodsID.isMountSkillBookID(good.id))
               {
                  this.backpack.showRideSkillStudyPanel(good);
               }
               else if(good.id == SpecialGoodsID.DAMOSHI)
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("确定使用打磨石？"),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == "FAlert.ok")
                     {
                        sendNotification(Item_ApplicationFacade.ITEM_USE,[new ItemFace(good),1]);
                     }
                  });
               }
               else if(good.id == SpecialGoodsID.CHUANSHUO_PINJI_ZUOQI_DAN)
               {
                  this.isShowChuanShuoMountOK(good);
               }
               break;
            case Item_ApplicationFacade.KUAFU_STATUS:
               isInKuaFu = Boolean(noteBody);
               if(isInKuaFu)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._backpack))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
                  }
               }
         }
      }
      
      private function isShowChuanShuoMountOK(param1:Goods) : void
      {
         var $good:Goods = param1;
         FAlert.show(LanResManager.getLanCommonTextWords("使用后可以将提升坐骑为橙色传说品级"),"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == "FAlert.ok")
            {
               sendNotification(Item_ApplicationFacade.ITEM_USE,[new ItemFace($good),1]);
            }
         });
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         GameInstance.stage.addEventListener(ItemFace.MOUSE_OVER,this.onItemMouseOver);
         GameInstance.stage.addEventListener(ItemFace.MOUSE_OUT,this.onItemMouseOut);
         GameInstance.stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         GameInstance.scene.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp,false,30);
         UIEventsRegisterManager.addUIRegisterEvent(Backpack,function():void
         {
            backpack.addEventListener(Event.ADDED_TO_STAGE,mainCharBackpackHandle);
            backpack.addEventListener(Event.REMOVED_FROM_STAGE,onRemove2Stage);
            backpack.addEventListener(Backpack.GETSHOWITEMMENU,mainCharBackpackHandle);
            backpack.addEventListener(Backpack.UI_BACKPACK_DESTROYITEM,onDestroyItem);
            backpack.addEventListener(Backpack.UI_BACKPACK_SPLITITEM,onSplitItem);
            backpack.addEventListener(Backpack.NEATENBACKPACK,onSortItem);
            backpack.addEventListener(Backpack.UI_BACKPACK_JIHUO_BACKPACK,onActiveBag);
            backpack.addEventListener(Backpack.GETBACKPACKITEM,onSwitchBag);
            backpack.addEventListener(Backpack.UI_BACKPACK_MYSHOPBTN_CLICK,onMainCharShopClick);
            backpack.addEventListener(Backpack.UI_BACKPACK_SHOPLISTBTN_CLICK,onShopListClick);
            backpack.addEventListener(Backpack.UI_BACKPACK_JIHUO_BACKPACK_OK,onActiveBagOK);
            backpack.addEventListener(FCloseEvent.CLOSE,closePanel);
            backpack.addEventListener(Backpack.UI_BACKPACK_DRAG_STRAT,onStartDrag);
            backpack.addEventListener(Backpack.UI_BACKPACK_RIDE_SKILL_STUDY,onStudyMountSkill);
            backpack.addEventListener(Backpack.GETSAFESTATE,onSafe);
            backpack.addEventListener(Backpack.UI_BACKPACK_JIESUO_CLICK,onSafe);
            backpack.addEventListener(Backpack.UI_BAKCPACK_ADDPWD,onSafe);
            backpack.addEventListener(Backpack.UI_SAFEUNLOCK_CLICK,onSafe);
            backpack.addEventListener(Backpack.UI_SETSAFELOCK_CLICK,onSafe);
            backpack.addEventListener(Backpack.UI_YIWANGLOCK_CLICK,onSafe);
            backpack.addEventListener(Backpack.UI_POCHULOCK_CLICK,onSafe);
            backpack.addEventListener(Backpack.UI_QUXIAOLOCK_CLICK,onSafe);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Backpack,function():void
         {
            backpack.removeEventListener(Event.ADDED_TO_STAGE,mainCharBackpackHandle);
            backpack.removeEventListener(Event.REMOVED_FROM_STAGE,onRemove2Stage);
            backpack.removeEventListener(Backpack.GETSHOWITEMMENU,mainCharBackpackHandle);
            backpack.removeEventListener(Backpack.UI_BACKPACK_DESTROYITEM,onDestroyItem);
            backpack.removeEventListener(Backpack.UI_BACKPACK_SPLITITEM,onSplitItem);
            backpack.removeEventListener(Backpack.NEATENBACKPACK,onSortItem);
            backpack.removeEventListener(Backpack.UI_BACKPACK_JIHUO_BACKPACK,onActiveBag);
            backpack.removeEventListener(Backpack.GETBACKPACKITEM,onSwitchBag);
            backpack.removeEventListener(Backpack.UI_BACKPACK_MYSHOPBTN_CLICK,onMainCharShopClick);
            backpack.removeEventListener(Backpack.UI_BACKPACK_SHOPLISTBTN_CLICK,onShopListClick);
            backpack.removeEventListener(Backpack.UI_BACKPACK_JIHUO_BACKPACK_OK,onActiveBagOK);
            backpack.removeEventListener(FCloseEvent.CLOSE,closePanel);
            backpack.removeEventListener(Backpack.UI_BACKPACK_DRAG_STRAT,onStartDrag);
            backpack.removeEventListener(Backpack.UI_BACKPACK_RIDE_SKILL_STUDY,onStudyMountSkill);
            backpack.removeEventListener(Backpack.GETSAFESTATE,onSafe);
            backpack.removeEventListener(Backpack.UI_BACKPACK_JIESUO_CLICK,onSafe);
            backpack.removeEventListener(Backpack.UI_BAKCPACK_ADDPWD,onSafe);
            backpack.removeEventListener(Backpack.UI_SAFEUNLOCK_CLICK,onSafe);
            backpack.removeEventListener(Backpack.UI_SETSAFELOCK_CLICK,onSafe);
            backpack.removeEventListener(Backpack.UI_YIWANGLOCK_CLICK,onSafe);
            backpack.removeEventListener(Backpack.UI_POCHULOCK_CLICK,onSafe);
            backpack.removeEventListener(Backpack.UI_QUXIAOLOCK_CLICK,onSafe);
         });
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.CHAT_ITEM_LINK_CLICK,onClickItemLink);
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.CHAT_ITEM_LINK_HIDE,onItemMouseOut);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.CHAT_ITEM_LINK_CLICK,onClickItemLink);
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.CHAT_ITEM_LINK_HIDE,onItemMouseOut);
         });
         UIEventsRegisterManager.addUIRegisterEvent(InstanceConvectionPanel,function():void
         {
            GameInstance.uiInstance.instanceSelectPanel.addEventListener(InstanceConvectionPanel.ITEM_LINK_CLICK,onClickFuBenItemLink);
         });
         UIEventsRegisterManager.addUIRemovedEvent(InstanceConvectionPanel,function():void
         {
            GameInstance.uiInstance.instanceSelectPanel.removeEventListener(InstanceConvectionPanel.ITEM_LINK_CLICK,onClickFuBenItemLink);
         });
         UIEventsRegisterManager.addUIRegisterEvent(GiftPanel,function():void
         {
            GameInstance.uiInstance.giftPanel.addEventListener(ActiveActiveCanvas.ITEM_LINK_CLICK,onClickFuBenItemLink);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GiftPanel,function():void
         {
            GameInstance.uiInstance.giftPanel.removeEventListener(ActiveActiveCanvas.ITEM_LINK_CLICK,onClickFuBenItemLink);
         });
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            GameInstance.uiInstance.charAttribute.addEventListener(CharAttribute.ITEM_LINK_CLICK,onClickFuBenItemLink);
            GameInstance.uiInstance.charAttribute.addEventListener(CharAttribute.CHAT_ITEM_LINK_HIDE,onItemMouseOut);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            GameInstance.uiInstance.charAttribute.removeEventListener(CharAttribute.ITEM_LINK_CLICK,onClickFuBenItemLink);
            GameInstance.uiInstance.charAttribute.removeEventListener(CharAttribute.CHAT_ITEM_LINK_HIDE,onItemMouseOut);
         });
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            GameInstance.uiInstance.charAttribute.addEventListener(CharAttribute.ITEM_LINK_CLICKB,onClickFuBenItemLink);
            GameInstance.uiInstance.charAttribute.addEventListener(CharAttribute.CHAT_ITEM_LINK_HIDEB,onItemMouseOut);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            GameInstance.uiInstance.charAttribute.removeEventListener(CharAttribute.ITEM_LINK_CLICKB,onClickFuBenItemLink);
            GameInstance.uiInstance.charAttribute.removeEventListener(CharAttribute.CHAT_ITEM_LINK_HIDEB,onItemMouseOut);
         });
      }
      
      private function onRemove2Stage(param1:Event) : void
      {
         if(this.itemMenu != null)
         {
            this.itemMenu.destroy();
         }
      }
      
      private function onMouseUp(param1:Event) : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG && TCursorManager.source == 2)
         {
            this.showDestroyItem(TCursorManager.currentItemFace.getBaseItem());
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG && TCursorManager.source == 4)
         {
            this.sender.send_70013([TCursorManager.currentItemFace.getBaseItem().id,TCursorManager.currentItemFace.getBaseItem().position]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG && TCursorManager.source == 7)
         {
            this.sender.send_70115([TCursorManager.currentItemFace.getBaseItem().id,TCursorManager.currentItemFace.getBaseItem().position]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG && TCursorManager.source == 9)
         {
            this.sender.send_72137([TCursorManager.currentItemFace.getBaseItem().id,TCursorManager.currentItemFace.getBaseItem().position]);
         }
      }
      
      private function onStartDrag(param1:BaseEvent) : void
      {
         var _loc2_:ItemFace = param1.data as ItemFace;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            TCursorManager.currentItemFace = _loc2_;
            TCursorManager.showItem(_loc2_.itemBD);
            TCursorManager.source = 2;
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
            TCursorManager.lockOnMouseStatus();
         }
         if(this.itemMenu != null && this.itemMenu.parent != null)
         {
            this.itemMenu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
            this.itemMenu.parent.removeChild(this.itemMenu);
         }
      }
      
      private function closePanel(param1:FCloseEvent) : void
      {
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide10);
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         if(!(param1.target is TextField))
         {
            this.itemTipProxy.clear();
         }
      }
      
      private function onStudyMountSkill(param1:BaseEvent) : void
      {
         var _loc2_:ItemFace = param1.data as ItemFace;
         sendNotification(Item_ApplicationFacade.ITEM_USE,[_loc2_,1]);
      }
      
      private function onSafe(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case Backpack.GETSAFESTATE:
               this.sender.send_60221();
               break;
            case Backpack.UI_BACKPACK_JIESUO_CLICK:
               _loc4_ = int(_loc3_.data);
               if(_loc4_ == 1)
               {
                  this.backpack.showSafeLockPanel(2);
               }
               else
               {
                  this.sender.send_60229();
               }
               break;
            case Backpack.UI_BAKCPACK_ADDPWD:
               _loc4_ = int(_loc3_.data);
               if(_loc4_ == 1)
               {
                  this.backpack.showSafeLockPanel(1);
               }
               else
               {
                  this.backpack.showUpdateSafeLockPanel();
               }
               break;
            case Backpack.UI_SAFEUNLOCK_CLICK:
               _loc5_ = _loc3_.data as Array;
               if(int(_loc5_[2]) == 1)
               {
                  this.sender.send_60223(_loc5_);
               }
               else
               {
                  this.sender.send_60227(_loc5_[0]);
               }
               break;
            case Backpack.UI_SETSAFELOCK_CLICK:
               _loc5_ = _loc3_.data as Array;
               if(_loc5_[1] == "" && _loc5_[2] == "")
               {
                  _loc5_[1] = "-1";
                  _loc5_[2] = "-1";
               }
               this.sender.send_60225(_loc5_);
               break;
            case Backpack.UI_YIWANGLOCK_CLICK:
               this.sender.send_60231();
               break;
            case Backpack.UI_POCHULOCK_CLICK:
               this.sender.send_60233();
               break;
            case Backpack.UI_QUXIAOLOCK_CLICK:
               this.sender.send_60235();
         }
      }
      
      private function onClickItemLink(param1:BaseEvent) : void
      {
         var _loc2_:Array = param1.data as Array;
         var _loc3_:Goods = new Goods(_loc2_[0],_loc2_[1]);
         _loc3_.roleID = _loc2_[2];
         this.showItemTip(_loc3_,_loc2_[3],_loc2_[4]);
      }
      
      private function onClickFuBenItemLink(param1:BaseEvent) : void
      {
         var _loc2_:Array = param1.data as Array;
         var _loc3_:Goods = new Goods(_loc2_[0],0);
         _loc3_.roleID = -99;
         this.showItemTip(_loc3_,_loc2_[1],_loc2_[2]);
      }
      
      private function onShopListClick(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_LIST_PANEL);
      }
      
      private function onMainCharShopClick(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
      }
      
      private function initBag() : void
      {
         if(GameInstance.uiInstance._backpack != null)
         {
            this.backpack.setBackpackCount(GameInstance.mainCharData.attributeInfo.bagCount);
            this.backpack.setMoney([GameInstance.mainCharData.moneyInfo.copper,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.gifts,GameInstance.mainCharData.moneyInfo.jinpiao]);
         }
      }
      
      public function updateMoney() : void
      {
         if(GameInstance.uiInstance._backpack != null)
         {
            this.backpack.setMoney([GameInstance.mainCharData.moneyInfo.copper,GameInstance.mainCharData.moneyInfo.gold,GameInstance.mainCharData.moneyInfo.gifts,GameInstance.mainCharData.moneyInfo.jinpiao]);
         }
      }
      
      private function onSwitchBag(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.showItemBag(_loc2_ - 1);
         ExchangePositionManager.bagCount = _loc2_;
      }
      
      private function onActiveBag(param1:BaseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc2_:int = GameInstance.mainCharData.attributeInfo.bagCount + 1;
         if(_loc2_ > 7)
         {
            _loc3_ = SpecialGoodsID.KUOZHANFU_QIANKUN;
         }
         else if(_loc2_ > 5)
         {
            _loc3_ = SpecialGoodsID.KUOZHANFU_SUPER;
         }
         else
         {
            _loc3_ = SpecialGoodsID.KUOZHANFU;
         }
         var _loc4_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc3_,true);
         var _loc5_:Goods = new Goods(_loc3_);
         _loc5_.count = _loc4_;
         if(_loc2_ == 2 && _loc4_ < 2)
         {
            this.backpack.showJiHuoBackpackPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ == 3 && _loc4_ < 6)
         {
            this.backpack.showJiHuoBackpackPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ == 4 && _loc4_ < 18)
         {
            this.backpack.showJiHuoBackpackPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ == 5 && _loc4_ < 50)
         {
            this.backpack.showJiHuoBackpackPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ > 5 && _loc2_ < 8 && _loc4_ < 1)
         {
            this.backpack.showJiHuoBackpackPanel(_loc2_,_loc5_,false);
            return;
         }
         if(_loc2_ >= 8 && _loc4_ < 1)
         {
            this.backpack.showJiHuoBackpackPanel(_loc2_,_loc5_,false);
            return;
         }
         this._readyActiveCount = _loc2_;
         this.backpack.showJiHuoBackpackPanel(_loc2_,_loc5_);
      }
      
      private function onActiveBagOK(param1:BaseEvent) : void
      {
         this.itemProxy.activeBag(this._readyActiveCount);
      }
      
      public function r_activeBag(param1:int) : void
      {
         this.backpack.setBackpackCount(param1);
      }
      
      private function onSortItem(param1:BaseEvent) : void
      {
         this.itemProxy.sortBag(param1.data as int);
      }
      
      private function onDestroyItem(param1:BaseEvent) : void
      {
         this.itemProxy.removeItem(this._readyDestroyItem);
      }
      
      private function onItemMouseOver(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc5_:BaseItem = null;
         var _loc6_:Point = null;
         _loc2_ = param1 as BaseEvent;
         var _loc3_:Array = _loc2_.data as Array;
         var _loc4_:ItemFace = _loc3_[0] as ItemFace;
         if(_loc4_ != null)
         {
            _loc5_ = _loc4_.getBaseItem();
         }
         if(_loc4_.parent)
         {
            _loc6_ = _loc4_.parent.localToGlobal(new Point(_loc4_.x,_loc4_.y));
         }
         else
         {
            _loc6_ = new Point(Tools.currentStage.mouseX,Tools.currentStage.mouseY);
         }
         if(_loc5_ is McBaseItem)
         {
            this.shouMcTip(_loc5_,_loc6_.x + 50,_loc6_.y,_loc4_);
         }
         else
         {
            this.showItemTip(_loc5_,_loc6_.x,_loc6_.y,_loc4_);
         }
      }
      
      private function showItemTip(param1:BaseItem, param2:int, param3:int, param4:ItemFace = null) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Goods = null;
         if(param1 as Goods)
         {
            _loc5_ = param1 as Goods;
            if(_loc5_.res == null)
            {
               return;
            }
            _loc6_ = _loc5_.res.kind;
            _loc7_ = true;
            if(_loc6_ == GoodsKind.K2)
            {
               _loc8_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc5_.res.position);
               if(_loc8_ != null)
               {
                  if(_loc5_.position != _loc5_.res.position)
                  {
                     _loc7_ = false;
                     this.itemTipProxy.createItemTip(param1,new Point(param2,param3),_loc8_);
                  }
               }
               else
               {
                  if(GameInstance.mainCharData.mountInfo.currentMount)
                  {
                     _loc8_ = GameInstance.mainCharData.mountInfo.currentMount.mountGoodsInfo.getGoodsByPosition(_loc5_.res.position);
                  }
                  if(_loc8_ != null)
                  {
                     if(_loc5_.position != _loc5_.res.position)
                     {
                        _loc7_ = false;
                        this.itemTipProxy.createItemTip(param1,new Point(param2,param3),_loc8_);
                     }
                  }
               }
            }
            if(_loc7_)
            {
               this.itemTipProxy.createItemTip(param1,new Point(param2,param3));
            }
         }
         else
         {
            this.itemTipProxy.createItemTip(param1,new Point(param2,param3),null,param4);
         }
      }
      
      private function shouMcTip(param1:BaseItem, param2:int, param3:int, param4:ItemFace = null) : void
      {
         this.itemTipProxy.createItemTip(param1,new Point(param2,param3));
      }
      
      private function onItemMouseOut(param1:Event = null) : void
      {
         this.itemTipProxy.clear();
      }
      
      private function mainCharBackpackHandle(param1:Event = null) : void
      {
         var _loc4_:Array = null;
         var _loc5_:ItemFace = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.initBag();
               this.showItemBag();
               break;
            case Backpack.GETSHOWITEMMENU:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  _loc4_ = _loc3_.data as Array;
                  _loc5_ = _loc4_[0].target as ItemFace;
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,_loc5_,_loc4_[1],ItemPositionRange.CONTAINER_BAG]);
               }
               else
               {
                  this.showItemMenu(_loc3_.data as Array);
               }
         }
      }
      
      public function showItemBag(param1:int = 0) : void
      {
         var _loc2_:Array = null;
         if(Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            _loc2_ = GameInstance.mainCharData.goodsInfo.pageBag(param1);
            this.backpack.setItem(_loc2_);
         }
      }
      
      private function onDoubleClick(param1:BaseEvent) : void
      {
         var g:Goods = null;
         var e:BaseEvent = param1;
         var itemFace:ItemFace = e.data as ItemFace;
         if(itemFace)
         {
            if(CDFaceManager.isCooling(itemFace.getBaseItem().getID()))
            {
               if(itemFace.getBaseItem() is Goods)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该道具处于冷却时间内"));
                  return;
               }
               if(itemFace.getBaseItem() is Skill)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该技能处于冷却时间内"));
                  return;
               }
               TimerManager.createOneOffTimer(50,1,null,null,function():void
               {
                  if(itemMenu)
                  {
                     itemMenu.destroy();
                  }
               });
            }
            else
            {
               TCursorManager.currentItemFace = new ItemFace(itemFace.getBaseItem());
               g = TCursorManager.currentItemFace.getBaseItem() as Goods;
               if(SpecialGoodsID.BUXIANSHISHIYONGGOODSID.indexOf(g.id) == -1)
               {
                  sendNotification(Item_ApplicationFacade.ITEM_USE,[TCursorManager.currentItemFace,0]);
               }
               TimerManager.createOneOffTimer(50,1,null,null,function():void
               {
                  if(itemMenu)
                  {
                     itemMenu.destroy();
                  }
               });
            }
         }
      }
      
      public function showItemMenu(param1:Array) : void
      {
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:Goods = null;
         var _loc2_:Array = param1 as Array;
         var _loc3_:ItemFace = _loc2_[0].target as ItemFace;
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide10);
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL && _loc3_ != null)
         {
            if(TCursorManager.chickItemToPanelFun != null)
            {
               TCursorManager.chickItemToPanelFun(_loc3_);
            }
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
         {
            if(!_loc3_)
            {
               return;
            }
            this._dc.trig(_loc3_);
            TCursorManager.currentItemFace = new ItemFace(_loc3_.getBaseItem());
            _loc4_ = TCursorManager.currentItemFace.getBaseItem() as Goods;
            _loc5_ = _loc4_.res.repeat;
            _loc6_ = _loc4_.res.kind;
            _loc7_ = [];
            _loc8_ = [];
            if(_loc6_ == 2)
            {
               if(_loc2_[2] == 1)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     GameInstance.uiInstance._charAttribute.closeJianSelectSpr();
                  }
                  if(_loc4_.res.position == ItemPositionRange.POSTION_YLZR || _loc4_.res.position == ItemPositionRange.POSTION_STDRJ || _loc4_.res.position == ItemPositionRange.POSTION_AOJIAN || _loc4_.res.position == ItemPositionRange.POSTION_GJMY || _loc4_.res.position == ItemPositionRange.POSITION_LONGYA || _loc4_.res.position == ItemPositionRange.POSITION_YAYUEDAO || _loc4_.res.position == ItemPositionRange.POSITION_XUANTIEZHONGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_GUANGMINGZHANG || _loc4_.res.position == ItemPositionRange.POSITION_HUIMIE || _loc4_.res.position == ItemPositionRange.POSITION_ZHUMOZHANG || _loc4_.res.position == ItemPositionRange.POSITION_CHIYAN || _loc4_.res.position == ItemPositionRange.POSITION_TIANJING || _loc4_.res.position == ItemPositionRange.POSITION_FENGTIANJI || _loc4_.res.position == ItemPositionRange.POSITION_HUOLONGDAO || _loc4_.res.position == ItemPositionRange.POSITION_TIANZHU || _loc4_.res.position == ItemPositionRange.POSITION_PANGUKAITIANFU || _loc4_
                  .res.position == ItemPositionRange.POSITION_TIANDI || _loc4_.res.position == ItemPositionRange.POSITION_HANQIBINGPO || _loc4_.res.position == ItemPositionRange.POSITION_JIANZUNLONGQUANJIAN || _loc4_.res.position == ItemPositionRange.POSITION_CHUANGSHI || _loc4_.res.position == ItemPositionRange.POSITION_SUILIESHIFU || _loc4_.res.position == ItemPositionRange.POSITION_MOYUAN || _loc4_.res.position == ItemPositionRange.POSITION_FENGBAODAO || _loc4_.res.position == ItemPositionRange.POSITION_CHENGJIECHANGJI || _loc4_.res.position == ItemPositionRange.POSITION_TIANXIEJIAN || _loc4_.res.position == ItemPositionRange.POSITION_JUNZIJIAN || _loc4_.res.position == ItemPositionRange.POSITION_WANGZHEJIAN || _loc4_.res.position == ItemPositionRange.POSITION_FENGYUN || _loc4_.res.position == ItemPositionRange.POSITION_SHENGDAN2015 || _loc4_.res.position == ItemPositionRange.POSITION_FENGSHA || _loc4_.res.position == ItemPositionRange.POSITION_FENGYIJIAN || _loc4_.res.position == ItemPositionRange.POSITION_LEXINJI || _loc4_
                  .res.position == ItemPositionRange.POSITION_FENGYINGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_ZHENFENGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_FENGYUNJIAN || _loc4_.res.position == ItemPositionRange.POSITION_BINGFENGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_HONGLEIZHANGU || _loc4_.res.position == ItemPositionRange.POSITION_SANDENGGUFO || _loc4_.res.position == ItemPositionRange.POSITION_FONUJI || _loc4_.res.position == ItemPositionRange.POSITION_FENGYINJIAN || _loc4_.res.position == ItemPositionRange.POSITION_TIANMAJIAN || _loc4_.res.position == ItemPositionRange.POSITION_WUHUNJIAN || _loc4_.res.position == ItemPositionRange.POSITION_ZHENTIANJIAN || _loc4_.res.position == ItemPositionRange.POSITION_TIANXUE || _loc4_.res.position == ItemPositionRange.POSITION_XIONGJIJIAN || _loc4_.res.position == ItemPositionRange.POSITION_WUJINJIAN || _loc4_.res.position == ItemPositionRange.POSITION_SHUNTIANJIAN || _loc4_.res.position == ItemPositionRange
                  .POSTION_SHENQI || _loc4_.res.position == ItemPositionRange.POSITION_WANGZHEQICANG || _loc4_.res.position == ItemPositionRange.POSITION_BIXUEJIAN || _loc4_.res.position == ItemPositionRange.POSITION_QINGFENGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_WUYIJIAN || _loc4_.res.position == ItemPositionRange.POSITION_SHIJIANSHENQI || _loc4_.res.position == ItemPositionRange.POSITION_HUOLINJIAN || _loc4_.res.position == ItemPositionRange.POSITION_ZHUIHUNJI || _loc4_.res.position == ItemPositionRange.POSITION_BIYUDAO || _loc4_.res.position == ItemPositionRange.POSITION_WUWOZHANG || _loc4_.res.position == ItemPositionRange.POSITION_YEHUOHONGLIAN || _loc4_.res.position == ItemPositionRange.POSITION_MINGYUEDAO || _loc4_.res.position == ItemPositionRange.POSITION_QINGFENGJIAN2 || _loc4_.res.position == ItemPositionRange.POSITION_ZHIZUNJIAN || _loc4_.res.position == ItemPositionRange.POSITION_BAOLEIJI || _loc4_.res.position == ItemPositionRange.POSITION_MINGSHENGZHANG || _loc4_.res.position == ItemPositionRange
                  .POSITION_ZUNSHIJIAN || _loc4_.res.position == ItemPositionRange.POSITION_RENZHEZHANG || _loc4_.res.position == ItemPositionRange.POSITION_ZHIZHEJIAN || _loc4_.res.position == ItemPositionRange.POSITION_YANGMINGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_XIWANGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_XUEJINGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_XUANBINGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_PINGANJIAN || _loc4_.res.position == ItemPositionRange.POSITION_QINGHUAJIAN || _loc4_.res.position == ItemPositionRange.POSITION_YUXUJIAN || _loc4_.res.position == ItemPositionRange.POSITION_YUQINGSHAN || _loc4_.res.position == ItemPositionRange.POSITION_HUOMODAO || _loc4_.res.position == ItemPositionRange.POSITION_YIHEJI || _loc4_.res.position == ItemPositionRange.POSITION_ERHEJIAN || _loc4_.res.position == ItemPositionRange.POSITION_SANHEDAO || _loc4_.res.position == ItemPositionRange.POSITION_MIEHUSHAN || _loc4_.res.position == ItemPositionRange
                  .POSITION_QINGMINGDAO || _loc4_.res.position == ItemPositionRange.POSITION_HUOXINGFU || _loc4_.res.position == ItemPositionRange.POSITION_SHENZAO || _loc4_.res.position == ItemPositionRange.POSITION_KAITIANGONG || _loc4_.res.position == ItemPositionRange.POSITION_YANWENFENGMO || _loc4_.res.position == ItemPositionRange.POSITION_LINGLONGZI || _loc4_.res.position == ItemPositionRange.POSITION_SHASHENJIAN || _loc4_.res.position == ItemPositionRange.POSITION_DUANQINGJI || _loc4_.res.position == ItemPositionRange.POSITION_NULONG || _loc4_.res.position == ItemPositionRange.POSITION_QINIAN || _loc4_.res.position == ItemPositionRange.POSITION_ZHUXIAN || _loc4_.res.position == ItemPositionRange.POSITION_HANBING || _loc4_.res.position == ItemPositionRange.POSITION_POSHAN || _loc4_.res.position == ItemPositionRange.POSITION_HAIYU || _loc4_.res.position == ItemPositionRange.POSITION_TIANMINGDAO || _loc4_.res.position == ItemPositionRange.POSITION_JINGTIANYIJI || _loc4_.res.position == ItemPositionRange
                  .POSITION_JINGLEIJUEDAO || _loc4_.res.position == ItemPositionRange.POSITION_YINGXIONGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_CHANGSHENGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_GUIYINGGONG || _loc4_.res.position == ItemPositionRange.POSITION_JINGLEIZHANG || _loc4_.res.position == ItemPositionRange.POSITION_HUNDUN || _loc4_.res.position == ItemPositionRange.POSITION_DINGHUN || _loc4_.res.position == ItemPositionRange.POSITION_WUJI || _loc4_.res.position == ItemPositionRange.POSITION_HUOXINGJIAN || _loc4_.res.position == ItemPositionRange.POSITION_WANGZHEFU || _loc4_.res.position == ItemPositionRange.POSITION_DUOMINGDAO || _loc4_.res.position == ItemPositionRange.POSITION_XIAOSHEN || _loc4_.res.position == ItemPositionRange.POSITION_WANSHI || _loc4_.res.position == ItemPositionRange.POSITION_ZHONGQIU || _loc4_.res.position == ItemPositionRange.POSITION_SHENJIAN || _loc4_.res.position == ItemPositionRange.POSITION_YUHUAZHANG || _loc4_.res.position == ItemPositionRange
                  .POSITION_BANIANGONG || _loc4_.res.position == ItemPositionRange.POSITION_BANIANJIAN || _loc4_.res.position == ItemPositionRange.POSITION_BANIANJI || _loc4_.res.position == ItemPositionRange.POSITION_2019SHENDAN || _loc4_.res.position == ItemPositionRange.POSITION_2019GENGZI || _loc4_.res.position == ItemPositionRange.POSITION_2019FEIHUA || _loc4_.res.position == ItemPositionRange.POSITION_2019XIONGWANG || _loc4_.res.position == ItemPositionRange.POSITION_2020XUEHUAN || _loc4_.res.position == ItemPositionRange.POSITION_2020BADAO || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN01 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN02 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN03 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN04 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN05 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN06 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN07 || _loc4_
                  .res.position == ItemPositionRange.POSITION_2020BAOJIAN08 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN09 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN10 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN11 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN12 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN13 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN14 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN15 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN16 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN17 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN18 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN19 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN20 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN21 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN22 || _loc4_
                  .res.position == ItemPositionRange.POSITION_2020BAOJIAN23 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN24 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN25 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN26 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN27 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN28 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN29 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN30 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN31 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN32 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN33 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN34 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN35 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN36 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN37 || _loc4_
                  .res.position == ItemPositionRange.POSITION_2020BAOJIAN38 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN39 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN40 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN41 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN42 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN43 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN44 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN45 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN46 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN47 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN48 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN49 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN50 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN51 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN52 || _loc4_
                  .res.position == ItemPositionRange.POSITION_2020BAOJIAN53 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN54 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN55 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN56 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN57 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN58 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN59 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN60 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN61 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN62 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN63 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN64 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN65 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN66 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN67 || _loc4_
                  .res.position == ItemPositionRange.POSITION_2020BAOJIAN68 || _loc4_.res.position == ItemPositionRange.POSITION_2020BAOJIAN69 || ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(_loc4_.res.position) != -1 || _loc4_.res.position >= ItemPositionRange.POSITION_NB_WEAPON_ARR[0] && _loc4_.res.position <= ItemPositionRange.POSITION_NB_WEAPON_ARR[ItemPositionRange.POSITION_NB_WEAPON_ARR.length - 1])
                  {
                     if(OtherConst.jianArr.length <= 1 && ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(_loc4_.res.position) == -1)
                     {
                        if(ItemPositionRange.GanjianArr.indexOf(_loc4_.id) != -1)
                        {
                           this.itemMenu = this.initMenu([{
                              "name":ItemMenuStatus.MOVE_TO_CHAT,
                              "state":1
                           }],_loc2_[0]);
                        }
                        else
                        {
                           this.itemMenu = this.initMenu([{
                              "name":ItemMenuStatus.UNLOAD,
                              "state":1
                           },{
                              "name":ItemMenuStatus.MOVE_TO_CHAT,
                              "state":1
                           }],_loc2_[0]);
                        }
                     }
                     else if(ItemPositionRange.GanjianArr.indexOf(_loc4_.id) != -1)
                     {
                        this.itemMenu = this.initMenu([{
                           "name":ItemMenuStatus.SELECT_EQUIP,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE_TO_CHAT,
                           "state":1
                        }],_loc2_[0]);
                     }
                     else if(ItemPositionRange.POSITION_SHIBALUOHAN_ARR.indexOf(_loc4_.res.position) != -1)
                     {
                        if(GameInstance.mainCharData.goodsInfo.YNsbtrArr.length > 1)
                        {
                           this.itemMenu = this.initMenu([{
                              "name":ItemMenuStatus.YN_SELECT_SBTR_EQUIP,
                              "state":1
                           },{
                              "name":ItemMenuStatus.UNLOAD,
                              "state":1
                           },{
                              "name":ItemMenuStatus.MOVE_TO_CHAT,
                              "state":1
                           }],_loc2_[0]);
                        }
                        else
                        {
                           this.itemMenu = this.initMenu([{
                              "name":ItemMenuStatus.UNLOAD,
                              "state":1
                           },{
                              "name":ItemMenuStatus.MOVE_TO_CHAT,
                              "state":1
                           }],_loc2_[0]);
                        }
                     }
                     else
                     {
                        this.itemMenu = this.initMenu([{
                           "name":ItemMenuStatus.SELECT_EQUIP,
                           "state":1
                        },{
                           "name":ItemMenuStatus.UNLOAD,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE_TO_CHAT,
                           "state":1
                        }],_loc2_[0]);
                     }
                  }
                  else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 0)
                  {
                     this.itemMenu = this.initMenu([{
                        "name":ItemMenuStatus.UNLOAD,
                        "state":1
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
                        "state":1
                     }],_loc2_[0]);
                  }
                  else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 1)
                  {
                     this.itemMenu = this.initMenu([{
                        "name":ItemMenuStatus.UNLOAD,
                        "state":1
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
                        "state":1
                     }],_loc2_[0]);
                  }
                  else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 2)
                  {
                     this.itemMenu = this.initMenu([{
                        "name":ItemMenuStatus.UNLOAD,
                        "state":1
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
                        "state":1
                     }],_loc2_[0]);
                  }
               }
               else
               {
                  if(ItemPositionRange.inMountBody(_loc4_.res.position))
                  {
                     if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 0)
                     {
                        _loc7_ = [{
                           "name":ItemMenuStatus.USE3,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.DESTROY,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE_TO_CHAT,
                           "state":1
                        }];
                        this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
                     }
                     else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 1)
                     {
                        _loc7_ = [{
                           "name":ItemMenuStatus.USE3,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.DESTROY,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE_TO_CHAT,
                           "state":1
                        },{
                           "name":ItemMenuStatus.ADD_SHELIZI,
                           "state":1
                        }];
                        this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
                     }
                     else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 2)
                     {
                        _loc7_ = [{
                           "name":ItemMenuStatus.USE3,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.DESTROY,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE_TO_CHAT,
                           "state":1
                        },{
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        }];
                        this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
                     }
                     if(_loc4_.res.position == ItemPositionRange.POSTION_HOURSE_NEW1 || _loc4_.res.position == ItemPositionRange.POSTION_HOURSE_NEW2 || _loc4_.res.position == ItemPositionRange.POSTION_HOURSE_NEW3 || _loc4_.res.position == ItemPositionRange.POSTION_HOURSE_NEW4 || _loc4_.res.position == ItemPositionRange.POSTION_HOURSE_NEW5)
                     {
                        if(_loc4_.id >= ItemPositionRange.ZUOQITESHU_RANGE1.x && _loc4_.id <= ItemPositionRange.ZUOQITESHU_RANGE1.y)
                        {
                           _loc7_.push({
                              "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                              "state":1
                           });
                        }
                        else if(ItemPositionRange.ZUOQITESHU_ARRAY.indexOf(_loc4_.id) == -1)
                        {
                           if(ItemPositionRange.ZUOQIPIJIA_ARRAY.indexOf(_loc4_.id) != -1)
                           {
                              _loc7_.push({
                                 "name":ItemMenuStatus.TIANSHANGZHIHUN_SHENGJIE,
                                 "state":1
                              });
                           }
                           else
                           {
                              _loc7_.push({
                                 "name":ItemMenuStatus.ZUOQI_DAZAO,
                                 "state":1
                              });
                           }
                        }
                     }
                     if(_loc4_.res.menuShengji)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHENGDAN_XUNZHANG_SHENGJI,
                           "state":1
                        });
                     }
                  }
                  else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 0)
                  {
                     if(SpecialGoodsID.FashionIDArr.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_ = [{
                           "name":ItemMenuStatus.MOVE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE_TO_CHAT,
                           "state":1
                        }];
                     }
                     else
                     {
                        _loc7_ = [{
                           "name":ItemMenuStatus.USE2,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.MOVE_TO_CHAT,
                           "state":1
                        }];
                     }
                     if(ItemPositionRange.POSITION_XIAOHUI_ARR.indexOf(_loc4_.res.position) == -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.DESTROY,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.SHEN_LONG_HU_SHEN_FU || _loc4_.id == SpecialGoodsID.CHUANSHUO_SHEN_LONG_HU_SHEN_FU)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        },{
                           "name":ItemMenuStatus.HUSHEN_XI_LIAN,
                           "state":1
                        },{
                           "name":ItemMenuStatus.CHUANSHUO_XI_LIAN,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.ZHAN_XUESHOU_HU_SHEN_FU)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.HUSHEN_XI_LIAN,
                           "state":1
                        });
                     }
                     if(SpecialGoodsID.YNAOJIANARR.indexOf(_loc4_.id) != -1 || SpecialGoodsID.YNCHANGEID.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.YNAOJIAN_ZHIZAO,
                           "state":1
                        });
                     }
                     if(SpecialGoodsID.YNSHENGJIEARR.indexOf(_loc4_.res.position) != -1 && SpecialGoodsID.YNNOSHENGJIEARRBYID.indexOf(_loc4_.id) == -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.YNAOJIAN_ZHIZAO,
                           "state":1
                        });
                     }
                     if(SpecialGoodsID.YN_SPECIALKAIFENG_ARR.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.HU_YI)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.KAI_GUANG,
                           "state":1
                        },{
                           "name":ItemMenuStatus.LING_HUA,
                           "state":1
                        },{
                           "name":ItemMenuStatus.XI_LIAN,
                           "state":1
                        },{
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        },{
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.HU_YI_KAI_GUANG)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.LING_HUA,
                           "state":1
                        },{
                           "name":ItemMenuStatus.XI_LIAN,
                           "state":1
                        },{
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        },{
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        },{
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.HUYI_LINHUA)
                     {
                     }
                     if(_loc4_.id == SpecialGoodsID.DI_YUN || _loc4_.id == SpecialGoodsID.LIU_YUN)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        });
                        _loc7_.push({
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuShengji)
                     {
                        if(_loc4_.id != 370171)
                        {
                           _loc7_.push({
                              "name":ItemMenuStatus.SHENGDAN_XUNZHANG_SHENGJI,
                              "state":1
                           });
                        }
                     }
                     if(_loc4_.res.menuXiangqian)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XUNZHANGXIANGQIAN,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuXiangqianSkill)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XIANGQIAN,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuShiSHiKaiFeng)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(ItemPositionRange.GOODSID_DUANLIAN_ARR.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.YN_DUANLIAN,
                           "state":1
                        });
                     }
                     if(ItemPositionRange.POSTION_WUFANG_ARR.indexOf(_loc4_.res.position) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.WUFANGQIANGHUA,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuQianghua)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                           "state":1
                        });
                     }
                     if(_loc4_.res.xunZhangXiLian)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.XUNZHANG_XILIAN,
                           "state":1
                        });
                     }
                     if(_loc4_.res.duoXuanQiangHua)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.DUOXUAN_QIANGHUA,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuJinHua)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHENQI_JINHUA,
                           "state":1
                        });
                     }
                     this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
                     if(_loc4_.id == SpecialGoodsID.LONGYIN)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.LONGYIN_KAI_GUANG,
                           "state":1
                        });
                        _loc7_.push({
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        });
                        _loc7_.push({
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        });
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.LONG_YIN_KAI_GUANG)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        });
                        _loc7_.push({
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        });
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.LONG_YA)
                     {
                     }
                     if(_loc4_.id == SpecialGoodsID.LONG_YA_KAI_GUANG)
                     {
                     }
                     if(_loc4_.id == SpecialGoodsID.QUAN_SHEN)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.QUANSHEN_JIHUO)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.id == SpecialGoodsID.SHENWU_LONGYA || _loc4_.id == SpecialGoodsID.SHENWU_LONGYA_YIKAIGUANG)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(ItemPositionRange.POSITION_XUNZHANG_ALL.indexOf(_loc4_.res.position) != -1)
                     {
                        if(_loc4_.res.grade <= OtherConst.xunzhang_zhanqi_duanzao)
                        {
                           _loc7_.push({
                              "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                              "state":1
                           });
                        }
                     }
                     if(ItemPositionRange.POSITION_ZHANQI_ALL.indexOf(_loc4_.res.position) != -1)
                     {
                        if(_loc4_.res.grade <= OtherConst.xunzhang_zhanqi_duanzao)
                        {
                           _loc7_.push({
                              "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                              "state":1
                           });
                        }
                     }
                     if(_loc4_.res.position == ItemPositionRange.POSTION_YUENANTESHUXUNZHANG1 || _loc4_.res.position == ItemPositionRange.POSTION_YUENANTESHUXUNZHANG2 || _loc4_.res.position == ItemPositionRange.POSTION_YUENANTESHUXUNZHANG3 || _loc4_.res.position == ItemPositionRange.POSTION_SHEDIAOXUNZHANG)
                     {
                        if(_loc4_.res.grade <= OtherConst.yuenanteshuxuznhang)
                        {
                           _loc7_.push({
                              "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                              "state":1
                           });
                        }
                     }
                     if(ItemPositionRange.POSITION_QIANGHUA_ARR.indexOf(_loc4_.res.position) != -1 && ItemPositionRange.YUENAN_NO_QIANGHUA_ID.indexOf(_loc4_.id) == -1)
                     {
                        if(_loc4_.id >= 741496 && _loc4_.id < 741502)
                        {
                           return;
                        }
                        if(_loc4_.res.grade <= OtherConst.xuanyuanjian && OtherConst.removeXunzhangDuanzao.indexOf(_loc4_.id) < 0)
                        {
                           _loc7_.push({
                              "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                              "state":1
                           });
                        }
                     }
                     if(ItemPositionRange.YN_QIANGHUA_BYID.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                           "state":1
                        });
                     }
                     if(ItemPositionRange.POSITION_TIANSHANGZHIHUN_Arr.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.TIANSHANGZHIHUN_SHENGJIE,
                           "state":1
                        });
                     }
                     _loc9_ = 0;
                     for each(_loc10_ in _loc7_)
                     {
                        if(_loc10_.name == ItemMenuStatus.ADD_STONE)
                        {
                           _loc9_ = 1;
                        }
                     }
                     if(_loc9_ != 1)
                     {
                        for each(_loc12_ in ItemPositionRange.POSITION_NB_WEAPON_ARR)
                        {
                           if(_loc4_.res.position == _loc12_)
                           {
                              if(_loc4_.id != SpecialGoodsID.LONGYIN && _loc4_.id != SpecialGoodsID.LONG_YIN_KAI_GUANG && _loc4_.id != SpecialGoodsID.QUAN_SHEN && _loc4_.id != SpecialGoodsID.QUAN_SHEN_JIHUO)
                              {
                              }
                              if(_loc4_.res.position != 59 && _loc4_.res.position != 52 && _loc4_.res.position != 54 && ItemPositionRange.YUENAN_NO_XIANGQIAN.indexOf(_loc4_.res.position) == -1)
                              {
                                 _loc7_.push({
                                    "name":ItemMenuStatus.ADD_STONE,
                                    "state":1
                                 });
                                 _loc7_.push({
                                    "name":ItemMenuStatus.SUPER_XIANGQIAN,
                                    "state":1
                                 });
                              }
                              break;
                           }
                        }
                     }
                     this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
                     _loc11_ = 0;
                     while(_loc11_ < SpecialGoodsID.ZHUANGBEI_JIHUO_ARRAY.length)
                     {
                        if(_loc4_.id == SpecialGoodsID.ZHUANGBEI_JIHUO_ARRAY[_loc11_])
                        {
                           _loc7_.push({
                              "name":ItemMenuStatus.ZHUANGBEI_JI_HUO,
                              "state":1
                           });
                        }
                        _loc11_++;
                     }
                  }
                  else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 1)
                  {
                     _loc7_ = [{
                        "name":ItemMenuStatus.USE2,
                        "state":1
                     },{
                        "name":ItemMenuStatus.MOVE,
                        "state":1
                     },{
                        "name":ItemMenuStatus.DESTROY,
                        "state":1
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
                        "state":1
                     },{
                        "name":ItemMenuStatus.ADD_SHELIZI,
                        "state":1
                     }];
                     this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
                  }
                  else if(EquipMosaic.getEquipMosaicData(_loc4_.id) == 2)
                  {
                     _loc7_ = [{
                        "name":ItemMenuStatus.USE2,
                        "state":1
                     },{
                        "name":ItemMenuStatus.MOVE,
                        "state":1
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
                        "state":1
                     }];
                     if(_loc4_.res.menuXiangqianSkill)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XIANGQIAN,
                           "state":1
                        });
                     }
                     else if(SpecialGoodsID.XUANYUANTIAN_ID.indexOf(_loc4_.id) == -1 && SpecialGoodsID.XUANYUANDI_ID.indexOf(_loc4_.id) == -1 && SpecialGoodsID.XUANYUANREN_ID.indexOf(_loc4_.id) == -1 && SpecialGoodsID.AOJIAN_ID.indexOf(_loc4_.id) == -1 && ItemPositionRange.YUENAN_NO_XIANGQIAN.indexOf(_loc4_.res.position) == -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.ADD_STONE,
                           "state":1
                        });
                        _loc7_.push({
                           "name":ItemMenuStatus.SUPER_XIANGQIAN,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuShiSHiKaiFeng)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHISHIKAIFENG,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuShengji)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHENGDAN_XUNZHANG_SHENGJI,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuXiangqian)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XUNZHANGXIANGQIAN,
                           "state":1
                        });
                     }
                     else
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.DESTROY,
                           "state":1
                        });
                     }
                     if(ItemPositionRange.GOODSID_DUANLIAN_ARR.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.YN_DUANLIAN,
                           "state":1
                        });
                     }
                     if(ItemPositionRange.POSTION_WUFANG_ARR.indexOf(_loc4_.res.position) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.WUFANGQIANGHUA,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuQianghua)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                           "state":1
                        });
                     }
                     if(_loc4_.res.xunZhangXiLian)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.XUNZHANG_XILIAN,
                           "state":1
                        });
                     }
                     if(_loc4_.res.duoXuanQiangHua)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.DUOXUAN_QIANGHUA,
                           "state":1
                        });
                     }
                     if(_loc4_.res.menuJinHua)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.SHENQI_JINHUA,
                           "state":1
                        });
                     }
                     if(SpecialGoodsID.XUANYUANTIAN_ID.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XIANGQIAN,
                           "state":1
                        });
                     }
                     if(SpecialGoodsID.XUANYUANDI_ID.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XIANGQIAN,
                           "state":1
                        });
                     }
                     if(SpecialGoodsID.XUANYUANREN_ID.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XIANGQIAN,
                           "state":1
                        });
                     }
                     if(SpecialGoodsID.AOJIAN_ID.indexOf(_loc4_.id) != -1)
                     {
                        _loc7_.push({
                           "name":ItemMenuStatus.MENU_XIANGQIAN,
                           "state":1
                        });
                     }
                     this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
                  }
                  if(_loc4_.res.limit_grade == 100 && _loc4_.res.popsinger != 5 && _loc4_.res.popsinger != 6)
                  {
                     _loc7_.push({
                        "name":ItemMenuStatus.KUAISU_SHEGNJIE,
                        "state":1
                     });
                  }
                  if(_loc4_.res.menuFenjieYN)
                  {
                     _loc7_.push({
                        "name":ItemMenuStatus.YNFENJIE,
                        "state":1
                     });
                  }
                  if((_loc4_.res.position <= 12 || _loc4_.res.position > 20 && _loc4_.res.position < 25 || _loc4_.res.position == 3537 || ItemPositionRange.XUNZHANG_ADD_YANGCHENG.indexOf(_loc4_.res.position) != -1) && (_loc4_.res.grade == 8 || _loc4_.res.grade == 9))
                  {
                     _loc7_.push({
                        "name":ItemMenuStatus.ZHUANGBEI_YANGCHENG,
                        "state":1
                     });
                  }
                  if(_loc4_.id == 350251 || _loc4_.id == 350271)
                  {
                     _loc7_.push({
                        "name":ItemMenuStatus.SPLIT,
                        "state":1
                     });
                  }
                  this.itemMenu = this.initMenu(_loc7_,_loc2_[0]);
               }
            }
            else if(_loc6_ == 6)
            {
               _loc8_.push({
                  "name":ItemMenuStatus.USE,
                  "state":1
               });
               _loc8_.push({
                  "name":ItemMenuStatus.MOVE,
                  "state":1
               });
               _loc8_.push({
                  "name":ItemMenuStatus.DESTROY,
                  "state":1
               });
               _loc8_.push({
                  "name":ItemMenuStatus.MOVE_TO_CHAT,
                  "state":1
               });
               if(_loc5_ != 1)
               {
                  if(_loc4_.id != 723238)
                  {
                     _loc8_.push({
                        "name":ItemMenuStatus.SPLIT,
                        "state":1
                     });
                  }
               }
               if(!(_loc4_.id == 723238 || _loc4_.id >= 728726 && _loc4_.id <= 728735 || _loc4_.id >= 728736 && _loc4_.id <= 728745 || _loc4_.id >= 728762 && _loc4_.id <= 728771 || _loc4_.id >= 728772 && _loc4_.id <= 728781 || _loc4_.id >= 728939 && _loc4_.id <= 728948 || _loc4_.id >= 729046 && _loc4_.id <= 729055 || _loc4_.id >= 729056 && _loc4_.id <= 729065))
               {
                  _loc8_.push({
                     "name":ItemMenuStatus.SYNTHESIS_STONE,
                     "state":1
                  });
               }
               this.itemMenu = this.initMenu(_loc8_,_loc2_[0]);
            }
            else if(_loc6_ == 50)
            {
               if(_loc5_ != 1)
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
                     "state":1
                  },{
                     "name":ItemMenuStatus.TISHENGPINZHI,
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
                     "state":1
                  },{
                     "name":ItemMenuStatus.TISHENGPINZHI,
                     "state":1
                  }],_loc2_[0]);
               }
            }
            else if(_loc6_ == 11)
            {
               if(_loc5_ != 1)
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
                     "state":1
                  }],_loc2_[0]);
               }
            }
            else if(_loc6_ == 13)
            {
               if(ItemPositionRange.YUENAN_ZHAOYUANWUHUJIANGARR.indexOf(_loc4_.id) != -1)
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
                     "state":1
                  },{
                     "name":ItemMenuStatus.XUNZHANG_DUANZAO,
                     "state":1
                  }],_loc2_[0]);
               }
               else if(_loc5_ != 1)
               {
                  if(_loc3_.getBaseItem().id == 727217 || _loc3_.getBaseItem().id == 725550 || _loc3_.getBaseItem().id == 40771 || _loc3_.getBaseItem().id == 40772 || _loc3_.getBaseItem().id == 40773 || _loc3_.getBaseItem().id == 40774 || _loc3_.getBaseItem().id == 40775)
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
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
                        "state":1
                     }],_loc2_[0]);
                  }
                  else if(SpecialGoodsID.BUXIANSHISHIYONGGOODSID.indexOf(_loc3_.getBaseItem().id) != -1)
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
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
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
                     },{
                        "name":ItemMenuStatus.MOVE_TO_CHAT,
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
                     "state":1
                  }],_loc2_[0]);
               }
            }
            else if(_loc5_ != 1)
            {
               if(_loc3_.getBaseItem().id == 727217 || _loc3_.getBaseItem().id == 725550 || _loc3_.getBaseItem().id == 40771 || _loc3_.getBaseItem().id == 40772 || _loc3_.getBaseItem().id == 40773 || _loc3_.getBaseItem().id == 40774 || _loc3_.getBaseItem().id == 40775)
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
                     "state":1
                  }],_loc2_[0]);
               }
               else if(SpecialGoodsID.BUXIANSHISHIYONGGOODSID.indexOf(_loc3_.getBaseItem().id) != -1)
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
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
                  },{
                     "name":ItemMenuStatus.MOVE_TO_CHAT,
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
               },{
                  "name":ItemMenuStatus.MOVE_TO_CHAT,
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
               },{
                  "name":ItemMenuStatus.MOVE_TO_CHAT,
                  "state":1
               }],_loc2_[0]);
            }
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOVE)
         {
            TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOREN);
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
            sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,_loc3_,_loc2_[1],ItemPositionRange.CONTAINER_BAG]);
            TCursorManager.currentItemFace = null;
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_PLCQ)
         {
            if(!_loc3_)
            {
               return;
            }
            sendNotification(Item_ApplicationFacade.ITEM_MOVE,[_loc3_,null,0,ItemPositionRange.CONTAINER_DEPOT]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_PLCQ_KUAFU)
         {
            if(!_loc3_)
            {
               return;
            }
            sendNotification(Item_ApplicationFacade.ITEM_MOVE,[_loc3_,null,0,ItemPositionRange.CONTAINER_BAG_KUAFU]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_SHANGJIA)
         {
            if(!_loc3_)
            {
               return;
            }
            this.mainCharShopMediator.showGoodAddedPanel(_loc3_.getBaseItem());
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_SHANGJIA_WJJJY)
         {
            if(!_loc3_)
            {
               return;
            }
            this.mainCharTradeMediator.addGoodsClick(_loc3_.getBaseItem());
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MAICHU)
         {
            if(!_loc3_)
            {
               return;
            }
            this.npcShop.showSalePanel(_loc3_.getBaseItem());
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_XUANZEHUA)
         {
            if(!_loc3_)
            {
               return;
            }
            this.mainCharSendFlower.addFlower(_loc3_.getBaseItem());
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DOLL_EMPTY)
         {
            if(!_loc3_)
            {
               return;
            }
            _loc13_ = _loc3_.getItem() as Goods;
            if(_loc13_.id == SpecialGoodsID.MOXUEDOLL_EMPTY)
            {
               PipeManager.sendMsg(PipeConstants.SELECT_MOXUE_DOLL,[0,_loc3_]);
            }
            else
            {
               PipeManager.sendMsg(PipeConstants.SELECT_DOLL,[0,_loc3_]);
            }
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DOLL_FULL)
         {
            if(!_loc3_)
            {
               return;
            }
            _loc13_ = _loc3_.getItem() as Goods;
            if(_loc13_.id == SpecialGoodsID.MOXUEDOLL_FULL)
            {
               PipeManager.sendMsg(PipeConstants.SELECT_MOXUE_DOLL,[1,_loc3_]);
            }
            else
            {
               PipeManager.sendMsg(PipeConstants.SELECT_DOLL,[1,_loc3_]);
            }
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DOLL_SUPER_FULL)
         {
            if(!_loc3_)
            {
               return;
            }
            PipeManager.sendMsg(PipeConstants.SELECT_DOLL_SUPER,[1,_loc3_]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_SELECT_YUPEI)
         {
            if(!_loc3_)
            {
               return;
            }
            PipeManager.sendMsg(PipeConstants.SELECT_YUPEI,_loc3_);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_SELECT_YUPEI_SWITCH)
         {
            if(!_loc3_)
            {
               return;
            }
            PipeManager.sendMsg(PipeConstants.SELECT_YUPEI_SWITCH,_loc3_);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOXUEDOLL_EMPTY)
         {
            if(!_loc3_)
            {
               return;
            }
            PipeManager.sendMsg(PipeConstants.SELECT_MOXUE_DOLL,[0,_loc3_]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOXUEDOLL_FULL)
         {
            if(!_loc3_)
            {
               return;
            }
            PipeManager.sendMsg(PipeConstants.SELECT_MOXUE_DOLL,[1,_loc3_]);
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_XUEYIN)
         {
            if(!_loc3_)
            {
               return;
            }
         }
      }
      
      private function onItemMenuClick(param1:BaseEvent) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:String = param1.data.toString();
         switch(_loc2_)
         {
            case ItemMenuStatus.USE:
            case ItemMenuStatus.USE2:
            case ItemMenuStatus.USE3:
               _loc3_ = TCursorManager.currentItemFace.getBaseItem() as Goods;
               sendNotification(Item_ApplicationFacade.ITEM_USE,[TCursorManager.currentItemFace,0]);
               break;
            case ItemMenuStatus.MOVE:
               TCursorManager.setCurrentStatus(TCursorManager.CURSOR_MOVE);
               this.itemMove();
               break;
            case ItemMenuStatus.DESTROY:
               this.showDestroyItem(TCursorManager.currentItemFace.getBaseItem());
               break;
            case ItemMenuStatus.SPLIT:
               this.showSplitItem(TCursorManager.currentItemFace.getBaseItem());
               break;
            case ItemMenuStatus.MOVE_TO_CHAT:
               GameInstance.uiInstance.mainUI.setItemToChat(TCursorManager.currentItemFace.getBaseItem() as Goods,GameInstance.mainChar.id);
               break;
            case ItemMenuStatus.SYNTHESIS_STONE:
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.ADD_STONE:
               PipeManager.sendMsg(PipeConstants.SHOW_EASY_STONE_ADD_TO_EQUIP_PLANE,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.UNLOAD:
               if(SpecialGoodsID.YNCHANGEID.indexOf(TCursorManager.currentItemFace.getBaseItem().id) != -1 || TCursorManager.currentItemFace.getBaseItem().id == 722415 || TCursorManager.currentItemFace.getBaseItem().id == SpecialGoodsID.YNCHANGEIDNEW)
               {
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,0,ItemPositionRange.CONTAINER_BAG,0,GameInstance.mainCharData.girlInfo.selectedGirlID]);
               }
               else
               {
                  sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,null,0,ItemPositionRange.CONTAINER_BAG]);
                  if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
                  {
                     if(GameInstance.uiInstance.charAttribute.shibatongrenVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestShiBaTongRen();
                     }
                     else if(GameInstance.uiInstance.charAttribute.feilongtanyunshouVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestFeiLong();
                     }
                     else if(GameInstance.uiInstance.charAttribute.dantianVisible())
                     {
                        GameInstance.uiInstance.charAttribute.requestShowDantianPanel();
                     }
                  }
               }
               break;
            case ItemMenuStatus.ADD_SHELIZI:
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT_ADD_SHELIZI,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.EQUIP2BAOSHI:
               PipeManager.sendMsg(PipeConstants.CLICK_EUQIP2BAOSHI,TCursorManager.currentItemFace.getBaseItem());
               break;
            case ItemMenuStatus.KAI_GUANG:
               PipeManager.sendMsg(PipeConstants.HUYI_KAIGUANG,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.LING_HUA:
               PipeManager.sendMsg(PipeConstants.HUYI_LINGHUA,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.XI_LIAN:
               PipeManager.sendMsg(PipeConstants.HUYI_XILIAN,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.LONGYIN_KAI_GUANG:
               PipeManager.sendMsg(PipeConstants.LONGYIN_KAIGUANG,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.KUAISU_SHEGNJIE:
               PipeManager.sendMsg(PipeConstants.KUAISU_SHEGNJIE,TCursorManager.currentItemFace.getBaseItem());
               break;
            case ItemMenuStatus.SELECT_EQUIP:
               GameInstance.uiInstance.charAttribute.showJiaoSelect();
               break;
            case ItemMenuStatus.YN_SELECT_SBTR_EQUIP:
               GameInstance.uiInstance.charAttribute.showSelectJianBarSBTR();
               break;
            case ItemMenuStatus.ZHUANGBEI_JI_HUO:
               PipeManager.sendMsg(PipeConstants.ZHUANGBEI_JIHUO,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.LONGYA_KAI_GUANG:
               PipeManager.sendMsg(PipeConstants.LONGYA_KAIGUANG,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.HUSHEN_XI_LIAN:
               PipeManager.sendMsg(PipeConstants.HUSHENFU_XILIAN,[TCursorManager.currentItemFace.getBaseItem() as Goods,0]);
               break;
            case ItemMenuStatus.ZHUANGBEI_YANGCHENG:
               PipeManager.sendMsg(PipeConstants.ZHUANGBEI_YANGCHENG,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.XUNZHANG_DUANZAO:
               PipeManager.sendMsg(PipeConstants.XUNZHANG_DUANZAO,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.ZUOQI_DAZAO:
               PipeManager.sendMsg(PipeConstants.ZUOQI_DAZAO,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.MENU_XIANGQIAN:
               PipeManager.sendMsg(PipeConstants.MENU_XIANGQIAN,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.SUPER_XIANGQIAN:
               PipeManager.sendMsg(PipeConstants.SUPER_XIANGQIAN,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.SHISHIKAIFENG:
               PipeManager.sendMsg(PipeConstants.SHISHIKAIFENG,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.TISHENGPINZHI:
               PipeManager.sendMsg(PipeConstants.TISHENGPINZHI,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.SHENGDAN_XUNZHANG_SHENGJI:
               PipeManager.sendMsg(PipeConstants.PACK_SHOW_SHENGDAN_XUNZHANG_SHENGJI,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.MENU_XUNZHANGXIANGQIAN:
               PipeManager.sendMsg(PipeConstants.MENU_XUNZHANGXIANGQIAN,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.XUNZHANG_XILIAN:
               PipeManager.sendMsg(PipeConstants.HUSHENFU_XILIAN,[TCursorManager.currentItemFace.getBaseItem() as Goods,0]);
               break;
            case ItemMenuStatus.DUOXUAN_QIANGHUA:
               PipeManager.sendMsg(PipeConstants.DUOXUAN_QIANGHUA,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.SHENQI_JINHUA:
               PipeManager.sendMsg(PipeConstants.SHENQI_JINHUA,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.TIANSHANGZHIHUN_SHENGJIE:
               PipeManager.sendMsg(PipeConstants.SHOW_TIANSHANGZHIHUN_SHENGJIE,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.CHUANSHUO_XI_LIAN:
               PipeManager.sendMsg(PipeConstants.HUSHENFU_XILIAN,[TCursorManager.currentItemFace.getBaseItem() as Goods,1]);
               break;
            case ItemMenuStatus.YNAOJIAN_ZHIZAO:
               PipeManager.sendMsg(PipeConstants.SHOW_YUENANAOJIANZHIZAOPANEL1,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.YNFENJIE:
               PipeManager.sendMsg(PipeConstants.YN_WUPINFENJIE,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.WUFANGQIANGHUA:
               PipeManager.sendMsg(PipeConstants.SHOW_WUFANGQIANGHUA_PANEL,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.YN_PILIANG:
               PipeManager.sendMsg(PipeConstants.SHOW_PILIANGUSE_PANEL,TCursorManager.currentItemFace.getBaseItem() as Goods);
               break;
            case ItemMenuStatus.YN_DUANLIAN:
               PipeManager.sendMsg(PipeConstants.SHOW_DUANLIAN_PANEL,TCursorManager.currentItemFace.getBaseItem() as Goods);
         }
      }
      
      private function itemMove() : void
      {
         TCursorManager.showItem(TCursorManager.currentItemFace.itemBD);
         TCursorManager.lockOnMouseStatus();
      }
      
      public function showDestroyItem(param1:BaseItem) : void
      {
         this._readyDestroyItem = param1;
         var _loc2_:Goods = this._readyDestroyItem as Goods;
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_.isShowDestroyPanel)
         {
            if(!this.tishiCanvas)
            {
               this.tishiCanvas = new DestroyTiShiCanvas();
            }
            POPWindowManager.showWindow(this.tishiCanvas);
            return;
         }
         if(_loc2_.res.f_discard_is_ui == 1)
         {
            this.backpack.showItemDestroyPanel(this._readyDestroyItem as Goods);
            TCursorManager.resumFullMouse();
         }
         else
         {
            this.itemProxy.removeItem(this._readyDestroyItem);
         }
      }
      
      private function initMenu(param1:Array, param2:MouseEvent) : Menu
      {
         if(this.itemMenu != null)
         {
            this.itemMenu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
            this.itemMenu.destroy();
         }
         this.itemMenu = Menu.addMenuItem(param1,param2);
         if(!this.itemMenu.hasEventListener(Menu.MENUITEM_CLICK))
         {
            this.itemMenu.addEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
         }
         return this.itemMenu;
      }
      
      public function showSplitItem(param1:BaseItem) : void
      {
         this.backpack.showItemSplitPanel(param1.count - 1);
      }
      
      private function onSplitItem(param1:BaseEvent) : void
      {
         var _loc2_:int = Number(param1.data);
         this.itemProxy.splitItem(TCursorManager.currentItemFace.getBaseItem(),_loc2_);
      }
      
      public function updateCopper(param1:int) : void
      {
         GameInstance.mainCharData.moneyInfo.copper = param1;
         this.initBag();
      }
      
      public function updateGoldAndGift(param1:int, param2:int) : void
      {
         GameInstance.mainCharData.moneyInfo.gold = param1;
         GameInstance.mainCharData.moneyInfo.gifts = param2;
         this.initBag();
      }
      
      private function useShortKey(param1:String, param2:Object) : void
      {
         var _loc3_:BaseItem = ExchangePositionManager.checkItemShortIndex(Number(param1));
         this.useMouseShortKey(_loc3_,param2);
      }
      
      public function useMouseShortKey(param1:BaseItem, param2:Object) : void
      {
         var _loc4_:Skill = null;
         var _loc3_:ItemFace = GameInstance.uiInstance.mainUI.getItemFaceByBaseItem(param1);
         if(!param1)
         {
            return;
         }
         if(param1 is Skill)
         {
            _loc4_ = param1 as Skill;
            if(_loc4_.id != OtherConst.DEFAULT_SKILL_ID && _loc4_.res.wugong_type == 3 && OtherConst.YN_SKILL_ID_ARR_LIULONGZHUANGBEI.indexOf(_loc4_.id) == -1)
            {
               this.showOtherSkillPanel(_loc4_);
               return;
            }
            if(_loc4_.res.skilltype == 1)
            {
               this.setRideMainSkill(_loc3_);
            }
            else if(_loc4_.res.skilltype == 2)
            {
               this.setMainSkill(_loc3_);
            }
         }
         if(_loc3_ != null && CDFaceManager.isCooling(_loc3_.getBaseItem().getID()))
         {
            if(param1 is Goods)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该道具处于冷却时间内"));
            }
            else if(param1 is Skill)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该技能处于冷却时间内"));
            }
            return;
         }
         if(param1 is Skill)
         {
            PipeManager.sendMsg(PipeConstants.USE_SKILL,param1);
         }
         else if(param1 is Goods)
         {
            ExchangePositionManager.checkUseDrugSound(param1 as Goods);
            if(param1.id == SpecialGoodsID.ZHENGGUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  this.sender.send_73135(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(param1.id == SpecialGoodsID.DOUDIZHUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  this.sender.send_73469(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(param1.id == SpecialGoodsID.FEIBIAODAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  this.sender.send_73719(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else
            {
               this.sender.send_11203([param1.quickbarindex,param1.id]);
            }
         }
      }
      
      private function useShortKey2(param1:String, param2:Object) : void
      {
         if(!GameInstance.mainCharData.mountInfo.currentFightMount)
         {
            return;
         }
         var _loc3_:BaseItem = ExchangePositionManager.checkItemShortIndexByMount(Number(param1));
         var _loc4_:ItemFace = GameInstance.uiInstance.mainUI.getItemFaceByBaseItem(_loc3_);
         if(!_loc3_)
         {
            return;
         }
         this.setRideMainSkill(_loc4_);
         if(_loc4_ != null && CDFaceManager.isCooling(_loc4_.getBaseItem().getID()))
         {
            if(_loc3_ is Goods)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该道具处于冷却时间内"));
            }
            else if(_loc3_ is Skill)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("该技能处于冷却时间内"));
            }
            return;
         }
         if(_loc3_ is Skill)
         {
            PipeManager.sendMsg(PipeConstants.USE_SKILL,_loc3_);
         }
         else if(_loc3_ is Goods)
         {
            ExchangePositionManager.checkUseDrugSound(_loc3_ as Goods);
            if(_loc3_.id == SpecialGoodsID.ZHENGGUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  this.sender.send_73135(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(_loc3_.id == SpecialGoodsID.DOUDIZHUDAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  this.sender.send_73469(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else if(_loc3_.id == SpecialGoodsID.FEIBIAODAOJU)
            {
               if(Boolean(GameInstance.lockOnChar) && GameInstance.lockOnChar.type == SceneCharacterType.PLAYER)
               {
                  this.sender.send_73719(GameInstance.lockOnChar.id);
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,"对不起，需要目标玩家");
               }
            }
            else
            {
               this.sender.send_11203([_loc3_.quickbarindex,_loc3_.id]);
            }
         }
      }
      
      private function showOtherSkillPanel(param1:Skill) : void
      {
         switch(param1.id)
         {
            case 50001:
               if(TCursorManager.getCurruntStatus() != TCursorManager.CURSOR_TIAOYUE)
               {
                  TCursorManager.showCursor(TCursorManager.CURSOR_TIAOYUE);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case 50002:
               if(GameInstance.mainChar.isJumping())
               {
                  return;
               }
               PipeManager.sendMsg(PipeConstants.SEND_DAZUO);
               break;
            case 50003:
               PipeManager.sendMsg(PipeConstants.KEY_SPACE);
               break;
            case 50004:
               PipeManager.sendMsg(PipeConstants.UP_DOWN_HORSE);
               break;
            case 50005:
               break;
            case 50006:
               if(GameInstance.mainCharData.afkInfo2.isStart)
               {
                  PipeManager.sendMsg(PipeConstants.AFK_START,0);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.AFK_START,1);
               }
               break;
            case 50007:
               PipeManager.sendMsg(PipeConstants.SHOW_AFK_PANEL);
               break;
            case 50008:
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
               break;
            case 50009:
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
               break;
            case 50010:
               break;
            case 50011:
               if(GameInstance.mainChar.isJumping())
               {
                  return;
               }
               PipeManager.sendMsg(PipeConstants.SEND_DAZUO);
         }
      }
      
      private function setMainSkill(param1:ItemFace) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:Skill = param1.getBaseItem() as Skill;
         if(!_loc2_ || _loc2_.res.shortType == 1)
         {
            return;
         }
         if(Fight_proxy.mainChar_skillID == _loc2_.id)
         {
            return;
         }
         Fight_proxy.mainChar_skillID = _loc2_.id;
         Fight_proxy.mainChar_skillDistance = _loc2_.res.distance * 25;
         this.sender.send_10279(Fight_proxy.mainChar_skillID);
         if(GameInstance.mainCharData.skillInfo.mainSkillItemFace)
         {
            GameInstance.mainCharData.skillInfo.mainSkillItemFace.Select = false;
         }
         GameInstance.mainCharData.skillInfo.mainSkillItemFace = param1;
         GameInstance.mainCharData.skillInfo.mainSkillItemFace.Select = true;
         GameInstance.mainCharData.skillInfo.mainSkill = param1.getBaseItem() as Skill;
      }
      
      private function setRideMainSkill(param1:ItemFace) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:Skill = param1.getBaseItem() as Skill;
         if(!_loc2_ || _loc2_.res.shortType == 1)
         {
            return;
         }
         this.sender.send_10281(_loc2_.id);
         if(GameInstance.mainCharData.skillInfo.rideMainSkillItemFace)
         {
            GameInstance.mainCharData.skillInfo.rideMainSkillItemFace.Select = false;
         }
         GameInstance.mainCharData.skillInfo.rideMainSkillItemFace = param1;
         GameInstance.mainCharData.skillInfo.rideMainSkillItemFace.Select = true;
         GameInstance.mainCharData.skillInfo.rideMainSkill = param1.getBaseItem() as Skill;
      }
      
      public function checkFirstDrug(param1:Goods) : void
      {
         if(GameInstance.mainCharData.attributeInfo.lv > 2)
         {
            return;
         }
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide24);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide25);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide26);
         if(!NewPlayerGuideStaticFun.getNewPlayerGuideVO(NewPlayerGuideType.Guide24).getIsComplete)
         {
            if(param1.res.kind == GoodsKind.K3 && param1.res.drug_kind == DrugsKind.HP)
            {
               if(!ExchangePositionManager.checkItemShortIndex(10))
               {
                  this.sender.send_10179([param1.position,10]);
                  NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide24);
               }
            }
         }
         if(!NewPlayerGuideStaticFun.getNewPlayerGuideVO(NewPlayerGuideType.Guide25).getIsComplete)
         {
            if(param1.res.kind == GoodsKind.K3 && param1.res.drug_kind == DrugsKind.MP)
            {
               if(!ExchangePositionManager.checkItemShortIndex(9))
               {
                  this.sender.send_10179([param1.position,9]);
                  NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide25);
               }
            }
         }
         if(!NewPlayerGuideStaticFun.getNewPlayerGuideVO(NewPlayerGuideType.Guide26).getIsComplete)
         {
            if(param1.res.kind == GoodsKind.K3 && param1.res.drug_kind == DrugsKind.SP)
            {
               if(!ExchangePositionManager.checkItemShortIndex(8))
               {
                  this.sender.send_10179([param1.position,8]);
                  NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide26);
               }
            }
         }
      }
      
      public function useSpecialItem(param1:int, param2:String, param3:String = "") : void
      {
         var myHandler:Function = null;
         var $posID:int = param1;
         var $str:String = param2;
         var $title:String = param3;
         myHandler = function(param1:FAlertEvent):void
         {
            sender.send_53091({
               "posID":$posID,
               "str":String(param1.eventData)
            });
         };
         ItemSpecialUseAlert.show($str,$title,myHandler);
      }
      
      public function use_LKZX() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            GameInstance.uiInstance.charAttribute.showFeiLongTanYunShou();
         }
         else
         {
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.charAttribute);
            GameInstance.uiInstance.charAttribute.initCharPanel(2,"8");
            ResizeManager.showDoublePanel(GameInstance.uiInstance.charAttribute,this.backpack);
         }
      }
      
      public function setSafeLock(param1:Boolean) : void
      {
         this.backpack.isHave(param1);
      }
      
      public function setSafeLockState(param1:int) : void
      {
         var _loc2_:Boolean = false;
         if(param1 == 1)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         this.backpack.setSafeState(_loc2_);
      }
      
      public function updateSafePanelClose() : void
      {
         this.backpack.updateSafePanelClose();
      }
      
      public function safeUnlockClose() : void
      {
         this.backpack.safeUnlockClose();
      }
      
      public function posuo(param1:int) : void
      {
         this.backpack.posuo(param1);
      }
   }
}

