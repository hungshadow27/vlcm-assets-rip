package com.tgame.moudels.twitchGift.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.ShouYuanChouJiangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShouYuanGongFa_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShouYuanGongFa_Mediator";
      
      public var giftType:int;
      
      public var giftID:int;
      
      private var isPlayering:Boolean = false;
      
      private var isGetGiftedAutoStart:Boolean = false;
      
      private var isStartedAutoGetGift:Boolean = false;
      
      public var longYuanId:int = -1;
      
      public var mountId:int;
      
      public var goodsId:int;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function ShouYuanGongFa_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : ShouYuanChouJiangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shouYuanChouJiangPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as ShouYuanChouJiangPanel;
      }
      
      private function get msgSenderProxy() : TwitchGift_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(TwitchGift_MsgSendProxy.NAME) as TwitchGift_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TwitchGift_ApplicationFacade.LONGYUAN_SKILL_CHOUJIANG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TwitchGift_ApplicationFacade.LONGYUAN_SKILL_CHOUJIANG:
               this.mountId = _loc2_[0];
               this.longYuanId = _loc2_[1];
               this.goodsId = _loc2_[2];
               this.msgSenderProxy.send_60147([this.mountId,this.longYuanId,0]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function showPanel(param1:Boolean) : void
      {
         if(param1)
         {
            POPWindowManager.showWindow(this.panel);
         }
         else
         {
            POPWindowManager.closeWindow();
         }
      }
      
      public function getGift(param1:Array, param2:int, param3:Boolean, param4:int, param5:String) : void
      {
         if(this.isPlayering || !Fun.isVisible(this.panel))
         {
            return;
         }
         this.giftType = param4;
         this.panel.setItem(param1,param2,param3,param5);
         if(this.isGetGiftedAutoStart && !param3)
         {
            this.startTwitchGiftBtnClick();
         }
         if(param3)
         {
            this.panel.KeyiLingjiang(false,true,true);
         }
         else
         {
            this.panel.KeyiLingjiang(true,false,false);
         }
      }
      
      public function getLostGift(param1:Goods, param2:Boolean, param3:int, param4:String) : void
      {
         if(this.isPlayering || !Fun.isVisible(this.panel))
         {
            return;
         }
         this.giftType = param3;
         this.panel.setDownResult([param1],param2,param4);
         if(this.isGetGiftedAutoStart && !param2)
         {
            this.startTwitchGiftBtnClick();
         }
         if(param2)
         {
            this.panel.KeyiLingjiang(false,true,true);
         }
         else
         {
            this.panel.KeyiLingjiang(true,false,true);
         }
      }
      
      public function qingKongPanel() : void
      {
         if(this.isPlayering || !Fun.isVisible(this.panel))
         {
            return;
         }
         this.panel.setLingJiangResult();
      }
      
      public function startTwitchGiftPlayer(param1:int) : void
      {
         if(param1 == 0)
         {
            this.panel.KeyiLingjiang(false,true,true);
            this.isPlayering = false;
            return;
         }
         this.panel.StartFun();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShouYuanChouJiangPanel,function():void
         {
            panel.addEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            panel.addEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            panel.addEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            panel.addEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            panel.addEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            panel.addEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_SHUAXIN_CLICK,twitchGiftPanelHandel);
            panel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShouYuanChouJiangPanel,function():void
         {
            panel.removeEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            panel.removeEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            panel.removeEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            panel.removeEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            panel.removeEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            panel.removeEventListener(ShouYuanChouJiangPanel.UI_KongMingLock_SHUAXIN_CLICK,twitchGiftPanelHandel);
            panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function panelClose(param1:FCloseEvent) : void
      {
      }
      
      private function twitchGiftPanelHandel(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_.type)
         {
            case ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_CLICK:
               this.getGiftBtnClick(_loc2_.data as int);
               break;
            case ShouYuanChouJiangPanel.UI_KongMingLock_START_CLICK:
               this.startTwitchGiftBtnClick();
               break;
            case ShouYuanChouJiangPanel.UI_KongMingLock_START_LINGJIANG_CLICK:
               this.isStartedAutoGetGift = _loc2_.data as Boolean;
               break;
            case ShouYuanChouJiangPanel.UI_KongMingLock_LINGJIANG_START_CLICK:
               this.isGetGiftedAutoStart = _loc2_.data as Boolean;
               break;
            case ShouYuanChouJiangPanel.UI_KongMingLock_KEYILINGJIANG_CLICK:
               this.isPlayering = false;
               this.panel.KeyiLingjiang(false,true,true);
               if(this.isStartedAutoGetGift)
               {
                  this.getGiftBtnClick();
               }
               break;
            case ShouYuanChouJiangPanel.UI_KongMingLock_SHUAXIN_CLICK:
               this.msgSenderProxy.send_60147([this.mountId,this.longYuanId,1]);
         }
      }
      
      private function getGiftBtnClick(param1:int = 3) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            return;
         }
         this.msgSenderProxy.send_60147([this.mountId,this.longYuanId,param1]);
         this.panel.KeyiLingjiang(false,true,true);
      }
      
      private function startTwitchGiftBtnClick() : void
      {
         if(!Fun.isVisible(this.panel))
         {
            return;
         }
         this.isPlayering = true;
         this.msgSenderProxy.send_60147([this.mountId,this.longYuanId,2]);
         this.panel.KeyiLingjiang(false,false,false);
      }
      
      public function setShouYuanGongFa() : void
      {
         this.panel.setShouYuanGongFa(this.goodsId);
      }
      
      public function setXingYunZhi(param1:int, param2:int) : void
      {
         if(param1 == this.longYuanId)
         {
            this.panel.setXingYunZhi(param2);
         }
      }
   }
}

