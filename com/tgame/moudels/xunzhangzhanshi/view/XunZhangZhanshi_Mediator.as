package com.tgame.moudels.xunzhangzhanshi.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangzhanshi.XunZhangZhanshi_ApplicationFacade;
   import com.tgame.moudels.xunzhangzhanshi.model.XunZhangZhanshi_MsgSenderProxy;
   import com.tgame.shell.view.components.xunzhangzhanshi.XunzhangZhanshiShowPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhangZhanshi_Mediator extends Mediator
   {
      
      public static const NAME:String = "XunZhangZhanshi_Mediator";
      
      public var pageNow:int;
      
      public var pageTotal:int;
      
      private var id:int;
      
      private var _msgSenderProxy:XunZhangZhanshi_MsgSenderProxy;
      
      public function XunZhangZhanshi_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get xunZhangPanel() : XunzhangZhanshiShowPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xunZhangzhanshiPanel);
         }
         return viewComponent as XunzhangZhanshiShowPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XunZhangZhanshi_ApplicationFacade.SHOW_XUNZHANG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc2_:Object = param1.getBody();
         var _loc3_:int = _loc2_ as int;
         this.id = _loc3_;
         switch(param1.getName())
         {
            case XunZhangZhanshi_ApplicationFacade.SHOW_XUNZHANG_PANEL:
               if(_loc3_ == -1)
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.xunZhangPanel);
                  this.xunZhangPanel.visible = true;
                  _loc4_ = viewComponent as DisplayObject;
                  _loc4_.x = GameConfig.sceneWidth / 2 - _loc4_.width / 2;
                  _loc4_.y = GameConfig.sceneHeight / 2 - _loc4_.height / 2;
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc4_);
                  this.msgSenderProxy.send_81609(_loc3_);
               }
         }
      }
      
      private function get msgSenderProxy() : XunZhangZhanshi_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(XunZhangZhanshi_MsgSenderProxy.NAME) as XunZhangZhanshi_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XunzhangZhanshiShowPanel,function():void
         {
            xunZhangPanel.addEventListener(XunzhangZhanshiShowPanel.UI_PAGE_BTN_2_CLICK,xunZhangDuiHuanHandle);
            xunZhangPanel.addEventListener(XunzhangZhanshiShowPanel.UI_START_LAST_BTN_2_CLICK,xunZhangDuiHuanHandle);
            xunZhangPanel.addEventListener(XunzhangZhanshiShowPanel.ITEM_XIEXIA_CLICK,xunZhangDuiHuanHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XunzhangZhanshiShowPanel,function():void
         {
            xunZhangPanel.removeEventListener(XunzhangZhanshiShowPanel.UI_PAGE_BTN_2_CLICK,xunZhangDuiHuanHandle);
            xunZhangPanel.removeEventListener(XunzhangZhanshiShowPanel.UI_START_LAST_BTN_2_CLICK,xunZhangDuiHuanHandle);
            xunZhangPanel.removeEventListener(XunzhangZhanshiShowPanel.ITEM_XIEXIA_CLICK,xunZhangDuiHuanHandle);
         });
      }
      
      private function xunZhangDuiHuanHandle(param1:Event = null) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:ItemFace = null;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case XunzhangZhanshiShowPanel.UI_PAGE_BTN_2_CLICK:
               _loc4_ = _loc3_.data as int;
               this.msgSenderProxy.send_81611([this.id,this.pageNow,_loc4_]);
               break;
            case XunzhangZhanshiShowPanel.UI_START_LAST_BTN_2_CLICK:
               _loc4_ = _loc3_.data as int;
               if(_loc4_ == 1)
               {
                  this.msgSenderProxy.send_81611([this.id,1,_loc4_]);
               }
               else
               {
                  this.msgSenderProxy.send_81611([this.id,this.pageTotal,_loc4_]);
               }
               break;
            case XunzhangZhanshiShowPanel.ITEM_XIEXIA_CLICK:
               _loc5_ = _loc3_.data as ItemFace;
               PipeManager.sendMsg(PipeConstants.ITEM_MOVE,[_loc5_,null,0,ItemPositionRange.CONTAINER_BAG]);
         }
      }
      
      public function setXunzhangDuiHuanPanel(param1:Array) : void
      {
         this.xunZhangPanel.setXunzhangDuiHuanPanel(true,param1);
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.xunZhangPanel.setPageCount(param1,param2);
      }
   }
}

