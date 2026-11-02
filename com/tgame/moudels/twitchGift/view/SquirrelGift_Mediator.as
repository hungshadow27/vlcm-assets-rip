package com.tgame.moudels.twitchGift.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.SquirrelGiftPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class SquirrelGift_Mediator extends Mediator
   {
      
      public static const NAME:String = "SquirrelGift_Mediator";
      
      private var isGetGiftedAutoStart:Boolean = false;
      
      private var isStartedAutoGetGift:Boolean = false;
      
      private var giftType:int = 0;
      
      private var isPlayering:Boolean = false;
      
      private var zhuFuNum:int;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function SquirrelGift_Mediator()
      {
         super(NAME);
      }
      
      protected function get squirrelGiftPanel() : SquirrelGiftPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.squirrelGiftPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as SquirrelGiftPanel;
      }
      
      private function get msgSenderProxy() : TwitchGift_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(TwitchGift_MsgSendProxy.NAME) as TwitchGift_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TwitchGift_ApplicationFacade.SHOW_SQUIRREL_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:* = undefined;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case TwitchGift_ApplicationFacade.SHOW_SQUIRREL_PANEL:
               _loc3_ = _loc2_;
               if(Boolean(_loc3_ && _loc3_ == SpecialGoodsID.PINE_NUTS_BLUE) || Boolean(_loc3_ == SpecialGoodsID.PINE_NUTS_GREEN) || _loc3_ == SpecialGoodsID.PINE_NUTS_ZHENQI_GOLD)
               {
                  this.showPanel(_loc3_ as int);
               }
               else
               {
                  this.showPanel(0);
               }
         }
      }
      
      public function showPanel(param1:int) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         if(!Fun.isVisible(this.squirrelGiftPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.squirrelGiftPanel);
            this.squirrelGiftPanel.visible = true;
            _loc2_ = 50;
            _loc3_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            _loc4_ = this.squirrelGiftPanel.getBounds(GameInstance.stage);
            _loc5_ = _loc3_.intersection(_loc4_);
            if(_loc5_.width < _loc2_ || _loc5_.height < _loc2_)
            {
               this.squirrelGiftPanel.x = GameConfig.sceneWidth / 2 - this.squirrelGiftPanel.width / 2;
               this.squirrelGiftPanel.y = GameConfig.sceneHeight / 2 - this.squirrelGiftPanel.height / 2;
            }
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
            TSoundManager.addPanelCloseSound(this.squirrelGiftPanel);
         }
         this.squirrelGiftPanel.setLingjiang();
         this.setSongZi(false,true,param1);
         this.msgSenderProxy.send_60115(this.giftType);
         if(GameState.gongneng150)
         {
            this.squirrelGiftPanel.setBuff(new Buff(OtherConst.BUFF_SQUIRREL));
         }
         else
         {
            this.squirrelGiftPanel.setBuff(null);
         }
         if(this.isGetGiftedAutoStart)
         {
            this.msgSenderProxy.send_60111(this.giftType);
         }
      }
      
      public function getGift(param1:Array, param2:int, param3:Boolean, param4:int, param5:String) : void
      {
         if(this.isPlayering || !Fun.isVisible(this.squirrelGiftPanel))
         {
            return;
         }
         this.setSongZi();
         this.giftType = param4;
         this.squirrelGiftPanel.setItem(param1,param2,param3,param5);
         if(this.isGetGiftedAutoStart && !param3)
         {
            this.startTwitchGiftPlayer(1);
         }
         if(param3)
         {
            this.squirrelGiftPanel.KeyiLingjiang(false,true,false,false);
         }
         else if(this.isGetGiftedAutoStart)
         {
            this.squirrelGiftPanel.KeyiLingjiang(false,false,false,true);
         }
         else
         {
            this.squirrelGiftPanel.KeyiLingjiang(true,false,false,false);
         }
      }
      
      public function getLostGift(param1:Goods, param2:Boolean, param3:int, param4:String) : void
      {
         if(this.isPlayering || !Fun.isVisible(this.squirrelGiftPanel))
         {
            return;
         }
         this.giftType = param3;
         this.squirrelGiftPanel.setDownResult([param1],param2,param4);
         if(this.isGetGiftedAutoStart && !param2)
         {
            this.msgSenderProxy.send_60111(param3);
         }
         this.squirrelGiftPanel.KeyiLingjiang(false,true,false,false);
         if(GameState.gongneng102 && this.giftType == SpecialGoodsID.PINE_NUTS_PURPLE)
         {
            this.squirrelGiftPanel.isShowDhljBtn(true);
         }
      }
      
      public function setNewPlayerGuide(param1:int) : void
      {
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_HAS_NOT_GET_SQUIRRE_GIFT,{
            "id":param1,
            "fun":this.msgSenderProxy.send_60107,
            "nextFun":this.msgSenderProxy.send_60121
         });
      }
      
      public function setZhuFuNum(param1:int, param2:int) : void
      {
         var _loc3_:String = null;
         if(param1 != this.giftType)
         {
            return;
         }
         this.zhuFuNum = param2;
         if(param1 == SpecialGoodsID.PINE_NUTS_BLUE)
         {
            _loc3_ = LanResManager.getLanCommonTextWords("蓝榛子");
         }
         if(param1 == SpecialGoodsID.PINE_NUTS_GREEN)
         {
            _loc3_ = LanResManager.getLanCommonTextWords("绿榛子");
         }
         if(param1 == SpecialGoodsID.PINE_NUTS_PURPLE)
         {
            _loc3_ = LanResManager.getLanCommonTextWords("紫榛子");
         }
         this.squirrelGiftPanel.setBenediction(param2,_loc3_);
      }
      
      public function setSongZi(param1:Boolean = false, param2:Boolean = false, param3:int = 0) : void
      {
         var _loc4_:Goods = null;
         if(param3 == 0)
         {
            if(param2)
            {
               this.giftType = SpecialGoodsID.PINE_NUTS_PURPLE;
               _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.giftType,true);
               if(_loc4_.count == 0)
               {
                  this.giftType = SpecialGoodsID.PINE_NUTS_GREEN;
                  _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.giftType,true);
                  if(_loc4_.count == 0)
                  {
                     this.giftType = SpecialGoodsID.PINE_NUTS_BLUE;
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.giftType,true);
                     if(_loc4_.count == 0)
                     {
                        this.giftType = SpecialGoodsID.PINE_NUTS_PURPLE;
                        _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.giftType,true);
                     }
                  }
               }
            }
            else
            {
               _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.giftType,true);
            }
         }
         else
         {
            this.giftType = param3;
            _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.giftType,true);
         }
         this.squirrelGiftPanel.setShovel(_loc4_.count,_loc4_,_loc4_.id);
         if(param1 && this.isGetGiftedAutoStart)
         {
            this.msgSenderProxy.send_60111(this.giftType);
         }
      }
      
      public function setFriendVilue(param1:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._squirrelGiftPanel))
         {
            return;
         }
         this.squirrelGiftPanel.setFriendVilue(param1);
      }
      
      public function nought() : void
      {
         this.squirrelGiftPanel.Nought();
      }
      
      public function startTwitchGiftPlayer(param1:int) : void
      {
         if(param1 == 0)
         {
            this.squirrelGiftPanel.KeyiLingjiang(false,true,false,false);
            this.isPlayering = false;
            return;
         }
         this.squirrelGiftPanel.StartFun();
         this.squirrelGiftPanel.KeyiLingjiang(false,false,false,true);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(SquirrelGiftPanel,function():void
         {
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LANBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LVBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_KongMingLock_DUIHUANLIJIN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_GET_JIN_SONG_GUO,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_FRIEND_PANEL_SHOW,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(SquirrelGiftPanel,function():void
         {
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LANBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LVBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_KongMingLock_DUIHUANLIJIN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_GET_JIN_SONG_GUO,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_FRIEND_PANEL_SHOW,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function panelClose(param1:FCloseEvent) : void
      {
         this.squirrelGiftPanel.isShowDhljBtn(false);
         this.msgSenderProxy.send_60121();
      }
      
      private function twitchGiftPanelHandel(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_.type)
         {
            case SquirrelGiftPanel.UI_KongMingLock_LINGJIANG_CLICK:
               this.getGiftBtnClick();
               break;
            case SquirrelGiftPanel.UI_KongMingLock_DUIHUANLIJIN_CLICK:
               this.getGiftBtnClick(1);
               break;
            case SquirrelGiftPanel.UI_KongMingLock_START_CLICK:
               this.startTwitchGiftPlayer(1);
               break;
            case SquirrelGiftPanel.UI_KongMingLock_START_LINGJIANG_CLICK:
               this.isStartedAutoGetGift = _loc2_.data as Boolean;
               break;
            case SquirrelGiftPanel.UI_KongMingLock_LINGJIANG_START_CLICK:
               this.isGetGiftedAutoStart = _loc2_.data as Boolean;
               break;
            case SquirrelGiftPanel.UI_KongMingLock_KEYILINGJIANG_CLICK:
               this.isPlayering = false;
               this.squirrelGiftPanel.KeyiLingjiang(false,true,false,false);
               if(this.isStartedAutoGetGift)
               {
                  this.getGiftBtnClick();
               }
               else if(GameState.gongneng102 && this.giftType == SpecialGoodsID.PINE_NUTS_PURPLE)
               {
                  this.squirrelGiftPanel.isShowDhljBtn(true);
               }
               break;
            case SquirrelGiftPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK:
               this.msgSenderProxy.send_60111(this.giftType);
               break;
            case SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LANBTN_CLICK:
               this.giftType = SpecialGoodsID.PINE_NUTS_BLUE;
               this.setSongZi();
               this.msgSenderProxy.send_60115(this.giftType);
               break;
            case SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LVBTN_CLICK:
               this.giftType = SpecialGoodsID.PINE_NUTS_GREEN;
               this.setSongZi();
               this.msgSenderProxy.send_60115(this.giftType);
               break;
            case SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK:
               this.giftType = SpecialGoodsID.PINE_NUTS_PURPLE;
               this.setSongZi();
               this.msgSenderProxy.send_60115(this.giftType);
               break;
            case SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_GET_JIN_SONG_GUO:
               this.msgSenderProxy.send_60119();
               break;
            case SquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_FRIEND_PANEL_SHOW:
               ResizeManager.showDoublePanel(this.squirrelGiftPanel,this.squirrelGiftPanel.showFirendPanel());
               this.msgSenderProxy.send_60117();
         }
      }
      
      private function getGiftBtnClick(param1:int = 0) : void
      {
         if(!Fun.isVisible(this.squirrelGiftPanel))
         {
            return;
         }
         this.squirrelGiftPanel.setLingjiang();
         this.msgSenderProxy.send_60107(this.giftType,param1);
         this.squirrelGiftPanel.KeyiLingjiang(false,false,true,false);
         this.squirrelGiftPanel.isShowDhljBtn(false);
         this.msgSenderProxy.send_60115(this.giftType);
      }
   }
}

