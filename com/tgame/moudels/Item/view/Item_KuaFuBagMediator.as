package com.tgame.moudels.Item.view
{
   import com.fireice.panel.FPanel;
   import com.fireice.util.LayoutManager;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemMenuStatus;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.manager.DoubleClickManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.moudels.Item.model.vo.KuaFuBagVO;
   import com.tgame.shell.view.components.KuafuLunjianBackpack;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_KuaFuBagMediator extends Mediator
   {
      
      public static const NAME:String = "Item_KuaFuBagMediator";
      
      private var _bagVO:KuaFuBagVO;
      
      private var _loadBuffer:LoadBuffer;
      
      private var itemMenu:Menu;
      
      private var _dc:DoubleClickManager;
      
      private var _sender:Item_MsgSenderProxy;
      
      private var _backPackMediator:Item_BackpackMediator;
      
      public function Item_KuaFuBagMediator()
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
      
      public function get bag() : KuafuLunjianBackpack
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.kuafuLunjianBackpack);
         }
         return viewComponent as KuafuLunjianBackpack;
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
         return [Item_ApplicationFacade.MAINUI_KUAFU_GUIZHE_QUERY,Item_ApplicationFacade.KUAFU_STATUS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         var _loc4_:Boolean = false;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Item_ApplicationFacade.MAINUI_KUAFU_GUIZHE_QUERY:
               _loc3_ = Number(_loc2_);
               if(_loc3_ == 1)
               {
                  if(Fun.isVisible(GameInstance.uiInstance.bossRefurbishPanel.kuafuLunjianCanvas.kuafulunjianguizechaxunCanvas))
                  {
                     GameInstance.uiInstance.bossRefurbishPanel.onCloseGuizechaxun();
                  }
                  else
                  {
                     GameInstance.uiInstance.bossRefurbishPanel.showGuizechaxun();
                  }
               }
               else if(_loc3_ == 2 || _loc3_ == 3)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUAFU_BACKPACK);
                     return;
                  }
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUAFU_BACKPACK);
                  if(!ReloginManager.isInKuafu)
                  {
                     this.sender.send_53201();
                     if(this._loadBuffer)
                     {
                        this._loadBuffer.close();
                     }
                     this._loadBuffer = LoadBuffer.show(this.bag);
                  }
               }
               break;
            case Item_ApplicationFacade.KUAFU_STATUS:
               _loc4_ = Boolean(_loc2_);
               if(!_loc4_)
               {
                  if(Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUAFU_BACKPACK);
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(KuafuLunjianBackpack,function():void
         {
            bag.addEventListener(Event.ADDED_TO_STAGE,onAdd2Stage);
            bag.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            bag.addEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIAN_BATCHSAVE_GET,uiHandler);
            bag.addEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIANBACKPACK_DRAG_STRAT,uiHandler);
            bag.addEventListener(KuafuLunjianBackpack.GETSHOWITEMMENU_KUAFULUNJIAN,uiHandler);
            bag.addEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK,uiHandler);
            bag.addEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIANBACKPACK_JIANGLI_DRAG_STRAT,uiHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(KuafuLunjianBackpack,function():void
         {
            bag.removeEventListener(Event.ADDED_TO_STAGE,onAdd2Stage);
            bag.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            bag.removeEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIAN_BATCHSAVE_GET,uiHandler);
            bag.removeEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIANBACKPACK_DRAG_STRAT,uiHandler);
            bag.removeEventListener(KuafuLunjianBackpack.GETSHOWITEMMENU_KUAFULUNJIAN,uiHandler);
            bag.removeEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK,uiHandler);
            bag.removeEventListener(KuafuLunjianBackpack.UI_KUAFULUNJIANBACKPACK_JIANGLI_DRAG_STRAT,uiHandler);
         });
         this._dc = new DoubleClickManager();
         this._dc.addEventListener(DoubleClickManager.DOUBLE_CLICK,this.onDoubleClick);
      }
      
      private function onDoubleClick(param1:BaseEvent) : void
      {
         var e:BaseEvent = param1;
         var itemFace:ItemFace = e.data as ItemFace;
         if(itemFace)
         {
            TCursorManager.currentItemFace = new ItemFace(itemFace.getBaseItem());
            sendNotification(Item_ApplicationFacade.ITEM_USE,[TCursorManager.currentItemFace,0]);
            TimerManager.createOneOffTimer(50,1,null,null,function():void
            {
               if(itemMenu)
               {
                  itemMenu.destroy();
               }
            });
         }
      }
      
      private function uiHandler(param1:Event = null) : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case KuafuLunjianBackpack.UI_KUAFULUNJIAN_BATCHSAVE_GET:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_PLCQ_KUAFU);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case KuafuLunjianBackpack.UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK:
               this.sender.send_53203();
               break;
            case KuafuLunjianBackpack.GETSHOWITEMMENU_KUAFULUNJIAN:
               _loc5_ = _loc3_.data as Array;
               this.clickGoods(_loc5_);
               break;
            case KuafuLunjianBackpack.UI_KUAFULUNJIANBACKPACK_DRAG_STRAT:
               _loc4_ = _loc3_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc4_;
                  TCursorManager.showItem(_loc4_.itemBD);
                  TCursorManager.source = 2;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
         }
      }
      
      private function onAdd2Stage(param1:Event) : void
      {
         var _loc2_:FPanel = null;
         var _loc3_:FPanel = null;
         if(ReloginManager.isInKuafu)
         {
            this.bag.setItem(GameInstance.mainCharData.goodsInfo.goodsBagArr);
         }
         else
         {
            this.bag.setItem(GameInstance.mainCharData.goodsInfo.goodsBagKuaArr);
         }
         this.bag.setJiangliItem(GameInstance.mainCharData.goodsInfo.goodsBagKuaJiangliArr);
         if(ReloginManager.isInKuafu)
         {
            this.bag.plcqBtn.enabled = false;
            this.bag.lqsyBtn.enabled = false;
         }
         else
         {
            this.bag.plcqBtn.enabled = true;
            this.bag.lqsyBtn.enabled = true;
         }
         if(!ReloginManager.isInKuafu)
         {
            _loc2_ = GameInstance.uiInstance.kuafuLunjianBackpack;
            _loc3_ = GameInstance.uiInstance.backpack;
            if(!Fun.isVisible(_loc3_))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
            }
            LayoutManager.getInstance().addLayoutObject(_loc2_,LayoutManager.CENTER,new Point(-_loc2_.panelWidth - 128,-_loc2_.panelHeight / 2));
            LayoutManager.getInstance().addLayoutObject(_loc3_,LayoutManager.CENTER,new Point(128,-_loc2_.panelHeight / 2));
            LayoutManager.getInstance().onStageResize();
         }
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         var _loc2_:FPanel = GameInstance.uiInstance.kuafuLunjianBackpack;
         var _loc3_:FPanel = GameInstance.uiInstance.backpack;
         LayoutManager.getInstance().removeLayoutObject(_loc2_);
         LayoutManager.getInstance().removeLayoutObject(_loc3_);
         TCursorManager.resumFullMouse();
      }
      
      private function clickGoods(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            _loc2_ = param1[0].target as ItemFace;
            if(ReloginManager.isInKuafu)
            {
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,_loc2_,param1[1],ItemPositionRange.CONTAINER_BAG]);
            }
            else
            {
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,_loc2_,param1[1],ItemPositionRange.CONTAINER_BAG_KUAFU]);
            }
         }
         else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_PLCQ_KUAFU)
         {
            _loc2_ = param1[0].target as ItemFace;
            if(!_loc2_)
            {
               return;
            }
            sendNotification(Item_ApplicationFacade.ITEM_MOVE,[_loc2_,null,0,ItemPositionRange.CONTAINER_BAG]);
         }
         else
         {
            _loc2_ = param1[0].target as ItemFace;
            if(_loc2_ != null)
            {
               this._dc.trig(_loc2_);
               TCursorManager.currentItemFace = new ItemFace(_loc2_.getBaseItem());
               if(SpecialGoodsID.BUXIANSHISHIYONGGOODSID.indexOf(_loc2_.getBaseItem().id) != -1)
               {
                  this.itemMenu = this.initMenu([{
                     "name":ItemMenuStatus.DESTROY,
                     "state":1
                  }],param1[0]);
               }
               else
               {
                  this.itemMenu = this.initMenu([{
                     "name":ItemMenuStatus.USE,
                     "state":1
                  },{
                     "name":ItemMenuStatus.DESTROY,
                     "state":1
                  }],param1[0]);
               }
            }
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
      
      private function onItemMenuClick(param1:BaseEvent) : void
      {
         var _loc2_:String = param1.data.toString();
         switch(_loc2_)
         {
            case ItemMenuStatus.USE:
               sendNotification(Item_ApplicationFacade.ITEM_USE,[TCursorManager.currentItemFace,0]);
               break;
            case ItemMenuStatus.DESTROY:
               this.backPackMediator.showDestroyItem(TCursorManager.currentItemFace.getBaseItem());
         }
      }
      
      public function initBagData(param1:KuaFuBagVO) : void
      {
         this._bagVO = param1;
         this.bag.setZhanchang([LanResManager.getLanCommonTextWords("战场") + this._bagVO.zhangchangLine,this._bagVO.exp,this._bagVO.shengwang,this._bagVO.copper,this._bagVO.zhenqi,this._bagVO.zhanchangJifen,this._bagVO.yuanbao,this._bagVO.weiWang,this._bagVO.gongXun,this._bagVO.wuhun]);
         this.bag.setItem(param1.goodsArr);
         if(this._loadBuffer)
         {
            this._loadBuffer.close();
         }
      }
      
      public function updateData(param1:int, param2:Number, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int) : void
      {
         if(this._bagVO != null)
         {
            this._bagVO.zhangchangLine = param1;
            this._bagVO.exp = param2;
            this._bagVO.shengwang = param3;
            this._bagVO.copper = param4;
            this._bagVO.zhenqi = param5;
            this._bagVO.yuanbao = param7;
            this._bagVO.gongXun = param9;
            this._bagVO.weiWang = param8;
            this._bagVO.wuhun = param10;
         }
         this.bag.setZhanchang([LanResManager.getLanCommonTextWords("战场") + param1,param2,param3,param4,param5,param6,param7,param8,param9,param10]);
      }
      
      public function updateJiangliData() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
         {
            this.bag.setJiangliItem(GameInstance.mainCharData.goodsInfo.goodsBagKuaJiangliArr);
         }
      }
      
      public function moveItem() : void
      {
         this.bag.moveItem();
      }
      
      public function updateGoods(param1:Array) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
         {
            this.bag.setItem(param1);
            if(ReloginManager.isInKuafu)
            {
               this.bag.plcqBtn.enabled = false;
               this.bag.lqsyBtn.enabled = false;
            }
            else
            {
               this.bag.plcqBtn.enabled = true;
               this.bag.lqsyBtn.enabled = true;
            }
         }
      }
   }
}

