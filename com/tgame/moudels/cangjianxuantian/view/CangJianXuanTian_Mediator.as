package com.tgame.moudels.cangjianxuantian.view
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
   import com.tgame.moudels.cangjianxuantian.CangJianXuanTian_ApplicationFacade;
   import com.tgame.moudels.cangjianxuantian.model.CangJianXuanTian_MsgSenderProxy;
   import com.tgame.moudels.cangjianxuantian.model.info.CangJianXuanTianVO;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CangJianXuanTian_Mediator extends Mediator
   {
      
      public static const NAME:String = "CangJianXuanTian_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:CangJianXuanTianVO;
      
      private var autoKnowTimer:Timer;
      
      private var curZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 5;
      
      private var _senderProxy:CangJianXuanTian_MsgSenderProxy;
      
      public function CangJianXuanTian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : CangJianXuanTian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(CangJianXuanTian_MsgSenderProxy.NAME) as CangJianXuanTian_MsgSenderProxy;
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
         return [CangJianXuanTian_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case CangJianXuanTian_ApplicationFacade.GOODS_CHANGED:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETCANGJIANXUANTIAN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANGJIANXUANTIAN_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANGJIANXUANTIAN_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANGJIANXUANTIAN_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANGJIANXUANTIAN_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANGJIANXUANTIAN_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANGJIANXUANTIAN_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETCANGJIANXUANTIAN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANGJIANXUANTIAN_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANGJIANXUANTIAN_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANGJIANXUANTIAN_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANGJIANXUANTIAN_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANGJIANXUANTIAN_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANGJIANXUANTIAN_GOUMAI_CLICK,handler);
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
               this.mainCharArrtibutePlane.showCangJianXuanTianTuPoPanel(false);
               break;
            case CharAttribute.GETCANGJIANXUANTIAN:
               this.senderProxy.send_79621([-1,0]);
               break;
            case CharAttribute.UI_CANGJIANXUANTIAN_XIULIAN_CLICK:
               this.senderProxy.send_79623(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_CANGJIANXUANTIAN_PREVIOUS_CLICK:
               this.senderProxy.send_79621([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_CANGJIANXUANTIAN_NEXT_CLICK:
               this.senderProxy.send_79621([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_CANGJIANXUANTIAN_KAISHITISHENG_CLICKJ:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_79625(-1);
               }
               else
               {
                  this.senderProxy.send_79625(this.vo.nowID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowID);
               }
               this.mainCharArrtibutePlane.setCangJianXuanTianBtn(!this.isAuto);
               break;
            case CharAttribute.UI_CANGJIANXUANTIAN_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_79625(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setCangJianXuanTianBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setCangJianXuanTianBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_CANGJIANXUANTIAN_GOUMAI_CLICK:
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
               senderProxy.send_79625(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(700,1);
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
      
      public function upDataCangJianXuanTianPanel(param1:CangJianXuanTianVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showCangJianXuanTian();
         this.mainCharArrtibutePlane.initializateCangJianXuanTian(this.vo);
      }
      
      public function upDataLingWuPanel(param1:String, param2:String, param3:int, param4:int, param5:String, param6:int, param7:int, param8:int, param9:int) : void
      {
         var _loc10_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param6,true);
         var _loc11_:Boolean = false;
         if(_loc10_.count >= param7)
         {
            _loc11_ = true;
         }
         this.mainCharArrtibutePlane.showCangJianXuanTianTuPoPanel(true);
         this.mainCharArrtibutePlane.setCangJianXuanTianTuPo(param5,true,_loc10_.res.name,param7,_loc11_,param8,param9);
         var _loc12_:int = 0;
         if(this.curZF != 0)
         {
            _loc12_ = param3 - this.curZF;
         }
         this.mainCharArrtibutePlane.setCangJianXuanTianZhufuzhi(param3,param4,_loc12_);
         this.curZF = param3;
         this.mainCharArrtibutePlane.setCangJianXuanTianGoods(_loc10_,_loc11_);
         this.autoKnowTimerFun();
      }
      
      public function upDataCangJianXuanTianLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setCangJianXuanTianBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showCangJianXuanTianTuPoPanel(false);
            this.senderProxy.send_79621([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setCangJianXuanTianBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_79623(this.vo.nowLookingID);
         }
      }
   }
}

