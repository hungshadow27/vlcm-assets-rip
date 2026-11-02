package com.tgame.moudels.guiliuzhen.view
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
   import com.tgame.moudels.guiliuzhen.GuiLiuZhen_ApplicationFacade;
   import com.tgame.moudels.guiliuzhen.model.GuiLiuZhen_MsgSenderProxy;
   import com.tgame.moudels.guiliuzhen.model.info.GuiLiuZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class GuiLiuZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "GuiLiuZhen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:GuiLiuZhenVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 8;
      
      private var _senderProxy:GuiLiuZhen_MsgSenderProxy;
      
      public function GuiLiuZhen_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : GuiLiuZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(GuiLiuZhen_MsgSenderProxy.NAME) as GuiLiuZhen_MsgSenderProxy;
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
         return [GuiLiuZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case GuiLiuZhen_ApplicationFacade.GOODS_CHANGED:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GUILIUZHEN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GUILIUZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GUILIUZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GUILIUZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GUILIUZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GUILIUZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_GUILIUZHEN_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GUILIUZHEN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GUILIUZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GUILIUZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GUILIUZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GUILIUZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GUILIUZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_GUILIUZHEN_GOUMAI_CLICK,handler);
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
               this.mainCharArrtibutePlane.showGuiLiuZhenLingWuPanel(false);
               break;
            case CharAttribute.GUILIUZHEN:
               if(this.vo)
               {
                  this.senderProxy.send_61601([-1,this.vo.nowID + 1]);
               }
               else
               {
                  this.senderProxy.send_61601([-1,0]);
               }
               break;
            case CharAttribute.UI_GUILIUZHEN_LINGWU_SHOW:
               this.senderProxy.send_61603(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_GUILIUZHEN_SHANGYIYE_CLICK:
               this.senderProxy.send_61601([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_GUILIUZHEN_XIAYIYE_CLICK:
               this.senderProxy.send_61601([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_GUILIUZHEN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_61605(1);
               }
               else
               {
                  this.senderProxy.send_61605(0);
               }
               this.mainCharArrtibutePlane.showGuiLiuZhenLingWuPanel(!this.isAuto);
               break;
            case CharAttribute.UI_GUILIUZHEN_ZIDONGTISHENG_CLICK:
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
                        mainCharArrtibutePlane.setGuiLiuZhenLingwuBtn(false);
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_61605(0);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  this.mainCharArrtibutePlane.setGuiLiuZhenLingwuBtn(true);
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.showGuiLiuZhenLingWuPanel(!this.isAuto);
               }
               break;
            case CharAttribute.UI_GUILIUZHEN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
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
               senderProxy.send_61605(0);
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
      
      public function upDataPanel(param1:GuiLiuZhenVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showGuiLiuZhen();
         this.mainCharArrtibutePlane.setGuiLiuZhenInitialize(this.vo);
      }
      
      public function upDateTuPoPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:String) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.setGuiLiuZhenLingwuInitialize(param7,param6,true,_loc8_.res.name,param4,_loc9_,param5);
         if(this.typeZF != 0)
         {
            _loc11_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setGuiLiuZhenLingwuZhufuzhi(param1,param2,_loc11_);
         this.typeZF = param1;
         this.mainCharArrtibutePlane.setGuiLiuZhenLingwuGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function upDateTuPoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setGuiLiuZhenLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showGuiLiuZhenLingWuPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_61601([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setGuiLiuZhenLingwuBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showGuiLiuZhenLingWuPanel(true);
            this.senderProxy.send_61603(this.vo.nowLookingID);
         }
      }
   }
}

