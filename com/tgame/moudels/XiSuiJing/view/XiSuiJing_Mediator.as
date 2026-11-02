package com.tgame.moudels.XiSuiJing.view
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
   import com.tgame.moudels.XiSuiJing.XiSuiJing_ApplicationFacade;
   import com.tgame.moudels.XiSuiJing.model.XiSuiJing_MsgSenderProxy;
   import com.tgame.moudels.XiSuiJing.model.info.XiSuiJingVO;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiSuiJing_Mediator extends Mediator
   {
      
      public static const NAME:String = "XiSuiJing_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:XiSuiJingVO;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 10;
      
      private const ALLOW_LEARN_LEVEL:int = 63;
      
      private var _senderProxy:XiSuiJing_MsgSenderProxy;
      
      public function XiSuiJing_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiSuiJing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiSuiJing_MsgSenderProxy.NAME) as XiSuiJing_MsgSenderProxy;
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
         return [XiSuiJing_ApplicationFacade.GOODS_CHANGED,XiSuiJing_ApplicationFacade.XISUIJING_DINGJI_JIHUO_SHUXING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XiSuiJing_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isYijinjingtupoCanvasShow_X() && Boolean(this.vo))
               {
                  this.senderProxy.send_51993(this.vo.nowLookingID);
               }
               break;
            case XiSuiJing_ApplicationFacade.XISUIJING_DINGJI_JIHUO_SHUXING:
               if(_loc2_.type == 5)
               {
                  this.senderProxy.send_51991(0);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETYIJINJING_X,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.YIJINJING_LINGWU_SHOW_X,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK_X,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_XIAYIYE_CLICK_X,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ_X,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_GOUMAI_CLICK_X,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETYIJINJING_X,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.YIJINJING_LINGWU_SHOW_X,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK_X,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_XIAYIYE_CLICK_X,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ_X,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_GOUMAI_CLICK_X,handler);
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
               this.mainCharArrtibutePlane.showYijinjingLingWuPanel_X(false);
               break;
            case CharAttribute.GETYIJINJING_X:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < this.ALLOW_LEARN_LEVEL)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有级及以上玩家才可以修炼洗髓经"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有级及以上玩家才可以修炼洗髓经"));
               }
               else
               {
                  this.senderProxy.send_51991(0);
               }
               break;
            case CharAttribute.YIJINJING_LINGWU_SHOW_X:
               this.senderProxy.send_51993(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK_X:
               this.senderProxy.send_51991(this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1);
               break;
            case CharAttribute.UI_YIJINJING_XIAYIYE_CLICK_X:
               this.senderProxy.send_51991(this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1);
               break;
            case CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ_X:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_51995({"id":(this.vo.nowID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowID)});
               this.mainCharArrtibutePlane.setYijinjingLingwuBtn_X(!this.isAuto);
               break;
            case CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ_X:
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
                           senderProxy.send_51995({"id":(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID)});
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setYijinjingLingwuBtn_X(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setYijinjingLingwuBtn_X(!this.isAuto);
               }
               break;
            case CharAttribute.UI_YIJINJING_GOUMAI_CLICK_X:
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
               senderProxy.send_51995({"id":(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID)});
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
      
      public function upDataPanel(param1:XiSuiJingVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showYiJinJing_X();
         this.mainCharArrtibutePlane.setYijinjingInitialize_X(this.vo);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115XISUIHUAYUANJUE] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115XISUIHUAYUANJUE]);
         }
         this.mainCharArrtibutePlane.set_XiSuiJing(_loc2_);
      }
      
      public function upDataYiJinJignLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:String, param8:String) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param4,true);
         var _loc10_:Boolean = false;
         if(_loc9_.count >= param5)
         {
            _loc10_ = true;
         }
         this.mainCharArrtibutePlane.setYijinjingLingwuInitialize_X(param7,true,_loc9_.res.name,param5,_loc10_,param6,param8);
         if(this.typeZF != 0)
         {
            _loc12_ = param2 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setYijinjingLingwuZhufuzhi_X(param2,param3,_loc12_);
         this.typeZF = param2;
         this.mainCharArrtibutePlane.setYijinjingLingwuGoods_X(_loc9_,_loc10_);
         this.autoKnowTimerFun();
      }
      
      public function upDataYiJinJignLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setYijinjingLingwuBtn_X(!this.isAuto);
            this.mainCharArrtibutePlane.showYijinjingLingWuPanel_X(false);
            this.senderProxy.send_51991(0);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setYijinjingLingwuBtn_X(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_51993(this.vo.nowLookingID);
         }
      }
      
      public function upDataXisuijingJindu(param1:XiSuiJingVO) : void
      {
         var _loc2_:Boolean = false;
         if(param1.nowID >= 10)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         this.mainCharArrtibutePlane.setXisuijingJinduNum(param1.jihuoJindu,_loc2_);
         var _loc3_:String = "";
         if(param1.jihuoJindu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param1.addJihuoGongji + " " + LanResManager.getLanCommonTextWords("防御:") + param1.addJihuoFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + param1.addJihuoShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洗髓经顶级激活属性（未激活）") + "</font>";
         }
         this.mainCharArrtibutePlane.menuXisuijingToolTip(_loc3_);
      }
   }
}

