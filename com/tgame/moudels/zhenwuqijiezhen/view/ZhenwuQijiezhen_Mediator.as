package com.tgame.moudels.zhenwuqijiezhen.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.zhenwuqijiezhen.ZhenwuQijiezhen_ApplicationFacade;
   import com.tgame.moudels.zhenwuqijiezhen.model.ZhenwuQijiezhen_MsgSenderProxy;
   import com.tgame.moudels.zhenwuqijiezhen.model.info.ZhenWuQiJieZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhenwuQijiezhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhenwuQijiezhen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:ZhenWuQiJieZhenVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 7;
      
      private var _senderProxy:ZhenwuQijiezhen_MsgSenderProxy;
      
      public function ZhenwuQijiezhen_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : ZhenwuQijiezhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZhenwuQijiezhen_MsgSenderProxy.NAME) as ZhenwuQijiezhen_MsgSenderProxy;
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
         return [ZhenwuQijiezhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhenwuQijiezhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isZhenWuQiJieZhentupoCanvasShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_60953(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.ZHENWUQIJIEZHEN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_SKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.ZHENWUQIJIEZHEN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZHENWUQIJIEZHEN_SKILL_DRAG,handler);
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
               this.mainCharArrtibutePlane.showZhenWuQiJieZhenLingWuPanel(false);
               break;
            case CharAttribute.ZHENWUQIJIEZHEN:
               this.senderProxy.send_60951([-1,0]);
               break;
            case CharAttribute.UI_ZHENWUQIJIEZHEN_LINGWU_SHOW:
               this.senderProxy.send_60953(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_ZHENWUQIJIEZHEN_SHANGYIYE_CLICK:
               this.senderProxy.send_60951([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_ZHENWUQIJIEZHEN_XIAYIYE_CLICK:
               this.senderProxy.send_60951([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_ZHENWUQIJIEZHEN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_60955(1);
               }
               else
               {
                  this.senderProxy.send_60955(0);
               }
               this.mainCharArrtibutePlane.showZhenWuQiJieZhenLingWuPanel(!this.isAuto);
               break;
            case CharAttribute.UI_ZHENWUQIJIEZHEN_ZIDONGTISHENG_CLICK:
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
                        mainCharArrtibutePlane.setZhenWuQiJieZhenLingwuBtn(false);
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_60955(0);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  this.mainCharArrtibutePlane.setZhenWuQiJieZhenLingwuBtn(true);
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.showZhenWuQiJieZhenLingWuPanel(!this.isAuto);
               }
               break;
            case CharAttribute.UI_ZHENWUQIJIEZHEN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_ZHENWUQIJIEZHEN_SKILL_DRAG:
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
               senderProxy.send_60955(0);
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
      
      public function upDataPanel(param1:ZhenWuQiJieZhenVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showZhenWuQiJieZhen();
         this.mainCharArrtibutePlane.setZhenWuQiJieZhenInitialize(this.vo);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_MODAO] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_MODAO]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_JULONGZHIJI] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_JULONGZHIJI]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_CHANGHONGJIANZHU] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_CHANGHONGJIANZHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BINGPOJIANZHU] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BINGPOJIANZHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_ZIYUNJIANZHU] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_ZIYUNJIANZHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_YUHUAJIANZHU] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_YUHUAJIANZHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BENLEIJIANZHU] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_BENLEIJIANZHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QINGGUANGJIANZHU] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QINGGUANGJIANZHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QUANFENGJIANZHU] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENWUQIJIEZHEN_QUANFENGJIANZHU]);
         }
         this.mainCharArrtibutePlane.set_ZhenWuQiJieZhen(_loc2_);
      }
      
      public function upDateZhenWuQiJieZhenLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:String) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param4)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.setZhenWuQiJieZhenLingwuInitialize(param7,param6,true,_loc8_.res.name,param4,_loc9_,param5);
         if(this.typeZF != 0)
         {
            _loc11_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setZhenWuQiJieZhenLingwuZhufuzhi(param1,param2,_loc11_);
         this.typeZF = param1;
         this.mainCharArrtibutePlane.setZhenWuQiJieZhenLingwuGoods(_loc8_,_loc9_);
         this.autoKnowTimerFun();
      }
      
      public function upDateZhenWuQiJieZhenLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setZhenWuQiJieZhenLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showZhenWuQiJieZhenLingWuPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_60951([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setZhenWuQiJieZhenLingwuBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showZhenWuQiJieZhenLingWuPanel(true);
            this.senderProxy.send_60953(this.vo.nowLookingID);
         }
      }
   }
}

