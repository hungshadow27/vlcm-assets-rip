package com.tgame.moudels.fabao.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fabao.Fabao_ApplicationFacade;
   import com.tgame.moudels.fabao.model.Fabao_MsgSendProxy;
   import com.tgame.shell.view.components.FabaoPanel;
   import com.tgame.shell.view.components.fabao.FabaoGuanzhuDesc;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Fabao_Mediator extends Mediator
   {
      
      public static const NAME:String = "Fabao_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var nowLV:int = 0;
      
      private var FBID:int = 0;
      
      private var fabaoDesc:FabaoGuanzhuDesc;
      
      private var isShengjie:Boolean = false;
      
      private var fbll:int = -1;
      
      private var _senderProxy:Fabao_MsgSendProxy;
      
      public function Fabao_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Fabao_ApplicationFacade.REQUEST_FABAOPANEL,Fabao_ApplicationFacade.REQUEST_FABAOLINGLIPANEL];
      }
      
      private function get senderProxy() : Fabao_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fabao_MsgSendProxy.NAME) as Fabao_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Fabao_ApplicationFacade.REQUEST_FABAOPANEL:
               _loc3_ = int(_loc2_);
               this.senderProxy.send_73631([-1,_loc3_]);
               break;
            case Fabao_ApplicationFacade.REQUEST_FABAOLINGLIPANEL:
               this.fbll = 0;
               this.senderProxy.send_73641();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : FabaoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.fabaoPanel);
         }
         return viewComponent as FabaoPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(FabaoPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.addEventListener(FabaoPanel.UI_FABAOFANYE_CLICK,onHandle);
            panel.addEventListener(FabaoPanel.UI_FABAOLIST_CLICK,onHandle);
            panel.addEventListener(FabaoPanel.UI_FABAOSHENGJIE_CLICK,onHandle);
            panel.addEventListener(FabaoPanel.UI_SHOWFABAO_WAIGUAN,onHandle);
            panel.addEventListener(FabaoPanel.UI_LINGLIGUANZHU_AUTO_CLICK,onHandle);
            panel.addEventListener(FabaoPanel.UI_LINGLIGUANZHU_BUY_CLICK,onHandle);
            panel.addEventListener(FabaoPanel.UI_LINGLIGUANZHU_CLICK,onHandle);
            panel.addEventListener(FabaoPanel.UI_LINGLIGUANZHU_DESC_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FabaoPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.removeEventListener(FabaoPanel.UI_FABAOFANYE_CLICK,onHandle);
            panel.removeEventListener(FabaoPanel.UI_FABAOLIST_CLICK,onHandle);
            panel.removeEventListener(FabaoPanel.UI_FABAOSHENGJIE_CLICK,onHandle);
            panel.removeEventListener(FabaoPanel.UI_SHOWFABAO_WAIGUAN,onHandle);
            panel.removeEventListener(FabaoPanel.UI_LINGLIGUANZHU_AUTO_CLICK,onHandle);
            panel.addEventListener(FabaoPanel.UI_LINGLIGUANZHU_BUY_CLICK,onHandle);
            panel.removeEventListener(FabaoPanel.UI_LINGLIGUANZHU_CLICK,onHandle);
            panel.removeEventListener(FabaoPanel.UI_LINGLIGUANZHU_DESC_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var e:BaseEvent = null;
         var ar:Array = null;
         var id:uint = 0;
         var str:String = null;
         var evt:* = param1;
         e = evt as BaseEvent;
         switch(evt.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_73633(1);
               break;
            case FabaoPanel.UI_FABAOFANYE_CLICK:
               this.senderProxy.send_73633(e.data);
               break;
            case FabaoPanel.UI_FABAOLIST_CLICK:
               this.senderProxy.send_73631(e.data);
               break;
            case FabaoPanel.UI_FABAOSHENGJIE_CLICK:
               this.isShengjie = true;
               this.senderProxy.send_73637(e.data);
               break;
            case FabaoPanel.UI_SHOWFABAO_WAIGUAN:
               ar = e.data as Array;
               if(ar[1] == true)
               {
                  ar[1] = 1;
               }
               else
               {
                  ar[1] = 0;
               }
               this.senderProxy.send_73635(ar);
               break;
            case FabaoPanel.UI_LINGLIGUANZHU_AUTO_CLICK:
               this.fbll = -1;
               ar = [];
               ar = e.data as Array;
               this.nowLV = int(ar[1]);
               this.FBID = int(ar[2]);
               if(Boolean(ar[0]))
               {
                  str = LanResManager.getLanCommonTextWords("您希望自动使用背包中的道具开始修炼法宝？") + "\n\n" + LanResManager.getLanCommonTextWords("当遇到以下情况时系统会中止自动灌注过程：") + "\n1." + LanResManager.getLanCommonTextWords("背包中剩余的道具已全部使用完毕") + "\n2." + LanResManager.getLanCommonTextWords("灵力不足") + "\n3." + LanResManager.getLanCommonTextWords("成功提升法宝") + "\n4." + LanResManager.getLanCommonTextWords("您点击了停止自动灌注按钮或关闭了修炼面板");
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动灌注");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已开始自动灌注！"));
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已开始自动灌注！"));
                        panel.setBtnAuto(false);
                        isAuto = ar[0];
                        if(isAuto)
                        {
                           senderProxy.send_73639(ar[2]);
                        }
                        autoKnowTimerFun();
                     }
                  });
               }
               else
               {
                  this.panel.setBtnAuto(true);
                  this.isAuto = ar[0];
                  this.autoKnowTimerFun();
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已停止自动灌注"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已停止自动灌注"),false);
               }
               break;
            case FabaoPanel.UI_LINGLIGUANZHU_BUY_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case FabaoPanel.UI_LINGLIGUANZHU_CLICK:
               this.isAuto = false;
               this.fbll = -1;
               this.autoKnowTimerFun();
               ar = e.data as Array;
               this.FBID = int(ar[1]);
               this.senderProxy.send_73639(ar[1]);
               break;
            case FabaoPanel.UI_LINGLIGUANZHU_DESC_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance.fabaoGuanzhuDesc))
               {
                  if(this.fabaoDesc == null)
                  {
                     this.fabaoDesc = new FabaoGuanzhuDesc();
                  }
                  this.fabaoDesc.x = (GameConfig.sceneWidth - this.fabaoDesc.width) / 2;
                  this.fabaoDesc.y = (GameConfig.sceneHeight - this.fabaoDesc.height) / 2;
                  GameInstance.uiInstance.uiContainer.addChild(this.fabaoDesc);
                  if(GameInstance.uiInstance.fabaotupo != null)
                  {
                     ResizeManager.showDoublePanel(GameInstance.uiInstance.fabaotupo,this.fabaoDesc);
                  }
               }
         }
      }
      
      public function setData(param1:int, param2:int, param3:String, param4:String, param5:String, param6:Array, param7:int, param8:String, param9:int, param10:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.fabaoPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_FABAOPANEL);
         }
         if(param1 != -1)
         {
            this.panel.setTa(true);
         }
         this.panel.setData(param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.FBID = param2;
      }
      
      public function fabaoTip() : void
      {
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("对不起，您还没有法宝！"));
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("对不起，您还没有法宝！"));
      }
      
      public function refreshList(param1:Array) : void
      {
         var _loc2_:XML = <list/>;
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_.appendChild(<node index={_loc3_ + 1} gid={param1[_loc3_].id} icoID={param1[_loc3_].icoID} name={param1[_loc3_].name}/>);
            _loc3_++;
         }
         this.panel.setXML(_loc2_,param1.length);
      }
      
      public function setUpData(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.fabaotupo) && this.isShengjie)
         {
            PipeManager.sendMsg(PipeConstants.SHOW_FABAOTUPOPANEL);
         }
         this.panel.setParent();
         this.panel.setTupoData(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var _loc12_:int = int(Number(param7 / (param8 / 100)));
         this.panel.setQiu(_loc12_);
         this.autoKnowTimerFun();
         this.FBID = param10;
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
               if(Fun.isVisible(GameInstance.uiInstance.fabaotupo))
               {
                  senderProxy.send_73639(FBID);
               }
               else
               {
                  isAuto = false;
                  panel.setBtnAuto(!isAuto);
               }
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
      
      public function upDateLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.panel.setBtnAuto(!this.isAuto);
            this.senderProxy.send_73631([this.FBID,-1]);
            GameInstance.uiInstance.fabaotupo.onClose();
            this.isShengjie = false;
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.panel.setBtnAuto(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_73637(this.FBID);
         }
      }
      
      public function setLingliPanel(param1:String, param2:int, param3:int, param4:int) : void
      {
         if(this.fbll == 0)
         {
            if(!Fun.isVisible(GameInstance.uiInstance.fabaolingli))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_FABAOLINGLIPANEL);
            }
         }
         GameInstance.uiInstance.fabaolingli.setData(param1,param2,param3,param4);
      }
      
      public function showLingliFullPanel() : void
      {
      }
   }
}

