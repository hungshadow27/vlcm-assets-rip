package com.tgame.moudels.jiuyinzhenjing.view
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
   import com.tgame.moudels.JiuYangShenGong.JiuYangShenGong_ApplicationFacade;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.jiuyinzhenjing.model.JiuYinZhenJing_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JiuYinZhenJing_LingwuPanelMediator extends Mediator
   {
      
      public static const NAME:String = "JiuYinZhenJing_LingwuPanelMediator";
      
      private var autoLingwuTimer:Timer = new Timer(100);
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      public var xiaohaoZhenqi:int;
      
      private var _senderProxy:JiuYinZhenJing_MsgSenderProxy;
      
      public function JiuYinZhenJing_LingwuPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : JiuYinZhenJing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JiuYinZhenJing_MsgSenderProxy.NAME) as JiuYinZhenJing_MsgSenderProxy;
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
            case JiuYangShenGong_ApplicationFacade.REFRESH_JIUYANGSHENGONG_INFO:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JIUYINZHENJING_KAISHITISHENG_CLICKJ,kaishiTishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JIUYINZHENJING_ZIDONGTISHENG_CLICKJ,zidongtishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JIUYINZHENJING_CLOSE,closeHandler);
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JIUYINZHENJING_KAISHITISHENG_CLICKJ,kaishiTishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JIUYINZHENJING_ZIDONGTISHENG_CLICKJ,zidongtishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JIUYINZHENJING_CLOSE,closeHandler);
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
      
      public function setJiuyinzhenjingTupoInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.mainCharArrtibutePlane.setJiuyinzhenjingTupoInitialize(param1,param2,param3,param4,param5,param6);
      }
      
      public function setJiujianLingwuZhufuzhi(param1:int, param2:int, param3:*) : void
      {
         this.mainCharArrtibutePlane.setJiuyinzhenjingZhufuzhi(param1,param2,param3);
      }
      
      public function setJiujianLingwuGoods(param1:Goods) : void
      {
         this.mainCharArrtibutePlane.setJiuyinzhenjingGoods(param1);
      }
      
      public function setJiujianLingwuShuoming(param1:String) : void
      {
         this.mainCharArrtibutePlane.setJiuyinzhenjingShuoming(param1);
      }
      
      private function kaishiTishengHandler(param1:Event) : void
      {
         this.stopAutoLingwu();
         var _loc2_:int = JiuYinZhenJing_PlaneMediator.curLevel;
         this.senderProxy.send_54105(_loc2_ + 1);
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
         this.mainCharArrtibutePlane.setJiuyinzhenjingBtn(false);
         this.autoTimerHandler(null);
      }
      
      public function yingcangLingwuPanel() : void
      {
         this.mainCharArrtibutePlane.onJiuyinzhenjingShowLv(false);
         this.stopAutoLingwu();
      }
      
      public function lingwuSuccess() : void
      {
         this.mainCharArrtibutePlane.bofangJiuyinYanhuaJ();
         this.yingcangLingwuPanel();
         this.senderProxy.send_54101();
      }
      
      public function lingwuFail() : void
      {
         var _loc1_:int = JiuYinZhenJing_PlaneMediator.curLevel;
         this.senderProxy.send_54103(_loc1_ + 1);
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = JiuYinZhenJing_PlaneMediator.curLevel;
         this.senderProxy.send_54105(_loc3_ + 1);
         var _loc4_:int = GameInstance.mainCharData.attributeInfo.gqNow;
         if(_loc2_ < this.xiaohaoNeedNum)
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
         this.mainCharArrtibutePlane.setJiuyinzhenjingBtn(true);
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
      }
      
      private function removeHandler(param1:Event) : void
      {
         this.closeHandler(null);
      }
      
      private function closeHandler(param1:BaseEvent) : void
      {
         this.stopAutoLingwu();
         this.mainCharArrtibutePlane.setJiuyinzhenjingBtn(false);
      }
      
      public function setShowItem(param1:Array) : void
      {
      }
   }
}

