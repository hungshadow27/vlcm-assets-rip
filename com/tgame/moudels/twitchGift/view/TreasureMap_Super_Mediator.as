package com.tgame.moudels.twitchGift.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.TreasureMapPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TreasureMap_Super_Mediator extends Mediator
   {
      
      private var isGetGiftedAutoStart:Boolean = false;
      
      private var isStartedAutoGetGift:Boolean = false;
      
      private var giftType:int;
      
      public var giftID:int;
      
      public var shovelType:int;
      
      private var isPlayering:Boolean = false;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function TreasureMap_Super_Mediator(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      protected function get treasureMapPanel() : TreasureMapPanel
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
               _loc3_ = _loc2_ as Goods;
               if(!_loc3_)
               {
                  return;
               }
               if(_loc3_.id == this.shovelType)
               {
                  _loc3_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.shovelType,true);
                  this.treasureMapPanel.setShovel(_loc3_.count,_loc3_.id);
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
         if(!Fun.isVisible(this.treasureMapPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.treasureMapPanel);
            this.treasureMapPanel.visible = true;
            _loc1_ = 50;
            _loc2_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            _loc3_ = this.treasureMapPanel.getBounds(GameInstance.stage);
            _loc4_ = _loc2_.intersection(_loc3_);
            if(_loc4_.width < _loc1_ || _loc4_.height < _loc1_)
            {
               this.treasureMapPanel.x = GameConfig.sceneWidth / 2 - this.treasureMapPanel.width / 2;
               this.treasureMapPanel.y = GameConfig.sceneHeight / 2 - this.treasureMapPanel.height / 2;
            }
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
            TSoundManager.addPanelCloseSound(this.treasureMapPanel);
         }
         this.treasureMapPanel.setLingjiang();
         if(this.isGetGiftedAutoStart)
         {
            this.msgSenderProxy.send_60111(this.giftID);
         }
      }
      
      public function getGift(param1:Array, param2:int, param3:Boolean, param4:int, param5:String) : void
      {
         if(this.isPlayering || !Fun.isVisible(this.treasureMapPanel))
         {
            return;
         }
         this.giftType = param4;
         this.treasureMapPanel.setItem(param1,param2,param3,param5);
         if(this.isGetGiftedAutoStart && !param3)
         {
            this.startTwitchGiftPlayer(1);
         }
         if(param3)
         {
            this.treasureMapPanel.KeyiLingjiang(false,true);
         }
         else
         {
            this.treasureMapPanel.KeyiLingjiang(true,false);
         }
      }
      
      public function getLostGift(param1:Goods, param2:Boolean, param3:int, param4:String) : void
      {
         if(this.isPlayering || !Fun.isVisible(this.treasureMapPanel))
         {
            return;
         }
         this.giftType = param3;
         this.treasureMapPanel.setDownResult([param1],param2,param4);
         if(this.isGetGiftedAutoStart && !param2)
         {
            this.startTwitchGiftPlayer(1);
         }
         if(param2)
         {
            this.treasureMapPanel.KeyiLingjiang(false,true);
         }
         else
         {
            this.treasureMapPanel.KeyiLingjiang(true,false);
         }
      }
      
      public function setShove(param1:int, param2:String) : void
      {
         this.treasureMapPanel.setDemandShovel(param1,param2);
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.shovelType,true);
         this.treasureMapPanel.setShovel(_loc3_.count,_loc3_.id);
      }
      
      public function nought() : void
      {
         this.treasureMapPanel.Nought();
      }
      
      public function startTwitchGiftPlayer(param1:int) : void
      {
         if(param1 == 0)
         {
            this.treasureMapPanel.KeyiLingjiang(false,true);
            this.isPlayering = false;
            return;
         }
         this.treasureMapPanel.StartFun();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TreasureMapPanel,function():void
         {
            treasureMapPanel.addEventListener(TreasureMapPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.addEventListener(TreasureMapPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.addEventListener(TreasureMapPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.addEventListener(TreasureMapPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.addEventListener(TreasureMapPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.addEventListener(TreasureMapPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TreasureMapPanel,function():void
         {
            treasureMapPanel.removeEventListener(TreasureMapPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.removeEventListener(TreasureMapPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.removeEventListener(TreasureMapPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.removeEventListener(TreasureMapPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.removeEventListener(TreasureMapPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.removeEventListener(TreasureMapPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK,twitchGiftPanelHandel);
            treasureMapPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
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
            case TreasureMapPanel.UI_KongMingLock_LINGJIANG_CLICK:
               this.getGiftBtnClick();
               break;
            case TreasureMapPanel.UI_KongMingLock_START_CLICK:
               this.startTwitchGiftPlayer(1);
               break;
            case TreasureMapPanel.UI_KongMingLock_START_LINGJIANG_CLICK:
               this.isStartedAutoGetGift = _loc2_.data as Boolean;
               break;
            case TreasureMapPanel.UI_KongMingLock_LINGJIANG_START_CLICK:
               this.isGetGiftedAutoStart = _loc2_.data as Boolean;
               break;
            case TreasureMapPanel.UI_KongMingLock_KEYILINGJIANG_CLICK:
               this.isPlayering = false;
               this.treasureMapPanel.KeyiLingjiang(false,true);
               if(this.isStartedAutoGetGift)
               {
                  this.getGiftBtnClick();
               }
               break;
            case TreasureMapPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK:
               this.msgSenderProxy.send_60111(this.giftID);
         }
      }
      
      private function getGiftBtnClick() : void
      {
         if(!Fun.isVisible(this.treasureMapPanel))
         {
            return;
         }
         this.msgSenderProxy.send_60107(this.giftType);
         this.treasureMapPanel.KeyiLingjiang(false,true);
      }
   }
}

