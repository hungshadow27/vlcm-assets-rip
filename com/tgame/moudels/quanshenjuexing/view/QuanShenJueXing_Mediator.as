package com.tgame.moudels.quanshenjuexing.view
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
   import com.tgame.moudels.quanshenjuexing.QuanShenJueXing_ApplicationFacade;
   import com.tgame.moudels.quanshenjuexing.model.QuanShenJueXing_MsgSenderProxy;
   import com.tgame.moudels.quanshenjuexing.model.info.QuanShenJueXingVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QuanShenJueXing_Mediator extends Mediator
   {
      
      public static const NAME:String = "QuanShenJueXing_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var curZF:int;
      
      private var vo:QuanShenJueXingVO;
      
      private const MAX_ZHAOSHI_COUNT:int = 6;
      
      private var autoKnowTimer:Timer;
      
      private var _senderProxy:QuanShenJueXing_MsgSenderProxy;
      
      public function QuanShenJueXing_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : QuanShenJueXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QuanShenJueXing_MsgSenderProxy.NAME) as QuanShenJueXing_MsgSenderProxy;
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
         return [QuanShenJueXing_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case QuanShenJueXing_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isQuanShenJueXingLVShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_72003(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.QUANSHENJUEXING,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUANSHENJUEXING_TUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUANSHENJUEXING_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUANSHENJUEXING_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUANSHENJUEXING_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUANSHENJUEXING_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUANSHENJUEXING_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QUANSHENJUEXING_XIANGQIAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.QUANSHENJUEXING,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUANSHENJUEXING_TUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUANSHENJUEXING_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUANSHENJUEXING_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUANSHENJUEXING_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUANSHENJUEXING_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUANSHENJUEXING_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QUANSHENJUEXING_XIANGQIAN_CLICK,handler);
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
               this.mainCharArrtibutePlane.showQuanShenJueXingTupoPanel(false);
               break;
            case CharAttribute.QUANSHENJUEXING:
               this.senderProxy.send_72001([-1,0]);
               break;
            case CharAttribute.UI_QUANSHENJUEXING_TUPO_CLICK:
               this.index = evt.data as int;
               this.senderProxy.send_72003(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_QUANSHENJUEXING_PREVIOUS_CLICK:
               this.senderProxy.send_72001([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_QUANSHENJUEXING_NEXT_CLICK:
               this.senderProxy.send_72001([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_QUANSHENJUEXING_KAISHITISHENG_CLICK:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_72005([this.index,evt.data]);
               this.mainCharArrtibutePlane.setQuanShenJueXingBtn(!this.isAuto);
               break;
            case CharAttribute.UI_QUANSHENJUEXING_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_72005([index,false]);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setQuanShenJueXingBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setQuanShenJueXingBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_QUANSHENJUEXING_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_QUANSHENJUEXING_XIANGQIAN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_SHENBINGJUEXINGXIANGQIAN_PANEL,3);
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
               senderProxy.send_72005([index,false]);
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
      
      public function setPanel(param1:QuanShenJueXingVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showQuanShenJueXing();
         this.mainCharArrtibutePlane.setQuanShenJueXingInit(param1);
      }
      
      public function setTupoPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showQuanShenJueXingTupoPanel(true);
         this.mainCharArrtibutePlane.setQuanShenJueXingTupoPanel(param1,param2,_loc9_,_loc8_.res.name,param4,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0 && param5 > this.curZF)
         {
            _loc10_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setQuanShenJueXingZhufuzhi(param5,param6,_loc10_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setQuanShenJueXingGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setQuanShenJueXingBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showQuanShenJueXingTupoPanel(false);
            this.senderProxy.send_72001([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setQuanShenJueXingBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_72003(this.index);
         }
      }
   }
}

