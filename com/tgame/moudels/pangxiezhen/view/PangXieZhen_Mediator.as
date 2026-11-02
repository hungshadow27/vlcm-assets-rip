package com.tgame.moudels.pangxiezhen.view
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
   import com.tgame.moudels.pangxiezhen.PangXieZhen_ApplicationFacade;
   import com.tgame.moudels.pangxiezhen.model.PangXieZhen_MsgSenderProxy;
   import com.tgame.moudels.pangxiezhen.model.info.PangXieZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PangXieZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "PangXieZhen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:PangXieZhenVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 8;
      
      private var _senderProxy:PangXieZhen_MsgSenderProxy;
      
      public function PangXieZhen_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : PangXieZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(PangXieZhen_MsgSenderProxy.NAME) as PangXieZhen_MsgSenderProxy;
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
         return [PangXieZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case PangXieZhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isPangXieZhentupoCanvasShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_71253(this.vo.lookID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.PANGXIEZHEN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_BUZHEN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_PANGXIEZHEN_XIANSHI_CHECK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.PANGXIEZHEN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_BUZHEN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_PANGXIEZHEN_XIANSHI_CHECK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var isSelect:Boolean = false;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showXiaoYaoYuFengTupoPanel(false);
               break;
            case CharAttribute.PANGXIEZHEN:
               this.senderProxy.send_71251([-1,0]);
               break;
            case CharAttribute.UI_PANGXIEZHEN_LINGWU_SHOW:
               this.senderProxy.send_71253(this.vo.lookID);
               break;
            case CharAttribute.UI_PANGXIEZHEN_SHANGYIYE_CLICK:
               this.senderProxy.send_71251([-1,this.vo.lookID - 1 <= 1 ? 1 : this.vo.lookID - 1]);
               break;
            case CharAttribute.UI_PANGXIEZHEN_XIAYIYE_CLICK:
               this.senderProxy.send_71251([-1,this.vo.lookID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.lookID + 1]);
               break;
            case CharAttribute.UI_PANGXIEZHEN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_71255(1);
               }
               else
               {
                  this.senderProxy.send_71255(0);
               }
               this.mainCharArrtibutePlane.setPangXieZhenLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_PANGXIEZHEN_ZIDONGTISHENG_CLICK:
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
                        mainCharArrtibutePlane.setPangXieZhenLingwuBtn(false);
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_71255(0);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  this.mainCharArrtibutePlane.setPangXieZhenLingwuBtn(true);
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.showPangXieZhenLingWuPanel(!this.isAuto);
               }
               break;
            case CharAttribute.UI_PANGXIEZHEN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_PANGXIEZHEN_BUZHEN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_BUZHEN_PANEL,10);
               break;
            case CharAttribute.UI_PANGXIEZHEN_XIANSHI_CHECK:
               isSelect = evt.data as Boolean;
               if(isSelect)
               {
                  this.senderProxy.send_71257(1);
               }
               else
               {
                  this.senderProxy.send_71257(0);
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
               senderProxy.send_71255(0);
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
      
      public function upDataPanel(param1:PangXieZhenVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showPangXieZhen();
         this.mainCharArrtibutePlane.setPangXieZhenInitialize(this.vo);
      }
      
      public function upDateLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:String, param8:int, param9:int) : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         this.mainCharArrtibutePlane.showPangXieZhenLingWuPanel(true);
         var _loc10_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc11_:Boolean = false;
         if(_loc10_.count >= param4)
         {
            _loc11_ = true;
         }
         this.mainCharArrtibutePlane.setPangXieZhenLingwuInitialize(param6,true,_loc10_.res.name,param4,_loc11_,param5,param8,param9);
         if(this.typeZF != 0)
         {
            _loc13_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setPangXieZhenLingwuZhufuzhi(param1,param2,_loc13_);
         this.typeZF = param1;
         this.mainCharArrtibutePlane.setPangXieZhenLingwuGoods(_loc10_,_loc11_);
         this.autoKnowTimerFun();
      }
      
      public function upDateLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setPangXieZhenLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showPangXieZhenLingWuPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_71251([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setPangXieZhenLingwuBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showPangXieZhenLingWuPanel(true);
            this.senderProxy.send_71253(this.vo.lookID);
         }
      }
   }
}

