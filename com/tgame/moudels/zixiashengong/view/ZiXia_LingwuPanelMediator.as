package com.tgame.moudels.zixiashengong.view
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
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.zixiashengong.ZiXia_ApplicationFacade;
   import com.tgame.moudels.zixiashengong.model.ZiXia_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZiXia_LingwuPanelMediator extends Mediator
   {
      
      public static const NAME:String = "ZiXia_LingwuPanelMediator";
      
      private var autoLingwuTimer:Timer = new Timer(100);
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      public var xiaohaoZhenqi:int;
      
      public var typeZF:int = 0;
      
      private var _senderProxy:ZiXia_MsgSenderProxy;
      
      public function ZiXia_LingwuPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : ZiXia_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZiXia_MsgSenderProxy.NAME) as ZiXia_MsgSenderProxy;
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
         return [ZiXia_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZiXia_ApplicationFacade.REFRESH_ZIXIASHENGONG_INFO:
               break;
            case ZiXia_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.zixiashengong.tupoBo)
               {
                  this.senderProxy.send_57383(ZiXia_PlaneMediator.curLevel + 1);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZIXIASHENGONG_KAISHITISHENG_CLICKJ,kaishiTishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZIXIASHENGONG_ZIDONGTISHENG_CLICKJ,zidongtishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZIXIASHENGONG_CLOSEJ,closeHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ZIXIASHENGONG_GOUMAI_CLICK,PurchaseFunction);
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZIXIASHENGONG_KAISHITISHENG_CLICKJ,kaishiTishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZIXIASHENGONG_ZIDONGTISHENG_CLICKJ,zidongtishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZIXIASHENGONG_CLOSEJ,closeHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ZIXIASHENGONG_GOUMAI_CLICK,PurchaseFunction);
         });
      }
      
      private function PurchaseFunction(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:uint = uint(_loc2_.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc3_,0]);
      }
      
      public function initLingwuPanel(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.mainCharArrtibutePlane.setZixiaInitializeTupo(param1,param2,param3,param4,param5,param6);
      }
      
      public function setZixiaLingwuZhufuzhi(param1:int, param2:int, param3:*) : void
      {
         var _loc4_:int = 0;
         if(this.typeZF != 0)
         {
            _loc4_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setZiXiaShenGongZhufuzhi(param1,param2,_loc4_);
         this.typeZF = param1;
      }
      
      public function setZixiaLingwuGoods(param1:Goods) : void
      {
         this.mainCharArrtibutePlane.setZiXiaShenGongGoods(param1);
      }
      
      private function kaishiTishengHandler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Boolean = _loc2_.data as Boolean;
         this.stopAutoLingwu();
         var _loc4_:int = ZiXia_PlaneMediator.curLevel;
         if(_loc3_)
         {
            this.senderProxy.send_57385(-1);
         }
         else
         {
            this.senderProxy.send_57385(_loc4_ + 1);
         }
      }
      
      private function startAutoLingwu() : void
      {
         if(!this.autoLingwuTimer.running)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已开始自动领悟！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已开始自动领悟！"));
         }
         this.stopAutoLingwu();
         this.autoLingwuTimer.addEventListener(TimerEvent.TIMER,this.autoTimerHandler);
         this.autoLingwuTimer.start();
         this.mainCharArrtibutePlane.setZiXiaShenGongBtn(false);
         this.autoTimerHandler(null);
      }
      
      public function yingcangLingwuPanel() : void
      {
         this.mainCharArrtibutePlane.onZiXiaShenGongShowLv(false);
         this.stopAutoLingwu();
      }
      
      public function lingwuSuccess() : void
      {
         this.yingcangLingwuPanel();
         this.typeZF = 0;
         this.senderProxy.send_57381();
      }
      
      public function lingwuFail() : void
      {
         var _loc1_:int = ZiXia_PlaneMediator.curLevel;
         this.senderProxy.send_57383(_loc1_ + 1);
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = ZiXia_PlaneMediator.curLevel;
         this.senderProxy.send_57385(_loc3_ + 1);
         var _loc4_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(9298,true);
         if(_loc2_ < this.xiaohaoNeedNum && _loc4_ < this.xiaohaoNeedNum)
         {
            this.stopAutoLingwu();
         }
      }
      
      private function stopAutoLingwu() : void
      {
         if(this.autoLingwuTimer.running)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已停止自动领悟！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已停止自动领悟！"));
         }
         this.autoLingwuTimer.stop();
         this.autoLingwuTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.autoTimerHandler);
         this.mainCharArrtibutePlane.setZiXiaShenGongBtn(true);
      }
      
      private function zidongtishengHandler(param1:BaseEvent) : void
      {
         var str:String = null;
         var e:BaseEvent = param1;
         var data:Boolean = Boolean(e.data);
         if(!data)
         {
            this.stopAutoLingwu();
         }
         else
         {
            str = LanResManager.getLanTextWords(Dugujiujian_LingwuPanelMediator,"您希望自动使用背包中的领悟道具领悟本阶招式1",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
            FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动领悟");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  if(mainCharArrtibutePlane.zixiashengong.tupoBo)
                  {
                     startAutoLingwu();
                  }
                  else
                  {
                     stopAutoLingwu();
                  }
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
         this.mainCharArrtibutePlane.onZiXiaShenGongShowLv(false);
      }
   }
}

