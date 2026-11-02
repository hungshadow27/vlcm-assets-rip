package com.tgame.moudels.sanshiliushou.view
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
   import com.tgame.moudels.sanshiliushou.SanShiLiuShou_ApplicationFacade;
   import com.tgame.moudels.sanshiliushou.model.SanShiLiuShou_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class SanShiLiuShou_MaincharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "SanShiLiuShou_MaincharPlaneMediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var item:Goods;
      
      private var curZF:int;
      
      private var _msgSenderProxy:SanShiLiuShou_MsgSenderProxy;
      
      public function SanShiLiuShou_MaincharPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      private function get msgSenderProxy() : SanShiLiuShou_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(SanShiLiuShou_MsgSenderProxy.NAME) as SanShiLiuShou_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case SanShiLiuShou_ApplicationFacade.GOODS_CHANGED:
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.SANSHILIUSHOU,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SANSHILIUSHOU_TUPO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SANSHILIUSHOU_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SANSHILIUSHOU_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SANSHILIUSHOU_PREVIOUS_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SANSHILIUSHOU_NEXT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SANSHILIUSHOU_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SANSHILIUSHOU,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SANSHILIUSHOU_TUPO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SANSHILIUSHOU_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SANSHILIUSHOU_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SANSHILIUSHOU_PREVIOUS_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SANSHILIUSHOU_NEXT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SANSHILIUSHOU_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DINGCHANJUE_SKILL_DRAG,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var itemFace:ItemFace = null;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showSanShiLiuShouTupoPanel(false);
               break;
            case CharAttribute.SANSHILIUSHOU:
               this.msgSenderProxy.send_60151([-1,0]);
               break;
            case CharAttribute.UI_SANSHILIUSHOU_TUPO_CLICK:
               this.msgSenderProxy.send_60153();
               break;
            case CharAttribute.UI_SANSHILIUSHOU_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.msgSenderProxy.send_60155(1);
               }
               else
               {
                  this.msgSenderProxy.send_60155(0);
               }
               this.mainCharArrtibutePlane.setSanShiLiuShouBtn(!this.isAuto);
               break;
            case CharAttribute.UI_SANSHILIUSHOU_ZIDONGTISHENG_CLICK:
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
                           msgSenderProxy.send_60155(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setSanShiLiuShouBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = b;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setSanShiLiuShouBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_SANSHILIUSHOU_PREVIOUS_CLICK:
               this.msgSenderProxy.send_60151([-1,evt.data as int]);
               break;
            case CharAttribute.UI_SANSHILIUSHOU_NEXT_CLICK:
               this.msgSenderProxy.send_60151([-1,evt.data as int]);
               break;
            case CharAttribute.UI_SANSHILIUSHOU_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_DINGCHANJUE_SKILL_DRAG:
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
      
      public function setSanShiLiuShou(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int, param13:Boolean) : void
      {
         this.mainCharArrtibutePlane.showSanShiLiuShou();
         this.mainCharArrtibutePlane.setSanShiLiuShouInit(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function setTupoPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showSanShiLiuShouTupoPanel(true);
         this.mainCharArrtibutePlane.setSanShiLiuShouTupoPanel(param1,param2,true,_loc8_.res.name,param4,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0 && param5 > this.curZF)
         {
            _loc10_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setSanShiLiuShouZhufuzhi(param5,param6,_loc10_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setSanShiLiuShouGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
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
               msgSenderProxy.send_60155(0);
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
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setSanShiLiuShouBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showSanShiLiuShouTupoPanel(false);
            this.msgSenderProxy.send_60151([-1,0]);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setSanShiLiuShouBtn(!this.isAuto);
         }
         else
         {
            this.msgSenderProxy.send_60153();
         }
      }
   }
}

