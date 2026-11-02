package com.tgame.moudels.twitchGift.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.KongMingLockPanel;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TwitchGift_Super_Mediator extends Mediator
   {
      
      private var isGetGiftedAutoStart:Boolean = false;
      
      private var isStartedAutoGetGift:Boolean = false;
      
      private var giftType:int;
      
      public var giftID:int;
      
      private var isPlayering:Boolean = false;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function TwitchGift_Super_Mediator(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      protected function get kongMingLockPanel() : KongMingLockPanel
      {
         return null;
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
         return [TwitchGift_ApplicationFacade.NEW_ITEM_TO_BACKPACK];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case TwitchGift_ApplicationFacade.NEW_ITEM_TO_BACKPACK:
               if(!Fun.isVisible(this.kongMingLockPanel))
               {
                  return;
               }
               _loc3_ = _loc2_ as Goods;
               if(Boolean(_loc3_ && _loc3_.id == this.giftType && !this.isPlayering) && Boolean(!this.kongMingLockPanel.startBtnEnabled) && !this.kongMingLockPanel.lingjiangBtnEnabled)
               {
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function showPanel() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Rectangle = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         if(!Fun.isVisible(this.kongMingLockPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.kongMingLockPanel);
            this.kongMingLockPanel.visible = true;
            _loc1_ = 50;
            _loc2_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            _loc3_ = this.kongMingLockPanel.getBounds(GameInstance.stage);
            _loc4_ = _loc2_.intersection(_loc3_);
            if(_loc4_.width < _loc1_ || _loc4_.height < _loc1_)
            {
               this.kongMingLockPanel.x = GameConfig.sceneWidth / 2 - this.kongMingLockPanel.width / 2;
               this.kongMingLockPanel.y = GameConfig.sceneHeight / 2 - this.kongMingLockPanel.height / 2;
            }
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
            TSoundManager.addPanelCloseSound(this.kongMingLockPanel);
         }
      }
      
      public function getGift(param1:Array, param2:int, param3:Boolean, param4:int, param5:String) : void
      {
         if(param4 == SpecialGoodsID.WU_LIANG_MI_ZANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT2,"complete");
         }
         if(param4 == SpecialGoodsID.HUANGJINBAOXIANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT3,"complete");
         }
         if(param4 == SpecialGoodsID.ZUANSHIBAOXIANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT4,"complete");
         }
         if(param4 == SpecialGoodsID.KONG_MING_SUO)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT5,"complete");
         }
         if(this.isPlayering || !Fun.isVisible(this.kongMingLockPanel))
         {
            return;
         }
         this.giftType = param4;
         this.kongMingLockPanel.setItem(param1,param2,param3,param5);
         if(this.isGetGiftedAutoStart && !param3)
         {
            this.startTwitchGiftBtnClick();
         }
         if(param3)
         {
            this.kongMingLockPanel.KeyiLingjiang(false,true);
         }
         else
         {
            this.kongMingLockPanel.KeyiLingjiang(true,false);
         }
      }
      
      public function getLostGift(param1:Goods, param2:Boolean, param3:int, param4:String) : void
      {
         if(param3 == SpecialGoodsID.WU_LIANG_MI_ZANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT2,"complete");
         }
         if(param3 == SpecialGoodsID.HUANGJINBAOXIANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT3,"complete");
         }
         if(param3 == SpecialGoodsID.ZUANSHIBAOXIANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT4,"complete");
         }
         if(param3 == SpecialGoodsID.KONG_MING_SUO)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT5,"complete");
         }
         if(this.isPlayering || !Fun.isVisible(this.kongMingLockPanel))
         {
            return;
         }
         this.giftType = param3;
         this.kongMingLockPanel.setDownResult([param1],param2,param4);
         if(this.isGetGiftedAutoStart && !param2)
         {
            this.startTwitchGiftBtnClick();
         }
         if(param2)
         {
            this.kongMingLockPanel.KeyiLingjiang(false,true);
         }
         else
         {
            this.kongMingLockPanel.KeyiLingjiang(true,false);
         }
      }
      
      public function nought() : void
      {
         this.kongMingLockPanel.Nought();
      }
      
      public function startTwitchGiftPlayer(param1:int) : void
      {
         if(param1 == 0)
         {
            this.kongMingLockPanel.KeyiLingjiang(false,true);
            this.isPlayering = false;
            return;
         }
         this.kongMingLockPanel.StartFun();
      }
      
      public function setNewPlayerGuide(param1:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.kongMingLockPanel4) && param1 == SpecialGoodsID.WU_LIANG_MI_ZANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT2,{
               "id":param1,
               "fun":this.msgSenderProxy.send_60109
            });
         }
         if(!Fun.isVisible(GameInstance.uiInstance.kongMingLockPanel5) && param1 == SpecialGoodsID.HUANGJINBAOXIANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT3,{
               "id":param1,
               "fun":this.msgSenderProxy.send_60109
            });
         }
         if(!Fun.isVisible(GameInstance.uiInstance.kongMingLockPanel6) && param1 == SpecialGoodsID.ZUANSHIBAOXIANG)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT4,{
               "id":param1,
               "fun":this.msgSenderProxy.send_60109
            });
         }
         if(param1 == SpecialGoodsID.KONG_MING_SUO)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT5,{
               "id":param1,
               "fun":this.msgSenderProxy.send_60109,
               "nextFun":this.msgSenderProxy.send_60121
            });
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(KongMingLockPanel,function():void
         {
            kongMingLockPanel.addEventListener(KongMingLockPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            kongMingLockPanel.addEventListener(KongMingLockPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            kongMingLockPanel.addEventListener(KongMingLockPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            kongMingLockPanel.addEventListener(KongMingLockPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            kongMingLockPanel.addEventListener(KongMingLockPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            kongMingLockPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(KongMingLockPanel,function():void
         {
         });
      }
      
      private function panelClose(param1:FCloseEvent) : void
      {
         if(this.giftType == SpecialGoodsID.WU_LIANG_MI_ZANG && !this.kongMingLockPanel.ZhuandongPd)
         {
            this.msgSenderProxy.send_60121();
         }
         if(this.giftType == SpecialGoodsID.HUANGJINBAOXIANG && !this.kongMingLockPanel.ZhuandongPd)
         {
            this.msgSenderProxy.send_60121();
         }
         if(this.giftType == SpecialGoodsID.ZUANSHIBAOXIANG && !this.kongMingLockPanel.ZhuandongPd)
         {
            this.msgSenderProxy.send_60121();
         }
         if(this.giftType == SpecialGoodsID.KONG_MING_SUO && !this.kongMingLockPanel.ZhuandongPd)
         {
            this.msgSenderProxy.send_60121();
         }
      }
      
      private function twitchGiftPanelHandel(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_.type)
         {
            case KongMingLockPanel.UI_KongMingLock_LINGJIANG_CLICK:
               this.getGiftBtnClick();
               break;
            case KongMingLockPanel.UI_KongMingLock_START_CLICK:
               this.startTwitchGiftBtnClick();
               break;
            case KongMingLockPanel.UI_KongMingLock_START_LINGJIANG_CLICK:
               this.isStartedAutoGetGift = _loc2_.data as Boolean;
               break;
            case KongMingLockPanel.UI_KongMingLock_LINGJIANG_START_CLICK:
               this.isGetGiftedAutoStart = _loc2_.data as Boolean;
               break;
            case KongMingLockPanel.UI_KongMingLock_KEYILINGJIANG_CLICK:
               this.isPlayering = false;
               this.kongMingLockPanel.KeyiLingjiang(false,true);
               if(this.isStartedAutoGetGift)
               {
                  this.getGiftBtnClick();
               }
               if(this.giftType == SpecialGoodsID.WU_LIANG_MI_ZANG && !Fun.isVisible(GameInstance.uiInstance._kongMingLockPanel4))
               {
                  this.msgSenderProxy.send_60121();
               }
               if(this.giftType == SpecialGoodsID.HUANGJINBAOXIANG && !Fun.isVisible(GameInstance.uiInstance._kongMingLockPanel5))
               {
                  this.msgSenderProxy.send_60121();
               }
               if(this.giftType == SpecialGoodsID.ZUANSHIBAOXIANG && !Fun.isVisible(GameInstance.uiInstance._kongMingLockPanel6))
               {
                  this.msgSenderProxy.send_60121();
               }
               if(this.giftType == SpecialGoodsID.KONG_MING_SUO && !Fun.isVisible(GameInstance.uiInstance._kongMingLockPanel2))
               {
                  this.msgSenderProxy.send_60121();
               }
         }
      }
      
      private function getGiftBtnClick() : void
      {
         if(!Fun.isVisible(this.kongMingLockPanel))
         {
            return;
         }
         this.msgSenderProxy.send_60107(this.giftType);
         this.kongMingLockPanel.KeyiLingjiang(false,true);
      }
      
      private function startTwitchGiftBtnClick() : void
      {
         if(!Fun.isVisible(this.kongMingLockPanel))
         {
            return;
         }
         this.isPlayering = true;
         this.msgSenderProxy.send_60101(this.giftType);
         this.kongMingLockPanel.KeyiLingjiang(false,false);
      }
   }
}

