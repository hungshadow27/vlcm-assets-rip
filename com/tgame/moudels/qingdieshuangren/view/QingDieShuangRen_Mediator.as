package com.tgame.moudels.qingdieshuangren.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.qingdieshuangren.QingDieShuangRen_ApplicationFacade;
   import com.tgame.moudels.qingdieshuangren.model.QingDieShuangRen_MsgSenderProxy;
   import com.tgame.moudels.qingdieshuangren.model.info.QingDieShuangRenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QingDieShuangRen_Mediator extends Mediator
   {
      
      public static const NAME:String = "QingDieShuangRen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:QingDieShuangRenVO;
      
      private var autoKnowTimer:Timer;
      
      private var curZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 5;
      
      private var _senderProxy:QingDieShuangRen_MsgSenderProxy;
      
      public function QingDieShuangRen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : QingDieShuangRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QingDieShuangRen_MsgSenderProxy.NAME) as QingDieShuangRen_MsgSenderProxy;
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
         return [QingDieShuangRen_ApplicationFacade.GOODS_CHANGED,QingDieShuangRen_ApplicationFacade.ZHANLI_200ZHUANGBEI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case QingDieShuangRen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isQingDieShuangRenTuPoShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_79533(this.vo.nowLookingID);
               }
               break;
            case QingDieShuangRen_ApplicationFacade.ZHANLI_200ZHUANGBEI:
               this.senderProxy.send_79189(_loc2_ as Array);
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETQINGDIESHUANGREN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINGDIESHUANGREN_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINGDIESHUANGREN_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINGDIESHUANGREN_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINGDIESHUANGREN_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINGDIESHUANGREN_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINGDIESHUANGREN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGBAOJIA_HUANZHUANG_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETQINGDIESHUANGREN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINGDIESHUANGREN_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINGDIESHUANGREN_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINGDIESHUANGREN_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINGDIESHUANGREN_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINGDIESHUANGREN_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINGDIESHUANGREN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGBAOJIA_HUANZHUANG_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var Arr:Array = null;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showQingDieShuangRenTuPoPanel(false);
               break;
            case CharAttribute.GETQINGDIESHUANGREN:
               this.senderProxy.send_79531([-1,0]);
               break;
            case CharAttribute.UI_QINGDIESHUANGREN_XIULIAN_CLICK:
               this.senderProxy.send_79533(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_QINGDIESHUANGREN_PREVIOUS_CLICK:
               this.senderProxy.send_79531([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_QINGDIESHUANGREN_NEXT_CLICK:
               this.senderProxy.send_79531([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_QINGDIESHUANGREN_KAISHITISHENG_CLICKJ:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_79535(-1);
               }
               else
               {
                  this.senderProxy.send_79535(this.vo.nowID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowID);
               }
               this.mainCharArrtibutePlane.setQingDieShuangRenBtn(!this.isAuto);
               break;
            case CharAttribute.UI_QINGDIESHUANGREN_ZIDONGTISHENG_CLICKJ:
               b = evt.data as Boolean;
               if(b)
               {
                  str = LanResManager.getLanTextWords(Dugujiujian_LingwuPanelMediator,"您希望自动使用背包中的领悟道具领悟本阶招式1",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动领悟");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_79535(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setQingDieShuangRenBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setQingDieShuangRenBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_QINGDIESHUANGREN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_WUXINGBAOJIA_HUANZHUANG_CLICK:
               Arr = evt.data as Array;
               this.senderProxy.send_79189(Arr);
         }
      }
      
      private function autoKnowTimerFun() : void
      {
         var fun:Function = null;
         fun = function(param1:TimerEvent):void
         {
            autoKnowTimer.removeEventListener(TimerEvent.TIMER,fun);
            autoKnowTimer = null;
            if(isAuto)
            {
               senderProxy.send_79535(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(700,1);
            this.autoKnowTimer.start();
            this.autoKnowTimer.addEventListener(TimerEvent.TIMER,fun);
         }
         else
         {
            if(!this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer.stop();
            this.autoKnowTimer.removeEventListener(TimerEvent.TIMER,fun);
            this.autoKnowTimer = null;
         }
      }
      
      public function upDataQingDieShuangRenPanel(param1:QingDieShuangRenVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showQingDieShuangRen();
         this.mainCharArrtibutePlane.initializateQingDieShuangRen(this.vo);
      }
      
      public function upDataLingWuPanel(param1:String, param2:String, param3:int, param4:int, param5:String, param6:int, param7:int, param8:int) : void
      {
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param6,true);
         var _loc10_:Boolean = false;
         if(_loc9_.count >= param7)
         {
            _loc10_ = true;
         }
         this.mainCharArrtibutePlane.showQingDieShuangRenTuPoPanel(true);
         this.mainCharArrtibutePlane.setQingDieShuangRenTuPo(param5,true,_loc9_.res.name,param7,_loc10_,param8);
         var _loc11_:int = 0;
         if(this.curZF != 0)
         {
            _loc11_ = param3 - this.curZF;
         }
         this.mainCharArrtibutePlane.setQingDieShuangRenZhufuzhi(param3,param4,_loc11_);
         this.curZF = param3;
         this.mainCharArrtibutePlane.setQingDieShuangRenGoods(_loc9_,_loc10_);
         this.autoKnowTimerFun();
      }
      
      public function upDataQingDieShuangRenLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setQingDieShuangRenBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showQingDieShuangRenTuPoPanel(false);
            this.senderProxy.send_79531([-1,0]);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setQingDieShuangRenBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_79533(this.vo.nowLookingID);
         }
      }
   }
}

