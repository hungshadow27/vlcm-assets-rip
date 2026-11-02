package com.tgame.moudels.cangjingge.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cangjingge.model.Cangjingge_MsgSenderProxy;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Cangjingge_LingwuPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Cangjingge_LingwuPanelMediator";
      
      private var autoLingwuTimer:Timer = new Timer(100);
      
      private var lingwuClickTimer:Timer = new Timer(100,1);
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      private var _senderProxy:Cangjingge_MsgSenderProxy;
      
      public function Cangjingge_LingwuPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Cangjingge_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Cangjingge_MsgSenderProxy.NAME) as Cangjingge_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGJIE_KAISHITISHENG_CLICK,kaishiTishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGJIE_ZIDONGTISHENG_CLICK,zidongtishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGJIE_GOUMAI_CLICK,buyHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGJIE_KAISHITISHENG_CLICK,kaishiTishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGJIE_ZIDONGTISHENG_CLICK,zidongtishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGJIE_GOUMAI_CLICK,buyHandler);
         });
      }
      
      public function initializeUI(param1:String, param2:int, param3:int) : void
      {
         this.mainCharArrtibutePlane.setJingJieTuPoShuxing(param2,param3,param1);
      }
      
      public function setJingJieGoods(param1:Goods) : void
      {
         this.mainCharArrtibutePlane.setJingJieTuPoGoods(param1);
      }
      
      public function setJingJieZhufuzhi(param1:int, param2:int) : void
      {
         this.mainCharArrtibutePlane.setJingJieTuPoZhufuzhi(param1,param2);
      }
      
      private function kaishiTishengHandler(param1:Event) : void
      {
         if(this.lingwuClickTimer.running)
         {
            return;
         }
         this.stopAutoLingwu();
         var _loc2_:int = Cangjingge_PanelMediator.current_jingjie;
         this.senderProxy.send_52045(_loc2_ + 1);
         this.lingwuClickTimer.addEventListener(TimerEvent.TIMER,this.delayTimerHandler);
         this.lingwuClickTimer.start();
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.lingwuClickTimer.stop();
         this.lingwuClickTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.delayTimerHandler);
      }
      
      private function zidongtishengHandler(param1:BaseEvent) : void
      {
         var str:String;
         var e:BaseEvent = param1;
         var isAutoTisheng:Boolean = Boolean(e.data);
         if(!isAutoTisheng)
         {
            this.stopAutoLingwu();
            return;
         }
         str = LanResManager.getLanTextWords(Dugujiujian_LingwuPanelMediator,"您希望自动使用背包中的领悟道具领悟本阶招式1",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
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
         this.mainCharArrtibutePlane.setJingJieTuPoBtn(false);
         this.autoTimerHandler(null);
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
         this.mainCharArrtibutePlane.setJingJieTuPoBtn(true);
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = Cangjingge_PanelMediator.current_jingjie;
         this.senderProxy.send_52045(_loc3_ + 1);
         if(_loc2_ < this.xiaohaoNeedNum)
         {
            this.stopAutoLingwu();
         }
      }
      
      private function closeHandler(param1:BaseEvent) : void
      {
         this.stopAutoLingwu();
      }
      
      private function buyHandler(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
      
      public function lingwuSuccess() : void
      {
         this.stopAutoLingwu();
         this.mainCharArrtibutePlane.onJingJieShowLv(false);
         this.senderProxy.send_52041(0);
      }
      
      public function lingwuFail() : void
      {
         var _loc1_:int = Cangjingge_PanelMediator.current_jingjie;
         this.senderProxy.send_52043(_loc1_ + 1);
      }
      
      public function showLingwu(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.onJingJieShowLv(param1);
      }
   }
}

