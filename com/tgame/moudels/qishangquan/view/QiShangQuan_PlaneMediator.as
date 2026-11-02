package com.tgame.moudels.qishangquan.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.qishangquan.QiShangQuan_ApplicationFacade;
   import com.tgame.moudels.qishangquan.model.QiShangQuan_MsgSenderProxy;
   import com.tgame.moudels.qishangquan.model.info.QiShangQuanVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QiShangQuan_PlaneMediator extends Mediator
   {
      
      public static var lookPlayerID:int;
      
      private static var _qishangVO:QiShangQuanVo;
      
      public static const NAME:String = "QiShangQuan_PlaneMediator";
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      public var autoLingwu:Boolean = false;
      
      private const ZHAOSHU_MAX:int = 9;
      
      private const ZHAOSHU_MIN:int = 1;
      
      private var string:String = "";
      
      private var refreshDelayTimer:Timer = new Timer(100);
      
      private var lingwuClickTimer:Timer = new Timer(100,1);
      
      private var _senderProxy:QiShangQuan_MsgSenderProxy;
      
      public function QiShangQuan_PlaneMediator()
      {
         super(NAME);
      }
      
      public static function get qishangquanVO() : QiShangQuanVo
      {
         if(!_qishangVO)
         {
            _qishangVO = new QiShangQuanVo();
         }
         return _qishangVO;
      }
      
      private function get senderProxy() : QiShangQuan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QiShangQuan_MsgSenderProxy.NAME) as QiShangQuan_MsgSenderProxy;
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
         return [QiShangQuan_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case QiShangQuan_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.reQiShangQuan())
               {
                  this.senderProxy.send_57261({
                     "userID":-1,
                     "skillID":0
                  });
               }
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETQISHANGQUAN,requestXiuWeiInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QISHANGQUAN_KAISHITISHENG_CLICKJ,StartLingwuHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QISHANGQUAN_ZIDONGTISHENG_CLICKJ,onChuangGuanZidong);
            mainCharArrtibutePlane.addEventListener(CharAttribute.QISHANGQUAN_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.QISHANGQUAN_GOUMAI_CLICK,onGouMaiClick);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETQISHANGQUAN,requestXiuWeiInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QISHANGQUAN_KAISHITISHENG_CLICKJ,StartLingwuHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QISHANGQUAN_ZIDONGTISHENG_CLICKJ,onChuangGuanZidong);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.QISHANGQUAN_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.QISHANGQUAN_GOUMAI_CLICK,onGouMaiClick);
         });
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         this.stopAutoLingWu(true);
      }
      
      private function requestXiuWeiInfoHandler(param1:Event) : void
      {
         if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 20)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有20级以上玩家才可以修炼七伤拳"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有20级以上玩家才可以修炼七伤拳"));
         }
         else
         {
            this.senderProxy.send_57261({
               "userID":-1,
               "skillID":0
            });
         }
      }
      
      private function arrowClickHandler(param1:BaseEvent) : void
      {
         if(this.refreshDelayTimer.running)
         {
            return;
         }
         var _loc2_:int = int(param1.data);
         var _loc3_:int = _loc2_ == 0 ? -1 : 1;
         if(_qishangVO.viewID + _loc3_ >= this.ZHAOSHU_MAX)
         {
            _qishangVO.viewID = this.ZHAOSHU_MAX - 1;
         }
         else if(_qishangVO.viewID + _loc3_ < this.ZHAOSHU_MIN)
         {
            _qishangVO.viewID = this.ZHAOSHU_MIN;
         }
         else
         {
            _qishangVO.viewID += _loc3_;
         }
         this.senderProxy.send_57261({
            "userID":-1,
            "skillID":_qishangVO.viewID
         });
      }
      
      private function onGouMaiClick(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
      
      private function StartLingwuHandler(param1:Event) : void
      {
         if(this.lingwuClickTimer.running)
         {
            return;
         }
         this.stopAutoLingWu();
         var _loc2_:int = QiShangQuan_PlaneMediator.qishangquanVO.learnedID;
         this.senderProxy.send_57263(_loc2_ + 1);
         this.lingwuClickTimer.addEventListener(TimerEvent.TIMER,this.delayTimerHandler);
         this.lingwuClickTimer.start();
      }
      
      public function stopAutoLingWu(param1:Boolean = false) : void
      {
         if(param1)
         {
            if(this.refreshDelayTimer.running)
            {
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已停止自动领悟！"));
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已停止自动领悟！"));
            }
         }
         this.refreshDelayTimer.stop();
         this.autoLingwu = false;
         this.refreshDelayTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.autoTimerHandler_zd);
         this.mainCharArrtibutePlane.setQiShangQuanBtn(true);
      }
      
      private function autoTimerHandler_zd(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = QiShangQuan_PlaneMediator.qishangquanVO.learnedID;
         if(this.autoLingwu)
         {
            this.senderProxy.send_57263(_loc3_ + 1);
         }
         if(_loc2_ < this.xiaohaoNeedNum)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您的道具不足，已停止自动领悟！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您的道具不足，已停止自动领悟！"));
            this.stopAutoLingWu();
         }
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.lingwuClickTimer.stop();
         this.lingwuClickTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.delayTimerHandler);
      }
      
      private function onChuangGuanZidong(param1:BaseEvent) : void
      {
         var str:String;
         var e:BaseEvent = param1;
         var isAutoTisheng:Boolean = Boolean(e.data);
         if(!isAutoTisheng)
         {
            this.stopAutoLingWu(true);
            return;
         }
         str = LanResManager.getLanTextWords(Dugujiujian_LingwuPanelMediator,"您希望自动使用背包中的领悟道具领悟本阶招式1",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
         FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动领悟");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               startAutoChuangGuan();
            }
         });
      }
      
      private function startAutoChuangGuan() : void
      {
         if(!this.refreshDelayTimer.running)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已开始自动领悟！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已开始自动领悟！"));
         }
         this.stopAutoLingWu();
         this.autoLingwu = true;
         this.refreshDelayTimer.addEventListener(TimerEvent.TIMER,this.autoTimerHandler_zd);
         this.refreshDelayTimer.start();
         this.mainCharArrtibutePlane.setQiShangQuanBtn(false);
         this.autoLingwu = true;
         this.autoTimerHandler_zd(null);
      }
      
      public function initializeMainUI(param1:QiShangQuanVo, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean) : void
      {
         if(param2 == 0)
         {
            return;
         }
         this.string = param1.dese;
         this.mainCharArrtibutePlane.showQiShangQuan();
         this.mainCharArrtibutePlane.setQiShangQuanInitializeText(param1.dese,param1.addAttack);
         var _loc8_:Goods = new Goods(param2);
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2);
         var _loc10_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param2,true);
         this.mainCharArrtibutePlane.setQiShangQuanGoods(_loc9_,_loc8_.res.name,param3,_loc10_ >= 10);
         this.mainCharArrtibutePlane.setQiShangQuanJinduNum(param4,param5,0,param6,param7);
         this.mainCharArrtibutePlane.setQiShangQuanZhaoShiMsg(param1,param1.viewName,param1.viewID,param1.learnedID + 1);
         this.mainCharArrtibutePlane.setQiShangQuanFanBei(param1.fanBei);
         this.mainCharArrtibutePlane.setQiShangQuanZuoQi(param1.isZuoQi,param1.isDanTian);
      }
      
      public function LingWuSucc() : void
      {
         this.stopAutoLingWu(false);
         this.senderProxy.send_57261({
            "userID":-1,
            "skillID":0
         });
      }
      
      public function UpdateExp(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean) : void
      {
         if(param1 % 10 == 0)
         {
            this.mainCharArrtibutePlane.bofangQiShangQuanYanhua();
         }
         this.mainCharArrtibutePlane.setQiShangQuanInitializeText(this.string,param4);
         this.mainCharArrtibutePlane.setQiShangQuanJinduNum(param1,param2,param3,param5,true);
         var _loc7_:Goods = new Goods(this.xiaohaoGoodsId);
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.xiaohaoGoodsId);
         var _loc9_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         this.mainCharArrtibutePlane.setQiShangQuanGoods(_loc8_,_loc7_.res.name,this.xiaohaoNeedNum,_loc9_ >= 10);
      }
   }
}

