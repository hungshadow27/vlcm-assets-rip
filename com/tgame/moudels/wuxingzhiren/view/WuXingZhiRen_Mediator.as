package com.tgame.moudels.wuxingzhiren.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.Menu;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxingzhiren.model.WuXingZhiRen_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.attribute.WuXingZhiRenJiHuoPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WuXingZhiRen_Mediator extends Mediator
   {
      
      public static const NAME:String = "WuXingZhiRen_Mediator";
      
      private var arrWuXing:Array = new Array();
      
      private var kd:int;
      
      public var no:int = 0;
      
      private var timer:Timer;
      
      private var timerNum:Number;
      
      private var _menu:Menu;
      
      private var _menuItem:Array = [LanResManager.getLanCommonTextWords("卸下")];
      
      private var _selectGoodsID:int = 0;
      
      private var _selectEvt:MouseEvent;
      
      private var _jiuhoPanel:WuXingZhiRenJiHuoPanel;
      
      private var _senderProxy:WuXingZhiRen_MsgSenderProxy;
      
      public function WuXingZhiRen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : WuXingZhiRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WuXingZhiRen_MsgSenderProxy.NAME) as WuXingZhiRen_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUXINGZHIREN,requestWuXingZhiRenInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXING_JIHUO_CLICK,requestWuXingZhiRenJiHuoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXING_USE_CLICK,requestWuXingZhiRenUseHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXING_QIEHUAN_CLICK,requestBtnHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGZHIREN_PANEL_SHOW_MENU,showMenuHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUXINGZHIREN,requestWuXingZhiRenInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXING_JIHUO_CLICK,requestWuXingZhiRenJiHuoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXING_USE_CLICK,requestWuXingZhiRenUseHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXING_QIEHUAN_CLICK,requestBtnHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGZHIREN_PANEL_SHOW_MENU,showMenuHandler);
         });
      }
      
      private function showMenuHandler(param1:Event) : void
      {
         var _loc2_:Object = (param1 as BaseEvent).data;
         this._selectGoodsID = _loc2_[0] as int;
         this._selectEvt = _loc2_[1] as MouseEvent;
         if(this._menu != null)
         {
            this._menu.removeEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
            this._menu.destroy();
         }
         this._menu = Menu.addMenuItem(this._menuItem,this._selectEvt);
         this._menu.addEventListener(Menu.MENUITEM_CLICK,this.onItemMenuClick);
      }
      
      public function onItemMenuClick(param1:BaseEvent) : void
      {
         var _loc2_:String = param1.data.toString();
         switch(_loc2_)
         {
            case LanResManager.getLanCommonTextWords("卸下"):
         }
      }
      
      private function requestWuXingZhiRenInfoHandler(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 70)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有70级及以上玩家才可以修炼五行之刃"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有70级及以上玩家才可以修炼五行之刃"));
         }
         else
         {
            this.senderProxy.send_55521();
         }
      }
      
      private function requestWuXingZhiRenJiHuoHandler(param1:BaseEvent) : void
      {
         var go:Goods;
         var g:Goods;
         var e:BaseEvent = param1;
         this.no = int(e.data);
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new WuXingZhiRenJiHuoPanel();
            this._jiuhoPanel.setWuXingZhiRenJiHuo();
            this._jiuhoPanel.addEventListener(WuXingZhiRenJiHuoPanel.UI_JIHUOWUXINGZHIREN_CLICK,function(param1:Event):void
            {
               senderProxy.send_55523(no);
            });
         }
         go = this.arrWuXing[this.no - 1].go;
         g = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(go.id,true);
         this._jiuhoPanel.setGoods3(g);
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
      }
      
      private function requestWuXingZhiRenUseHandler(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         this.senderProxy.send_55525(_loc2_);
      }
      
      private function requestBtnHandler(param1:BaseEvent) : void
      {
         var _loc2_:int = int(param1.data);
         if(this.timerNum > 0)
         {
            if(this.kd != _loc2_)
            {
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您目前不能切换五行，距离下一次可以切换的时间还有") + (Math.floor(this.timerNum / 60) + LanResManager.getLanCommonTextWords("分") + Math.floor(this.timerNum % 60) + LanResManager.getLanCommonTextWords("秒")));
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您目前不能切换五行，距离下一次可以切换的时间还有") + (Math.floor(this.timerNum / 60) + LanResManager.getLanCommonTextWords("分") + Math.floor(this.timerNum % 60) + LanResManager.getLanCommonTextWords("秒")));
            }
         }
         else if(this.kd != _loc2_)
         {
            this.mainCharArrtibutePlane.showKaiQiTiShi(_loc2_);
         }
      }
      
      public function updateWuXingZhiRenPanel(param1:Array, param2:String, param3:int, param4:int, param5:Boolean, param6:int, param7:Boolean) : void
      {
         this.arrWuXing = param1;
         this.kd = param4;
         this.mainCharArrtibutePlane.setYunInitializeWuXingZhiRen(this.arrWuXing,param2,param4,param6,param7);
         this.mainCharArrtibutePlane.WuXingZhiRenShow(param5);
         this.mainCharArrtibutePlane.showWuXingZhiRen();
         this.setTimer(param3);
         this.mainCharArrtibutePlane.set_WuXingZhiRen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         var _loc8_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHIREN_WUXINGZHUANLUN] != undefined)
         {
            _loc8_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHIREN_WUXINGZHUANLUN]);
         }
         this.mainCharArrtibutePlane.showWuXingZhiRen(_loc8_);
         _loc8_ = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_DAGOUBANG_WUXINGZHIREN] != undefined)
         {
            _loc8_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_DAGOUBANG_WUXINGZHIREN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHUNYANGXUANGONG_WUXINGZHIREN] != undefined)
         {
            _loc8_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHUNYANGXUANGONG_WUXINGZHIREN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TANZHISHENTONG_WUXINGZHIREN] != undefined)
         {
            _loc8_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TANZHISHENTONG_WUXINGZHIREN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_HAMAGONG_WUXINGZHIREN] != undefined)
         {
            _loc8_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_HAMAGONG_WUXINGZHIREN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIYANGZHI_WUXINGZHIREN] != undefined)
         {
            _loc8_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIYANGZHI_WUXINGZHIREN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_KONGMINGQUAN_WUXINGZHIREN] != undefined)
         {
            _loc8_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_KONGMINGQUAN_WUXINGZHIREN]);
         }
         this.mainCharArrtibutePlane.setZhuangbei2(_loc8_);
      }
      
      public function isHuanZhuang(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.wuxingzhirenHZ(param1);
      }
      
      public function setTimer(param1:int) : void
      {
         this.timerNum = param1 / 1000;
         if(this.timerNum > 0)
         {
            if(this.timer)
            {
               this.timer.reset();
               this.timer.start();
            }
            else
            {
               this.timer = new Timer(1000);
               this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               this.timer.start();
            }
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         --this.timerNum;
         if(this.timerNum <= 0)
         {
            this.timer.stop();
            this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this.timer = null;
         }
         this.mainCharArrtibutePlane.setWuXingTimerText(this.timerNum);
      }
      
      public function refillWuXingZhiRenData(param1:int) : void
      {
         this.senderProxy.send_55521();
      }
      
      public function qhWuXingZhiRenData(param1:int) : void
      {
         if(param1 == 1)
         {
            this.senderProxy.send_55521();
         }
      }
      
      public function showCharAttribute_wuxingzhiren() : void
      {
         this.mainCharArrtibutePlane.set_WuXingZhiRen(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
      }
   }
}

