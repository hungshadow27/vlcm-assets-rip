package com.tgame.moudels.zhenyanshouyin.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.zhenyanshouyin.Zhenyanshouyin_ApplicationFacade;
   import com.tgame.moudels.zhenyanshouyin.model.Zhenyanshouyin_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Zhenyanshouyin_Mediator extends Mediator
   {
      
      public static const NAME:String = "Zhenyanshouyin_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var nowExp1:int = 0;
      
      private var maxExp1:int = 0;
      
      private var preExp:int = 0;
      
      private var _senderProxy:Zhenyanshouyin_MsgSenderProxy;
      
      public function Zhenyanshouyin_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Zhenyanshouyin_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Zhenyanshouyin_MsgSenderProxy.NAME) as Zhenyanshouyin_MsgSenderProxy;
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
         return [Zhenyanshouyin_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Zhenyanshouyin_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isShowWuDuZhenTupoPanel())
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.ZHENYANSHOUYIN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENYANSHOUYIN_PRE_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENYANSHOUYIN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENYANSHOUYIN_ZIDONGTISHENG_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.ZHENYANSHOUYIN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENYANSHOUYIN_PRE_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENYANSHOUYIN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENYANSHOUYIN_ZIDONGTISHENG_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var type:int = 0;
         var page:int = 0;
         var b:Boolean = false;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case CharAttribute.ZHENYANSHOUYIN:
               this.senderProxy.send_73301([-1,0]);
               break;
            case CharAttribute.UI_ZHENYANSHOUYIN_KAISHITISHENG_CLICK:
               type = int(evt.data);
               this.senderProxy.send_73303(type);
               break;
            case CharAttribute.UI_ZHENYANSHOUYIN_PRE_NEXT_CLICK:
               page = int(evt.data);
               this.senderProxy.send_73301([-1,page]);
               break;
            case CharAttribute.UI_ZHENYANSHOUYIN_ZIDONGTISHENG_CLICK:
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
                        isAuto = b;
                        if(isAuto)
                        {
                           senderProxy.send_73303(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setZhenYanShouYinAutoBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = b;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setZhenYanShouYinAutoBtn(!this.isAuto);
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
               senderProxy.send_73303(0);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(500,1);
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
      
      public function setTupoResult(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:int = 0;
         if(this.preExp != 0)
         {
            _loc4_ = param2 - this.preExp;
         }
         this.nowExp1 = param2;
         this.maxExp1 = param3;
         if(param1 == 1)
         {
            if(this.isAuto == true)
            {
               this.isAuto = false;
               this.mainCharArrtibutePlane.setZhenYanShouYinAutoBtn(!this.isAuto);
            }
            this.mainCharArrtibutePlane.bofangZhenyanouyinYanhua();
         }
         else if(param1 == 0)
         {
            if(this.isAuto == true)
            {
               this.autoKnowTimerFun();
            }
         }
         else
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setZhenYanShouYinAutoBtn(!this.isAuto);
         }
         this.mainCharArrtibutePlane.setExp(param2,param3,_loc4_);
         this.preExp = param2;
      }
      
      public function setData(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number, param12:Array) : void
      {
         this.nowExp1 = param5;
         this.maxExp1 = param6;
         this.mainCharArrtibutePlane.showZhenYanShouYin();
         this.mainCharArrtibutePlane.setZhenYanShouYinInit(param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
      }
   }
}

