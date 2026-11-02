package com.tgame.moudels.zhanWenKeHua.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.GoodsKind;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhanWenKeHua.model.ZhanWenKeHua_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.TishengZhuangbeiMenghuanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhanWenKeHua_JinChuiZiUseMediator extends Mediator
   {
      
      public static const NAME:String = "ZhanWenKeHua_JinChuiZiUseMediator";
      
      private var equip:Goods;
      
      private var _sendMsg:ZhanWenKeHua_MsgSendProxy;
      
      public function ZhanWenKeHua_JinChuiZiUseMediator()
      {
         super(NAME);
      }
      
      public function get panel() : TishengZhuangbeiMenghuanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.jinChuiZiPanel);
         }
         return viewComponent as TishengZhuangbeiMenghuanPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      public function equipUpDataCommplete(param1:int) : void
      {
         if(param1 < 0)
         {
            return;
         }
         this.equip = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1);
         this.panel.setGoods1(this.equip);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TishengZhuangbeiMenghuanPanel,function():void
         {
            panel.addEventListener(TishengZhuangbeiMenghuanPanel.UI_TISHENGZHUANGBEIMENGHUANDUCLICK,uiHandle);
            panel.addEventListener(TishengZhuangbeiMenghuanPanel.UI_FANGRUZHUANGBEICLICK,uiHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TishengZhuangbeiMenghuanPanel,function():void
         {
            panel.removeEventListener(TishengZhuangbeiMenghuanPanel.UI_TISHENGZHUANGBEIMENGHUANDUCLICK,uiHandle);
            panel.removeEventListener(TishengZhuangbeiMenghuanPanel.UI_FANGRUZHUANGBEICLICK,uiHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null) : void
      {
         this.equip = null;
         this.panel.setGoods1(null);
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc4_:Goods = null;
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case TishengZhuangbeiMenghuanPanel.UI_FANGRUZHUANGBEICLICK:
               if(_loc3_ == 2)
               {
                  this.panelClose();
                  return;
               }
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case TishengZhuangbeiMenghuanPanel.UI_TISHENGZHUANGBEIMENGHUANDUCLICK:
               if(this.equip)
               {
                  this.sendMsg.send_53523({"index":this.equip.position});
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               }
         }
      }
      
      private function itemToPanel(param1:ItemFace, param2:Goods = null) : void
      {
         var _loc3_:Object = {};
         if(!param2)
         {
            param2 = param1.getBaseItem() as Goods;
         }
         if(param2)
         {
            if(!ItemPositionRange.inBag(param2.position))
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
               return;
            }
            if(param2.res.kind != GoodsKind.K2)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
               return;
            }
         }
         this.equip = param2;
         this.mouseToNormal();
         this.panel.setGoods1(this.equip);
         PipeManager.sendMsg(PipeConstants.USE_BAG,0);
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
      }
      
      private function get sendMsg() : ZhanWenKeHua_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(ZhanWenKeHua_MsgSendProxy.NAME) as ZhanWenKeHua_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

