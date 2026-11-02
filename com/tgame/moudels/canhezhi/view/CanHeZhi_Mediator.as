package com.tgame.moudels.canhezhi.view
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
   import com.tgame.moudels.canhezhi.model.CanHeZhi_MsgSenderProxy;
   import com.tgame.moudels.canhezhi.model.info.CanHeZhiVo;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CanHeZhi_Mediator extends Mediator
   {
      
      public static const NAME:String = "CanHeZhi_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var curZF:int;
      
      private var vo:CanHeZhiVo;
      
      private const MAX_ZHAOSHI_COUNT:int = 7;
      
      private var autoKnowTimer:Timer;
      
      private var _senderProxy:CanHeZhi_MsgSenderProxy;
      
      public function CanHeZhi_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : CanHeZhi_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(CanHeZhi_MsgSenderProxy.NAME) as CanHeZhi_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.CANHEZHI,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANHEZHI_TUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANHEZHI_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANHEZHI_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANHEZHI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANHEZHI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANHEZHI_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.CANHEZHI,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANHEZHI_TUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANHEZHI_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANHEZHI_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANHEZHI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANHEZHI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANHEZHI_GOUMAI_CLICK,handler);
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
               this.mainCharArrtibutePlane.showCanHeZhiTupoPanel(false);
               break;
            case CharAttribute.CANHEZHI:
               this.senderProxy.send_70451([-1,0]);
               break;
            case CharAttribute.UI_CANHEZHI_TUPO_CLICK:
               this.index = evt.data as int;
               this.senderProxy.send_70453(1);
               break;
            case CharAttribute.UI_CANHEZHI_PREVIOUS_CLICK:
               this.senderProxy.send_70451([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_CANHEZHI_NEXT_CLICK:
               this.senderProxy.send_70451([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_CANHEZHI_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_70455(1);
               }
               else
               {
                  this.senderProxy.send_70455(0);
               }
               this.mainCharArrtibutePlane.setTianMenZhenLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_CANHEZHI_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_70455(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setCanHeZhiBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setCanHeZhiBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_CANHEZHI_GOUMAI_CLICK:
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
               senderProxy.send_70455(0);
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
      
      public function setPanel(param1:CanHeZhiVo) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showCanHeZhi();
         this.mainCharArrtibutePlane.setCanHeZhiInit(param1);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CANHEZHI_CANHEWUJUE] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CANHEZHI_CANHEWUJUE]);
         }
         this.mainCharArrtibutePlane.set_CanHeZhi(_loc2_);
      }
      
      public function setTupoPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showCanHeZhiTupoPanel(true);
         this.mainCharArrtibutePlane.setCanHeZhiTupoPanel(param1,param2,_loc9_,_loc8_.res.name,param4,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0 && param5 > this.curZF)
         {
            _loc10_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setCanHeZhiZhufuzhi(param5,param6,_loc10_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setCanHeZhiGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setCanHeZhiBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showCanHeZhiTupoPanel(false);
            this.senderProxy.send_70451([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setCanHeZhiBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_70453(this.index);
         }
      }
   }
}

