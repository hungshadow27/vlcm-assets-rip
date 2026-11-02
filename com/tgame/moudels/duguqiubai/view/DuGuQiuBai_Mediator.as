package com.tgame.moudels.duguqiubai.view
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
   import com.tgame.moudels.dugujiujian.Dugujiujian_ApplicationFacade;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.duguqiubai.DuGuQiuBai_ApplicationFacade;
   import com.tgame.moudels.duguqiubai.model.DuGuQiuBai_MsgSenderProxy;
   import com.tgame.moudels.duguqiubai.model.info.DuGuQiuBaiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DuGuQiuBai_Mediator extends Mediator
   {
      
      public static const NAME:String = "DuGuQiuBai_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var curZF:int;
      
      private var vo:DuGuQiuBaiVO;
      
      private const MAX_ZHAOSHI_COUNT:int = 5;
      
      private var autoKnowTimer:Timer;
      
      private var _senderProxy:DuGuQiuBai_MsgSenderProxy;
      
      public function DuGuQiuBai_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : DuGuQiuBai_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DuGuQiuBai_MsgSenderProxy.NAME) as DuGuQiuBai_MsgSenderProxy;
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
         return [Dugujiujian_ApplicationFacade.QINGQIUHUANZHUANG,DuGuQiuBai_ApplicationFacade.UI_MeiRenPanel_GOUXUAN_CLICK];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Dugujiujian_ApplicationFacade.QINGQIUHUANZHUANG:
               this.senderProxy.send_73005(0);
               break;
            case DuGuQiuBai_ApplicationFacade.UI_MeiRenPanel_GOUXUAN_CLICK:
               _loc3_ = _loc2_ as Array;
               _loc4_ = Boolean(_loc3_[0]);
               _loc5_ = int(_loc3_[1]);
               if(_loc4_)
               {
                  this.senderProxy.send_73005([1,_loc5_]);
               }
               else
               {
                  this.senderProxy.send_73005([0,_loc5_]);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.DUGUQIUBAI,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUQIUBAI_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUQIUBAI_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUQIUBAI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUQIUBAI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUQIUBAI_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.DUGUQIUBAI,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUQIUBAI_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUQIUBAI_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUQIUBAI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUQIUBAI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUQIUBAI_GOUMAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var arr:Array = null;
         var v1:int = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.DUGUQIUBAI:
               this.senderProxy.send_73001([-1,0]);
               break;
            case CharAttribute.UI_DUGUQIUBAI_SHANGYIYE_CLICK:
               this.senderProxy.send_73001([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_DUGUQIUBAI_XIAYIYE_CLICK:
               this.senderProxy.send_73001([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_DUGUQIUBAI_KAISHITISHENG_CLICK:
               this.senderProxy.send_73003();
               this.isAuto = false;
               this.mainCharArrtibutePlane.setDuGuQiuBaiBtn(!this.isAuto);
               break;
            case CharAttribute.UI_DUGUQIUBAI_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_73003();
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setDuGuQiuBaiBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setDuGuQiuBaiBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_DUGUQIUBAI_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_DUGUQIUBAI_HUANZHUANG_CLICK:
               arr = evt.data as Array;
               b = Boolean(arr[0]);
               v1 = int(arr[1]);
               if(b)
               {
                  this.senderProxy.send_73005([1,v1]);
               }
               else
               {
                  this.senderProxy.send_73005([0,v1]);
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
               senderProxy.send_73003();
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
      
      public function setPanel(param1:DuGuQiuBaiVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showDuGuQiuBai();
         this.mainCharArrtibutePlane.setDuGuQiuBaiInit(param1);
         this.setTupoPanel(param1.nowZhufuzhi,param1.maxZhufuzhi);
         this.setGood(param1.goodid,param1.count);
      }
      
      public function setGood(param1:int, param2:int) : void
      {
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         var _loc4_:Boolean = false;
         if(_loc3_.count >= param2)
         {
            _loc4_ = true;
         }
         this.mainCharArrtibutePlane.setDuGuQiuBaiGoods(_loc3_,_loc4_);
         this.autoKnowTimerFun();
      }
      
      public function setTupoPanel(param1:int, param2:int) : void
      {
         var _loc3_:int = 0;
         if(this.curZF != 0 && param1 > this.curZF)
         {
            _loc3_ = param1 - this.curZF;
         }
         this.mainCharArrtibutePlane.setDuGuQiuBaiZhufuzhi(param1,param2,_loc3_);
         this.curZF = param1;
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setDuGuQiuBaiBtn(!this.isAuto);
            this.senderProxy.send_73001([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setDuGuQiuBaiBtn(!this.isAuto);
         }
         else if(!GameInstance.uiInstance.charAttribute.isDuGuQiuBaiShow())
         {
            this.isAuto = false;
         }
         else
         {
            this.senderProxy.send_73001([-1,0]);
         }
      }
   }
}

