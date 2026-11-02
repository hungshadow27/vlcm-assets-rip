package com.tgame.moudels.qinlonggong.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.qinlonggong.model.QinLongGong_MsgSenderProxy;
   import com.tgame.moudels.qinlonggong.model.info.QinLongGongVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QinLongGong_Mediator extends Mediator
   {
      
      public static const NAME:String = "QinLongGong_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var curZF:int;
      
      private var vo:QinLongGongVo;
      
      private const MAX_ZHAOSHI_COUNT:int = 6;
      
      private var autoKnowTimer:Timer;
      
      private var _senderProxy:QinLongGong_MsgSenderProxy;
      
      public function QinLongGong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : QinLongGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QinLongGong_MsgSenderProxy.NAME) as QinLongGong_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.QINLONGGONG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINLONGGONG_TUPO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINLONGGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINLONGGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINLONGGONG_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINLONGGONG_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINLONGGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_QINLONGGONG_SKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.QINLONGGONG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINLONGGONG_TUPO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINLONGGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINLONGGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINLONGGONG_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINLONGGONG_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINLONGGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_QINLONGGONG_SKILL_DRAG,handler);
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
               this.mainCharArrtibutePlane.showQinLongGongTupoPanel(false);
               break;
            case CharAttribute.QINLONGGONG:
               this.senderProxy.send_61841([-1,0]);
               break;
            case CharAttribute.UI_QINLONGGONG_TUPO_CLICK:
               this.index = evt.data as int;
               this.senderProxy.send_61843(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_QINLONGGONG_PREVIOUS_CLICK:
               this.senderProxy.send_61841([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_QINLONGGONG_NEXT_CLICK:
               this.senderProxy.send_61841([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_QINLONGGONG_KAISHITISHENG_CLICK:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_61845([this.index,evt.data]);
               this.mainCharArrtibutePlane.setQinLongGongBtn(!this.isAuto);
               break;
            case CharAttribute.UI_QINLONGGONG_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_61845([index,false]);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setQinLongGongBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setQinLongGongBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_QINLONGGONG_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_QINLONGGONG_SKILL_DRAG:
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
               senderProxy.send_61845([index,false]);
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
      
      public function setPanel(param1:QinLongGongVo) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showQinLongGong();
         this.mainCharArrtibutePlane.setQinLongGongInit(param1);
         this.mainCharArrtibutePlane.qinLongGongJiHuo(GameState.dictMainStatus[40636]);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE1] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE1]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE2] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE2]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE3] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE3]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE4] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE4]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE5] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_QINLONGGONG_JUEXUE5]);
         }
         this.mainCharArrtibutePlane.set_QinLongGong(_loc2_);
      }
      
      public function setTupoPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showQinLongGongTupoPanel(true);
         this.mainCharArrtibutePlane.setQinLongGongTupoPanel(param1,param2,_loc9_,_loc8_.res.name,param4,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0 && param5 > this.curZF)
         {
            _loc10_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setQinLongGongZhufuzhi(param5,param6,_loc10_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setQinLongGongGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setQinLongGongBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showQinLongGongTupoPanel(false);
            this.senderProxy.send_61841([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setQinLongGongBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_61843(this.index);
         }
      }
   }
}

