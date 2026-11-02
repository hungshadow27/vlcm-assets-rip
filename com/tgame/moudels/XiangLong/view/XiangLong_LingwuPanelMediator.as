package com.tgame.moudels.XiangLong.view
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
   import com.tgame.moudels.XiangLong.model.XiangLong_MsgSenderProxy;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiangLong_LingwuPanelMediator extends Mediator
   {
      
      public static const NAME:String = "XiangLong_LingwuPanelMediator";
      
      private var autoLingwuTimer:Timer = new Timer(100);
      
      private var lingwuClickTimer:Timer = new Timer(100,1);
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      private var _senderProxy:XiangLong_MsgSenderProxy;
      
      public function XiangLong_LingwuPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiangLong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiangLong_MsgSenderProxy.NAME) as XiangLong_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_KAISHITISHENG_CLICKJ,kaishiTishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_ZIDONGTISHENG_CLICKJ,zidongtishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_CLOSEJ,closeHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_GOUMAI_CLICK,buyHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_KAISHITISHENG_CLICKJ,kaishiTishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_ZIDONGTISHENG_CLICKJ,zidongtishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_CLOSEJ,closeHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIANGLONGSHIBAZHANG_GOUMAI_CLICK,buyHandler);
         });
      }
      
      public function initializeUI(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.mainCharArrtibutePlane.setInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.mainCharArrtibutePlane.setShuoming(param1);
      }
      
      public function setXiangLongShiBaZahangGoods(param1:Goods, param2:Boolean) : void
      {
         this.mainCharArrtibutePlane.setXiangLongShiBaZahangGoods(param1,param2);
      }
      
      public function setXiangLongShiBaZahangZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this.mainCharArrtibutePlane.setXiangLongShiBaZahangZhufuzhi(param1,param2,param3);
      }
      
      private function kaishiTishengHandler(param1:Event) : void
      {
         if(this.lingwuClickTimer.running)
         {
            return;
         }
         this.stopAutoLingwu();
         var _loc2_:int = XiangLong_PlaneMediator.xianglongVO.curLearnLevel;
         this.senderProxy.send_51905(_loc2_ + 1);
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
         this.mainCharArrtibutePlane.setBtn(false);
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
         this.mainCharArrtibutePlane.setBtn(true);
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = XiangLong_PlaneMediator.xianglongVO.curLearnLevel;
         this.senderProxy.send_51905(_loc3_ + 1);
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
         this.mainCharArrtibutePlane.closeMiniPanel();
         this.senderProxy.send_51901(0);
      }
      
      public function lingwuFail(param1:int) : void
      {
         if(param1 == 2)
         {
            this.stopAutoLingwu();
         }
         var _loc2_:int = XiangLong_PlaneMediator.xianglongVO.curLearnLevel;
         this.senderProxy.send_51903(_loc2_ + 1);
      }
   }
}

