package com.tgame.moudels.shibatongren.view
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
   import com.tgame.moudels.shibatongren.model.ShiBaTongRen_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShiBatongren_ChuangguanPanelMediator extends Mediator
   {
      
      public static const NAME:String = "ShiBatongren_ChuangguanPanelMediator";
      
      private var autoLingwuTimer:Timer = new Timer(100);
      
      private var lingwuClickTimer:Timer = new Timer(100,1);
      
      private var _xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      private var _senderProxy:ShiBaTongRen_MsgSenderProxy;
      
      public function ShiBatongren_ChuangguanPanelMediator()
      {
         super(NAME);
      }
      
      public function get xiaohaoGoodsId() : int
      {
         return this._xiaohaoGoodsId;
      }
      
      public function set xiaohaoGoodsId(param1:int) : void
      {
         this._xiaohaoGoodsId = param1;
      }
      
      private function get senderProxy() : ShiBaTongRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ShiBaTongRen_MsgSenderProxy.NAME) as ShiBaTongRen_MsgSenderProxy;
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
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN_KAISHI,onChuangGuanBegin);
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN_ZIDONG,onChuangGuanZidong);
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHIBATONGREN_GOUMAI_CLICK,onGouMaiClick);
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN_CLOSE,onClose);
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN_KAISHI,onChuangGuanBegin);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN_ZIDONG,onChuangGuanZidong);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHIBATONGREN_GOUMAI_CLICK,onGouMaiClick);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHIBATONGREN_CHUANGGUAN_CLOSE,onClose);
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
         });
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         this.stopAutoChuangGuan();
      }
      
      private function onChuangGuanBegin(param1:BaseEvent) : void
      {
         if(this.lingwuClickTimer.running)
         {
            return;
         }
         this.stopAutoChuangGuan();
         var _loc2_:int = ShiBatongren_PanelMediator.tongrenVO.learnedSkillID;
         this.senderProxy.send_54505(_loc2_ + 1);
         this.lingwuClickTimer.addEventListener(TimerEvent.TIMER,this.delayTimerHandler);
         this.lingwuClickTimer.start();
      }
      
      private function delayTimerHandler(param1:TimerEvent) : void
      {
         this.lingwuClickTimer.stop();
         this.lingwuClickTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.delayTimerHandler);
      }
      
      private function onChuangGuanZidong(param1:BaseEvent) : void
      {
         var str:String;
         var e:BaseEvent = param1;
         var isAutoTisheng:Boolean = Boolean(e.data);
         if(!isAutoTisheng)
         {
            this.stopAutoChuangGuan();
            return;
         }
         str = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您希望自动使用背包中的闯关道具进行闯关？") + "</font>\n\n<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当遇到以下情况时系统会中止自动闯关过程：背包中剩余的闯关道具已全部使用完毕闯关成功您点击了停止闯关按钮或关闭了闯关面板") + "</font>";
         FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动闯关");
         FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               startAutoChuangGuan();
            }
         });
      }
      
      private function startAutoChuangGuan() : void
      {
         if(!this.autoLingwuTimer.running)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已开始自动闯关！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已开始自动闯关！"));
         }
         this.stopAutoChuangGuan();
         this.autoLingwuTimer.addEventListener(TimerEvent.TIMER,this.autoTimerHandler);
         this.autoLingwuTimer.start();
         this.mainCharArrtibutePlane.setBtnSBTR(false);
         this.autoTimerHandler(null);
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = ShiBatongren_PanelMediator.tongrenVO.learnedSkillID;
         this.senderProxy.send_54505(_loc3_ + 1);
         if(_loc2_ < this.xiaohaoNeedNum)
         {
            this.stopAutoChuangGuan();
         }
      }
      
      public function stopAutoChuangGuan() : void
      {
         if(this.autoLingwuTimer.running)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已停止自动闯关！"));
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已停止自动闯关！"));
         }
         this.autoLingwuTimer.stop();
         this.autoLingwuTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,this.autoTimerHandler);
         this.mainCharArrtibutePlane.setBtnSBTR(true);
      }
      
      private function onGouMaiClick(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
      
      private function onClose(param1:BaseEvent) : void
      {
         this.mainCharArrtibutePlane.showShiBaTongRenLingWuPanel(false);
         this.stopAutoChuangGuan();
      }
      
      public function showChuangGuan() : void
      {
         this.mainCharArrtibutePlane.showShiBaTongRenLingWuPanel(true);
      }
      
      public function closeChuangGuan() : void
      {
         this.mainCharArrtibutePlane.showShiBaTongRenLingWuPanel(false);
      }
      
      public function setZhufuzhi(param1:int, param2:int, param3:int) : void
      {
         this.mainCharArrtibutePlane.setShiBaTongRenZhufuzhi(param1,param2,param3);
      }
      
      public function setGoods(param1:Goods, param2:Boolean) : void
      {
         this.mainCharArrtibutePlane.setShiBaTongRenGoods(param1,param2);
      }
      
      public function setShuoming(param1:String) : void
      {
         this.mainCharArrtibutePlane.setShuomingSBTR(param1);
      }
      
      public function chuangGuanSuccess() : void
      {
         this.stopAutoChuangGuan();
         this.mainCharArrtibutePlane.showShiBaTongRenLingWuPanel(false);
         this.senderProxy.send_54501({
            "userID":-1,
            "skillID":0
         });
      }
      
      public function chuangguanFail() : void
      {
      }
      
      public function setInitializeSBTR(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int) : void
      {
         this.mainCharArrtibutePlane.setInitializeSBTR(param1,param2,param3,param4,param5,param6);
      }
   }
}

