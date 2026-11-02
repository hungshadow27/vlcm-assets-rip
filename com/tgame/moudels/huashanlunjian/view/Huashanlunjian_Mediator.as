package com.tgame.moudels.huashanlunjian.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.huashanlunjian.Huashanlunjian_ApplicationFacade;
   import com.tgame.moudels.huashanlunjian.model.Huashanlunjian_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Huashanlunjian_Mediator extends Mediator
   {
      
      public static const NAME:String = "Huashanlunjian_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var lID:int = 1;
      
      private var nID:int = 1;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 6;
      
      private var _senderProxy:Huashanlunjian_MsgSenderProxy;
      
      public function Huashanlunjian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Huashanlunjian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Huashanlunjian_MsgSenderProxy.NAME) as Huashanlunjian_MsgSenderProxy;
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
         return [Huashanlunjian_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Huashanlunjian_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isHeYiZhentupoCanvasShow())
               {
                  this.senderProxy.send_74423(this.lID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.HUASHANLUNJIAN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HUASHANLUNJIAN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HUASHANLUNJIAN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HUASHANLUNJIAN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HUASHANLUNJIAN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HUASHANLUNJIAN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HUASHANLUNJIAN_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.HUASHANLUNJIAN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HUASHANLUNJIAN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HUASHANLUNJIAN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HUASHANLUNJIAN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HUASHANLUNJIAN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HUASHANLUNJIAN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HUASHANLUNJIAN_GOUMAI_CLICK,handler);
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
               if(this.mainCharArrtibutePlane.huashanlunjianTupoShow())
               {
                  this.mainCharArrtibutePlane.showHuashanlunjianTupoPanel(false);
               }
               break;
            case CharAttribute.HUASHANLUNJIAN:
               this.senderProxy.send_74421([-1,0]);
               break;
            case CharAttribute.UI_HUASHANLUNJIAN_LINGWU_SHOW:
               this.senderProxy.send_74423(this.lID);
               break;
            case CharAttribute.UI_HUASHANLUNJIAN_SHANGYIYE_CLICK:
               this.senderProxy.send_74421([-1,this.lID - 1 <= 1 ? 1 : this.lID - 1]);
               break;
            case CharAttribute.UI_HUASHANLUNJIAN_XIAYIYE_CLICK:
               this.senderProxy.send_74421([-1,this.lID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.lID + 1]);
               break;
            case CharAttribute.UI_HUASHANLUNJIAN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_74425(1);
               }
               else
               {
                  this.senderProxy.send_74425(0);
               }
               this.mainCharArrtibutePlane.setHeYiZhenLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_HUASHANLUNJIAN_ZIDONGTISHENG_CLICK:
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
                        mainCharArrtibutePlane.setHuashanlunjianBtn(false);
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_74425(0);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  this.mainCharArrtibutePlane.setHuashanlunjianBtn(true);
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.showHuashanlunjianTupoPanel(!this.isAuto);
               }
               break;
            case CharAttribute.UI_HUASHANLUNJIAN_GOUMAI_CLICK:
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
               senderProxy.send_74425(0);
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
      
      public function setInit(param1:Object, param2:int, param3:int, param4:String, param5:String, param6:String) : void
      {
         this.lID = param2;
         this.nID = param3;
         GameInstance.uiInstance.charAttribute.showHuaShanLunJian();
         this.mainCharArrtibutePlane.setHuashanlunjianInit(-1,param1,param2,param3,param4,param5,param6);
         var _loc7_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_HUASHANLUNJIAN_NIYAN] != undefined)
         {
            _loc7_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_HUASHANLUNJIAN_NIYAN]);
         }
         this.mainCharArrtibutePlane.set_HuaShanLunJian(_loc7_);
      }
      
      public function upDateLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:String) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         this.mainCharArrtibutePlane.showHuashanlunjianTupoPanel(true);
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.settHuashanlunjianTupoPanel(param7,param6,true,_loc8_.res.name,param4,_loc9_,param5);
         if(this.typeZF != 0)
         {
            _loc11_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.settHuashanlunjianZhufuzhi(param1,param2,_loc11_);
         this.typeZF = param1;
         this.mainCharArrtibutePlane.settHuashanlunjianGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function upDateLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setHuashanlunjianBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showHuashanlunjianTupoPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_74421([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setHuashanlunjianBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showHuashanlunjianTupoPanel(true);
            this.senderProxy.send_74423(this.lID);
         }
      }
   }
}

