package com.tgame.moudels.xuanXiangZhen.view
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
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.xuanXiangZhen.XuanXiangZhen_ApplicationFacade;
   import com.tgame.moudels.xuanXiangZhen.model.XuanXiangZhen_MsgSenderProxy;
   import com.tgame.moudels.xuanXiangZhen.model.info.XuanXiangZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XuanXiangZhen_Mediator extends Mediator
   {
      
      public static const NAME:String = "XuanXiangZhen_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:XuanXiangZhenVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 8;
      
      private var _senderProxy:XuanXiangZhen_MsgSenderProxy;
      
      public function XuanXiangZhen_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : XuanXiangZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XuanXiangZhen_MsgSenderProxy.NAME) as XuanXiangZhen_MsgSenderProxy;
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
         return [XuanXiangZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XuanXiangZhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isXuanXiangZhentupoCanvasShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_70753(this.vo.lookID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.XUANXIANGZHEN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_BUZHEN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XUANXIANGZHEN_XIANSHI_CHECK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XUANXIANGZHEN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_BUZHEN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XUANXIANGZHEN_XIANSHI_CHECK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var isSelect:Boolean = false;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showXiaoYaoYuFengTupoPanel(false);
               break;
            case CharAttribute.XUANXIANGZHEN:
               this.senderProxy.send_70751([-1,0]);
               break;
            case CharAttribute.UI_XUANXIANGZHEN_LINGWU_SHOW:
               this.senderProxy.send_70753(this.vo.lookID);
               break;
            case CharAttribute.UI_XUANXIANGZHEN_SHANGYIYE_CLICK:
               this.senderProxy.send_70751([-1,this.vo.lookID - 1 <= 1 ? 1 : this.vo.lookID - 1]);
               break;
            case CharAttribute.UI_XUANXIANGZHEN_XIAYIYE_CLICK:
               this.senderProxy.send_70751([-1,this.vo.lookID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.lookID + 1]);
               break;
            case CharAttribute.UI_XUANXIANGZHEN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_70755(1);
               }
               else
               {
                  this.senderProxy.send_70755(0);
               }
               this.mainCharArrtibutePlane.setXuanXiangZhenLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_XUANXIANGZHEN_ZIDONGTISHENG_CLICK:
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
                        mainCharArrtibutePlane.setXuanXiangZhenLingwuBtn(false);
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_70755(0);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  this.mainCharArrtibutePlane.setXuanXiangZhenLingwuBtn(true);
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.showXuanXiangZhenLingWuPanel(!this.isAuto);
               }
               break;
            case CharAttribute.UI_XUANXIANGZHEN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_XUANXIANGZHEN_BUZHEN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_BUZHEN_PANEL,6);
               break;
            case CharAttribute.UI_XUANXIANGZHEN_XIANSHI_CHECK:
               isSelect = evt.data as Boolean;
               if(isSelect)
               {
                  this.senderProxy.send_70757(1);
               }
               else
               {
                  this.senderProxy.send_70757(0);
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
               senderProxy.send_70755(0);
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
      
      public function upDataPanel(param1:XuanXiangZhenVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showXuanXiangZhen();
         this.mainCharArrtibutePlane.setXuanXiangZhenInitialize(this.vo);
         this.mainCharArrtibutePlane.setYuLiJiHuo(GameState.dictMainStatus[40751]);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN1] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN1]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN2] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN2]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN3] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN3]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN4] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ZHENFA_XUANXIANGZHEN4]);
         }
         this.mainCharArrtibutePlane.set_XuanXiangZhen(_loc2_);
      }
      
      public function upDateLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String, param7:String, param8:int, param9:int) : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         this.mainCharArrtibutePlane.showXuanXiangZhenLingWuPanel(true);
         var _loc10_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc11_:Boolean = false;
         if(_loc10_.count >= param4)
         {
            _loc11_ = true;
         }
         this.mainCharArrtibutePlane.setXuanXiangZhenLingwuInitialize(param6,true,_loc10_.res.name,param4,_loc11_,param5,param8,param9);
         if(this.typeZF != 0)
         {
            _loc13_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setXuanXiangZhenLingwuZhufuzhi(param1,param2,_loc13_);
         this.typeZF = param1;
         this.mainCharArrtibutePlane.setXuanXiangZhenLingwuGoods(_loc10_,_loc11_);
         this.autoKnowTimerFun();
      }
      
      public function upDateLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setXuanXiangZhenLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showXuanXiangZhenLingWuPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_70751([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setXuanXiangZhenLingwuBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showXuanXiangZhenLingWuPanel(true);
            this.senderProxy.send_70753(this.vo.lookID);
         }
      }
   }
}

