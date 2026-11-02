package com.tgame.moudels.shuXingDaZaoKa.view
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
   import com.tgame.moudels.shuXingDaZaoKa.model.ShuXingDaZaoKa_MsgSenderProxy;
   import com.tgame.shell.view.components.ShuxingDazaokaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShuXingDaZaoKa_ShuXingDaZaoKaMediator extends Mediator
   {
      
      public static const NAME:String = "ShuXingDaZaoKa_ShuXingDaZaoKaMediator";
      
      private var equip:Goods;
      
      private var _msgSenderProxy:ShuXingDaZaoKa_MsgSenderProxy;
      
      public function ShuXingDaZaoKa_ShuXingDaZaoKaMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : ShuXingDaZaoKa_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ShuXingDaZaoKa_MsgSenderProxy.NAME) as ShuXingDaZaoKa_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get panel() : ShuxingDazaokaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shuXingDaZaoKaPanel);
         }
         return viewComponent as ShuxingDazaokaPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc2_:Object = param1.getBody();
         var _loc4_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function getMsg(param1:int) : void
      {
         if(param1 == 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("装备属性打造成功"),false);
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("装备属性打造成功"),false);
            if(!this.equip)
            {
               return;
            }
            this.itemToPanel(null,GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.equip.position));
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShuxingDazaokaPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.addEventListener(ShuxingDazaokaPanel.UI_SHUXINGDAZAOKA_QUEDING_CLICK,panelHandle);
            panel.addEventListener(ShuxingDazaokaPanel.UI_SHUXINGDAZAOKA_ZHUANGBEI_CLICK,panelHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShuxingDazaokaPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.removeEventListener(ShuxingDazaokaPanel.UI_SHUXINGDAZAOKA_QUEDING_CLICK,panelHandle);
            panel.removeEventListener(ShuxingDazaokaPanel.UI_SHUXINGDAZAOKA_ZHUANGBEI_CLICK,panelHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:*) : void
      {
         this.resumMouseStatus();
         this.equip = null;
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.panel.getItem();
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case ShuxingDazaokaPanel.UI_SHUXINGDAZAOKA_QUEDING_CLICK:
               if(!this.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"),false);
                  return;
               }
               this.msgSenderProxy.send_53021({
                  "id":this.equip.id,
                  "index":this.equip.position
               });
               break;
            case ShuxingDazaokaPanel.UI_SHUXINGDAZAOKA_ZHUANGBEI_CLICK:
               _loc3_ = _loc2_.data as int;
               if(_loc3_ == 1)
               {
                  TCursorManager.chickItemToPanelFun = this.itemToPanel;
                  this.changeMouseStatus();
                  this.openBackpack();
               }
               else
               {
                  this.resumMouseStatus();
                  this.equip = null;
                  PipeManager.sendMsg(PipeConstants.USE_BAG,1);
                  this.panel.getItem();
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
         if(!ItemPositionRange.inBag(param2.position))
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入包裹中的物品"),false);
            return;
         }
         if(param2.res.kind != GoodsKind.K2)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您所放入的物品类型不是装备"),false);
            return;
         }
         this.equip = param2;
         PipeManager.sendMsg(PipeConstants.USE_BAG,0);
         this.mouseToNormal();
         this.panel.setItem(this.equip);
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
   }
}

