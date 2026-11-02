package com.tgame.moudels.Item.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemMenuStatus;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.manager.DoubleClickManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.Item.Item_ApplicationFacade;
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.ZhanhundaiPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Item_ZhanhundaiMediator extends Mediator
   {
      
      public static const NAME:String = "Item_ZhanhundaiMediator";
      
      private var _dc:DoubleClickManager;
      
      private var itemMenu:Menu;
      
      private var itemF:ItemFace;
      
      private var _sender:Item_MsgSenderProxy;
      
      public function Item_ZhanhundaiMediator(param1:String = null, param2:Object = null)
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
      
      public function get bag() : ZhanhundaiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhanhundai);
         }
         return viewComponent as ZhanhundaiPanel;
      }
      
      protected function get charPanel() : CharAttribute
      {
         return GameInstance.uiInstance.charAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhanhundaiPanel,function():void
         {
            bag.addEventListener(Event.ADDED_TO_STAGE,onAdd2Stage);
            bag.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            bag.addEventListener(ZhanhundaiPanel.UI_KUAFULUNJIANBACKPACK_DRAG_STRAT,uiHandler);
            bag.addEventListener(ZhanhundaiPanel.GETSHOWITEMMENU_KUAFULUNJIAN,uiHandler);
            bag.addEventListener(ZhanhundaiPanel.UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK,uiHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhanhundaiPanel,function():void
         {
            bag.removeEventListener(Event.ADDED_TO_STAGE,onAdd2Stage);
            bag.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            bag.removeEventListener(ZhanhundaiPanel.UI_KUAFULUNJIANBACKPACK_DRAG_STRAT,uiHandler);
            bag.removeEventListener(ZhanhundaiPanel.GETSHOWITEMMENU_KUAFULUNJIAN,uiHandler);
            bag.removeEventListener(ZhanhundaiPanel.UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK,uiHandler);
         });
         this._dc = new DoubleClickManager();
         this._dc.addEventListener(DoubleClickManager.DOUBLE_CLICK,this.onDoubleClick);
      }
      
      private function onAdd2Stage(param1:Event) : void
      {
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
      }
      
      private function onDoubleClick(param1:BaseEvent) : void
      {
         var mcItem:McBaseItem = null;
         var e:BaseEvent = param1;
         var itemFace:ItemFace = e.data as ItemFace;
         if(itemFace)
         {
            TCursorManager.currentItemFace = new ItemFace(itemFace.getBaseItem());
            mcItem = itemFace.getBaseItem() as McBaseItem;
            if(Fun.isVisible(GameInstance.uiInstance._charAttribute) && this.charPanel.getZhanhunVis())
            {
               PipeManager.sendMsg(PipeConstants.ZHANHUNDAI_SHUANGJI_CHUANDAI,mcItem.position);
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
      
      private function uiHandler(param1:Event = null) : void
      {
         var _loc4_:ItemFace = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case ZhanhundaiPanel.UI_KUAFULUNJIAN_LIQINGJIANGLI_CICLK:
               this.sender.send_55903(_loc3_.data);
               break;
            case ZhanhundaiPanel.GETSHOWITEMMENU_KUAFULUNJIAN:
               _loc5_ = _loc3_.data as Array;
               this.clickGoods(_loc5_);
               break;
            case ZhanhundaiPanel.UI_KUAFULUNJIANBACKPACK_DRAG_STRAT:
               _loc4_ = _loc3_.data as ItemFace;
               if(this.itemMenu != null)
               {
                  if(this.itemMenu.parent != null)
                  {
                     this.itemMenu.parent.removeChild(this.itemMenu);
                  }
                  this.itemMenu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
               }
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
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function clickGoods(param1:Array) : void
      {
         var _loc2_:ItemFace = null;
         var _loc3_:McBaseItem = null;
         var _loc4_:ItemFace = null;
         var _loc5_:ItemFace = null;
         var _loc6_:Array = null;
         var _loc7_:McBaseItem = null;
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            _loc2_ = param1[0].target as ItemFace;
            if(this.itemF != null)
            {
               this.itemF.destroy();
               this.itemF = null;
            }
            this.bag.setZhanxing(null);
            _loc3_ = TCursorManager.currentItemFace.getBaseItem() as McBaseItem;
            if(_loc3_.zhuangbeiId != -1 && _loc3_.zhuangbeiWeizhi != -1)
            {
               _loc4_ = TCursorManager.currentItemFace;
               _loc5_ = _loc2_;
               if(_loc5_ == null)
               {
                  PipeManager.sendMsg(PipeConstants.ZHANHUN_XIEXIA,[_loc3_.zhuangbeiId,_loc3_.zhuangbeiWeizhi,param1[1]]);
                  return;
               }
               if(!(_loc5_.getBaseItem() is McBaseItem))
               {
                  return;
               }
               PipeManager.sendMsg(PipeConstants.ZHANHUN_XIEXIA,[_loc3_.zhuangbeiId,_loc3_.zhuangbeiWeizhi,(_loc5_.getBaseItem() as McBaseItem).position]);
            }
            else
            {
               sendNotification(Item_ApplicationFacade.ITEM_MOVE,[TCursorManager.currentItemFace,_loc2_,param1[1],ItemPositionRange.CONTAINER_ZHANHUNDAI_BAOGUO]);
            }
         }
         else
         {
            _loc2_ = param1[0].target as ItemFace;
            if(_loc2_ != null)
            {
               _loc6_ = new Array();
               this._dc.trig(_loc2_);
               TCursorManager.currentItemFace = _loc2_;
               _loc7_ = _loc2_.getBaseItem() as McBaseItem;
               if(_loc7_.position != ItemPositionRange.GOODS_IN_BAG_ZHANHUNDAI_RANGE.y)
               {
                  if(_loc7_.isSuoding == 1)
                  {
                     _loc6_.push({
                        "name":ItemMenuStatus.JIESUO,
                        "state":1
                     });
                  }
                  else
                  {
                     _loc6_.push({
                        "name":ItemMenuStatus.SUODING,
                        "state":1
                     });
                  }
                  this.itemMenu = this.initMenu(_loc6_,param1[0]);
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
         var _loc3_:ItemFace = null;
         var _loc2_:String = param1.data.toString();
         switch(_loc2_)
         {
            case ItemMenuStatus.SUODING:
               if(TCursorManager.currentItemFace != null && TCursorManager.currentItemFace.getBaseItem() != null)
               {
                  this.sender.send_55905([TCursorManager.currentItemFace.getBaseItem().position,1]);
               }
               break;
            case ItemMenuStatus.JIESUO:
               this.sender.send_55905([TCursorManager.currentItemFace.getBaseItem().position,0]);
               break;
            case ItemMenuStatus.FANGRUZHANXING:
               if(TCursorManager.currentItemFace != null && TCursorManager.currentItemFace.getBaseItem() != null)
               {
                  if((TCursorManager.currentItemFace.getBaseItem() as McBaseItem).isSuoding)
                  {
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"锁定战魂不能放入战星！");
                     NoticeManager.notify(NoticeManager.FOOT,"锁定战魂不能放入战星！");
                  }
                  else
                  {
                     this.itemF = new ItemFace(TCursorManager.currentItemFace.getBaseItem() as McBaseItem);
                     _loc3_ = this.itemF;
                     this.bag.setZhanxing(_loc3_);
                  }
               }
               break;
            case ItemMenuStatus.QUCHUZHANXING:
               if(this.itemF != null)
               {
                  this.itemF.destroy();
                  this.itemF = null;
               }
               this.bag.setZhanxing(null);
         }
      }
      
      public function updateGoods(param1:Array) : void
      {
         this.bag.setItem(param1);
      }
   }
}

