package com.tgame.moudels.wuxingzhen.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.wuxingzhen.WuXingZhen_ApplicationFacade;
   import com.tgame.moudels.wuxingzhen.model.WuXingZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WuXingZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "WuXingZhen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var index:int;
      
      private var grade:int;
      
      private var _senderProxy:WuXingZhen_MsgSenderProxy;
      
      public function WuXingZhen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : WuXingZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WuXingZhen_MsgSenderProxy.NAME) as WuXingZhen_MsgSenderProxy;
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
         return [WuXingZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case WuXingZhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isShowWuXingZhenTupoPanel())
               {
                  this.senderProxy.send_59303([this.index,this.grade]);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETWUXINGZHEN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGZHEN_TUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGZHEN_PRE_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGZHEN_TUPO_CLOSE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXINGZHEN_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETWUXINGZHEN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGZHEN_TUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGZHEN_PRE_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGZHEN_TUPO_CLOSE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXINGZHEN_GOUMAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var arr:Array = null;
         var b:Boolean = false;
         var id:uint = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showWuXingZhenTupo(false);
               break;
            case CharAttribute.GETWUXINGZHEN:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 35)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"很抱歉，只有35级及以上玩家才可以修炼五行阵");
                  NoticeManager.notify(NoticeManager.FOOT,"很抱歉，只有35级及以上玩家才可以修炼五行阵");
               }
               else
               {
                  this.senderProxy.send_59301([-1,-1,-1]);
               }
               break;
            case CharAttribute.UI_WUXINGZHEN_TUPO_CLICK:
               this.mainCharArrtibutePlane.showWuXingZhenTupo(true);
               arr = evt.data as Array;
               this.index = arr[0];
               this.grade = arr[1];
               this.senderProxy.send_59303([this.index,this.grade]);
               break;
            case CharAttribute.UI_WUXINGZHEN_KAISHITISHENG_CLICK:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_59305([this.index,this.grade]);
               this.mainCharArrtibutePlane.setWuXingZhenTupoBtn(!this.isAuto);
               break;
            case CharAttribute.UI_WUXINGZHEN_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_59305([index,grade]);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setWuXingZhenTupoBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setWuXingZhenTupoBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_WUXINGZHEN_PRE_NEXT_CLICK:
               arr = evt.data as Array;
               this.senderProxy.send_59301([-1,arr[0],arr[1]]);
               break;
            case CharAttribute.UI_WUXINGZHEN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_WUXINGZHEN_TUPO_CLOSE:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.mainCharArrtibutePlane.showWuXingZhenTupo(false);
               this.mainCharArrtibutePlane.setWuXingZhenTupoBtn(!this.isAuto);
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
               senderProxy.send_59305([index,grade]);
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
      
      public function setPanel(param1:int, param2:Array, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean, param10:Boolean) : void
      {
         this.index = param1;
         this.mainCharArrtibutePlane.showWuXingZhen();
         this.mainCharArrtibutePlane.setWuXingZhenInit(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.mainCharArrtibutePlane.set_ZhuXunzhang(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         this.mainCharArrtibutePlane.setWuXingZhenJiHuo(GameState.dictMainStatus[40711]);
         var _loc11_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI1] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI1]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI2] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI2]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI3] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI3]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI4] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI4]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI5] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_ZHENQI5]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_BAJIAOSHAN] != undefined)
         {
            _loc11_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_WUXINGZHEN_BAJIAOSHAN]);
         }
         this.mainCharArrtibutePlane.set_WuXingZhen(_loc11_);
      }
      
      public function setGouXuan(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         this.mainCharArrtibutePlane.wuxingzhenGouXuan(param1,param2,param3,param4,param5);
      }
      
      public function setTupoPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = 0) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true);
         this.mainCharArrtibutePlane.setWuXingZhenTuPoPanel(param1,_loc8_,param3,param4,param5,param6,param7);
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.showWuXingZhenTupo(false);
            this.mainCharArrtibutePlane.setWuXingZhenTupoBtn(!this.isAuto);
         }
         else if(param1 == 2)
         {
            this.autoKnowTimerFun();
         }
         else
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setWuXingZhenTupoBtn(!this.isAuto);
         }
      }
   }
}

