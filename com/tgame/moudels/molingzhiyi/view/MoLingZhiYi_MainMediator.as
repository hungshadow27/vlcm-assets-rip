package com.tgame.moudels.molingzhiyi.view
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
   import com.tgame.moudels.molingzhiyi.model.MoLingZhiYi_MsgSenderProxy;
   import com.tgame.moudels.molingzhiyi.model.info.MoLingZhiYiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MoLingZhiYi_MainMediator extends Mediator
   {
      
      public static const NAME:String = "MoLingZhiYi_MainMediator";
      
      public var vo:MoLingZhiYiVO;
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var item:Goods;
      
      private var curZF:int;
      
      private var _msgSenderProxy:MoLingZhiYi_MsgSenderProxy;
      
      public function MoLingZhiYi_MainMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      private function get msgSenderProxy() : MoLingZhiYi_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(MoLingZhiYi_MsgSenderProxy.NAME) as MoLingZhiYi_MsgSenderProxy;
         }
         return this._msgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.MOLINGZHIYI,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_LINGWU_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_HUANYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_HECHENG_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_FEIXING_CLICK,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.MOLINGZHIYI,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_LINGWU_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_HUANYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_HECHENG_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_FEIXING_CLICK,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showMoLingZhiYiLingWuPanel(false);
               break;
            case CharAttribute.MOLINGZHIYI:
               this.msgSenderProxy.send_73581([-1,0]);
               break;
            case CharAttribute.UI_MOLINGZHIYI_LINGWU_SHOW:
               this.msgSenderProxy.send_73583(evt.data);
               break;
            case CharAttribute.UI_MOLINGZHIYI_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.msgSenderProxy.send_73585(1);
               }
               else
               {
                  this.msgSenderProxy.send_73585(0);
               }
               this.mainCharArrtibutePlane.setMoLingZhiYiLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_MOLINGZHIYI_ZIDONGTISHENG_CLICK:
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
                           msgSenderProxy.send_73585(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setMoLingZhiYiLingwuBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = b;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setMoLingZhiYiLingwuBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_MOLINGZHIYI_HUANYE_CLICK:
               this.msgSenderProxy.send_73581([-1,evt.data as int]);
               break;
            case CharAttribute.UI_MOLINGZHIYI_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_MOLINGZHIYI_HECHENG_SHOW:
               PipeManager.sendMsg(PipeConstants.SHOW_YULING_HECHENG_PANEL);
               break;
            case CharAttribute.UI_MOLINGZHIYI_FEIXING_CLICK:
               PipeManager.sendMsg(PipeConstants.UP_DOWN_FEIXING,4);
         }
      }
      
      public function setMoLingZhiYi(param1:MoLingZhiYiVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showMoLingZhiYi();
         this.mainCharArrtibutePlane.setMoLingZhiYiInitialize(param1);
      }
      
      public function setTupoPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showMoLingZhiYiLingWuPanel(true);
         this.mainCharArrtibutePlane.setMoLingZhiYiLingwuInitialize(param1,param2,true,_loc8_.res.name,param4,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0 && param5 > this.curZF)
         {
            _loc10_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setMoLingZhiYiLingwuZhufuzhi(param5,param6,_loc10_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setMoLingZhiYiLingwuGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
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
               msgSenderProxy.send_73585(0);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(300,1);
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
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setMoLingZhiYiLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showMoLingZhiYiLingWuPanel(false);
            this.msgSenderProxy.send_73581([-1,0]);
            this.mainCharArrtibutePlane.MoLingZhiYicomposeSuccess();
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setMoLingZhiYiLingwuBtn(!this.isAuto);
         }
         else
         {
            this.msgSenderProxy.send_73583(this.vo.lookId);
         }
      }
      
      public function upDateTuPoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setMoLingZhiYiLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showMoLingZhiYiLingWuPanel(false);
            this.curZF = 0;
            this.msgSenderProxy.send_73581([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setMoLingZhiYiLingwuBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showMoLingZhiYiLingWuPanel(true);
            this.msgSenderProxy.send_73583(this.vo.lookId);
         }
      }
   }
}

