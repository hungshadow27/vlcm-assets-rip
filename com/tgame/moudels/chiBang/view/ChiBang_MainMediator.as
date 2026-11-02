package com.tgame.moudels.chiBang.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.chiBang.model.ChiBang_MsgSenderProxy;
   import com.tgame.moudels.chiBang.model.info.ChiBangVo;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChiBang_MainMediator extends Mediator
   {
      
      public static const NAME:String = "ChiBang_MainMediator";
      
      public var vo:ChiBangVo;
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var item:Goods;
      
      private var curZF:int;
      
      private var _msgSenderProxy:ChiBang_MsgSenderProxy;
      
      public function ChiBang_MainMediator()
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
      
      private function get msgSenderProxy() : ChiBang_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ChiBang_MsgSenderProxy.NAME) as ChiBang_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.CHIBANG,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_LINGWU_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_HUANYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_HECHENG_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_FEIXING_CLICK,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.CHIBANG,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_LINGWU_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_HUANYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_HECHENG_SHOW,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_FEIXING_CLICK,mainCharArrtibutePlaneHandle);
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
               this.mainCharArrtibutePlane.showChiBangLingWuPanel(false);
               break;
            case CharAttribute.CHIBANG:
               this.msgSenderProxy.send_61701([-1,0]);
               break;
            case CharAttribute.UI_CHIBANG_LINGWU_SHOW:
               this.msgSenderProxy.send_61703(evt.data);
               break;
            case CharAttribute.UI_CHIBANG_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.msgSenderProxy.send_61705(1);
               }
               else
               {
                  this.msgSenderProxy.send_61705(0);
               }
               this.mainCharArrtibutePlane.setChiBangLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_CHIBANG_ZIDONGTISHENG_CLICK:
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
                           msgSenderProxy.send_61705(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setChiBangLingwuBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = b;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setChiBangLingwuBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_CHIBANG_HUANYE_CLICK:
               this.msgSenderProxy.send_61701([-1,evt.data as int]);
               break;
            case CharAttribute.UI_CHIBANG_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_CHIBANG_HECHENG_SHOW:
               PipeManager.sendMsg(PipeConstants.SHOW_YULING_HECHENG_PANEL);
               break;
            case CharAttribute.UI_CHIBANG_FEIXING_CLICK:
               PipeManager.sendMsg(PipeConstants.UP_DOWN_FEIXING,1);
         }
      }
      
      public function setChiBang(param1:ChiBangVo) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showChibang();
         this.mainCharArrtibutePlane.setChiBangInitialize(param1);
         this.mainCharArrtibutePlane.setChiBangJiHuo(GameState.dictMainStatus[40702]);
      }
      
      public function setTupoPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showChiBangLingWuPanel(true);
         this.mainCharArrtibutePlane.setChiBangLingwuInitialize(param1,param2,true,_loc8_.res.name,param4,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0 && param5 > this.curZF)
         {
            _loc10_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setChiBangLingwuZhufuzhi(param5,param6,_loc10_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setChiBangLingwuGoods(_loc8_,_loc9_);
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
               msgSenderProxy.send_61705(0);
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
            this.mainCharArrtibutePlane.setChiBangLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showChiBangLingWuPanel(false);
            this.msgSenderProxy.send_61701([-1,0]);
            this.mainCharArrtibutePlane.composeSuccess();
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setChiBangLingwuBtn(!this.isAuto);
         }
         else
         {
            this.msgSenderProxy.send_61703(this.vo.lookId);
         }
      }
      
      public function upDateTuPoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setChiBangLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showChiBangLingWuPanel(false);
            this.curZF = 0;
            this.msgSenderProxy.send_61701([-1,0]);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setChiBangLingwuBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showChiBangLingWuPanel(true);
            this.msgSenderProxy.send_61703(this.vo.lookId);
         }
      }
   }
}

