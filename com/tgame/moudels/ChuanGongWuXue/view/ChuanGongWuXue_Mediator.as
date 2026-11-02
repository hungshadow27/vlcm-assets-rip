package com.tgame.moudels.ChuanGongWuXue.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ChuanGongWuXue.ChuanGongWuXue_ApplicationFacade;
   import com.tgame.moudels.ChuanGongWuXue.model.ChuanGongWuXue_MsgSenderProxy;
   import com.tgame.shell.view.components.ChuanGongWuXuePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChuanGongWuXue_Mediator extends Mediator
   {
      
      public static const NAME:String = "ChuanGongWuXue_Mediator";
      
      private var mySP:int = 0;
      
      private var sqhd:Boolean = false;
      
      private var diziId:int = 0;
      
      private var _senderProxy:ChuanGongWuXue_MsgSenderProxy;
      
      public function ChuanGongWuXue_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : ChuanGongWuXue_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ChuanGongWuXue_MsgSenderProxy.NAME) as ChuanGongWuXue_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : ChuanGongWuXuePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.chuangongwuxuePanel);
         }
         return viewComponent as ChuanGongWuXuePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ChuanGongWuXue_ApplicationFacade.QINGQIU_CHUANGONGWUXUE_MIANBAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ChuanGongWuXue_ApplicationFacade.QINGQIU_CHUANGONGWUXUE_MIANBAN:
               this.senderProxy.send_72131();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         GameInstance.scene.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp,false,30);
         UIEventsRegisterManager.addUIRegisterEvent(ChuanGongWuXuePanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,handler);
            panel.addEventListener(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_SHOW,handler);
            panel.addEventListener(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZIWUXUE_SHOW,handler);
            panel.addEventListener(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_DRAGUP_1,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ChuanGongWuXuePanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            panel.removeEventListener(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_SHOW,handler);
            panel.removeEventListener(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZIWUXUE_SHOW,handler);
            panel.removeEventListener(ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_DRAGUP_1,handler);
         });
      }
      
      private function onMouseUp(param1:Event) : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            this.senderProxy.send_72135([this.diziId,TCursorManager.currentItemFace.getBaseItem().id,0]);
         }
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:ItemFace = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_SHOW:
               this.senderProxy.send_72131();
               break;
            case ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZIWUXUE_SHOW:
               this.senderProxy.send_72133(_loc2_.data);
               break;
            case ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_DRAGUP:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  _loc4_ = _loc2_.data as Array;
                  _loc3_ = _loc4_[1];
                  _loc5_ = _loc4_[0] as int;
                  this.diziId = _loc5_;
                  _loc6_ = _loc4_[2] as int;
                  this.senderProxy.send_72135([_loc5_,_loc3_.getBaseItem().id,_loc6_]);
               }
               break;
            case ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_YICHU:
               _loc3_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.source = 9;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case ChuanGongWuXuePanel.UI_CHUANGONGWUXUE_DIZI_DRAGUP_1:
               _loc3_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
         }
      }
      
      public function setPanel(param1:Array) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_CHUANGONGWUXUE_PANEL);
         this.panel.setDizi(param1);
      }
      
      public function setPanelDizi(param1:int, param2:Array, param3:Array, param4:Array, param5:Array) : void
      {
         this.panel.setDiZiWuXue(param1,param2,param3,param4,param5);
      }
   }
}

