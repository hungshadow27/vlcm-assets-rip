package com.tgame.moudels.yiJinJing.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.yiJinJing.YiJinJing_ApplicationFacade;
   import com.tgame.moudels.yiJinJing.model.YiJinJing_MsgSenderProxy;
   import com.tgame.moudels.yiJinJing.model.info.YiJinJingVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YiJinJing_Mediator extends Mediator
   {
      
      public static const NAME:String = "YiJinJing_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:YiJinJingVO;
      
      private var autoKnowTimer:Timer;
      
      private var tempJY:int;
      
      private var typeZF:int;
      
      private var _senderProxy:YiJinJing_MsgSenderProxy;
      
      public function YiJinJing_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : YiJinJing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YiJinJing_MsgSenderProxy.NAME) as YiJinJing_MsgSenderProxy;
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
         return [YiJinJing_ApplicationFacade.GOODS_CHANGED,YiJinJing_ApplicationFacade.USE_ITEM_JIYUAN_UP];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YiJinJing_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isYijinjingtupoCanvasShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_51953(this.vo.nowLookingID);
               }
               break;
            case YiJinJing_ApplicationFacade.USE_ITEM_JIYUAN_UP:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isYijinjingtupoCanvasShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_51953(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETYIJINJING,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.YIJINJING_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_ZHIJIETISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_SKILL_DRAG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YIJINJING_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETYIJINJING,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.YIJINJING_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_ZHIJIETISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_SKILL_DRAG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YIJINJING_GOUMAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var str:String = null;
         var itemFace:ItemFace = null;
         var id:uint = 0;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showYijinjingLingWuPanel(false);
               break;
            case CharAttribute.GETYIJINJING:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 61)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有级及以上玩家才可以修炼易筋经"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有级及以上玩家才可以修炼易筋经"));
               }
               else
               {
                  this.senderProxy.send_51951(0);
               }
               break;
            case CharAttribute.YIJINJING_LINGWU_SHOW:
               this.senderProxy.send_51953(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_YIJINJING_SHANGYIYE_CLICK:
               this.senderProxy.send_51951(this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1);
               break;
            case CharAttribute.UI_YIJINJING_XIAYIYE_CLICK:
               this.senderProxy.send_51951(this.vo.nowLookingID + 1 >= 12 ? 12 : this.vo.nowLookingID + 1);
               break;
            case CharAttribute.UI_YIJINJING_KAISHITISHENG_CLICKJ:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_51955({
                  "id":(this.vo.nowID + 1 >= 12 ? 12 : this.vo.nowID),
                  "isNow":false
               });
               this.mainCharArrtibutePlane.setYijinjingLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_YIJINJING_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_51955({
                              "id":(vo.nowID + 1 >= 12 ? 12 : vo.nowID),
                              "isNow":false
                           });
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setYijinjingLingwuBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setYijinjingLingwuBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_YIJINJING_ZHIJIETISHENG_CLICKJ:
               str = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("您希望直接领悟本招式吗？") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("直接领悟不会消耗任何道具，并且一定成功。成功后会清空当前的机缘值和祝福值。");
               FAlert.show(str,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     senderProxy.send_51955({
                        "id":(vo.nowID + 1 >= 12 ? 12 : vo.nowID),
                        "isNow":true
                     });
                  }
               });
               break;
            case CharAttribute.UI_YIJINJING_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.UI_YIJINJING_GOUMAI_CLICK:
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
               senderProxy.send_51955({
                  "id":(vo.nowID + 1 >= 12 ? 12 : vo.nowID),
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
      
      public function upDataPanel(param1:YiJinJingVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showYiJinJing();
         this.mainCharArrtibutePlane.setYijinjingInitialize(this.vo);
         var _loc2_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_DONGFANG1] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_DONGFANG1]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_NANFANG2] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_NANFANG2]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_XIFANG3] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_XIFANG3]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_BEIFANG4] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_YIJINJING_BEIFANG4]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_XICHUANHONGMIANBAIHUAPAO] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_XICHUANHONGMIANBAIHUAPAO]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115NIZHUANYIJINJING] != undefined)
         {
            _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115NIZHUANYIJINJING]);
         }
         this.mainCharArrtibutePlane.set_YiJinJing(_loc2_);
      }
      
      public function upDataYiJinJignLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:String) : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param6,true);
         var _loc11_:Boolean = false;
         if(_loc10_.count >= param7)
         {
            _loc11_ = true;
         }
         this.mainCharArrtibutePlane.setYijinjingLingwuInitialize(param9,true,_loc10_.res.name,param7,_loc11_,param8);
         if(GameInstance.mainCharData.buffInfo.hasBuff(OtherConst.BUFF_YI_JING_JING))
         {
            param2 += 100;
         }
         if(this.tempJY != 0)
         {
            _loc12_ = param4 - this.tempJY;
         }
         if(this.typeZF != 0)
         {
            _loc13_ = param2 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setYijinjingLingwuJiyuanzhi(param4,param5,_loc12_);
         this.mainCharArrtibutePlane.setYijinjingLingwuZhufuzhi(param2,param3,_loc13_);
         this.tempJY = param4;
         this.typeZF = param2;
         this.mainCharArrtibutePlane.setYijinjingLingwuGoods(_loc10_,_loc11_);
         this.autoKnowTimerFun();
      }
      
      public function upDataYiJinJignLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setYijinjingLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showYijinjingLingWuPanel(false);
            this.senderProxy.send_51951(0);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setYijinjingLingwuBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_51953(this.vo.nowLookingID);
         }
      }
   }
}

