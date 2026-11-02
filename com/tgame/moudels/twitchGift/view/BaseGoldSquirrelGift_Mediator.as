package com.tgame.moudels.twitchGift.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.GoldSquirrelGiftPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BaseGoldSquirrelGift_Mediator extends Mediator
   {
      
      public static const NAME:String = "GoldSquirrelGift_Mediator";
      
      private var isGetGiftedAutoStart:Boolean = false;
      
      private var isStartedAutoGetGift:Boolean = false;
      
      private var giftType:int = 0;
      
      private var isPlayering:Boolean = false;
      
      private var zhuFuNum:int;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function BaseGoldSquirrelGift_Mediator(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      protected function get squirrelGiftPanel() : GoldSquirrelGiftPanel
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
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      public function showPanel(param1:Goods, param2:String) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         if(!Fun.isVisible(this.squirrelGiftPanel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.squirrelGiftPanel);
            this.squirrelGiftPanel.visible = true;
            _loc3_ = 50;
            _loc4_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
            _loc5_ = this.squirrelGiftPanel.getBounds(GameInstance.stage);
            _loc6_ = _loc4_.intersection(_loc5_);
            if(_loc6_.width < _loc3_ || _loc6_.height < _loc3_)
            {
               this.squirrelGiftPanel.x = GameConfig.sceneWidth / 2 - this.squirrelGiftPanel.width / 2;
               this.squirrelGiftPanel.y = GameConfig.sceneHeight / 2 - this.squirrelGiftPanel.height / 2;
            }
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
            TSoundManager.addPanelCloseSound(this.squirrelGiftPanel);
         }
         PipeManager.sendMsg(PipeConstants.SHOW_GOLD_SQUIRREL_GIFT_PLANE,param1.id);
         this.squirrelGiftPanel.setLingjiang();
         this.setSongZi(false,true,param1);
         if(this.isGetGiftedAutoStart)
         {
            this.msgSenderProxy.send_60111(this.giftType);
         }
         this.squirrelGiftPanel.setJinsongguoStr(param2);
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
         this.squirrelGiftPanel.setJinsongguoStr(param5);
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
         this.squirrelGiftPanel.setJinsongguoStr(param4);
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
      
      public function setSongZi(param1:Boolean = false, param2:Boolean = false, param3:Goods = null) : void
      {
         var _loc4_:Goods = null;
         if(param3)
         {
            this.squirrelGiftPanel.setShovel(param3.count,param3,LanResManager.getLanCommonTextWords("蓝榛子"));
            this.giftType = param3.id;
            return;
         }
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
         this.squirrelGiftPanel.setShovel(_loc4_.count,_loc4_,LanResManager.getLanCommonTextWords("蓝榛子"));
         if(param1 && this.isGetGiftedAutoStart)
         {
            this.msgSenderProxy.send_60111(this.giftType);
         }
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
         UIEventsRegisterManager.addUIRegisterEvent(GoldSquirrelGiftPanel,function():void
         {
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LANBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LVBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_DUIHUANLIJIN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GoldSquirrelGiftPanel,function():void
         {
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_LINGJIANG_START_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_START_LINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_KEYILINGJIANG_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LANBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LVBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(GoldSquirrelGiftPanel.UI_KongMingLock_DUIHUANLIJIN_CLICK,twitchGiftPanelHandel);
            squirrelGiftPanel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function panelClose(param1:FCloseEvent) : void
      {
         this.squirrelGiftPanel.isShowDhljBtn(false);
      }
      
      private function twitchGiftPanelHandel(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_.type)
         {
            case GoldSquirrelGiftPanel.UI_KongMingLock_LINGJIANG_CLICK:
               this.getGiftBtnClick();
               break;
            case GoldSquirrelGiftPanel.UI_KongMingLock_DUIHUANLIJIN_CLICK:
               this.getGiftBtnClick(1);
               break;
            case GoldSquirrelGiftPanel.UI_KongMingLock_START_CLICK:
               this.startTwitchGiftPlayer(1);
               break;
            case GoldSquirrelGiftPanel.UI_KongMingLock_START_LINGJIANG_CLICK:
               this.isStartedAutoGetGift = _loc2_.data as Boolean;
               break;
            case GoldSquirrelGiftPanel.UI_KongMingLock_LINGJIANG_START_CLICK:
               this.isGetGiftedAutoStart = _loc2_.data as Boolean;
               break;
            case GoldSquirrelGiftPanel.UI_KongMingLock_KEYILINGJIANG_CLICK:
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
            case GoldSquirrelGiftPanel.UI_TreasureMap_SHOWSTOREHOUSE_CLICK:
               this.msgSenderProxy.send_60111(this.giftType);
               break;
            case GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LANBTN_CLICK:
               this.giftType = SpecialGoodsID.PINE_NUTS_BLUE;
               this.setSongZi();
               this.msgSenderProxy.send_60115(this.giftType);
               break;
            case GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_LVBTN_CLICK:
               this.giftType = SpecialGoodsID.PINE_NUTS_GREEN;
               this.setSongZi();
               this.msgSenderProxy.send_60115(this.giftType);
               break;
            case GoldSquirrelGiftPanel.UI_SQUIRRELGIFTPANEL_ZIBTN_CLICK:
               this.giftType = SpecialGoodsID.PINE_NUTS_PURPLE;
               this.setSongZi();
               this.msgSenderProxy.send_60115(this.giftType);
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

