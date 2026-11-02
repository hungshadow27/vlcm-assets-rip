package com.tgame.moudels.kuafu3v3.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.kuafu3v3.Kuafu3v3_ApplicationFacade;
   import com.tgame.moudels.kuafu3v3.model.Kuafu3v3_MsgSenderProxy;
   import com.tgame.shell.view.components.KuafuLunjianBackpack;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.conquerPanel;
   import com.tgame.shell.view.components.jingjichang.JingjiChangBaomingPanel;
   import com.tgame.shell.view.components.jingjichang.JingjiResultPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Kuafu3v3_Mediator extends Mediator
   {
      
      public static const NAME:String = "Kuafu3v3_Mediator";
      
      private var _querenBaomingTime:TimerData;
      
      private var _querenCount:int;
      
      private var _nextPipei:int;
      
      private var _msg_sender:Kuafu3v3_MsgSenderProxy;
      
      public var baoMingType:int = 1;
      
      public function Kuafu3v3_Mediator()
      {
         super(NAME);
      }
      
      private function get msg_sender() : Kuafu3v3_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(Kuafu3v3_MsgSenderProxy.NAME) as Kuafu3v3_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Kuafu3v3_ApplicationFacade.ENTER_SCENE,Kuafu3v3_ApplicationFacade.YINCHANG_JING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Kuafu3v3_ApplicationFacade.ENTER_SCENE:
               if(GameConfig.wantEnterMapRes.isFuben != 4)
               {
                  GameInstance.uiInstance.mainUI.isShowKuaFuLunJian3v3(false);
                  if(GameInstance.uiInstance._popMapPanel != null)
                  {
                     PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI3V3,[OtherConst.NB_ZHUANGBEI_REMOVE3V3]);
                  }
                  if(GameInstance.uiInstance._kuafu3v3VSResultPanel != null)
                  {
                     if(GameInstance.uiInstance.kuafu3v3VSResultPanel.parent != null)
                     {
                        GameInstance.uiInstance.kuafu3v3VSResultPanel.parent.removeChild(GameInstance.uiInstance.kuafu3v3VSResultPanel);
                     }
                  }
               }
               break;
            case Kuafu3v3_ApplicationFacade.YINCHANG_JING:
               if(_loc2_ as Boolean == true)
               {
                  GameInstance.uiInstance.mainUI.hideJing();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAP_JING_CLICK,jingClickHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.MAP_JING_CLICK,jingClickHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAP_ZHAN_CLICK,zhanClickHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.MAP_ZHAN_CLICK,zhanClickHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(conquerPanel,function():void
         {
            GameInstance.uiInstance.bossRefurbishPanel.addEventListener(conquerPanel.UI_JINGJIPANEL_KAISHIJINGJI_BTN_CLICK,tryBaoming);
            GameInstance.uiInstance.bossRefurbishPanel.addEventListener(conquerPanel.UI_JINGJIPANEL_BAOGUOSHOUYIQUHUI_BTN_CLICK,jingClickHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(conquerPanel,function():void
         {
            GameInstance.uiInstance.bossRefurbishPanel.removeEventListener(conquerPanel.UI_JINGJIPANEL_KAISHIJINGJI_BTN_CLICK,tryBaoming);
            GameInstance.uiInstance.bossRefurbishPanel.removeEventListener(conquerPanel.UI_JINGJIPANEL_BAOGUOSHOUYIQUHUI_BTN_CLICK,jingClickHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(JingjiChangBaomingPanel,function():void
         {
            GameInstance.uiInstance.teamInstancePanel3v3.addEventListener(JingjiChangBaomingPanel.UI_JINGJIBAOMING_ACCEDEBTN,querenBaoming_acc);
            GameInstance.uiInstance.teamInstancePanel3v3.addEventListener(JingjiChangBaomingPanel.UI_JINGJIBAOMING_REFUSEBTN,querenBaoming_ref);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JingjiChangBaomingPanel,function():void
         {
            GameInstance.uiInstance.teamInstancePanel3v3.removeEventListener(JingjiChangBaomingPanel.UI_JINGJIBAOMING_ACCEDEBTN,querenBaoming_acc);
            GameInstance.uiInstance.teamInstancePanel3v3.removeEventListener(JingjiChangBaomingPanel.UI_JINGJIBAOMING_REFUSEBTN,querenBaoming_ref);
         });
         UIEventsRegisterManager.addUIRegisterEvent(KuafuLunjianBackpack,function():void
         {
            GameInstance.uiInstance.kuafuLunjianBackpack.addEventListener(Event.REMOVED_FROM_STAGE,kuafuBaoguoRemoveHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(KuafuLunjianBackpack,function():void
         {
            GameInstance.uiInstance.kuafuLunjianBackpack.removeEventListener(Event.REMOVED_FROM_STAGE,kuafuBaoguoRemoveHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(JingjiResultPanel,function():void
         {
            GameInstance.uiInstance.kuafu3v3ResultPanel.addEventListener(JingjiResultPanel.UI_3V3_TUICHU,tuichu3v3);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JingjiResultPanel,function():void
         {
            GameInstance.uiInstance.kuafu3v3ResultPanel.removeEventListener(JingjiResultPanel.UI_3V3_TUICHU,tuichu3v3);
         });
      }
      
      private function jingClickHandle(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         if(!Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_KUAFU_BACKPACK);
         }
         ResizeManager.showDoublePanel(GameInstance.uiInstance.kuafuLunjianBackpack,GameInstance.uiInstance.backpack);
      }
      
      private function zhanClickHandle(param1:BaseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.MAINUI_KUAFU_GUIZHE_QUERY,3);
         var _loc2_:Boolean = Fun.isVisible(GameInstance.uiInstance._backpack);
         var _loc3_:Boolean = Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack);
         if(_loc2_ != _loc3_)
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         if(Fun.isVisible(GameInstance.uiInstance._backpack) && Fun.isVisible(GameInstance.uiInstance._kuafuLunjianBackpack))
         {
            ResizeManager.showDoublePanel(GameInstance.uiInstance.kuafuLunjianBackpack,GameInstance.uiInstance.backpack);
         }
      }
      
      private function kuafuBaoguoRemoveHandle(param1:Event) : void
      {
         ResizeManager.hideDoublePanel();
      }
      
      private function tryBaoming(param1:BaseEvent) : void
      {
         this.msg_sender.send_53601(1);
      }
      
      private function querenBaoming_acc(param1:BaseEvent) : void
      {
         this.msg_sender.send_53603([this.baoMingType,1]);
      }
      
      private function querenBaoming_ref(param1:BaseEvent) : void
      {
         this.msg_sender.send_53603([this.baoMingType,0]);
      }
      
      private function tuichu3v3(param1:BaseEvent) : void
      {
         this.msg_sender.send_53617();
      }
      
      public function received_querenBaoming(param1:int, param2:String, param3:int, param4:String, param5:String, param6:int, param7:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._teamInstancePanel3v3))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_TEAM_INSTANCE_PANEL_3V3);
         }
         if(this._querenBaomingTime == null)
         {
            this.startQuerenBaomingTime();
         }
         this.baoMingType = param1;
         GameInstance.uiInstance.teamInstancePanel3v3.initBaomingInfo(HeadResChange.headResChangeToString(param6),param2,param3,param4,param5);
         GameInstance.uiInstance.teamInstancePanel3v3.setMemberArr(param7);
      }
      
      public function received_baomingStatus(param1:Boolean, param2:int = 0) : void
      {
         if(param1)
         {
            if(Fun.isVisible(GameInstance.uiInstance._teamInstancePanel3v3))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TEAM_INSTANCE_PANEL_3V3);
            }
            this._nextPipei = param2;
            GameInstance.uiInstance.mainUI.showJing(param2);
         }
         else
         {
            GameInstance.uiInstance.mainUI.hideJing();
         }
      }
      
      public function received_pipeiStatus(param1:Boolean, param2:String = "") : void
      {
         if(!param1)
         {
            GameInstance.uiInstance.mainUI.showJing(this._nextPipei);
         }
         NoticeManager.notify(NoticeManager.CENTER,param2);
      }
      
      public function received_fightInfo(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Array, param7:int, param8:int, param9:int) : void
      {
         GameInstance.uiInstance.mainUI.isShowKuaFuLunJian3v3(true);
         GameInstance.uiInstance.mainUI.setKuaFuValue3v3(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function received_fightResult(param1:XML, param2:int, param3:int, param4:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._kuafu3v3ResultPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_KUAFU3V3_RESULT_PANEL);
         }
         GameInstance.uiInstance.kuafu3v3ResultPanel.setJingjiResult(param1,param2,param3,param4);
      }
      
      public function received_fightSmallMapInfo(param1:Array) : void
      {
         PipeManager.sendMsg(PipeConstants.SET_SMALL_MAP_NB_ZHUANGBEI3V3,[OtherConst.NB_ZHUANGBEI_ADD3V3,param1]);
      }
      
      public function received_fightInfo_PK(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:Array, param7:int, param8:int, param9:int) : void
      {
         GameInstance.uiInstance.mainUI.isShowKuaFuLunJian3v3(true);
         GameInstance.uiInstance.mainUI.setKuaFuValue3v3_PK(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function received_fightResult_PK(param1:XML, param2:int, param3:int, param4:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._kuafu3v3ResultPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_KUAFU3V3_RESULT_PANEL);
         }
         GameInstance.uiInstance.kuafu3v3ResultPanel.setJingjiResult_PK(param1,param2,param3,param4);
      }
      
      public function startQuerenBaomingTime() : void
      {
         var timerHandler:Function = null;
         timerHandler = function(param1:TimerEvent = null):void
         {
            --_querenCount;
            GameInstance.uiInstance.teamInstancePanel3v3.setCountDownFun(_querenCount);
         };
         this._querenCount = 15;
         GameInstance.uiInstance.teamInstancePanel3v3.setCountDownFun(this._querenCount);
         this._querenBaomingTime = TimerManager.createTimer(1000,15,timerHandler,null,this.stopQuerenBaomingTime);
      }
      
      public function stopQuerenBaomingTime(param1:TimerEvent = null) : void
      {
         if(this._querenBaomingTime != null)
         {
            TimerManager.deleteTimer(this._querenBaomingTime);
            this._querenBaomingTime = null;
         }
      }
   }
}

