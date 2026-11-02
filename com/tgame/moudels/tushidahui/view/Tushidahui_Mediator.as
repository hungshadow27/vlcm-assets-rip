package com.tgame.moudels.tushidahui.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.tushidahui.Tushidahui_ApplicationFacade;
   import com.tgame.moudels.tushidahui.model.Tushidahui_MsgSenderProxy;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiChuangGuanVO;
   import com.tgame.moudels.tushidahui.view.info.TushidahuiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiConst;
   import com.tgame.shell.view.components.attribute.tushidahui.TushidahuiController;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Tushidahui_Mediator extends Mediator
   {
      
      public static const NAME:String = "Tushidahui_Mediator";
      
      private const MAX_ZHAOSHI_COUNT:int = 8;
      
      private var isAuto:Boolean = false;
      
      private var typeZF:int;
      
      private var autoKnowTimer:Timer;
      
      private var vo:TushidahuiVO;
      
      private var _senderProxy:Tushidahui_MsgSenderProxy;
      
      public function Tushidahui_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Tushidahui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Tushidahui_MsgSenderProxy.NAME) as Tushidahui_MsgSenderProxy;
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
         return [Tushidahui_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Tushidahui_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && TushidahuiController.instance.tupoCanvasIsShow && Boolean(this.vo))
               {
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.TUSHIDAHUI,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.UI_TUSHIDAHUI_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.UI_TUSHIDAHUI_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.UI_TUSHIDAHUI_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.UI_TUSHIDAHUI_UPGRADE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.UI_TUSHIDAHUI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.UI_TUSHIDAHUI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(TushidahuiConst.UI_TUSHIDAHUI_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.TUSHIDAHUI,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.UI_TUSHIDAHUI_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.UI_TUSHIDAHUI_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.UI_TUSHIDAHUI_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.UI_TUSHIDAHUI_UPGRADE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.UI_TUSHIDAHUI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.UI_TUSHIDAHUI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(TushidahuiConst.UI_TUSHIDAHUI_GOUMAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
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
               this.mainCharArrtibutePlane.showXiaoYaoYuFengTupoPanel(false);
               break;
            case TushidahuiConst.TUSHIDAHUI:
               this.senderProxy.send_71651([-1,0]);
               break;
            case TushidahuiConst.UI_TUSHIDAHUI_LINGWU_SHOW:
               this.senderProxy.send_71653(this.vo.lookLv);
               break;
            case TushidahuiConst.UI_TUSHIDAHUI_SHANGYIYE_CLICK:
               this.senderProxy.send_71651([-1,this.vo.lookLv - 1 <= 1 ? 1 : this.vo.lookLv - 1]);
               break;
            case TushidahuiConst.UI_TUSHIDAHUI_XIAYIYE_CLICK:
               this.senderProxy.send_71651([-1,this.vo.lookLv + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.lookLv + 1]);
               break;
            case TushidahuiConst.UI_TUSHIDAHUI_KAISHITISHENG_CLICK:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_71657(this.vo.nowLv);
               TushidahuiController.instance.setTupoBtn(!this.isAuto);
               break;
            case TushidahuiConst.UI_TUSHIDAHUI_ZIDONGTISHENG_CLICK:
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
                        TushidahuiController.instance.setTupoBtn(false);
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_71657(vo.nowLv);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  TushidahuiController.instance.setTupoBtn(true);
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  TushidahuiController.instance.showTupoPanel(!this.isAuto);
               }
               break;
            case TushidahuiConst.UI_TUSHIDAHUI_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case TushidahuiConst.UI_TUSHIDAHUI_UPGRADE_CLICK:
               this.senderProxy.send_71655(this.vo.nowLv);
         }
      }
      
      public function upDataPanel(param1:TushidahuiVO) : void
      {
         this.vo = param1;
         TushidahuiController.instance.show();
         TushidahuiController.instance.setInitData(this.vo);
         this.mainCharArrtibutePlane.setYuLiJiHuo(GameState.dictMainStatus[40751]);
      }
      
      public function upDateLV(param1:TushidahuiChuangGuanVO) : void
      {
         var _loc2_:int = 0;
         TushidahuiController.instance.showTupoPanel(true);
         TushidahuiController.instance.setChuangGuanData(param1);
         if(this.typeZF != 0)
         {
            _loc2_ = param1.blessCurt - this.typeZF;
         }
         TushidahuiController.instance.setBless(param1.blessCurt,param1.blessMax,_loc2_);
         this.typeZF = param1.blessCurt;
         this.autoKnowTimerFun();
      }
      
      public function upDateLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            TushidahuiController.instance.setTupoBtn(!this.isAuto);
            TushidahuiController.instance.showTupoPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_71651([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            TushidahuiController.instance.setTupoBtn(!this.isAuto);
         }
         else if(param1 == 0)
         {
            TushidahuiController.instance.showTupoPanel(true);
            this.senderProxy.send_71653(this.vo.lookLv);
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
               senderProxy.send_71657(0);
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
   }
}

