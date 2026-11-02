package com.tgame.moudels.wuduzhen.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.wuduzhen.WuDuZhen_ApplicationFacade;
   import com.tgame.moudels.wuduzhen.model.WuDuZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WuDuZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "WuDuZhen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var index:int;
      
      private var grade:int;
      
      private var curZF:int;
      
      private var _senderProxy:WuDuZhen_MsgSenderProxy;
      
      public function WuDuZhen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : WuDuZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WuDuZhen_MsgSenderProxy.NAME) as WuDuZhen_MsgSenderProxy;
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
         return [WuDuZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case WuDuZhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isShowWuDuZhenTupoPanel())
               {
                  this.senderProxy.send_72023([this.index,this.grade]);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUDUZHEN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDUZHEN_TUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDUZHEN_PRE_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDUZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDUZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDUZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDUZHEN_SIWANGXUANYAN_SKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUDUZHEN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDUZHEN_TUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDUZHEN_PRE_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDUZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDUZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDUZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDUZHEN_SIWANGXUANYAN_SKILL_DRAG,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var arr:Array = null;
         var b:Boolean = false;
         var id:uint = 0;
         var itemFace:ItemFace = null;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showWuDuZhenTupo(false);
               break;
            case CharAttribute.WUDUZHEN:
               this.senderProxy.send_72021([-1,-1,-1]);
               break;
            case CharAttribute.UI_WUDUZHEN_TUPO_CLICK:
               this.mainCharArrtibutePlane.showWuDuZhenTupo(true);
               arr = evt.data as Array;
               this.index = arr[0];
               this.grade = arr[1];
               this.senderProxy.send_72023([this.index,this.grade]);
               break;
            case CharAttribute.UI_WUDUZHEN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_72025([this.index,1]);
               }
               else
               {
                  this.senderProxy.send_72025([this.index,0]);
               }
               this.mainCharArrtibutePlane.setWuDuZhenTupoBtn(!this.isAuto);
               break;
            case CharAttribute.UI_WUDUZHEN_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_72025([index,0]);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setWuDuZhenTupoBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setWuDuZhenTupoBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_WUDUZHEN_PRE_NEXT_CLICK:
               arr = evt.data as Array;
               this.senderProxy.send_72021([-1,arr[0],arr[1]]);
               break;
            case CharAttribute.UI_WUDUZHEN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_WUDUZHEN_SIWANGXUANYAN_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
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
               senderProxy.send_72025([index,0]);
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
      
      public function setPanel(param1:int, param2:Array, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:int, param9:Boolean, param10:int, param11:Boolean, param12:Boolean, param13:Boolean) : void
      {
         this.index = param1;
         this.mainCharArrtibutePlane.showWuDuZhen();
         this.mainCharArrtibutePlane.setWuDuZhenInit(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setTupoPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true);
         var _loc8_:int = 0;
         if(this.curZF != 0 && param4 > this.curZF)
         {
            _loc8_ = param4 - this.curZF;
         }
         this.mainCharArrtibutePlane.setWuDuZhenTuPoPanel(param1,_loc7_,param3,param4,param5,param6,_loc8_);
         this.curZF = param4;
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.showWuDuZhenTupo(false);
            this.mainCharArrtibutePlane.setWuDuZhenTupoBtn(!this.isAuto);
         }
         else if(param1 == 2)
         {
            this.autoKnowTimerFun();
         }
         else
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setWuDuZhenTupoBtn(!this.isAuto);
         }
      }
   }
}

