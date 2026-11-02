package com.tgame.moudels.liumaishenjian.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.liumaishenjian.info.LiumaishenjianVO;
   import com.tgame.moudels.liumaishenjian.model.Liumaishenjian_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Liumaishenjian_Mediator extends Mediator
   {
      
      public static const NAME:String = "Liumaishenjian_Mediator";
      
      private var vo:LiumaishenjianVO = new LiumaishenjianVO();
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var current_loockID:int;
      
      public var jianId:int;
      
      public var chongId:int;
      
      public var linwuId:int;
      
      public var isLingwu:int;
      
      private var typeZF:int;
      
      public var shuxingAay:Array = [];
      
      private var _senderProxy:Liumaishenjian_MsgSenderProxy;
      
      public function Liumaishenjian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Liumaishenjian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Liumaishenjian_MsgSenderProxy.NAME) as Liumaishenjian_MsgSenderProxy;
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
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.LIUMAISHENJIAN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENJIAN_EVENT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LIUMAISHENJIAN_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LIUMAISHENJIAN_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LIUMAISHENJIAN_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LIUMAISHENJIAN_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LIUMAISHENJIAN_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LIUMAISHENJIAN_SKILL_DRAG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_LIUMAISHENJIAN_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.LIUMAISHENJIAN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENJIAN_EVENT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LIUMAISHENJIAN_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LIUMAISHENJIAN_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LIUMAISHENJIAN_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LIUMAISHENJIAN_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LIUMAISHENJIAN_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LIUMAISHENJIAN_SKILL_DRAG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_LIUMAISHENJIAN_GOUMAI_CLICK,handler);
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
               this.mainCharArrtibutePlane.ShowTupo(false);
               break;
            case CharAttribute.LIUMAISHENJIAN:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 69)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有69级及以上玩家才可以修炼六脉神剑"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有69级及以上玩家才可以修炼六脉神剑"));
               }
               else
               {
                  this.senderProxy.send_54401(0);
               }
               break;
            case CharAttribute.UI_SHENJIAN_EVENT_CLICK:
               this.current_loockID = int(evt.data);
               this.senderProxy.send_54401(this.current_loockID);
               if(this.mainCharArrtibutePlane.reManbanBo())
               {
                  this.mainCharArrtibutePlane.ShowTupo(false);
               }
               break;
            case CharAttribute.UI_LIUMAISHENJIAN_XIULIAN_CLICK:
               this.senderProxy.send_54405([this.jianId,this.chongId]);
               break;
            case CharAttribute.UI_LIUMAISHENJIAN_PREVIOUS_CLICK:
               this.senderProxy.send_54403([this.jianId,this.chongId - 1 <= 1 ? 1 : this.chongId - 1]);
               break;
            case CharAttribute.UI_LIUMAISHENJIAN_NEXT_CLICK:
               this.senderProxy.send_54403([this.jianId,this.chongId + 1 >= 10 ? 10 : this.chongId + 1]);
               break;
            case CharAttribute.UI_LIUMAISHENJIAN_KAISHITISHENG_CLICKJ:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_54407({
                  "jianId":this.jianId,
                  "chongId":(this.linwuId + 1 >= 10 ? 10 : this.linwuId + 1)
               });
               this.mainCharArrtibutePlane.setLiumaishenjianTupoBtn(!this.isAuto);
               break;
            case CharAttribute.UI_LIUMAISHENJIAN_ZIDONGTISHENG_CLICKJ:
               b = evt.data as Boolean;
               if(b)
               {
                  str = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您希望自动使用背包中的修炼道具修炼本阶招式？") + "</font>\n\n" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当遇到以下情况时系统会中止自动提升过程：") + "\n" + LanResManager.getLanCommonTextWords("1.背包中剩余的修炼道具已全部使用完毕") + "\n" + LanResManager.getLanCommonTextWords("2.成功修炼了本式") + "\n" + LanResManager.getLanCommonTextWords("3.您点击了停止修炼按钮或关闭了修炼面板") + "</font>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动修炼");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_54407({
                              "jianId":jianId,
                              "chongId":(linwuId + 1 >= 10 ? 10 : linwuId + 1)
                           });
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setLiumaishenjianTupoBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setLiumaishenjianTupoBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_LIUMAISHENJIAN_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.UI_LIUMAISHENJIAN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
         }
      }
      
      public function initializeMainUI(param1:LiumaishenjianVO) : void
      {
         var _loc4_:String = null;
         this.mainCharArrtibutePlane.showLiuMaiShenJian();
         this.mainCharArrtibutePlane.setLiumaishenjianJianshuBtn(param1.shenjianAry);
         this.mainCharArrtibutePlane.setLiumaishenjianSkill(param1.skillList);
         this.mainCharArrtibutePlane.setLiumaishenjianMiaoshu(param1.miaoshuFta);
         this.mainCharArrtibutePlane.setLiumaishenjianShuxingNum(param1.shuxingNumAry,param1.shuxingNumTotalAry);
         this.mainCharArrtibutePlane.setLiumaishenjianDengji(param1.nowLookingShenjianID,param1.nowLookingChongshuNum,param1.lingWuNum + 1,param1.isLingwu);
         this.mainCharArrtibutePlane.loadLiumaishenjianPicture(param1.nowLookingShenjianID);
         this.mainCharArrtibutePlane.lmsjJiHuoStatus(GameState.dictMainStatus[40632]);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < param1.shenjianAry.length)
         {
            _loc4_ = "";
            _loc4_ = LanResManager.getLanCommonTextWords("名称：") + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.shenjianAry[_loc3_].name + "</font><br>" + LanResManager.getLanCommonTextWords("修炼状态：");
            if(param1.shenjianAry[_loc3_].id < param1.nowLingwuShenjianID)
            {
               _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第三重") + "</font>";
            }
            else if(param1.shenjianAry[_loc3_].id == param1.nowLingwuShenjianID)
            {
               if(param1.nowLingwuShenjianNum == 1)
               {
                  _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第一重") + "</font>";
               }
               else if(param1.nowLingwuShenjianNum == 2)
               {
                  _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第二重") + "</font>";
               }
               else if(param1.nowLingwuShenjianNum == 3)
               {
                  _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第三重") + "</font>";
               }
            }
            else if(param1.shenjianAry[_loc3_].id > param1.nowLingwuShenjianID)
            {
               _loc4_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("未修炼") + "</font>";
            }
            _loc4_ += "<br>" + LanResManager.getLanCommonTextWords("修炼前提：");
            if(_loc3_ == 0)
            {
               _loc4_ += "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("无") + "</font>";
            }
            else
            {
               _loc4_ += "<font color = \'" + StaticValue.GREEN_HTML + "\'>" + param1.shenjianAry[_loc3_ - 1].name + LanResManager.getLanCommonTextWords("修炼至第三重") + "</font>";
            }
            _loc2_.push(_loc4_);
            _loc3_++;
         }
         this.mainCharArrtibutePlane.menuLiumaishenjianJianToolTip(_loc2_);
      }
      
      public function btnUpDataLiumaishenjianLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int) : void
      {
         var _loc14_:Array = [];
         var _loc15_:Array = [];
         var _loc16_:Object = new Object();
         var _loc17_:Object = new Object();
         _loc16_.act = param4;
         _loc16_.def = param5;
         _loc16_.hp = param6;
         _loc16_.mp = param7;
         _loc16_.cp = param8;
         _loc14_.push(_loc16_);
         _loc17_.actMax = param9;
         _loc17_.defMax = param10;
         _loc17_.hpMax = param11;
         _loc17_.mpMax = param12;
         _loc17_.cpMax = param13;
         _loc15_.push(_loc17_);
         this.mainCharArrtibutePlane.setLiumaishenjianShuxingNum(_loc14_,_loc15_);
         this.mainCharArrtibutePlane.setLiumaishenjianDengji(param1,param2,param3 + 1,this.isLingwu);
      }
      
      public function upDataLiumaishenjianLV(param1:int, param2:int, param3:String, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int) : void
      {
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc10_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param7,true);
         var _loc11_:Boolean = false;
         if(_loc10_.count >= param8)
         {
            _loc11_ = true;
         }
         this.mainCharArrtibutePlane.setLiumaishenjianTupoInitialize(param6,true,_loc10_.res.name,param8,_loc11_,param9,param3);
         if(this.typeZF != 0)
         {
            _loc13_ = param4 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setLiumaishenjianTupoZhufuzhi(param4,param5,_loc13_);
         this.typeZF = param4;
         this.mainCharArrtibutePlane.setLiumaishenjianTupoGoods(_loc10_,_loc11_);
         this.autoKnowTimerFun();
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
               senderProxy.send_54407({
                  "jianId":jianId,
                  "chongId":(linwuId + 1 >= 10 ? 10 : linwuId + 1)
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
      
      public function upDataLiumaishenjianLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setLiumaishenjianTupoBtn(!this.isAuto);
            this.mainCharArrtibutePlane.ShowTupo(false);
            this.typeZF = 0;
            this.senderProxy.send_54401(0);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setLiumaishenjianTupoBtn(!this.isAuto);
            this.senderProxy.send_54405([this.jianId,this.chongId]);
         }
         else
         {
            this.senderProxy.send_54405([this.jianId,this.chongId]);
         }
      }
   }
}

