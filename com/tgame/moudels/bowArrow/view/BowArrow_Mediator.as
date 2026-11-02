package com.tgame.moudels.bowArrow.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.bowArrow.BowArrow_ApplicationFacade;
   import com.tgame.moudels.bowArrow.info.BowArrowCmpInfo;
   import com.tgame.moudels.bowArrow.info.BowArrowCmpResultInfo;
   import com.tgame.moudels.bowArrow.info.BowArrowItemInfo;
   import com.tgame.moudels.bowArrow.model.BowArrow_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.JiHuoRouShenShuXingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BowArrow_Mediator extends Mediator
   {
      
      public static const NAME:String = "BowArrowMediator";
      
      private var _curtPage:int = 1;
      
      private var _totalPage:uint = 8;
      
      private var _isAutoCmp:Boolean = false;
      
      private var _timer:Timer;
      
      private var _curtInstallItem:ItemFace;
      
      private var _curtInstallID:uint;
      
      private var _curtBowArrowCmpInfo:BowArrowCmpInfo;
      
      private var isShowUseShenQiLongShouJinFAlert:Boolean = true;
      
      private var _interval:uint;
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var _msgSendProxy:BowArrow_MsgSenderProxy;
      
      public function BowArrow_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get charAttribute() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BowArrow_ApplicationFacade.SHOW_GOODS_PANEL,BowArrow_ApplicationFacade.UPDATE_SKILL,BowArrow_ApplicationFacade.BOW_DINGJI_JIHUO_SHUXING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BowArrow_ApplicationFacade.SHOW_GOODS_PANEL:
               this.useArcheryBook(_loc2_);
               break;
            case BowArrow_ApplicationFacade.UPDATE_SKILL:
               if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
               {
                  this.msgSendProxy.send_53031(this._curtPage);
               }
               break;
            case BowArrow_ApplicationFacade.BOW_DINGJI_JIHUO_SHUXING:
               if(_loc2_.type == 3)
               {
                  this.msgSendProxy.send_53031(-1);
               }
         }
      }
      
      public function get msgSendProxy() : BowArrow_MsgSenderProxy
      {
         if(this._msgSendProxy == null)
         {
            this._msgSendProxy = facade.retrieveProxy(BowArrow_MsgSenderProxy.NAME) as BowArrow_MsgSenderProxy;
         }
         return this._msgSendProxy;
      }
      
      private function useArcheryBook(param1:Object) : void
      {
         var good:Goods = null;
         var str:String = null;
         var data:Object = param1;
         var sendMsg:Function = function():void
         {
            PipeManager.sendMsg(PipeConstants.SEND_ITEM_USE,[good.id,good.position]);
         };
         good = data as Goods;
         if(good.id >= 57001 && good.id <= 57007)
         {
            if(GameInstance.mainCharData.attributeInfo.currentBowLv <= 0)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("无法学习箭术秘籍"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("无法学习箭术秘籍"));
               return;
            }
            if(GameInstance.mainCharData.attributeInfo.currentBowLv == 8)
            {
               sendMsg();
               return;
            }
            str = LanResManager.getLanTextWords(this,"激活当前弓箭上的箭术",[StaticValue.RED_HTML,StaticValue.BLUE_HTML,StaticValue.GREEN_HTML,GoodsResManager.getGoodsRes(good.id).name]);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("开始学习");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("稍后学习");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  sendMsg();
               }
            },true);
         }
      }
      
      public function updateBowArrowPanel(param1:BowArrowItemInfo) : void
      {
         this.charAttribute.setJianshu(param1.allArcheryList,param1.activeArcheryList.length,param1.allArcheryList.length);
         var _loc2_:Array = [];
         if(param1.bowArrowGoodsOne.id != -1)
         {
            _loc2_.push([param1.bowArrowGoodsOne,1]);
         }
         if(param1.bowArrowGoodsTwo.id != -1)
         {
            _loc2_.push([param1.bowArrowGoodsTwo,2]);
         }
         this.charAttribute.setJianzhi(_loc2_,this._curtPage);
         var _loc3_:Boolean = false;
         if(param1.curtID != -1 && this._curtPage < this._totalPage && param1.curtID != this._totalPage)
         {
            _loc3_ = true;
         }
         var _loc4_:uint = 0;
         if(param1.curtID == -1)
         {
            _loc4_ = 1;
            if(this._curtPage > 1)
            {
               _loc4_ = 2;
            }
         }
         else if(this._curtPage > param1.curtID)
         {
            _loc4_ = 2;
         }
         this.charAttribute.setBowPage(this._curtPage,this._totalPage,_loc3_,_loc4_);
         this.charAttribute.setZuoyong(param1.historyDes);
         this.charAttribute.setShuxing(param1.propertyDesList,param1.ynlianzhounu);
         this.charAttribute.isOpenBow(param1.isUseArrow);
         this.charAttribute.setName(param1.name,param1.step.toString());
         this.charAttribute.BowShow(param1.visible);
         this.charAttribute.setBowJihuo(param1.isJihuo);
         this.charAttribute.setBowEquip(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         this.charAttribute.setYNBowEquip(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         this.charAttribute.setBowMenghuanYujian(true);
         this.charAttribute.setBowDanTian(param1.isDanTian);
      }
      
      public function updateComposePanel(param1:BowArrowCmpInfo) : void
      {
         this._curtBowArrowCmpInfo = param1;
         this.charAttribute.showBowJinjie();
         this.charAttribute.setBow(param1.curtBowArrowName,param1.curtBowArrowID,param1.nextBowArrowName,param1.nextBowArrowID);
         this.setCompsePanelData(param1);
      }
      
      public function composeSuccess(param1:BowArrowCmpResultInfo) : void
      {
         var _loc2_:BowArrowCmpInfo = null;
         this._isAutoCmp = false;
         if(this._timer)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
         }
         this.charAttribute.setBowZdtsBtnLabel(true);
         NoticeManager.notify(NoticeManager.FOOT,"弓箭进阶成功！");
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"弓箭进阶成功！");
         if(param1.curtBowArrowID == this._totalPage)
         {
            this._curtPage = GameInstance.mainCharData.attributeInfo.currentBowLv;
            _loc2_ = this._curtBowArrowCmpInfo;
            this.charAttribute.setXingyunzhi(_loc2_.coinsCost,GoodsResManager.getGoodsRes(_loc2_.stuffID).name + "×" + _loc2_.stuffCnt,Math.floor(_loc2_.probability / 100),true,true,param1.luckAllCnt);
            this.charAttribute.bowJinjiePanelClose();
         }
         else
         {
            this._curtPage = GameInstance.mainCharData.attributeInfo.currentBowLv;
            this.msgSendProxy.send_53033();
         }
         this.msgSendProxy.send_53031(param1.curtBowArrowID);
         this.charAttribute.setJinJieBtnEnabled(!this._isAutoCmp);
      }
      
      public function composeFaile(param1:BowArrowCmpResultInfo) : void
      {
         if(param1.isSuccess == 2 && this._isAutoCmp)
         {
            if(this._timer)
            {
               this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
               this._timer.stop();
            }
            this.stopAutoCompose();
         }
         if(Boolean(this._timer) && this._isAutoCmp)
         {
            this._timer.start();
         }
         this._curtBowArrowCmpInfo.luckAllCnt = param1.luckAllCnt;
         this.setCompsePanelData(this._curtBowArrowCmpInfo);
         this.charAttribute.addXingyunzhi(param1.buffLuckCnt);
         this.charAttribute.xingyunzhiStop(param1.luckCnt);
      }
      
      public function updateArrowContainer(param1:Array) : void
      {
         this.charAttribute.setJianzhi(param1,this._curtPage);
      }
      
      public function f5() : void
      {
         this.msgSendProxy.send_53031(this._curtPage);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            charAttribute.addEventListener(CharAttribute.GETGONGJIAN,onClickBowArrow);
            charAttribute.addEventListener(CharAttribute.UI_BOW_SHANGYIYE_CLICK,onSelectBowArrowPrev);
            charAttribute.addEventListener(CharAttribute.UI_BOW_XIAYIYE_CLICK,onSelectBowArrowNext);
            charAttribute.addEventListener(CharAttribute.UI_BOW_JINJIEHECHENG_CLICK,onComposeBowArrow);
            charAttribute.addEventListener(CharAttribute.UI_BOW_OPTION_PANEL_DRAG_ENTER,onInstallArrow);
            charAttribute.addEventListener(CharAttribute.UI_BOW_OPTION_PANEL_STONE_CLICK,onUninstallArrow);
            charAttribute.addEventListener(CharAttribute.UI_BOWJINJIE_KAISHIJINJIE_CLICK,onStartComposeBowArrow);
            charAttribute.addEventListener(CharAttribute.UI_BOWJINJIE_ZIDONGJINJIE_CLICK,onAutoComposeBowArrow);
            charAttribute.addEventListener(CharAttribute.UI_BOW_SHIFOUSHIYONGANQI_CLICK,onUseBowArrow);
            charAttribute.addEventListener(CharAttribute.UI_BOWJINJIE_CLOSE_CLICK,onComposeBowArrowPanelClose);
            charAttribute.addEventListener(CharAttribute.UI_BOWJINJIE_GOUMAI_CLICK,onBuyStuff);
            charAttribute.addEventListener(CharAttribute.UI_GONGJIANYINCANGSHUXING_JIHUO_CLICK,onJihuoBowYincang);
            charAttribute.addEventListener(CharAttribute.UI_BOWJINJIE_USE_SHENQILONGSHOUJIN_CLICK,useShenQiLongShouJin);
            charAttribute.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveStage);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            charAttribute.removeEventListener(CharAttribute.GETGONGJIAN,onClickBowArrow);
            charAttribute.removeEventListener(CharAttribute.UI_BOW_SHANGYIYE_CLICK,onSelectBowArrowPrev);
            charAttribute.removeEventListener(CharAttribute.UI_BOW_XIAYIYE_CLICK,onSelectBowArrowNext);
            charAttribute.removeEventListener(CharAttribute.UI_BOW_JINJIEHECHENG_CLICK,onComposeBowArrow);
            charAttribute.removeEventListener(CharAttribute.UI_BOW_OPTION_PANEL_DRAG_ENTER,onInstallArrow);
            charAttribute.removeEventListener(CharAttribute.UI_BOW_OPTION_PANEL_STONE_CLICK,onUninstallArrow);
            charAttribute.removeEventListener(CharAttribute.UI_BOWJINJIE_KAISHIJINJIE_CLICK,onStartComposeBowArrow);
            charAttribute.removeEventListener(CharAttribute.UI_BOWJINJIE_ZIDONGJINJIE_CLICK,onAutoComposeBowArrow);
            charAttribute.removeEventListener(CharAttribute.UI_BOW_SHIFOUSHIYONGANQI_CLICK,onUseBowArrow);
            charAttribute.removeEventListener(CharAttribute.UI_BOWJINJIE_CLOSE_CLICK,onComposeBowArrowPanelClose);
            charAttribute.removeEventListener(CharAttribute.UI_BOWJINJIE_GOUMAI_CLICK,onBuyStuff);
            charAttribute.removeEventListener(CharAttribute.UI_GONGJIANYINCANGSHUXING_JIHUO_CLICK,onJihuoBowYincang);
            charAttribute.removeEventListener(CharAttribute.UI_BOWJINJIE_USE_SHENQILONGSHOUJIN_CLICK,useShenQiLongShouJin);
            charAttribute.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveStage);
         });
      }
      
      private function useShenQiLongShouJin(param1:Event) : void
      {
         var e:Event = param1;
         if(this.isShowUseShenQiLongShouJinFAlert)
         {
            FAlert.show(LanResManager.getLanCommonTextWords("神奇龙兽筋：将可以代替龙兽筋免费锻造一次弓箭，有几率锻造成功。只有使用不绑定不限时的龙兽筋才能兑换神奇龙兽筋，每个玩家都将可以无限兑换"),"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  msgSendProxy.send_53035({"isUseShenQiLongShouJin":2});
                  isShowUseShenQiLongShouJinFAlert = false;
               }
            });
         }
         else
         {
            this.msgSendProxy.send_53035({"isUseShenQiLongShouJin":2});
         }
      }
      
      private function onClickBowArrow(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 60)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有60级以上玩家才可以获得弓箭"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有60级以上玩家才可以获得弓箭"));
            return;
         }
         this.charAttribute.showBow();
         this._curtPage = GameInstance.mainCharData.attributeInfo.currentBowLv;
         if(this._curtPage <= 0)
         {
            this._curtPage = 1;
         }
         this.setBuff();
         this.msgSendProxy.send_53031(-1);
      }
      
      private function onSelectBowArrowPrev(param1:BaseEvent) : void
      {
         if(this._curtPage > 1)
         {
            --this._curtPage;
            this.msgSendProxy.send_53031(this._curtPage);
         }
      }
      
      private function onSelectBowArrowNext(param1:BaseEvent) : void
      {
         if(this._curtPage < this._totalPage)
         {
            ++this._curtPage;
            this.msgSendProxy.send_53031(this._curtPage);
         }
      }
      
      private function onComposeBowArrow(param1:BaseEvent) : void
      {
         this._msgSendProxy.send_53033();
         this.charAttribute.setBowZdtsBtnLabel(true);
      }
      
      private function onStartComposeBowArrow(param1:BaseEvent) : void
      {
         var evt:BaseEvent = param1;
         clearTimeout(this._interval);
         this._interval = setTimeout(function():void
         {
            charAttribute.xingyunzhiPlay();
         },3000);
         this.msgSendProxy.send_53035({"isUseShenQiLongShouJin":0});
      }
      
      private function onInstallArrow(param1:BaseEvent) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:ByteArray = null;
         var _loc2_:uint = uint(param1.data);
         if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
         {
            _loc3_ = TCursorManager.currentItemFace;
            if(!_loc3_ || this._curtPage != GameInstance.mainCharData.attributeInfo.currentBowLv)
            {
               return;
            }
            _loc4_ = new ByteArray();
            this.msgSendProxy.send_53037([_loc2_,_loc3_.getBaseItem().position]);
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
            this._curtInstallID = _loc2_;
            this._curtInstallItem = _loc3_;
         }
      }
      
      private function onUninstallArrow(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         this.msgSendProxy.send_53039(_loc2_);
      }
      
      private function onAutoComposeBowArrow(param1:BaseEvent) : void
      {
         var str:String = null;
         var evt:BaseEvent = param1;
         if(evt.data != null && evt.data as Boolean == false)
         {
            this.stopAutoCompose();
            return;
         }
         if(!this._isAutoCmp)
         {
            str = LanResManager.getLanTextWords(this,0,[StaticValue.RED_HTML,StaticValue.BLUE_HTML]);
            FAlert.okLabel = LanResManager.getLanTextWords(this,"开始自动进阶");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  _isAutoCmp = true;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已开始自动提升"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已开始自动提升"),false);
                  if(!_timer)
                  {
                     _timer = new Timer(500);
                  }
                  _timer.addEventListener(TimerEvent.TIMER,onTimer);
                  _timer.start();
                  onTimer();
                  charAttribute.setBowZdtsBtnLabel(false);
               }
            });
         }
         else
         {
            this.stopAutoCompose();
         }
         this.charAttribute.setJinJieBtnEnabled(!this._isAutoCmp);
      }
      
      private function stopAutoCompose() : void
      {
         if(this._isAutoCmp)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已停止自动提升!"),false);
            this._isAutoCmp = false;
         }
         if(this._timer)
         {
            this._timer.stop();
         }
         this.charAttribute.setBowZdtsBtnLabel(true);
      }
      
      private function onComposeBowArrowPanelClose(param1:BaseEvent) : void
      {
         this.stopAutoCompose();
         if(this._timer)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
            this._timer = null;
         }
         this._curtBowArrowCmpInfo = null;
         clearTimeout(this._interval);
      }
      
      private function onUseBowArrow(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         this.msgSendProxy.send_53043(_loc2_);
      }
      
      private function onBuyStuff(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
      
      private function onJihuoBowYincang(param1:BaseEvent) : void
      {
         var goods:Goods;
         var evt:BaseEvent = param1;
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new JiHuoRouShenShuXingPanel();
            this._jiuhoPanel.setGongjianShuxing();
            this._jiuhoPanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               msgSendProxy.send_53049();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SGMJCJ_SHANG,true);
         this._jiuhoPanel.setGoods1(goods);
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.SGMJCJ_XIA,true);
         this._jiuhoPanel.setGoods2(goods);
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
      }
      
      private function onTimer(param1:TimerEvent = null) : void
      {
         this._timer.stop();
         this.msgSendProxy.send_53035({"isUseShenQiLongShouJin":0});
      }
      
      public function setCompsePanelData(param1:BowArrowCmpInfo) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:Boolean = GameInstance.mainCharData.moneyInfo.copper >= param1.coinsCost ? true : false;
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1.stuffID,true);
         if(param1.stuffID == SpecialGoodsID.LONGSHOUJIN_ID)
         {
            _loc3_.count += GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.HUAODONG_LONGSHOUJIN_ID,true);
         }
         var _loc4_:Boolean = _loc3_.count >= param1.stuffCnt ? true : false;
         this.charAttribute.setGoods(_loc3_,_loc4_);
         this.charAttribute.setXingyunzhi(param1.coinsCost,GoodsResManager.getGoodsRes(param1.stuffID).name + "×" + param1.stuffCnt,Math.floor(param1.probability / 100),_loc2_,_loc4_,param1.luckAllCnt);
         this.charAttribute.setRTimeGj(param1.daojishi);
         this.charAttribute.xingyunzhiPlay();
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.GOODS_CHANGED:
               this.setCompsePanelData(this._curtBowArrowCmpInfo);
         }
      }
      
      private function onRemoveStage(param1:Event) : void
      {
         this.charAttribute.removeMc();
      }
      
      public function get curtBowArrowCmpInfo() : BowArrowCmpInfo
      {
         return this._curtBowArrowCmpInfo;
      }
      
      public function set curtBowArrowCmpInfo(param1:BowArrowCmpInfo) : void
      {
         this._curtBowArrowCmpInfo = param1;
      }
      
      private function setBuff() : void
      {
         var _loc1_:Array = [];
         if(GameState.gongneng151)
         {
            _loc1_.push(new Buff(OtherConst.BUFF_BOWARROW_DAN));
         }
         if(GameState.gongneng152)
         {
            _loc1_.push(new Buff(OtherConst.BUFF_BOWARROW_BOOK));
         }
         if(GameState.gongneng155)
         {
            _loc1_.push(new Buff(OtherConst.BUFF_BOWARROW_LEVEL));
         }
         if(GameState.gongneng163)
         {
            _loc1_.push(new Buff(OtherConst.BUFF_BOWARROW_LONGJIN));
         }
         this.charAttribute.setBuff(_loc1_);
      }
      
      public function menuBowToolTip(param1:String) : void
      {
         this.charAttribute.menuBowToolTip(param1);
      }
      
      public function setBowJinduNum(param1:int, param2:Boolean) : void
      {
         this.charAttribute.setBowJinduNum(param1,param2);
      }
   }
}

