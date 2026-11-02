package com.tgame.moudels.tulongdao.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.tulongdao.TuLongDao_ApplicationFacade;
   import com.tgame.moudels.tulongdao.model.TuLongDao_MsgSenderProxy;
   import com.tgame.moudels.tulongdao.model.info.TuLongDaoVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.JiHuoRouShenShuXingPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TuLongDao_Mediator extends Mediator
   {
      
      public static const NAME:String = "TuLongDao_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:TuLongDaoVO;
      
      private var autoKnowTimer:Timer;
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var curZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 6;
      
      private var _senderProxy:TuLongDao_MsgSenderProxy;
      
      public function TuLongDao_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TuLongDao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TuLongDao_MsgSenderProxy.NAME) as TuLongDao_MsgSenderProxy;
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
         return [TuLongDao_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETTULONGDAO,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_XIANSHI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_JIHUO_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TULONGDAO_DAKAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETTULONGDAO,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_XIANSHI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_GUANZHU_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_JIHUO_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TULONGDAO_DAKAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var byte:int = 0;
         var b:Boolean = false;
         var id:uint = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.GETTULONGDAO:
               this.senderProxy.send_74751(-1);
               break;
            case CharAttribute.UI_TULONGDAO_JIHUO_CLICK:
               this.senderProxy.send_74761();
               break;
            case CharAttribute.UI_TULONGDAO_DAKAI_CLICK:
               this.onJihuoYincang();
               break;
            case CharAttribute.UI_TULONGDAO_XIULIAN_CLICK:
               byte = evt.data as int;
               this.senderProxy.send_74753(byte);
               this.vo.nowLiLiang = byte;
               break;
            case CharAttribute.UI_TULONGDAO_XIANSHI_CLICK:
               byte = evt.data as int;
               this.senderProxy.send_74757(byte);
               break;
            case CharAttribute.UI_TULONGDAO_GUANZHU_CLICK:
               byte = evt.data as int;
               this.senderProxy.send_74759(byte);
               this.vo.nowLiLiang = byte;
               break;
            case CharAttribute.UI_TULONGDAO_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_74755([-1,this.vo.nowLiLiang]);
               }
               else
               {
                  this.senderProxy.send_74755([0,this.vo.nowLiLiang]);
               }
               this.mainCharArrtibutePlane.setTuLongDaoBtn(!this.isAuto);
               break;
            case CharAttribute.UI_TULONGDAO_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_74755([0,vo.nowLiLiang]);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setTuLongDaoBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setTuLongDaoBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_TULONGDAO_GOUMAI_CLICK:
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
               senderProxy.send_74755([0,vo.nowLiLiang]);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(700,1);
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
      
      public function upDataTuLongDaoPanel(param1:TuLongDaoVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showTuLongDao();
         this.mainCharArrtibutePlane.setTuLongDaoInit(this.vo);
      }
      
      public function upDataLingWuPanel(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc10_:Boolean = false;
         if(_loc9_.count >= param4)
         {
            _loc10_ = true;
         }
         this.mainCharArrtibutePlane.showTuLongDaoTupoPanel(true);
         this.mainCharArrtibutePlane.setTuLongDaoTupoPanel(param1,param2,_loc10_,_loc9_.res.name,param4,_loc10_,param7);
         var _loc11_:int = 0;
         if(this.curZF != 0)
         {
            _loc11_ = param5 - this.curZF;
         }
         this.mainCharArrtibutePlane.setTuLongDaoZhufuzhi(param5,param6,_loc11_);
         this.curZF = param5;
         this.mainCharArrtibutePlane.setTuLongDaoGoods(_loc9_,_loc10_);
         this.autoKnowTimerFun();
      }
      
      public function upDataTuLongDaoLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setTuLongDaoBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showTuLongDaoTupoPanel(false);
            this.senderProxy.send_74751(-1);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setTuLongDaoBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_74753(this.vo.nowLiLiang);
         }
      }
      
      private function onJihuoYincang() : void
      {
         var goods:Goods;
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new JiHuoRouShenShuXingPanel();
            this._jiuhoPanel.setTuLongDao();
            this._jiuhoPanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               _senderProxy.send_74761();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(43130,true);
         this._jiuhoPanel.setGoods3(goods);
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
      }
   }
}

