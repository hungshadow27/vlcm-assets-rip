package com.tgame.moudels.synthesize.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.synthesize.Synthesize_ApplicationFacde;
   import com.tgame.moudels.synthesize.model.Synthesize_MsgSendProxy;
   import com.tgame.shell.view.components.XunZhangHeChengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhangHeChengMediator extends Mediator
   {
      
      public static const NAME:String = "XunZhangHeChengMediator";
      
      private var goodId:int;
      
      private var stone:Goods;
      
      private var indexArr:Array = new Array();
      
      private var _sendMsg:Synthesize_MsgSendProxy;
      
      public function XunZhangHeChengMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : XunZhangHeChengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xunZhangHeChengPanel);
         }
         return viewComponent as XunZhangHeChengPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Synthesize_ApplicationFacde.SHOW_XUNZHANG_HECHENG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Synthesize_ApplicationFacde.SHOW_XUNZHANG_HECHENG_PANEL:
               this.goodId = _loc2_ as int;
               if(Fun.isVisible(GameInstance.uiInstance._xunZhangHeChengPanel))
               {
                  return;
               }
               if(this.panel.parent == null)
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.panel);
               }
               this.openBackpack();
               this.setItems([],[]);
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XunZhangHeChengPanel,function():void
         {
            panel.addEventListener(XunZhangHeChengPanel.UI_TIANFU_HECHENG_PANEL_DRAG_ENTER,handle);
            panel.addEventListener(XunZhangHeChengPanel.UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK,handle);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
            panel.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XunZhangHeChengPanel,function():void
         {
            panel.removeEventListener(XunZhangHeChengPanel.UI_TIANFU_HECHENG_PANEL_DRAG_ENTER,handle);
            panel.removeEventListener(XunZhangHeChengPanel.UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK,handle);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
         });
      }
      
      private function panelClose(param1:* = null) : void
      {
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
      }
      
      private function handle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc4_:int = 0;
         _loc2_ = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.openBackpack();
               break;
            case XunZhangHeChengPanel.UI_TIANFU_HECHENG_PANEL_DRAG_ENTER:
               _loc4_ = _loc2_.data as int;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.stone = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.sendMsg.send_58953([this.goodId,this.indexArr.length,this.indexArr,this.stone.position]);
                  break;
               }
               return;
               break;
            case XunZhangHeChengPanel.UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK:
               this.sendMsg.send_58955([this.goodId,this.indexArr.length,this.indexArr]);
         }
      }
      
      public function setItems(param1:Array, param2:Array) : void
      {
         this.indexArr = param1;
         this.panel.setItems(param2);
      }
      
      public function setOKGood(param1:int, param2:int) : void
      {
         this.panel.setOKGood(param1,param2);
      }
      
      public function updateButton() : void
      {
         this.panel.updateButton();
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
      
      private function get sendMsg() : Synthesize_MsgSendProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Synthesize_MsgSendProxy.NAME) as Synthesize_MsgSendProxy;
         }
         return this._sendMsg;
      }
   }
}

