package com.tgame.moudels.stone.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.stone.Stone_ApplicationFacade;
   import com.tgame.moudels.stone.model.Stone_MsgSendProxy;
   import com.tgame.shell.view.components.XunzhangOptionSmallPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class UI_XunzhangXiangqianMediator extends Mediator
   {
      
      public static const NAME:String = "UI_XunzhangXiangqianMediator";
      
      private var equip:Goods;
      
      private var stone:Goods;
      
      private var _sendMsg:Stone_MsgSendProxy;
      
      public function UI_XunzhangXiangqianMediator()
      {
         super(NAME);
      }
      
      private function get sendMsg() : Stone_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Stone_MsgSendProxy.NAME) as Stone_MsgSendProxy;
         }
         return this._sendMsg;
      }
      
      protected function get easyStonePanel() : XunzhangOptionSmallPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xunzhangStoneOptionSmallPanel);
         }
         return viewComponent as XunzhangOptionSmallPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Stone_ApplicationFacade.MENU_XUNZHANGXIANGQIAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Stone_ApplicationFacade.MENU_XUNZHANGXIANGQIAN:
               this.equip = _loc2_ as Goods;
               this.sendMsg.send_53569(this.equip.position);
               this.openBackpack();
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XunzhangOptionSmallPanel,function():void
         {
            easyStonePanel.addEventListener(XunzhangOptionSmallPanel.UI_STONE_OPTION_PANEL_DRAG_ENTER,easyStonePanelHandle);
            easyStonePanel.addEventListener(XunzhangOptionSmallPanel.UI_STONE_OPTION_PANEL_STONE_CLICK,easyStonePanelHandle);
            easyStonePanel.addEventListener(FCloseEvent.CLOSE,easyStonePanelClose);
            easyStonePanel.addEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XunzhangOptionSmallPanel,function():void
         {
            easyStonePanel.removeEventListener(XunzhangOptionSmallPanel.UI_STONE_OPTION_PANEL_DRAG_ENTER,easyStonePanelHandle);
            easyStonePanel.removeEventListener(XunzhangOptionSmallPanel.UI_STONE_OPTION_PANEL_STONE_CLICK,easyStonePanelHandle);
            easyStonePanel.removeEventListener(FCloseEvent.CLOSE,easyStonePanelClose);
            easyStonePanel.removeEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
      }
      
      private function easyStonePanelClose(param1:* = null) : void
      {
         this.equip = null;
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
      }
      
      private function easyStonePanelHandle(param1:Event) : void
      {
         var e:Event = param1;
         var baseE:BaseEvent = e as BaseEvent;
         var data:Object = {};
         switch(e.type)
         {
            case XunzhangOptionSmallPanel.UI_STONE_OPTION_PANEL_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.stone = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  if(this.equip.bind == 0)
                  {
                     FAlert.okLabel = LanResManager.getLanCommonTextWords("镶嵌");
                     FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                     FAlert.show(LanResManager.getLanTextWords(UI_MainCharEasyEquipAddStoneMediator,"绑定提示",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           sendMsg.send_53583([equip.position,stone.position]);
                        }
                     });
                  }
                  else
                  {
                     this.sendMsg.send_53583([this.equip.position,this.stone.position]);
                  }
                  break;
               }
               return;
               break;
            case XunzhangOptionSmallPanel.UI_STONE_OPTION_PANEL_STONE_CLICK:
               this.sendMsg.send_53581(this.equip.position);
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.easyStonePanel,GameInstance.uiInstance.backpack);
      }
      
      public function setItem(param1:int, param2:Array) : void
      {
         this.easyStonePanel.setFengKuang(6 - param1);
         this.easyStonePanel.setItem(param2);
      }
   }
}

