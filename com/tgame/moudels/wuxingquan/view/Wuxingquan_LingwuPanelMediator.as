package com.tgame.moudels.wuxingquan.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxingquan.Wuxingquan_ApplicationFacade;
   import com.tgame.moudels.wuxingquan.model.Wuxingquan_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Wuxingquan_LingwuPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Wuxingquan_LingwuPanelMediator";
      
      private var autoLingwuTimer:Timer = new Timer(300);
      
      public var xiaohaoGoodsId:int;
      
      public var xiaohaoNeedNum:int;
      
      public var xiaohaoTongbi:int;
      
      private var _senderProxy:Wuxingquan_MsgSenderProxy;
      
      public function Wuxingquan_LingwuPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Wuxingquan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wuxingquan_MsgSenderProxy.NAME) as Wuxingquan_MsgSenderProxy;
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
            case Wuxingquan_ApplicationFacade.REFRESH_WUXINGQUAN_INFO:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_KAISHILINGWU,kaishiTishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_ZIDONGLINGWU,zidongtishengHandler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.WUXINGQUAN_GOUMAI_CLICK,goumaiFun);
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,removeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_KAISHILINGWU,kaishiTishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUXINGQUAN_LINGWUMIANBAN_ZIDONGLINGWU,zidongtishengHandler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WUXINGQUAN_GOUMAI_CLICK,goumaiFun);
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
         this.mainCharArrtibutePlane.setInitializeWxqTupo(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setWXQLingwuZhufuzhi(param1:int, param2:int, param3:int) : void
      {
         this.mainCharArrtibutePlane.setZhufuzhiWxqTupo(param1,param2,param3);
      }
      
      public function setWXQLingwuGoods(param1:Goods) : void
      {
         this.mainCharArrtibutePlane.setGoodsWxqTupo(param1);
      }
      
      public function setWXQLingwuShuoming(param1:String) : void
      {
         this.mainCharArrtibutePlane.setShuomingWxqTupo(param1);
      }
      
      private function kaishiTishengHandler(param1:Event) : void
      {
         this.stopAutoLingwu();
         var _loc2_:int = Wuxingquan_PlaneMediator.curLevel;
         this.senderProxy.send_54305(_loc2_ + 1);
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
         this.mainCharArrtibutePlane.setBtnWxqTupo(false);
         this.autoTimerHandler(null);
      }
      
      public function yingcangLingwuPanel() : void
      {
         this.mainCharArrtibutePlane.showPanelWxq(false);
         this.stopAutoLingwu();
      }
      
      public function lingwuSuccess() : void
      {
         this.mainCharArrtibutePlane.bofangJiuyinYanhuaWxq();
         this.yingcangLingwuPanel();
         this.senderProxy.send_54301();
      }
      
      public function lingwuFail() : void
      {
         var _loc1_:int = Wuxingquan_PlaneMediator.curLevel;
         this.senderProxy.send_54303(_loc1_ + 1);
      }
      
      private function autoTimerHandler(param1:TimerEvent) : void
      {
         var _loc2_:int = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this.xiaohaoGoodsId,true);
         var _loc3_:int = Wuxingquan_PlaneMediator.curLevel;
         this.senderProxy.send_54305(_loc3_ + 1);
         var _loc4_:int = GameInstance.mainCharData.moneyInfo.copper;
         if(_loc2_ < this.xiaohaoNeedNum || _loc4_ < this.xiaohaoTongbi)
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
         this.mainCharArrtibutePlane.setBtnWxqTupo(true);
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
            str = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您希望自动使用背包中的领悟道具领悟本阶招式？") + "</font>";
            str += "\n\n<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当遇到以下情况时系统会中止自动提升过程：");
            str += "\n" + LanResManager.getLanCommonTextWords("1.背包中剩余的领悟道具已全部使用完毕");
            str += "\n" + LanResManager.getLanCommonTextWords("2.剩余铜币不足");
            str += "\n" + LanResManager.getLanCommonTextWords("3.成功领悟了本式");
            str += "\n" + LanResManager.getLanCommonTextWords("4.您点击了停止领悟按钮或关闭了领悟面板") + "</font>";
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
      
      private function goumaiFun(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_,0]);
      }
   }
}

