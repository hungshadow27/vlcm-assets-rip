package com.tgame.moudels.amulet.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.amulet.Amulet_ApplicationFacade;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.shell.view.components.qingrenjie.BaoShiDuanLian;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BaoShiDuanLian_Mediator extends Mediator
   {
      
      public static const NAME:String = "BaoShiDuanLian_Mediator";
      
      private var item:Goods;
      
      private var dakongId:int;
      
      private var _sender:Amult_MsgSenderProxy;
      
      public function BaoShiDuanLian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get sender() : Amult_MsgSenderProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(Amult_MsgSenderProxy.NAME) as Amult_MsgSenderProxy;
         }
         return this._sender;
      }
      
      protected function get panel() : BaoShiDuanLian
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.baoShiDuanLian);
         }
         return viewComponent as BaoShiDuanLian;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Amulet_ApplicationFacade.GOODS_CHANGE,Amulet_ApplicationFacade.SHOW_BAOSHI_DUANLIAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Goods = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Amulet_ApplicationFacade.GOODS_CHANGE:
               if(!Fun.isVisible(GameInstance.uiInstance._baoShiDuanLian) || !this.item)
               {
                  return;
               }
               _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.item.position);
               if(_loc3_ != this.item)
               {
                  this.quChu();
               }
               break;
            case Amulet_ApplicationFacade.SHOW_BAOSHI_DUANLIAN:
               this.dakongId = _loc2_ as int;
               this.openBackpack();
         }
      }
      
      public function setChangeItem(param1:int, param2:int, param3:int) : void
      {
         if(param3 == this.dakongId)
         {
            if(!this.item)
            {
               return;
            }
            if(GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1) != this.item)
            {
               return;
            }
            this.panel.setGoods1(this.item);
            this.panel.setGoods2(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true,true));
         }
         else if(this.dakongId == SpecialGoodsID.BAJIGUIYUANHUFU)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入八极归元护符！"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入八极归元护符！"),false);
         }
      }
      
      public function itemChangeComplete(param1:int, param2:int) : void
      {
         this.item = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(param1);
         this.panel.setGoods1(this.item);
         this.panel.setGoods2(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true,true));
         this.sender.send_83121([this.item.position,param2]);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BaoShiDuanLian,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.addEventListener(BaoShiDuanLian.UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK,panelHandle);
            panel.addEventListener(BaoShiDuanLian.UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER,panelHandle);
            panel.addEventListener(BaoShiDuanLian.UI_SHENLONGDAKONG_OK_CLICK,panelHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(BaoShiDuanLian,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.removeEventListener(BaoShiDuanLian.UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK,panelHandle);
            panel.removeEventListener(BaoShiDuanLian.UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER,panelHandle);
            panel.removeEventListener(BaoShiDuanLian.UI_SHENLONGDAKONG_OK_CLICK,panelHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null) : void
      {
         this.panel.setNull();
         ResizeManager.hideDoublePanel();
         this.item = null;
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case BaoShiDuanLian.UI_DAKONGSHI_OPTION_PANEL_STONE_CLICK:
               this.quChu();
               break;
            case BaoShiDuanLian.UI_DAKONGSHI_OPTION_PANEL_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.item = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.sender.send_83121([this.item.position,this.dakongId]);
               }
               break;
            case BaoShiDuanLian.UI_SHENLONGDAKONG_OK_CLICK:
               if(!this.item)
               {
                  return;
               }
               this.sender.send_83123([this.item.position,this.dakongId]);
         }
      }
      
      private function quChu() : void
      {
         this.item = null;
         this.panel.setNull();
         this.panel.setGoods1();
      }
      
      private function openBackpack() : void
      {
         this.quChu();
         if(this.dakongId != 0)
         {
            this.panel.setGoods2(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.dakongId,true,true));
            if(!Fun.isVisible(GameInstance.uiInstance._backpack))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
            }
            UITools.showPanel(this.panel);
            ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
         }
      }
   }
}

