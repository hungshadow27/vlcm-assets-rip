package com.tgame.moudels.rulaishenzhang.view
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
   import com.tgame.moudels.rulaishenzhang.RuLaiShenZhang_ApplicationFacade;
   import com.tgame.moudels.rulaishenzhang.model.RuLaiShenZhang_MsgSenderProxy;
   import com.tgame.moudels.rulaishenzhang.model.info.RuLaiShenZhangVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class RuLaiShenZhang_MaincharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "RuLaiShenZhang_MaincharPlaneMediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:RuLaiShenZhangVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private var curZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 12;
      
      private var _senderProxy:RuLaiShenZhang_MsgSenderProxy;
      
      public function RuLaiShenZhang_MaincharPlaneMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : RuLaiShenZhang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(RuLaiShenZhang_MsgSenderProxy.NAME) as RuLaiShenZhang_MsgSenderProxy;
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
         return [RuLaiShenZhang_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case RuLaiShenZhang_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isRulaishenzhangLVShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_72823(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETRULAISHENZHANG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.RULAISHENZHANG_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_RULAISHENZHANG_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_RULAISHENZHANG_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_RULAISHENZHANG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_RULAISHENZHANG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_RULAISHENZHANG_SKILL_DRAG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_RULAISHENZHANG_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETRULAISHENZHANG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.RULAISHENZHANG_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_RULAISHENZHANG_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_RULAISHENZHANG_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_RULAISHENZHANG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_RULAISHENZHANG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_RULAISHENZHANG_SKILL_DRAG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_RULAISHENZHANG_GOUMAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var itemFace:ItemFace = null;
         var id:uint = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showRulaishenzhangTupoPanel(false);
               break;
            case CharAttribute.GETRULAISHENZHANG:
               this.senderProxy.send_72821([-1,0]);
               break;
            case CharAttribute.RULAISHENZHANG_LINGWU_SHOW:
               this.senderProxy.send_72823(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_RULAISHENZHANG_SHANGYIYE_CLICK:
               this.senderProxy.send_72821([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_RULAISHENZHANG_XIAYIYE_CLICK:
               this.senderProxy.send_72821([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_RULAISHENZHANG_KAISHITISHENG_CLICKJ:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_72825(1);
               }
               else
               {
                  this.senderProxy.send_72825(0);
               }
               this.mainCharArrtibutePlane.setRulaishenzhangBtn(!this.isAuto);
               break;
            case CharAttribute.UI_RULAISHENZHANG_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_72825(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setRulaishenzhangBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setRulaishenzhangBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_RULAISHENZHANG_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.UI_RULAISHENZHANG_GOUMAI_CLICK:
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
               senderProxy.send_72825(0);
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
      
      public function upDataPanel(param1:RuLaiShenZhangVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showRulaishenzhang();
         this.mainCharArrtibutePlane.setRulaishenzhangInit(this.vo);
      }
      
      public function setTupoPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showRulaishenzhangTupoPanel(true);
         this.mainCharArrtibutePlane.setRulaishenzhangTupoInitialize(param1,param2,_loc9_,_loc8_.res.name,param4,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0 && param5 > this.curZF)
         {
            _loc10_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setRulaishenzhangZhufuzhi(param5,param6,_loc10_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setRulaishenzhangGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function upDateRulaishenzhangLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setRulaishenzhangBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showRulaishenzhangTupoPanel(false);
            this.senderProxy.send_72821([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setRulaishenzhangBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_72823(this.vo.nowLookingID);
         }
      }
   }
}

