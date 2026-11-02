package com.tgame.moudels.tuTengCard.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tuTengCard.model.TuTengCade_MsgSendProxy;
   import com.tgame.shell.view.components.huodong.TutengShuxingTihuankaPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TuTengCade_TianJiSuo_Mediator extends Mediator
   {
      
      public static const NAME:String = "TuTengCade_TianJiSuo_Mediator";
      
      private var equip:Goods;
      
      private var _sendMsg:TuTengCade_MsgSendProxy;
      
      public function TuTengCade_TianJiSuo_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : TutengShuxingTihuankaPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tutengShuxingTihuankaPanel);
         }
         return viewComponent as TutengShuxingTihuankaPanel;
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
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      public function isAddShuXing(param1:Boolean, param2:int) : void
      {
         if(!this.equip)
         {
            return;
         }
         if(param1)
         {
            this.panel.setEquip(this.equip,param2);
         }
         else
         {
            this.equip = null;
         }
      }
      
      public function repShuXing(param1:Boolean) : void
      {
         if(param1)
         {
            this.itemToPanel(null,GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.equip.position));
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TutengShuxingTihuankaPanel,function():void
         {
            panel.addEventListener(TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_SETEQUIPBTN_CLICK,tutengShuxingTihuankaPanelHandle);
            panel.addEventListener(TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_GETEQUIPBTN_CLICK,tutengShuxingTihuankaPanelHandle);
            panel.addEventListener(TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_OK_CLICK,tutengShuxingTihuankaPanelHandle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TutengShuxingTihuankaPanel,function():void
         {
            panel.removeEventListener(TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_SETEQUIPBTN_CLICK,tutengShuxingTihuankaPanelHandle);
            panel.removeEventListener(TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_GETEQUIPBTN_CLICK,tutengShuxingTihuankaPanelHandle);
            panel.removeEventListener(TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_OK_CLICK,tutengShuxingTihuankaPanelHandle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:Event = null) : void
      {
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         this.resumMouseStatus();
         this.panel.getEquip();
         this.equip = null;
      }
      
      private function tutengShuxingTihuankaPanelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(_loc2_.type)
         {
            case TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_SETEQUIPBTN_CLICK:
               TCursorManager.chickItemToPanelFun = this.itemToPanel;
               this.openBackpack();
               this.changeMouseStatus();
               break;
            case TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_GETEQUIPBTN_CLICK:
               this.equip = null;
               this.panel.getEquip();
               PipeManager.sendMsg(PipeConstants.USE_BAG,1);
               this.resumMouseStatus();
               break;
            case TutengShuxingTihuankaPanel.UI_TUTENGSHUXINGKA_OK_CLICK:
               if(!this.equip)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入装备"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入装备"));
                  return;
               }
               _loc3_ = int(_loc2_.data);
               this.sendMsg.send_53025({
                  "index":this.equip.position,
                  "id":_loc3_
               });
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
         }
         if(param2)
         {
            this.equip = param2;
            PipeManager.sendMsg(PipeConstants.USE_BAG,0);
            _loc3_.index = param2.position;
            this.sendMsg.send_53023(_loc3_);
            this.mouseToNormal();
         }
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
      
      private function get sendMsg() : TuTengCade_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(TuTengCade_MsgSendProxy.NAME) as TuTengCade_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

