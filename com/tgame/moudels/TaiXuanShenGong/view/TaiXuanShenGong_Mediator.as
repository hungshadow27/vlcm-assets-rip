package com.tgame.moudels.TaiXuanShenGong.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.TaiXuanShenGong.TaiXuanShenGong_ApplicationFacade;
   import com.tgame.moudels.TaiXuanShenGong.model.TaiXuanShenGong_MsgSenderProxy;
   import com.tgame.moudels.TaiXuanShenGong.model.info.TaiXuanShenGongVO;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TaiXuanShenGong_Mediator extends Mediator
   {
      
      public static const NAME:String = "TaiXuanShenGong_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:TaiXuanShenGongVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 24;
      
      private const ALLOW_LEARN_LEVEL:int = 63;
      
      private var _senderProxy:TaiXuanShenGong_MsgSenderProxy;
      
      public function TaiXuanShenGong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TaiXuanShenGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TaiXuanShenGong_MsgSenderProxy.NAME) as TaiXuanShenGong_MsgSenderProxy;
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
         return [TaiXuanShenGong_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TaiXuanShenGong_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isTaiXuanShenGongtupoCanvasShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_52193(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETTAIXUANSHENGONG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.TAIXUANSHENGONG_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TAIXUANSHENGONG_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TAIXUANSHENGONG_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TAIXUANSHENGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TAIXUANSHENGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TAIXUANSHENGONG_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETTAIXUANSHENGONG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.TAIXUANSHENGONG_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TAIXUANSHENGONG_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TAIXUANSHENGONG_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TAIXUANSHENGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TAIXUANSHENGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TAIXUANSHENGONG_GOUMAI_CLICK,handler);
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
               this.mainCharArrtibutePlane.showTaiXuanShenGongLingWuPanel(false);
               break;
            case CharAttribute.GETTAIXUANSHENGONG:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < this.ALLOW_LEARN_LEVEL)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有71级及以上玩家才可以修炼太玄神功"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有71级及以上玩家才可以修炼太玄神功"));
               }
               else
               {
                  this.senderProxy.send_52191(0);
               }
               break;
            case CharAttribute.TAIXUANSHENGONG_LINGWU_SHOW:
               this.senderProxy.send_52193(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_TAIXUANSHENGONG_SHANGYIYE_CLICK:
               this.senderProxy.send_52191(this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1);
               break;
            case CharAttribute.UI_TAIXUANSHENGONG_XIAYIYE_CLICK:
               this.senderProxy.send_52191(this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1);
               break;
            case CharAttribute.UI_TAIXUANSHENGONG_KAISHITISHENG_CLICKJ:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_52195({"id":-1});
               }
               else
               {
                  this.senderProxy.send_52195({"id":(this.vo.nowID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowID)});
               }
               this.mainCharArrtibutePlane.setTaiXuanShenGongLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_TAIXUANSHENGONG_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_52195({"id":(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID)});
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setTaiXuanShenGongLingwuBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setTaiXuanShenGongLingwuBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_TAIXUANSHENGONG_GOUMAI_CLICK:
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
               senderProxy.send_52195({"id":(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID)});
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
      
      public function upDataPanel(param1:TaiXuanShenGongVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showTaiXuanShenGong();
         this.mainCharArrtibutePlane.setTaiXuanShenGongInitialize(this.vo);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_QINGMULINGQUAN] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_QINGMULINGQUAN]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_DUGUQIUBAI] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_DUGUQIUBAI]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_FENGQINGYANG] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_FENGQINGYANG]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_LINGHUCHONG] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_TAIXUANSHENGONG_LINGHUCHONG]);
         }
         this.mainCharArrtibutePlane.set_TaiXuanShenGong(_loc2_);
      }
      
      public function upDateTaiXuanShenGongLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:String, param8:String) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param4,true);
         var _loc10_:Boolean = false;
         if(_loc9_.count >= param5)
         {
            _loc10_ = true;
         }
         this.mainCharArrtibutePlane.setTaiXuanShenGongLingwuInitialize(param7,true,_loc9_.res.name,param5,_loc10_,param6,param8);
         if(this.typeZF != 0)
         {
            _loc12_ = param2 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setTaiXuanShenGongLingwuZhufuzhi(param2,param3,_loc12_);
         this.typeZF = param2;
         this.mainCharArrtibutePlane.setTaiXuanShenGongLingwuGoods(_loc9_,_loc10_);
         this.autoKnowTimerFun();
      }
      
      public function upDateTaiXuanShenGongLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setTaiXuanShenGongLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showTaiXuanShenGongLingWuPanel(false);
            this.senderProxy.send_52191(0);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setTaiXuanShenGongLingwuBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_52193(this.vo.nowLookingID);
         }
      }
   }
}

