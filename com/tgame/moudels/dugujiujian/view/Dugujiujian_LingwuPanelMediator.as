package com.tgame.moudels.dugujiujian.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.Dugujiujian_ApplicationFacade;
   import com.tgame.moudels.dugujiujian.model.Dugujiujian_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Dugujiujian_LingwuPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Dugujiujian_LingwuPanelMediator";
      
      private var autoLingwuTimer:Timer = new Timer(100);
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      public var xiaohaoZhenqi:int;
      
      private var _senderProxy:Dugujiujian_MsgSenderProxy;
      
      public function Dugujiujian_LingwuPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Dugujiujian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Dugujiujian_MsgSenderProxy.NAME) as Dugujiujian_MsgSenderProxy;
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
         switch(param1.getName())
         {
            case Dugujiujian_ApplicationFacade.REFREASH_DUGUJIUJIAN_INFO:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUJIUJIAN_KAISHITISHENG_CLICK,kaishiTishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICK,zidongtishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DUGUJIUJIAN_CLOSE,closeHandler);
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUJIUJIAN_KAISHITISHENG_CLICK,kaishiTishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUJIUJIAN_ZIDONGTISHENG_CLICK,zidongtishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DUGUJIUJIAN_CLOSE,closeHandler);
         });
      }
      
      private function dugujiujianPlaneHandle(param1:Event) : void
      {
         var _loc2_:Player = GameInstance.mainCharData;
         var _loc3_:AttributeInfo = _loc2_.attributeInfo;
         var _loc4_:String = param1.type;
         switch(_loc4_)
         {
            case CharAttribute.GETCHARATTRIBUTE:
               break;
            case CharAttribute.UI_CHARATTRIBUTE_ARRRIBUT_POINT_OK:
         }
      }
      
      public function initLingwuPanel(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:Boolean, param8:int) : void
      {
         this.mainCharArrtibutePlane.setJiujianLingwuInitialize(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setJiujianLingwuZhufuzhi(param1:int, param2:int, param3:*) : void
      {
         this.mainCharArrtibutePlane.setJiujianLingwuZhufuzhi(param1,param2,param3);
      }
      
      public function setJiujianLingwuGoods(param1:Goods) : void
      {
         this.mainCharArrtibutePlane.setJiujianLingwuGoods(param1);
      }
      
      public function setJiujianLingwuShuoming(param1:String) : void
      {
         this.mainCharArrtibutePlane.setJiujianLingwuShuoming(param1);
      }
      
      private function kaishiTishengHandler(param1:Event) : void
      {
         this.stopAutoLingwu();
         var _loc2_:int = Dugujiujian_PlaneMediator.curLevel;
         this.senderProxy.send_53265(_loc2_ + 1);
      }
      
      private function startAutoLingwu() : void
      {
         if(!this.autoLingwuTimer.running)
         {
            NoticeManager.notify(NoticeManager.FOOT,"已开始自动领悟！");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"已开始自动领悟！");
         }
         this.stopAutoLingwu();
         this.autoLingwuTimer.addEventListener(TimerEvent.TIMER,this.autoTimerHandler);
         this.autoLingwuTimer.start();
         this.mainCharArrtibutePlane.setJiujianLingwuBtn(false);
         this.autoTimerHandler(null);
      }
      
      public function yingcangLingwuPanel() : void
      {
         this.mainCharArrtibutePlane.onDuguJiujianShowLv(false);
         this.stopAutoLingwu();
      }
      
      public function lingwuSuccess() : void
      {
         this.mainCharArrtibutePlane.bofangDuguYanhua();
         this.yingcangLingwuPanel();
         this.senderProxy.send_53261();
      }
      
      public function lingwuFail() : void
      {
         var _loc1_:int = Dugujiujian_PlaneMediator.curLevel;
         this.senderProxy.send_53263(_loc1_ + 1);
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = Dugujiujian_PlaneMediator.curLevel;
         this.senderProxy.send_53265(_loc3_ + 1);
         var _loc4_:int = GameInstance.mainCharData.attributeInfo.gqNow;
         if(_loc2_ < this.xiaohaoNeedNum || _loc4_ < this.xiaohaoZhenqi)
         {
            this.stopAutoLingwu();
         }
      }
      
      private function stopAutoLingwu() : void
      {
         if(this.autoLingwuTimer.running)
         {
            NoticeManager.notify(NoticeManager.FOOT,"已停止自动领悟！");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"已停止自动领悟！");
         }
         this.autoLingwuTimer.stop();
         this.autoLingwuTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.autoTimerHandler);
         this.mainCharArrtibutePlane.setJiujianLingwuBtn(true);
      }
      
      private function zidongtishengHandler(param1:BaseEvent) : void
      {
         var str:String = null;
         var e:BaseEvent = param1;
         var data:Boolean = Boolean(e.data);
         if(data)
         {
            this.stopAutoLingwu();
         }
         else
         {
            str = LanResManager.getLanTextWords(this,"您希望自动使用背包中的领悟道具领悟本阶招式1",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动领悟");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  startAutoLingwu();
               }
            });
         }
      }
      
      private function removeHandler(param1:Event) : void
      {
         this.closeHandler(null);
      }
      
      private function closeHandler(param1:BaseEvent) : void
      {
         this.stopAutoLingwu();
         this.mainCharArrtibutePlane.onDuguJiujianShowLv(false);
      }
   }
}

