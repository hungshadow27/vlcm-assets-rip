package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.NpcShopType;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.Item_TipProxy;
   import com.tgame.shell.view.components.DestroyTiShiCanvas;
   import com.tgame.shell.view.components.NPCShopPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_NPCShopMediator extends Mediator
   {
      
      public static const NAME:String = "Item_NPCShopMediator";
      
      private var showMenuItem:ItemFace;
      
      private var itemMenu:Menu;
      
      private var shopArray:Array;
      
      private var page:int;
      
      private var pageTotal:int;
      
      private var selectedGoods:Goods;
      
      private var saleGoods:Goods;
      
      private var npcID:int;
      
      private var npcRes:NpcRes;
      
      private var _itemTipProxy:Item_TipProxy;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var tishiCanvas:DestroyTiShiCanvas;
      
      public function Item_NPCShopMediator()
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
      
      protected function get npcShop() : NPCShopPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.npcShopPanel);
         }
         return viewComponent as NPCShopPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Item_ApplicationFacade.NPC_REQ_FUNCTION];
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
               if(_loc3_ != NpcFunctionType.DEAL)
               {
                  return;
               }
               if(!Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
               }
               this.showNPCSale();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(NPCShopPanel,function():void
         {
            npcShop.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            npcShop.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_ITEM_CLICK,onClickItem);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_BUY_OK,onClickItemOK);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_BUYBTN_CLICK,onClickBuyItem);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_GET_ITEM,onClickSwitchType);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_SELLBTN_CLICK,onClickSaleItem);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_SELL_OK,onClickSaleItemOK);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_REPAIRBTN_CLICK,onClickRepair);
            npcShop.addEventListener(NPCShopPanel.UI_NPC_SHOP_GET_PAGE,onClickShopPage);
         });
         UIEventsRegisterManager.addUIRemovedEvent(NPCShopPanel,function():void
         {
            npcShop.removeEventListener(Event.ADDED_TO_STAGE,onAddToStage);
            npcShop.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveToStage);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_ITEM_CLICK,onClickItem);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_BUY_OK,onClickItemOK);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_BUYBTN_CLICK,onClickBuyItem);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_GET_ITEM,onClickSwitchType);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_SELLBTN_CLICK,onClickSaleItem);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_SELL_OK,onClickSaleItemOK);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_REPAIRBTN_CLICK,onClickRepair);
            npcShop.removeEventListener(NPCShopPanel.UI_NPC_SHOP_GET_PAGE,onClickShopPage);
         });
      }
      
      private function onClickRepair(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_REPAIR_PANEL);
      }
      
      private function onClickShopPage(param1:BaseEvent) : void
      {
         var _loc3_:Array = null;
         var _loc2_:int = Number(param1.data);
         if(_loc2_ == 1)
         {
            --this.page;
            if(this.page <= 1)
            {
               this.page = 1;
            }
            _loc3_ = this.getPageItems(this.page,30,this.npcRes.shop_type);
            this.npcShop.setItem(_loc3_,this.page,this.pageTotal);
         }
         else
         {
            ++this.page;
            if(this.page >= this.pageTotal)
            {
               this.page = this.pageTotal;
            }
            _loc3_ = this.getPageItems(this.page,30,this.npcRes.shop_type);
            this.npcShop.setItem(_loc3_,this.page,this.pageTotal);
         }
      }
      
      private function onClickSwitchType(param1:BaseEvent) : void
      {
         var _loc2_:Array = null;
         switch(Number(param1.data))
         {
            case 2:
               _loc2_ = this.getPageItems(this.page,30,NpcShopType.SHOP_2,PartyType.SHAOLINPAI);
               this.page = 1;
               this.npcShop.setItem(_loc2_,this.page,this.pageTotal);
               break;
            case 3:
               _loc2_ = this.getPageItems(this.page,30,NpcShopType.SHOP_2,PartyType.QUANZHENJIAO);
               this.page = 1;
               this.npcShop.setItem(_loc2_,this.page,this.pageTotal);
               break;
            case 4:
               _loc2_ = this.getPageItems(this.page,30,NpcShopType.SHOP_2,PartyType.GUMUPAI);
               this.page = 1;
               this.npcShop.setItem(_loc2_,this.page,this.pageTotal);
               break;
            case 5:
               _loc2_ = this.getPageItems(this.page,30,NpcShopType.SHOP_2,PartyType.TAOHUADAO);
               this.page = 1;
               this.npcShop.setItem(_loc2_,this.page,this.pageTotal);
         }
      }
      
      private function onClickSaleItem(param1:BaseEvent) : void
      {
         TCursorManager.resumFullMouse();
         TCursorManager.showCursor(TCursorManager.CURSOR_MAICHU);
         TCursorManager.lockOnMouseStatus();
      }
      
      private function onClickSaleItemOK(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data[0]);
         var _loc3_:int = int(param1.data[1]);
         this.sender.send_10883([this.npcID,_loc2_,_loc3_,this.saleGoods.position]);
      }
      
      public function showSalePanel(param1:BaseItem) : void
      {
         if(param1 is McBaseItem)
         {
            return;
         }
         this.saleGoods = param1 as Goods;
         if(this.saleGoods != null)
         {
            if(this.saleGoods.isShowDestroyPanel)
            {
               if(!this.tishiCanvas)
               {
                  this.tishiCanvas = new DestroyTiShiCanvas();
               }
               POPWindowManager.showWindow(this.tishiCanvas);
               return;
            }
            if(this.saleGoods.res.sale_is_ui == 1)
            {
               if(this.saleGoods.bind == 1)
               {
                  this.npcShop.showSellPanel(this.saleGoods,this.saleGoods.res.sale_price * 0.5,GameInstance.mainCharData.moneyInfo.copper);
               }
               else
               {
                  this.npcShop.showSellPanel(this.saleGoods,this.saleGoods.res.sale_price,GameInstance.mainCharData.moneyInfo.copper);
               }
            }
            else
            {
               this.sender.send_10883([this.npcID,this.saleGoods.id,this.saleGoods.count,this.saleGoods.position]);
            }
         }
      }
      
      private function onClickBuyItem(param1:BaseEvent) : void
      {
         TCursorManager.resumFullMouse();
         TCursorManager.showCursor(TCursorManager.CURSOR_GOUMAI);
         TCursorManager.lockOnMouseStatus();
      }
      
      private function onClickItemOK(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data[0]);
         var _loc3_:int = int(param1.data[1]);
         this.sender.send_10881([this.npcID,_loc2_,_loc3_]);
      }
      
      private function onClickItem(param1:BaseEvent) : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            this.showSalePanel(TCursorManager.currentItemFace.getBaseItem());
         }
         else
         {
            this.selectedGoods = param1.data as Goods;
            if(this.selectedGoods)
            {
               this.npcShop.showBuyPanel(this.selectedGoods,this.selectedGoods.res.buy_price,GameInstance.mainCharData.moneyInfo.copper);
               NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide20);
            }
         }
      }
      
      private function showNPCSale() : void
      {
         var _loc2_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:Goods = null;
         this.npcID = GameInstance.lockOnChar.id;
         this.npcRes = NpcResManager.getNpcRes(this.npcID);
         var _loc1_:Array = this.npcRes.function_shop;
         var _loc3_:int = int(_loc1_.length);
         this.shopArray = [];
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc6_ = new Goods(Number(_loc1_[_loc2_]),_loc2_);
            _loc6_.roleID = -99;
            _loc4_ = _loc6_.res.kind;
            _loc6_.order_limit_grade = _loc6_.res.limit_grade;
            _loc6_.order_position = _loc6_.res.position;
            _loc6_.order_popsinger = _loc6_.res.popsinger;
            this.shopArray.push(_loc6_);
            _loc2_++;
         }
         this.shopArray.sortOn(["order_limit_grade","order_position","order_popsinger","id"],Array.NUMERIC);
         this.page = 1;
         this.npcShop.type = this.getShopType(this.npcRes.shop_type);
         var _loc5_:Array = this.getPageItems(this.page,30,this.npcRes.shop_type);
         this.npcShop.setItem(_loc5_,this.page,this.pageTotal);
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.npcShop,GameInstance.uiInstance.backpack);
      }
      
      private function onAddToStage(param1:Event) : void
      {
      }
      
      private function onRemoveToStage(param1:Event) : void
      {
         GameInstance.mainCharData.attributeInfo.isNPCShopOpen = false;
         PipeManager.sendMsg(PipeConstants.ITEMTIP_CLEAR);
         TCursorManager.resumFullMouse();
      }
      
      private function getShopType(param1:int) : String
      {
         switch(param1)
         {
            case NpcShopType.SHOP_1:
               return NPCShopPanel.TYPE_WUQI;
            case NpcShopType.SHOP_2:
               return NPCShopPanel.TYPE_HUJU;
            case NpcShopType.SHOP_3:
               return NPCShopPanel.TYPE_SIPIN;
            case NpcShopType.SHOP_4:
               return NPCShopPanel.TYPE_YAOPIN;
            case NpcShopType.SHOP_5:
               return NPCShopPanel.TYPE_ZAHUO;
            case NpcShopType.SHOP_6:
               return NPCShopPanel.TYPE_ZHANCHANGSHENGWANG;
            default:
               return "";
         }
      }
      
      private function getPageItems(param1:int, param2:int, param3:int, param4:int = 1) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:Goods = null;
         var _loc5_:Array = [];
         if(param3 == NpcShopType.SHOP_2)
         {
            while(true)
            {
               _loc7_ = this.shopArray[_loc6_];
               if(_loc7_ == null)
               {
                  break;
               }
               if(param4 == _loc7_.res.popsinger)
               {
                  _loc5_.push(_loc7_);
               }
               _loc6_++;
            }
         }
         else
         {
            _loc5_ = this.shopArray;
         }
         this.pageTotal = Math.ceil(_loc5_.length / 30);
         var _loc8_:Array = [];
         _loc6_ = (param1 - 1) * param2;
         var _loc9_:int = _loc6_ + param2;
         while(true)
         {
            _loc7_ = _loc5_[_loc6_];
            if(_loc7_ == null)
            {
               break;
            }
            _loc8_.push(_loc7_);
            if(++_loc6_ > 29)
            {
               break;
            }
         }
         return _loc8_;
      }
   }
}

