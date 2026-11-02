package com.tgame.moudels.douZhuanXingYi.view
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
   import com.tgame.moudels.douZhuanXingYi.DouZhuanXingYi_ApplicationFacade;
   import com.tgame.moudels.douZhuanXingYi.model.DouZhuanXingYi_MsgSenderProxy;
   import com.tgame.moudels.douZhuanXingYi.model.info.DouZhuanXingYiVO;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.zhenwuqijiezhen.ZhenwuQijiezhen_ApplicationFacade;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DouZhuanXingYi_Mediator extends Mediator
   {
      
      public static const NAME:String = "DouZhuanXingYi_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:DouZhuanXingYiVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 7;
      
      private var _senderProxy:DouZhuanXingYi_MsgSenderProxy;
      
      public function DouZhuanXingYi_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : DouZhuanXingYi_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DouZhuanXingYi_MsgSenderProxy.NAME) as DouZhuanXingYi_MsgSenderProxy;
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
         return [DouZhuanXingYi_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhenwuQijiezhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isDouZhuanXingYiLVShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_61303(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.DOUZHUANXINGYI,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DOUZHUANXINGYI_TUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DOUZHUANXINGYI_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DOUZHUANXINGYI_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DOUZHUANXINGYI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DOUZHUANXINGYI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DOUZHUANXINGYI_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.DOUZHUANXINGYI,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DOUZHUANXINGYI_TUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DOUZHUANXINGYI_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DOUZHUANXINGYI_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DOUZHUANXINGYI_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DOUZHUANXINGYI_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DOUZHUANXINGYI_GOUMAI_CLICK,handler);
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
               this.mainCharArrtibutePlane.showDouZhuanXingYiTupoPanel(false);
               break;
            case CharAttribute.DOUZHUANXINGYI:
               if(this.vo)
               {
                  this.senderProxy.send_61301([-1,this.vo.nowID + 1]);
               }
               else
               {
                  this.senderProxy.send_61301([-1,0]);
               }
               break;
            case CharAttribute.UI_DOUZHUANXINGYI_TUPO_CLICK:
               this.senderProxy.send_61303(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_DOUZHUANXINGYI_PREVIOUS_CLICK:
               this.senderProxy.send_61301([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_DOUZHUANXINGYI_NEXT_CLICK:
               this.senderProxy.send_61301([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_DOUZHUANXINGYI_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_61305(1);
               }
               else
               {
                  this.senderProxy.send_61305(0);
               }
               this.mainCharArrtibutePlane.showDouZhuanXingYiTupoPanel(!this.isAuto);
               break;
            case CharAttribute.UI_DOUZHUANXINGYI_ZIDONGTISHENG_CLICK:
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
                        mainCharArrtibutePlane.setDouZhuanXingYiBtn(false);
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_61305(0);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  this.mainCharArrtibutePlane.setDouZhuanXingYiBtn(true);
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.showDouZhuanXingYiTupoPanel(!this.isAuto);
               }
               break;
            case CharAttribute.UI_DOUZHUANXINGYI_GOUMAI_CLICK:
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
               senderProxy.send_61305(0);
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
      
      public function upDataPanel(param1:DouZhuanXingYiVO) : void
      {
         this.vo = param1;
         var _loc2_:Array = [];
         this.mainCharArrtibutePlane.showDouZhuanXingYi();
         this.mainCharArrtibutePlane.setDouZhuanXingYiInit(this.vo);
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QIANKUNJIA] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QIANKUNJIA]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115SHENGHUODOUZHUAN] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115SHENGHUODOUZHUAN]);
         }
         this.mainCharArrtibutePlane.setDouzhuangxingyiZhuangbei(_loc2_);
      }
      
      public function upDateDouZhuanXingYiLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:String) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.setDouZhuanXingYiTupoPanel(param7,param6,true,_loc8_.res.name,param4,_loc9_,param5);
         if(this.typeZF != 0)
         {
            _loc11_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setDouZhuanXingYiZhufuzhi(param1,param2,_loc11_);
         this.typeZF = param1;
         this.mainCharArrtibutePlane.setDouZhuanXingYiGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function upDateDouZhuanXingYiLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setDouZhuanXingYiBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showDouZhuanXingYiTupoPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_61301([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setDouZhuanXingYiBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showDouZhuanXingYiTupoPanel(true);
            this.senderProxy.send_61303(this.vo.nowLookingID);
         }
      }
   }
}

