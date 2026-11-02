package com.tgame.moudels.feilongtanyunshou.view
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
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.feilongtanyunshou.FeiLongTanYunShou_ApplicationFacade;
   import com.tgame.moudels.feilongtanyunshou.model.FeiLongTanYunShou_MsgSenderProxy;
   import com.tgame.moudels.feilongtanyunshou.model.info.FeiLongTanYunShouVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FeiLongTanYunShou_Mediator extends Mediator
   {
      
      public static const NAME:String = "FeiLongTanYunShou_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:FeiLongTanYunShouVO;
      
      private var autoKnowTimer:Timer;
      
      private var tempJY:int;
      
      private var typeZF:int;
      
      private var _senderProxy:FeiLongTanYunShou_MsgSenderProxy;
      
      public function FeiLongTanYunShou_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : FeiLongTanYunShou_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(FeiLongTanYunShou_MsgSenderProxy.NAME) as FeiLongTanYunShou_MsgSenderProxy;
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
         return [FeiLongTanYunShou_ApplicationFacade.GOODS_CHANGED,FeiLongTanYunShou_ApplicationFacade.FEILONG_DINGJI_JIHUO_SHUXING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case FeiLongTanYunShou_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isFeilongtanyunshoutupoCanvasShow_X() && Boolean(this.vo))
               {
                  this.senderProxy.send_53953(this.vo.nowLookingID);
               }
               break;
            case FeiLongTanYunShou_ApplicationFacade.FEILONG_DINGJI_JIHUO_SHUXING:
               if(_loc2_.type == 4)
               {
                  this.senderProxy.send_53951(0);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.FEILONGTANYUNSHOU,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_SHIFOUSHIYONG_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.FEILONGTANYUNSHOU,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FEILONGTANYUNSHOU_SHIFOUSHIYONG_CLICK,handler);
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
               this.mainCharArrtibutePlane.showFeiLongTanYunShouLingWuPanel(false);
               break;
            case CharAttribute.FEILONGTANYUNSHOU:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 66)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有66级及以上玩家才可以修炼飞龙探云手"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有66级及以上玩家才可以修炼飞龙探云手"));
               }
               else
               {
                  this.senderProxy.send_53951(0);
               }
               break;
            case CharAttribute.UI_FEILONGTANYUNSHOU_LINGWU_SHOW:
               this.senderProxy.send_53953(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_FEILONGTANYUNSHOU_PREVIOUS_CLICK:
               this.senderProxy.send_53951(this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1);
               break;
            case CharAttribute.UI_FEILONGTANYUNSHOU_NEXT_CLICK:
               this.senderProxy.send_53951(this.vo.nowLookingID + 1 >= 15 ? 15 : this.vo.nowLookingID + 1);
               break;
            case CharAttribute.UI_FEILONGTANYUNSHOU_KAISHITISHENG_CLICKJ:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_53955({
                  "id":(this.vo.nowID + 1 >= 15 ? 15 : this.vo.nowID),
                  "isNow":false
               });
               this.mainCharArrtibutePlane.setFeilongtanyunshouLingwuBtn_X(!this.isAuto);
               break;
            case CharAttribute.UI_FEILONGTANYUNSHOU_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_53955({
                              "id":(vo.nowID + 1 >= 15 ? 15 : vo.nowID),
                              "isNow":false
                           });
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setFeilongtanyunshouLingwuBtn_X(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setFeilongtanyunshouLingwuBtn_X(!this.isAuto);
               }
               break;
            case CharAttribute.UI_FEILONGTANYUNSHOU_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_FEILONGTANYUNSHOU_SHIFOUSHIYONG_CLICK:
               this.senderProxy.send_53963(evt.data);
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
               senderProxy.send_53955({
                  "id":(vo.nowID + 1 >= 15 ? 15 : vo.nowID),
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
      
      public function upDataPanel(param1:FeiLongTanYunShouVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showFeiLongTanYunShou();
         this.mainCharArrtibutePlane.setFeiLongTanYunShouInitialize(this.vo);
         this.mainCharArrtibutePlane.setFeiLongJiHuo(GameState.dictMainStatus[40739]);
         this.mainCharArrtibutePlane.setCHK_HLZ(this.vo.YN_QixuanState);
         this.mainCharArrtibutePlane.showYN_HLZ(this.vo.YN_Qixuan);
         this.mainCharArrtibutePlane.setXunzhangYN_FLTYS(this.selectXunzhang());
      }
      
      public function selectXunzhang() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:Array = GameInstance.mainCharData.goodsInfo.goodsBodyArr;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].res.position == ItemPositionRange.POSITION_HUOLONGZHU || _loc2_[_loc3_].res.position == ItemPositionRange.POSITION_20180926XUNZHANG_94)
            {
               _loc1_.push(_loc2_[_loc3_]);
            }
            _loc3_++;
         }
         return _loc1_;
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
         this.mainCharArrtibutePlane.setFeilongtanyunshouLingwuInitialize_X(param6,true,_loc10_.res.name,param8,_loc11_,param9,param2);
         if(this.typeZF != 0)
         {
            _loc13_ = param3 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setFeilongtanyunshouLingwuZhufuzhi_X(param3,param4,_loc13_);
         this.typeZF = param3;
         this.mainCharArrtibutePlane.setFeilongtanyunshouLingwuGoods_X(_loc10_,_loc11_);
         this.autoKnowTimerFun();
      }
      
      public function upDataYiJinJignLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setFeilongtanyunshouLingwuBtn_X(!this.isAuto);
            this.mainCharArrtibutePlane.showFeiLongTanYunShouLingWuPanel(false);
            this.senderProxy.send_53951(0);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setFeilongtanyunshouLingwuBtn_X(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_53953(this.vo.nowLookingID);
         }
      }
      
      public function KaiQiFeilongTanYueShou(param1:int) : void
      {
         GameInstance.mainCharData.feilongInfo.isUseSkill = param1;
         var _loc2_:Boolean = param1 == 1 ? true : false;
         this.mainCharArrtibutePlane.setFeiongtanyunshouUse(_loc2_);
      }
      
      public function upDataFeilongJindu(param1:FeiLongTanYunShouVO) : void
      {
         var _loc2_:Boolean = false;
         if(param1.nowID >= 15)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         this.mainCharArrtibutePlane.setFeilongJinduNum(param1.jihuoJindu,_loc2_);
         var _loc3_:String = "";
         if(param1.jihuoJindu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param1.addJihuoGongji + " " + LanResManager.getLanCommonTextWords("防御:") + param1.addJihuoFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + param1.addJihuoShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("飞龙探云手顶级激活属性（未激活）") + "</font>";
         }
         this.mainCharArrtibutePlane.menuFeilongToolTip(_loc3_);
      }
   }
}

