package com.tgame.moudels.langhundun.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.langhundun.model.LangHunDun_MsgSenderProxy;
   import com.tgame.moudels.langhundun.model.info.LangHunDunVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class LangHunDun_Mediator extends Mediator
   {
      
      public static const NAME:String = "LangHunDun_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var curZF:int;
      
      private var vo:LangHunDunVO;
      
      private var autoKnowTimer:Timer;
      
      private var _senderProxy:LangHunDun_MsgSenderProxy;
      
      public function LangHunDun_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : LangHunDun_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(LangHunDun_MsgSenderProxy.NAME) as LangHunDun_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.LANGHUNDUN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LANGHUNDUN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LANGHUNDUN_ZIDONGTISHENG_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.LANGHUNDUN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LANGHUNDUN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LANGHUNDUN_ZIDONGTISHENG_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.LANGHUNDUN:
               this.senderProxy.send_72491([-1,0]);
               break;
            case CharAttribute.UI_LANGHUNDUN_KAISHITISHENG_CLICK:
               this.senderProxy.send_72493();
               break;
            case CharAttribute.UI_LANGHUNDUN_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_72493();
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setLangHunDunBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setLangHunDunBtn(!this.isAuto);
               }
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
               senderProxy.send_72493();
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
      
      public function setPanel(param1:LangHunDunVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showLangHunDun();
         this.mainCharArrtibutePlane.setLangHunDunInit(param1);
         this.setTupoPanel(param1.nowZhufuzhi,param1.maxZhufuzhi);
      }
      
      public function setTupoPanel(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(this.curZF != 0 && param1 > this.curZF)
         {
            _loc3_ = param1 - this.curZF;
         }
         this.mainCharArrtibutePlane.setLangHunDunZhufuzhi(param1,param2,_loc3_);
         this.curZF = param1;
         this.autoKnowTimerFun();
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setLangHunDunBtn(!this.isAuto);
            this.senderProxy.send_72491([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setLangHunDunBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_72491([-1,0]);
         }
      }
   }
}

