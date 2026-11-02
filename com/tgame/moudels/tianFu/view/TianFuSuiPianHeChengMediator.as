package com.tgame.moudels.tianFu.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianFu.TianFu_ApplicationFacade;
   import com.tgame.moudels.tianFu.model.TianFu_MsgSenderProxy;
   import com.tgame.shell.view.components.TianFuSuiPianHeChengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianFuSuiPianHeChengMediator extends Mediator
   {
      
      public static const NAME:String = "TianFuSuiPianHeChengMediator";
      
      private var stone:Goods;
      
      private var _sendMsg:TianFu_MsgSenderProxy;
      
      public function TianFuSuiPianHeChengMediator()
      {
         super(NAME);
      }
      
      protected function get tianFuSuiPianHeChengPanel() : TianFuSuiPianHeChengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tianFuSuiPianHeChengPanel);
         }
         return viewComponent as TianFuSuiPianHeChengPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TianFu_ApplicationFacade.SHOW_HECHENG_PLANE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TianFu_ApplicationFacade.SHOW_HECHENG_PLANE:
               if(Fun.isVisible(GameInstance.uiInstance._tianFuSuiPianHeChengPanel))
               {
                  return;
               }
               if(this.tianFuSuiPianHeChengPanel.parent == null)
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.tianFuSuiPianHeChengPanel);
               }
               this.openBackpack();
               this.tianFuSuiPianHeChengPanel.setItems([]);
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               this.sendMsg.send_58321();
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TianFuSuiPianHeChengPanel,function():void
         {
            tianFuSuiPianHeChengPanel.addEventListener(TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_SUIPIAN_CLICK,tianFuSuiPianHeChengPanelHandle);
            tianFuSuiPianHeChengPanel.addEventListener(TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_DRAG_ENTER,tianFuSuiPianHeChengPanelHandle);
            tianFuSuiPianHeChengPanel.addEventListener(TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK,tianFuSuiPianHeChengPanelHandle);
            tianFuSuiPianHeChengPanel.addEventListener(FCloseEvent.CLOSE,tianFuSuiPianHeChengPanelClose);
            tianFuSuiPianHeChengPanel.addEventListener(Event.REMOVED_FROM_STAGE,tianFuSuiPianHeChengPanelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TianFuSuiPianHeChengPanel,function():void
         {
            tianFuSuiPianHeChengPanel.removeEventListener(TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_SUIPIAN_CLICK,tianFuSuiPianHeChengPanelHandle);
            tianFuSuiPianHeChengPanel.removeEventListener(TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_DRAG_ENTER,tianFuSuiPianHeChengPanelHandle);
            tianFuSuiPianHeChengPanel.removeEventListener(TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK,tianFuSuiPianHeChengPanelHandle);
            tianFuSuiPianHeChengPanel.removeEventListener(FCloseEvent.CLOSE,tianFuSuiPianHeChengPanelClose);
            tianFuSuiPianHeChengPanel.removeEventListener(Event.REMOVED_FROM_STAGE,tianFuSuiPianHeChengPanelClose);
         });
      }
      
      private function tianFuSuiPianHeChengPanelClose(param1:* = null) : void
      {
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
      }
      
      private function tianFuSuiPianHeChengPanelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc5_:int = 0;
         _loc2_ = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.openBackpack();
               break;
            case TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_SUIPIAN_CLICK:
               _loc4_ = _loc2_.data as Object;
               this.sendMsg.send_58323([1,_loc4_.pos,_loc4_.idx]);
               break;
            case TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_DRAG_ENTER:
               _loc5_ = _loc2_.data as int;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.stone = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.sendMsg.send_58323([0,this.stone.position,_loc5_]);
                  break;
               }
               return;
               break;
            case TianFuSuiPianHeChengPanel.UI_TIANFU_HECHENG_PANEL_HECHENG_OR_LINGQU_CLICK:
               _loc5_ = _loc2_.data as int;
               if(_loc5_ == 0)
               {
                  this.sendMsg.send_58325();
               }
               else if(_loc5_ == 1)
               {
                  this.sendMsg.send_58327();
               }
         }
      }
      
      public function setItems(param1:Array) : void
      {
         this.tianFuSuiPianHeChengPanel.setItems(param1);
      }
      
      public function setOKGood(param1:int, param2:int) : void
      {
         this.tianFuSuiPianHeChengPanel.setOKGood(param1,param2);
      }
      
      public function updateButton() : void
      {
         this.tianFuSuiPianHeChengPanel.updateButton();
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
         ResizeManager.showDoublePanel(this.tianFuSuiPianHeChengPanel,GameInstance.uiInstance.backpack);
      }
      
      private function get sendMsg() : TianFu_MsgSenderProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(TianFu_MsgSenderProxy.NAME) as TianFu_MsgSenderProxy;
         }
         return this._sendMsg;
      }
   }
}

