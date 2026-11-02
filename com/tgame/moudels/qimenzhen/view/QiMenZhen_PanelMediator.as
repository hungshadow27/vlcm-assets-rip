package com.tgame.moudels.qimenzhen.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.qimenzhen.QiMenZhen_ApplicationFacade;
   import com.tgame.moudels.qimenzhen.model.QiMenZhen_MsgSenderProxy;
   import com.tgame.moudels.qimenzhen.model.info.QiMenZhenVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QiMenZhen_PanelMediator extends Mediator
   {
      
      public static var lookPlayerID:int;
      
      private static var _qimenzhenVO:QiMenZhenVo;
      
      public static const NAME:String = "QiMenZhen_PanelMediator";
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      public var autoLingwu:Boolean = false;
      
      private const ZHAOSHU_MAX:int = 8;
      
      private const ZHAOSHU_MIN:int = 1;
      
      private var string:String = "";
      
      private var refreshDelayTimer:Timer = new Timer(100);
      
      private var lingwuClickTimer:Timer = new Timer(100,1);
      
      private var _senderProxy:QiMenZhen_MsgSenderProxy;
      
      public function QiMenZhen_PanelMediator()
      {
         super(NAME);
      }
      
      public static function get qimenzhenVO() : QiMenZhenVo
      {
         if(!_qimenzhenVO)
         {
            _qimenzhenVO = new QiMenZhenVo();
         }
         return _qimenzhenVO;
      }
      
      private function get senderProxy() : QiMenZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QiMenZhen_MsgSenderProxy.NAME) as QiMenZhen_MsgSenderProxy;
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
         return [QiMenZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case QiMenZhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.reQiMenZhen())
               {
                  this.senderProxy.send_57701({
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETQIMENZHEN,requestQiMenZhenInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QIMENZHEN_KAISHITISHENG_CLICKJ,StartLingwuHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QIMENZHEN_ZIDONGTISHENG_CLICKJ,onChuangGuanZidong);
            mainCharArrtibutePlane.addEventListener(CharAttribute.QIMENZHEN_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.QIMENZHEN_GOUMAI_CLICK,onGouMaiClick);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETQIMENZHEN,requestQiMenZhenInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QIMENZHEN_KAISHITISHENG_CLICKJ,StartLingwuHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QIMENZHEN_ZIDONGTISHENG_CLICKJ,onChuangGuanZidong);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.QIMENZHEN_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.QIMENZHEN_GOUMAI_CLICK,onGouMaiClick);
         });
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         this.stopAutoLingWu(true);
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
         this.mainCharArrtibutePlane.setQiMenZhenBtn(true);
      }
      
      private function autoTimerHandler_zd(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = QiMenZhen_PanelMediator.qimenzhenVO.learnedID;
         if(this.autoLingwu)
         {
            this.senderProxy.send_57703(_loc3_ + 1);
         }
         if(_loc2_ < this.xiaohaoNeedNum)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您的道具不足，已停止自动领悟！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您的道具不足，已停止自动领悟！"));
            this.stopAutoLingWu();
         }
      }
      
      private function requestQiMenZhenInfoHandler(param1:Event) : void
      {
         this.senderProxy.send_57701({
            "userID":-1,
            "skillID":0
         });
      }
      
      private function StartLingwuHandler(param1:Event) : void
      {
         if(this.lingwuClickTimer.running)
         {
            return;
         }
         this.stopAutoLingWu();
         var _loc2_:int = QiMenZhen_PanelMediator.qimenzhenVO.learnedID;
         this.senderProxy.send_57703(_loc2_ + 1);
         this.lingwuClickTimer.addEventListener(TimerEvent.TIMER,this.delayTimerHandler);
         this.lingwuClickTimer.start();
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
         this.mainCharArrtibutePlane.setQiMenZhenBtn(false);
         this.autoLingwu = true;
         this.autoTimerHandler_zd(null);
      }
      
      private function arrowClickHandler(param1:BaseEvent) : void
      {
         if(this.refreshDelayTimer.running)
         {
            return;
         }
         var _loc2_:int = int(param1.data);
         this.senderProxy.send_57701({
            "userID":-1,
            "skillID":_loc2_
         });
      }
      
      private function onGouMaiClick(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
      
      public function initializeMainUI(param1:QiMenZhenVo, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean) : void
      {
         this.mainCharArrtibutePlane.set_QMDJ(GameInstance.mainCharData.attributeInfo.qmStatus);
         this.string = param1.dese;
         this.mainCharArrtibutePlane.showQiMenZhen();
         this.mainCharArrtibutePlane.setQiMenZhenZhaoShiMsg(param1.viewID,param1.learnedID + 1);
         this.mainCharArrtibutePlane.setQiMenZhenInitializeText(param1.dese,param1.addAttack);
         var _loc8_:Goods = new Goods(param2);
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2);
         var _loc10_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param2,true);
         this.mainCharArrtibutePlane.setQiMenZhenGoods(_loc9_,_loc8_.res.name,param3,_loc10_ >= 10);
         this.mainCharArrtibutePlane.setQiMenZhenJinduNum(param4,param5,0,param6,param7);
         this.mainCharArrtibutePlane.setQiMenZhenFanBei(param1.fanBei,param1.qiMenDunJia);
         this.mainCharArrtibutePlane.setZuoQi(param1.isZuoQi,param1.isDanTian,param1.isZuoqi1);
         var _loc11_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QIMENZHEN_CIYUANHU] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QIMENZHEN_CIYUANHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QIMENZHEN_LONGZUZHISHEN] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QIMENZHEN_LONGZUZHISHEN]);
         }
         this.mainCharArrtibutePlane.set_QiMenZhen(_loc11_);
      }
      
      public function LingWuSucc() : void
      {
         this.stopAutoLingWu(false);
         this.senderProxy.send_57701({
            "userID":-1,
            "skillID":0
         });
      }
      
      public function UpdateExp(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean) : void
      {
         if(param1 % 10 == 0)
         {
            this.mainCharArrtibutePlane.bofangQiMenZhenYanhua();
         }
         this.mainCharArrtibutePlane.setQiMenZhenInitializeText(this.string,param4);
         this.mainCharArrtibutePlane.setQiMenZhenJinduNum(param1,param2,param3,param5,param6);
         var _loc7_:Goods = new Goods(this.xiaohaoGoodsId);
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.xiaohaoGoodsId);
         var _loc9_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         this.mainCharArrtibutePlane.setQiMenZhenGoods(_loc8_,_loc7_.res.name,this.xiaohaoNeedNum,_loc9_ >= 10);
      }
   }
}

