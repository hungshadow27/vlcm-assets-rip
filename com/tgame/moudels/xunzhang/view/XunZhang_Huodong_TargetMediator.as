package com.tgame.moudels.xunzhang.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhang.XunZhang_ApplicationFacade;
   import com.tgame.moudels.xunzhang.model.XunZhang_MsgSenderProxy;
   import com.tgame.shell.view.components.XunzhangShowPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhang_Huodong_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "XunZhang_TargetMediator";
      
      private var id:int;
      
      public var pageNow:int;
      
      public var pageTotal:int;
      
      private var _senderProxy:XunZhang_MsgSenderProxy;
      
      public function XunZhang_Huodong_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get senderProxy() : XunZhang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XunZhang_MsgSenderProxy.NAME) as XunZhang_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get targetXunzhangPlane() : XunzhangShowPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetXunZhangPanel);
         }
         return viewComponent as XunzhangShowPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XunZhang_ApplicationFacade.SHOW_XUNZHANG_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:DisplayObject = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Rectangle = null;
         var _loc2_:Object = param1.getBody();
         var _loc3_:int = _loc2_ as int;
         this.id = _loc3_;
         switch(param1.getName())
         {
            case XunZhang_ApplicationFacade.SHOW_XUNZHANG_PANEL:
               if(_loc3_ != -1)
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.targetXunzhangPlane);
                  this.targetXunzhangPlane.visible = true;
                  _loc4_ = 50;
                  _loc5_ = viewComponent as DisplayObject;
                  _loc6_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
                  _loc7_ = _loc5_.getBounds(GameInstance.stage);
                  _loc8_ = _loc6_.intersection(_loc7_);
                  if(_loc8_.width < _loc4_ || _loc8_.height < _loc4_)
                  {
                     _loc5_.x = GameConfig.sceneWidth / 2 - _loc5_.width / 2;
                     _loc5_.y = GameConfig.sceneHeight / 2 - _loc5_.height / 2;
                  }
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc5_);
                  this.senderProxy.send_59657(_loc3_);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XunzhangShowPanel,function():void
         {
            targetXunzhangPlane.addEventListener(XunzhangShowPanel.UI_PAGE_BTN_2_CLICK,xunZhangDuiHuanHandle);
            targetXunzhangPlane.addEventListener(XunzhangShowPanel.UI_START_LAST_BTN_2_CLICK,xunZhangDuiHuanHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XunzhangShowPanel,function():void
         {
            targetXunzhangPlane.removeEventListener(XunzhangShowPanel.UI_PAGE_BTN_2_CLICK,xunZhangDuiHuanHandle);
            targetXunzhangPlane.removeEventListener(XunzhangShowPanel.UI_START_LAST_BTN_2_CLICK,xunZhangDuiHuanHandle);
         });
      }
      
      private function xunZhangDuiHuanHandle(param1:Event = null) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc2_:String = param1.type;
         _loc3_ = param1 as BaseEvent;
         switch(_loc2_)
         {
            case XunzhangShowPanel.UI_PAGE_BTN_2_CLICK:
               _loc4_ = _loc3_.data as int;
               this.senderProxy.send_59659([this.id,this.pageNow,_loc4_]);
               break;
            case XunzhangShowPanel.UI_START_LAST_BTN_2_CLICK:
               _loc4_ = _loc3_.data as int;
               if(_loc4_ == 1)
               {
                  this.senderProxy.send_59659([this.id,1,_loc4_]);
               }
               else
               {
                  this.senderProxy.send_59659([this.id,this.pageTotal,_loc4_]);
               }
         }
      }
      
      public function setXunzhangDuiHuanPanel(param1:Array) : void
      {
         this.targetXunzhangPlane.setXunzhangDuiHuanPanel(false,param1);
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.targetXunzhangPlane.setPageCount(param1,param2);
      }
   }
}

