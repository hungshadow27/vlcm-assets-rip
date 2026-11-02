package com.tgame.moudels.hamagong.view
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
   import com.tgame.moudels.hamagong.HaMaGong_ApplicationFacade;
   import com.tgame.moudels.hamagong.info.HaMaGongVO;
   import com.tgame.moudels.hamagong.model.HaMaGong_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HaMaGong_Mediator extends Mediator
   {
      
      public static const NAME:String = "HaMaGong_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:HaMaGongVO;
      
      private var autoKnowTimer:Timer;
      
      private var tempJY:int;
      
      private var typeZF:int;
      
      private var _senderProxy:HaMaGong_MsgSenderProxy;
      
      public function HaMaGong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : HaMaGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(HaMaGong_MsgSenderProxy.NAME) as HaMaGong_MsgSenderProxy;
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
         return [HaMaGong_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case HaMaGong_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isHaMaGongtupoCanvasShow_X() && Boolean(this.vo))
               {
                  this.senderProxy.send_58803(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.HAMAGONG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HAMAGONG_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HAMAGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HAMAGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HAMAGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HAMAGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HAMAGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_HAMAGONG_SKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.HAMAGONG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HAMAGONG_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HAMAGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HAMAGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HAMAGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HAMAGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HAMAGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_HAMAGONG_SKILL_DRAG,handler);
         });
      }
      
      private function handler(param1:Event) : void
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
               this.mainCharArrtibutePlane.showHaMaGongLingWuPanel(false);
               break;
            case CharAttribute.HAMAGONG:
               this.senderProxy.send_58801(0);
               break;
            case CharAttribute.UI_HAMAGONG_LINGWU_SHOW:
               this.senderProxy.send_58803(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_HAMAGONG_PREVIOUS_CLICK:
               this.senderProxy.send_58801(this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1);
               break;
            case CharAttribute.UI_HAMAGONG_NEXT_CLICK:
               this.senderProxy.send_58801(this.vo.nowLookingID + 1 >= 5 ? 5 : this.vo.nowLookingID + 1);
               break;
            case CharAttribute.UI_HAMAGONG_KAISHITISHENG_CLICKJ:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_58805({
                  "id":(this.vo.nowID + 1 >= 5 ? 5 : this.vo.nowID),
                  "isNow":false
               });
               this.mainCharArrtibutePlane.setHaMaGongLingwuBtn_X(!this.isAuto);
               break;
            case CharAttribute.UI_HAMAGONG_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_58805({
                              "id":(vo.nowID + 1 >= 5 ? 5 : vo.nowID),
                              "isNow":false
                           });
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setHaMaGongLingwuBtn_X(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setHaMaGongLingwuBtn_X(!this.isAuto);
               }
               break;
            case CharAttribute.UI_HAMAGONG_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_HAMAGONG_SKILL_DRAG:
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
               senderProxy.send_58805({
                  "id":(vo.nowID + 1 >= 5 ? 5 : vo.nowID),
                  "isNow":false
               });
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
      
      public function upDataPanel(param1:HaMaGongVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showHaMaGong();
         this.mainCharArrtibutePlane.setHaMaGongInitialize(this.vo);
      }
      
      public function upDataYiJinJignLV(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int) : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param7,true);
         var _loc11_:Boolean = false;
         if(_loc10_.count >= param8)
         {
            _loc11_ = true;
         }
         this.mainCharArrtibutePlane.setHaMaGongLingwuInitialize_X(param6,true,_loc10_.res.name,param8,_loc11_,param9,param2);
         if(this.typeZF != 0)
         {
            _loc13_ = param3 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setHaMaGongLingwuZhufuzhi_X(param3,param4,_loc13_);
         this.typeZF = param3;
         this.mainCharArrtibutePlane.setHaMaGongLingwuGoods_X(_loc10_,_loc11_);
         this.autoKnowTimerFun();
      }
      
      public function upDataYiJinJignLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setHaMaGongLingwuBtn_X(!this.isAuto);
            this.mainCharArrtibutePlane.showHaMaGongLingWuPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_58801(0);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setHaMaGongLingwuBtn_X(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_58803(this.vo.nowLookingID);
         }
      }
   }
}

