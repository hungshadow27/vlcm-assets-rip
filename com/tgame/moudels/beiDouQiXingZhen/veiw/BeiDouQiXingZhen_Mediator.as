package com.tgame.moudels.beiDouQiXingZhen.veiw
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
   import com.tgame.moudels.beiDouQiXingZhen.model.BeiDouQiXingZhen_MsgSenderProxy;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BeiDouQiXingZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "BeiDouQiXingZhen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var curZF:int;
      
      private var index:int = 0;
      
      private var _senderProxy:BeiDouQiXingZhen_MsgSenderProxy;
      
      public function BeiDouQiXingZhen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : BeiDouQiXingZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BeiDouQiXingZhen_MsgSenderProxy.NAME) as BeiDouQiXingZhen_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.BEIDOUQIXINGZHEN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_TUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_KAISHITUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_XUANZHEBTN_CLICKB,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_JINENG_CLICKB,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.BEIDOUQIXINGZHEN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_TUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_KAISHITUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_XUANZHEBTN_CLICKB,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIDOUQIXINGZHEN_JINENG_CLICKB,handler);
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
               this.mainCharArrtibutePlane.showBeiDouTuPoPanel(false);
               break;
            case CharAttribute.BEIDOUQIXINGZHEN:
               this.senderProxy.send_60301([-1,-1]);
               break;
            case CharAttribute.UI_BEIDOUQIXINGZHEN_TUPO_CLICK:
               this.index = evt.data as int;
               this.senderProxy.send_60307(this.index);
               break;
            case CharAttribute.UI_BEIDOUQIXINGZHEN_KAISHITUPO_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_60309([this.index,b]);
               this.mainCharArrtibutePlane.setBeiDouZdtsBtnLabel(!this.isAuto);
               break;
            case CharAttribute.UI_BEIDOUQIXINGZHEN_ZIDONGTUPO_CLICK:
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
                           senderProxy.send_60309([index,false]);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setBeiDouZdtsBtnLabel(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setBeiDouZdtsBtnLabel(!this.isAuto);
               }
               break;
            case CharAttribute.UI_BEIDOUQIXINGZHEN_XUANZHEBTN_CLICKB:
               this.senderProxy.send_60303(evt.data);
               break;
            case CharAttribute.UI_BEIDOUQIXINGZHEN_JINENG_CLICKB:
               this.senderProxy.send_60305(evt.data as Array);
               break;
            case CharAttribute.UI_BEIDOUQIXINGZHEN_GOUMAI_CLICK:
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
               senderProxy.send_60309([index,false]);
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
      
      public function setPanel(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:Boolean, param13:Boolean, param14:Boolean) : void
      {
         this.mainCharArrtibutePlane.showBeiDouQiXing();
         this.mainCharArrtibutePlane.initBeiDouQiXing(true,param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14);
         param3 = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BEIDOUQIXINGZHEN_SHUSHANSHENQI] != undefined)
         {
            param3.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BEIDOUQIXINGZHEN_SHUSHANSHENQI]);
         }
         this.mainCharArrtibutePlane.set_BeiDouQiXingZhen(param3);
      }
      
      public function setSkills(param1:int, param2:Array) : void
      {
         this.mainCharArrtibutePlane.setBeiDouQiXingSkills(param2);
      }
      
      public function setTupoPanel(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true);
         var _loc8_:Boolean = false;
         if(_loc7_.count >= param3)
         {
            _loc8_ = true;
         }
         this.mainCharArrtibutePlane.showBeiDouTuPoPanel(true);
         this.mainCharArrtibutePlane.setBeiDouTupoInit(param1,_loc8_,_loc7_.res.name,param3,_loc8_,param6);
         var _loc9_:int = 0;
         if(this.curZF != 0 && param4 > this.curZF)
         {
            _loc9_ = param4 - this.curZF;
         }
         this.mainCharArrtibutePlane.setBeiDouZhufuzhi(param4,param5,_loc9_);
         this.curZF = param4;
         this.mainCharArrtibutePlane.setBeiDouQiXingGoods(_loc7_,_loc8_);
         this.autoKnowTimerFun();
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setBeiDouZdtsBtnLabel(!this.isAuto);
            this.mainCharArrtibutePlane.showBeiDouTuPoPanel(false);
            this.senderProxy.send_60301([-1,-1]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setBeiDouZdtsBtnLabel(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_60307(this.index);
         }
      }
   }
}

