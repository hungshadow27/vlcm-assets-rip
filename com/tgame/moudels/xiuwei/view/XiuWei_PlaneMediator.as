package com.tgame.moudels.xiuwei.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.xiuwei.XiuWei_ApplicationFacade;
   import com.tgame.moudels.xiuwei.model.XiuWei_MsgSenderProxy;
   import com.tgame.moudels.xiuwei.model.info.XiuWeiVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiuWei_PlaneMediator extends Mediator
   {
      
      public static var lookPlayerID:int;
      
      private static var _xiuweiVO:XiuWeiVo;
      
      public static const NAME:String = "XiuWei_PlaneMediator";
      
      private const ZHAOSHU_MAX:int = 10;
      
      private const ZHAOSHU_MIN:int = 1;
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      public var autoLingwu:Boolean = false;
      
      private var refreshDelayTimer:Timer = new Timer(100);
      
      private var lingwuClickTimer:Timer = new Timer(100,1);
      
      private var _senderProxy:XiuWei_MsgSenderProxy;
      
      public function XiuWei_PlaneMediator()
      {
         super(NAME);
      }
      
      public static function get xiuweiVO() : XiuWeiVo
      {
         if(!_xiuweiVO)
         {
            _xiuweiVO = new XiuWeiVo();
         }
         return _xiuweiVO;
      }
      
      public static function clearVO() : void
      {
         if(_xiuweiVO)
         {
            _xiuweiVO = null;
         }
      }
      
      private function get senderProxy() : XiuWei_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiuWei_MsgSenderProxy.NAME) as XiuWei_MsgSenderProxy;
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
         return [XiuWei_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XiuWei_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.reXiuwei())
               {
                  this.senderProxy.send_55701({
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETXIUWEI,requestXiuWeiInfoHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIUWEI_KAISHITISHENG_CLICKJ,StartLingwuHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIUWEI_ZIDONGTISHENG_CLICKJ,onChuangGuanZidong);
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIUWEI_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIUWEI_GOUMAI_CLICK,onGouMaiClick);
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETXIUWEI,requestXiuWeiInfoHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIUWEI_KAISHITISHENG_CLICKJ,StartLingwuHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIUWEI_ZIDONGTISHENG_CLICKJ,onChuangGuanZidong);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIUWEI_ARROW_CLICK,arrowClickHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIUWEI_GOUMAI_CLICK,onGouMaiClick);
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
         });
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         this.stopAutoLingWu(true);
      }
      
      private function StartLingwuHandler(param1:Event) : void
      {
         if(this.lingwuClickTimer.running)
         {
            return;
         }
         this.stopAutoLingWu();
         var _loc2_:int = XiuWei_PlaneMediator.xiuweiVO.learnedID;
         this.senderProxy.send_55703();
         this.lingwuClickTimer.addEventListener(TimerEvent.TIMER,this.delayTimerHandler);
         this.lingwuClickTimer.start();
      }
      
      private function arrowClickHandler(param1:BaseEvent) : void
      {
         if(this.refreshDelayTimer.running)
         {
            return;
         }
         var _loc2_:int = int(param1.data);
         var _loc3_:int = _loc2_ == 0 ? -1 : 1;
         if(_xiuweiVO.viewID + _loc3_ > this.ZHAOSHU_MAX)
         {
            _xiuweiVO.viewID = this.ZHAOSHU_MAX;
         }
         else if(_xiuweiVO.viewID + _loc3_ < this.ZHAOSHU_MIN)
         {
            _xiuweiVO.viewID = this.ZHAOSHU_MIN;
         }
         else
         {
            _xiuweiVO.viewID += _loc3_;
         }
         this.senderProxy.send_55701({
            "userID":-1,
            "skillID":_xiuweiVO.viewID
         });
      }
      
      private function chuangguanHandler(param1:BaseEvent) : void
      {
         if(_xiuweiVO.viewID > _xiuweiVO.learnedID + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("不能越级领悟"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("不能越级领悟"));
            return;
         }
         if(_xiuweiVO.viewID < _xiuweiVO.learnedID + 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("此关已经领悟"));
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("此关已经领悟"));
            return;
         }
         this.senderProxy.send_55703(_xiuweiVO.viewID);
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.lingwuClickTimer.stop();
         this.lingwuClickTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.delayTimerHandler);
      }
      
      private function requestXiuWeiInfoHandler(param1:Event) : void
      {
         this.senderProxy.send_55701({
            "userID":-1,
            "skillID":0
         });
      }
      
      public function LingWuSucc(param1:int, param2:int) : void
      {
         if(param1 == 2)
         {
            this.mainCharArrtibutePlane.bofangXiuweiYanhua();
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您！您通过顿悟，获得了") + param2 + LanResManager.getLanCommonTextWords("修行值"));
         }
         else if(param1 == 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您！您通过大悟，获得了") + param2 + LanResManager.getLanCommonTextWords("修行值"));
         }
         else
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("获得了") + param2 + LanResManager.getLanCommonTextWords("修行值"));
         }
         this.stopAutoLingWu(false);
         this.senderProxy.send_55701({
            "userID":-1,
            "skillID":0
         });
      }
      
      private function onGouMaiClick(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
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
         this.mainCharArrtibutePlane.setXiuweiBtn(false);
         this.autoLingwu = true;
         this.autoTimerHandler_zd(null);
      }
      
      private function autoTimerHandler_zd(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = XiuWei_PlaneMediator.xiuweiVO.learnedID;
         if(this.autoLingwu)
         {
            this.senderProxy.send_55703(_loc3_ + 1);
         }
         if(_loc2_ < this.xiaohaoNeedNum)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您的道具不足，已停止自动领悟！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您的道具不足，已停止自动领悟！"));
            this.stopAutoLingWu();
         }
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = XiuWei_PlaneMediator.xiuweiVO.learnedID;
         if(_loc2_ < this.xiaohaoNeedNum)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您的道具不足，已停止自动领悟！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您的道具不足，已停止领悟！"));
            this.stopAutoLingWu();
         }
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
         this.mainCharArrtibutePlane.setXiuweiBtn(true);
      }
      
      public function initializeMainUI(param1:XiuWeiVo, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.mainCharArrtibutePlane.showXiuWei();
         this.mainCharArrtibutePlane.setXiuweiInitializeText(param1.dese,param1.viewDesc,param1.addAttack,param1.addDefend,param1.addLifeMax,param1.addNeiliMax,param1.addTiliMax,param6,param1.isSelect,param1.isHuanZhuang);
         var _loc7_:Goods = new Goods(param2);
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2);
         var _loc9_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(param2,true);
         this.mainCharArrtibutePlane.setXiuweiGoods(_loc8_,_loc7_.res.name,param3,_loc9_ > 0);
         this.mainCharArrtibutePlane.setXiuweiJinduNum(param4,param5,-1,-1);
         this.mainCharArrtibutePlane.setXiuweiZhaoShiMsg(param1.viewName,param1.viewID,param1.learnedID);
         this.mainCharArrtibutePlane.setXiuweiDingJiShuXing(param1.isJihuo);
         this.mainCharArrtibutePlane.setXiuWeiJiHuo(GameState.dictMainStatus[40732]);
         this.mainCharArrtibutePlane.setXiuWeiHuanZhuang(param1.isHuanZhuang2);
         var _loc10_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_XIUWEI_BINGJINGHU] != undefined)
         {
            _loc10_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_XIUWEI_BINGJINGHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115YINGXIONGLISHI] != undefined)
         {
            _loc10_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115YINGXIONGLISHI]);
         }
         this.mainCharArrtibutePlane.set_XiuWei(_loc10_);
      }
      
      public function UpdateExp(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         if(param4 == 2)
         {
            this.mainCharArrtibutePlane.bofangXiuweiYanhua();
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您！您通过顿悟，获得了") + param5 + LanResManager.getLanCommonTextWords("修行值"));
         }
         else if(param4 == 1)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("恭喜您！您通过大悟，获得了") + param5 + LanResManager.getLanCommonTextWords("修行值"));
         }
         else
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("获得了") + param5 + LanResManager.getLanCommonTextWords("修行值"));
         }
         this.mainCharArrtibutePlane.setXiuweiJinduNum(param1,param2,param4,param5);
         var _loc6_:Goods = new Goods(this.xiaohaoGoodsId);
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(this.xiaohaoGoodsId);
         param3 = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         this.mainCharArrtibutePlane.setXiuweiGoods(_loc7_,_loc6_.res.name,this.xiaohaoNeedNum,param3 > 0);
      }
   }
}

