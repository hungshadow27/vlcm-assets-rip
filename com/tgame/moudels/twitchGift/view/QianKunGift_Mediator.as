package com.tgame.moudels.twitchGift.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.CardGiftPanel;
   import com.tgame.shell.view.components.baoxiang.KapianVo;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QianKunGift_Mediator extends Mediator
   {
      
      public static const NAME:String = "QianKunGift_Mediator";
      
      public static const MAIN_STATUS_OLD_NUOYI:int = 1;
      
      public static const MAIN_STATUS_NEW_NUOYI:int = 3;
      
      public static const MAIN_STATUS_NEW_YIZHI:int = 4;
      
      public static const FU_STATUS_SHIKONG:int = 1;
      
      public static const FU_STATUS_HUNDUN:int = 2;
      
      public static const FU_STATUS_MEIMENG:int = 3;
      
      private var _goodsID:int = 0;
      
      private var _mainStatus:int = 0;
      
      private var hasFanzhuanNum:int = 0;
      
      private var useXuanHuangShiNum:int = 0;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function QianKunGift_Mediator()
      {
         super(NAME);
      }
      
      private function get goodsID() : int
      {
         return this._goodsID;
      }
      
      private function set goodsID(param1:int) : void
      {
         this._goodsID = param1;
         var _loc2_:GoodsRes = GoodsResManager.getGoodsRes(this._goodsID);
         this.cardGiftPanel.setGoodsName(_loc2_ != null ? _loc2_.name : LanResManager.getLanCommonTextWords("无"));
         if(_loc2_ != null)
         {
            this.cardGiftPanel.setTitle(_loc2_.name);
         }
         else
         {
            this.cardGiftPanel.setTitle(LanResManager.getLanCommonTextWords("上次未领取奖励"));
         }
      }
      
      private function get mainStatus() : int
      {
         return this._mainStatus;
      }
      
      private function set mainStatus(param1:int) : void
      {
         this._mainStatus = param1;
      }
      
      protected function get cardGiftPanel() : CardGiftPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.cardGiftPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as CardGiftPanel;
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
         return [TwitchGift_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TwitchGift_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance._cardGiftPanel))
               {
                  this.cardGiftPanel.setQianKunDaiAndXuanHuangShi(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.goodsID,true),GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.XUAN_HUANG_SHI,true));
               }
         }
      }
      
      private function send60125AndFAlert(param1:int) : Boolean
      {
         var goodsName:String = null;
         var xuanhuangshiGoodsName:String = null;
         var isRe:int = param1;
         if(isRe == 0)
         {
            goodsName = GoodsResManager.getGoodsRes(this.goodsID).name;
            xuanhuangshiGoodsName = GoodsResManager.getGoodsRes(SpecialGoodsID.XUAN_HUANG_SHI).name;
            if(this.mainStatus == MAIN_STATUS_OLD_NUOYI || this.mainStatus == MAIN_STATUS_NEW_NUOYI)
            {
               if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.goodsID,true).count <= 0)
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"您拥有的乾坤袋数量不足，不能开启游戏。",[goodsName]),"",1);
                  return false;
               }
               if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUAN_HUANG_SHI,true).count <= 0)
               {
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("购买") + xuanhuangshiGoodsName;
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(LanResManager.getLanTextWords(this,"您拥有的乾坤袋数量不足，不能开启游戏。",[xuanhuangshiGoodsName]),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[SpecialGoodsID.XUAN_HUANG_SHI,0]);
                     }
                  });
                  return false;
               }
            }
            else if(this.mainStatus == MAIN_STATUS_NEW_YIZHI)
            {
               if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.goodsID,true).count <= 0)
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"您拥有的乾坤袋数量不足，不能开启游戏。",[goodsName]),"",1);
                  return false;
               }
               if(GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XUAN_HUANG_SHI,true).count <= 0)
               {
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("购买") + xuanhuangshiGoodsName;
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(LanResManager.getLanTextWords(this,"您拥有的乾坤袋数量不足，不能开启游戏。",[xuanhuangshiGoodsName]),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[SpecialGoodsID.XUAN_HUANG_SHI,0]);
                     }
                  });
                  return false;
               }
            }
         }
         this.msgSenderProxy.send_60125({
            "goodsID":this.goodsID,
            "state":this.mainStatus,
            "isShuaXin":isRe
         });
         return true;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CardGiftPanel,function():void
         {
            cardGiftPanel.addEventListener(Event.ADDED_TO_STAGE,twitchGiftPanelHandel);
            cardGiftPanel.addEventListener(Event.REMOVED_FROM_STAGE,twitchGiftPanelHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CardGiftPanel,function():void
         {
         });
         EventDispatchCenter.getInstance().addEventListener(CardGiftPanel.UI_CARD_GIFT_REPLAY_GAME,this.twitchGiftPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(CardGiftPanel.UI_CARD_GIFT_REFRESH,this.twitchGiftPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(CardGiftPanel.UI_CARD_GIFT_SMALL_PANEL_LOOK_PUKE,this.twitchGiftPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(CardGiftPanel.UI_CARD_GIFT_SHOW_OVER_DATA,this.twitchGiftPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(CardGiftPanel.UI_CARD_GOUMAI_CLICK,this.twitchGiftPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(CardGiftPanel.UI_CARD_GIFT_GET_GIFT_ITEM,this.twitchGiftPanelHandel);
         EventDispatchCenter.getInstance().addEventListener(CardGiftPanel.UI_CARD_GIFT_BAG_PANEL_LOOK_PUKE,this.twitchGiftPanelHandel);
      }
      
      private function twitchGiftPanelHandel(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var obj:Object = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.ADDED_TO_STAGE:
               this.cardGiftPanel.setQianKunDaiAndXuanHuangShi(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.goodsID,true),GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.XUAN_HUANG_SHI,true));
               break;
            case Event.REMOVED_FROM_STAGE:
               this.mainStatus = 0;
               break;
            case CardGiftPanel.UI_CARD_GIFT_REFRESH:
               this.send60125AndFAlert(1);
               break;
            case CardGiftPanel.UI_CARD_GIFT_REPLAY_GAME:
               this.send60125AndFAlert(0);
               break;
            case CardGiftPanel.UI_CARD_GIFT_SMALL_PANEL_LOOK_PUKE:
               obj = {
                  "goodsID":this.goodsID,
                  "state":this.mainStatus,
                  "index":Number((evt.data as KapianVo).name)
               };
               if(this.mainStatus == MAIN_STATUS_OLD_NUOYI || this.mainStatus == MAIN_STATUS_NEW_NUOYI)
               {
                  if(this.useXuanHuangShiNum > 0)
                  {
                     FAlert.show(LanResManager.getLanTextWords(this,"继续翻转八卦镜需要使用1",["",this.hasFanzhuanNum + 1,this.useXuanHuangShiNum]),"",2,function(param1:FAlertEvent):void
                     {
                        if(param1.eventData == FAlert.OK)
                        {
                           msgSenderProxy.send_60127(obj);
                        }
                     },true);
                  }
                  else
                  {
                     this.msgSenderProxy.send_60127(obj);
                  }
               }
               else if(this.mainStatus == MAIN_STATUS_NEW_YIZHI)
               {
                  this.msgSenderProxy.send_60127(obj);
               }
               break;
            case CardGiftPanel.UI_CARD_GIFT_SHOW_OVER_DATA:
               this.msgSenderProxy.send_60129({
                  "goodsID":this.goodsID,
                  "state":this.mainStatus
               });
               break;
            case CardGiftPanel.UI_CARD_GOUMAI_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[SpecialGoodsID.XUAN_HUANG_SHI,0]);
               break;
            case CardGiftPanel.UI_CARD_GIFT_GET_GIFT_ITEM:
               if(this.mainStatus == MAIN_STATUS_NEW_YIZHI)
               {
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("领取奖励");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("退回玄黄石");
                  FAlert.show(LanResManager.getLanCommonTextWords("您可以选择领取奖励，或者放弃奖励而退回5块玄黄石。"),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_60133({
                           "goodsID":goodsID,
                           "state":mainStatus,
                           "isGetXuanHuangShi":0
                        });
                     }
                     else
                     {
                        msgSenderProxy.send_60133({
                           "goodsID":goodsID,
                           "state":mainStatus,
                           "isGetXuanHuangShi":1
                        });
                     }
                  });
               }
               else if(this.mainStatus == 0)
               {
                  this.msgSenderProxy.send_60133({
                     "goodsID":this.goodsID,
                     "state":this.mainStatus,
                     "isGetXuanHuangShi":0
                  });
               }
               break;
            case CardGiftPanel.UI_CARD_GIFT_BAG_PANEL_LOOK_PUKE:
               this.msgSenderProxy.send_60131({
                  "goodsID":this.goodsID,
                  "state":evt.data as int
               });
         }
      }
      
      public function reveived_openSelectPanel(param1:int) : void
      {
         var selectMainStatus:int = 0;
         var selectMainStatusComplete:Function = null;
         var selectGameComplete:Function = null;
         var $goodsID:int = param1;
         selectMainStatusComplete = function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               selectMainStatus = MAIN_STATUS_NEW_NUOYI;
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(LanResManager.getLanCommonTextWords("开始一局普通模式"),"",2,selectGameComplete);
            }
            else
            {
               selectMainStatus = MAIN_STATUS_NEW_YIZHI;
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(LanResManager.getLanCommonTextWords("开始一局乾坤一掷"),"",2,selectGameComplete);
            }
         };
         selectGameComplete = function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               mainStatus = selectMainStatus;
               send60125AndFAlert(0);
            }
            else
            {
               mainStatus = 0;
            }
         };
         if(this.cardGiftPanel.opened)
         {
            return;
         }
         this.goodsID = $goodsID;
         if(this.goodsID == SpecialGoodsID.QIAN_KUN_DAI)
         {
            selectMainStatus = MAIN_STATUS_OLD_NUOYI;
            FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
            FAlert.show(LanResManager.getLanCommonTextWords("开始一局普通模式"),"",2,selectGameComplete);
         }
         else
         {
            FAlert.okLabel = LanResManager.getLanCommonTextWords("普通模式");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("乾坤一掷");
            FAlert.show(LanResManager.getLanCommonTextWords("请选择开启模式？普通模式 或 乾坤一掷"),"",2,selectMainStatusComplete);
         }
      }
      
      public function reveived_AllGiftData(param1:int, param2:int, param3:Array, param4:int, param5:String, param6:int, param7:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._cardGiftPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_QIAN_KUN_PU_KE_PANEL);
         }
         this.goodsID = param1;
         this.mainStatus = param2;
         this.hasFanzhuanNum = 0;
         this.useXuanHuangShiNum = 0;
         this.cardGiftPanel.changeToDataReady(param3,param6,param5);
         this.cardGiftPanel.setHunDunZhiQi(param4);
      }
      
      public function receive_GiftResult(param1:int, param2:int, param3:int, param4:Goods, param5:int, param6:int, param7:int, param8:int, param9:Boolean) : void
      {
         var _loc10_:int = 0;
         var _loc11_:String = null;
         this.goodsID = param1;
         this.mainStatus = param2;
         this.hasFanzhuanNum = param7;
         this.useXuanHuangShiNum = param8;
         this.cardGiftPanel.changeToShowResult(param3,param4,param5,this.hasFanzhuanNum - 1,this.mainStatus != MAIN_STATUS_NEW_YIZHI);
         this.cardGiftPanel.setHunDunZhiQi(param6);
         if(this.useXuanHuangShiNum < 0)
         {
            _loc10_ = 0;
            if(this.useXuanHuangShiNum == -1)
            {
               _loc10_ = FU_STATUS_SHIKONG;
            }
            else if(this.useXuanHuangShiNum == -2)
            {
               _loc10_ = FU_STATUS_HUNDUN;
            }
            _loc11_ = LanResManager.getLanCommonTextWords("免费抽取奖品");
            this.cardGiftPanel.showHuanjingPanel(_loc10_,_loc11_);
         }
         if(param9)
         {
            this.cardGiftPanel.showMeimengPanel(FU_STATUS_MEIMENG,LanResManager.getLanCommonTextWords("免费抽取超级大奖"));
         }
      }
      
      public function reveived_OverGiftResult(param1:int, param2:int, param3:Array, param4:int) : void
      {
         this.goodsID = param1;
         this.mainStatus = param2;
         this.cardGiftPanel.changeToShowAllResult(param3);
         this.cardGiftPanel.setHunDunZhiQi(param4);
      }
      
      public function received_OtherGiftResult(param1:int, param2:int, param3:Array, param4:Goods, param5:int) : void
      {
         if(param2 == FU_STATUS_MEIMENG)
         {
            this.cardGiftPanel.setMeimengOtherGiftComplete(param2,param3,param4,param5);
         }
         else
         {
            this.cardGiftPanel.setHuanjingOtherGiftComplete(param2,param3,param4,param5);
         }
      }
      
      public function received_hasWeiLingGoods(param1:int, param2:int, param3:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._cardGiftPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_QIAN_KUN_PU_KE_PANEL);
         }
         this.goodsID = param1;
         this.mainStatus = param2;
         this.hasFanzhuanNum = 0;
         this.useXuanHuangShiNum = 0;
         this.cardGiftPanel.changeToShowWeiling(param1,param2,param3);
         this.cardGiftPanel.setHunDunZhiQi(0);
      }
      
      public function received_OtherGetGiftComplete(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc5_:int = 0;
         var _loc6_:String = null;
         this.cardGiftPanel.setOtherGiftGetComplete(param1,param2);
         if(param2 == 0)
         {
            this.cardGiftPanel.onClose();
            return;
         }
         if(param4 < 0)
         {
            _loc5_ = 0;
            if(param4 == -1)
            {
               _loc5_ = FU_STATUS_SHIKONG;
            }
            else if(param4 == -2)
            {
               _loc5_ = FU_STATUS_HUNDUN;
            }
            _loc6_ = LanResManager.getLanCommonTextWords("免费抽取奖品");
            this.cardGiftPanel.showHuanjingPanel(_loc5_,_loc6_);
         }
      }
   }
}

