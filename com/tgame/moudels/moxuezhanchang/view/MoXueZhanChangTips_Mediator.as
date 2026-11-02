package com.tgame.moudels.moxuezhanchang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.TimeManager;
   import com.tgame.shell.view.components.moxuezhanchang.moxuezhanchangTips;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.common.utils.Fun;
   import com.zcp.manager.TimerManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MoXueZhanChangTips_Mediator extends Mediator
   {
      
      public static const NAME:String = "MoXueZhanChangTips_Mediator";
      
      private var readyEnterTimerData:TimerData;
      
      private var readyEnterTimerCount:int = 11;
      
      private var timer:Timer;
      
      private var syNum:int;
      
      private var endTime:int = -1;
      
      public function MoXueZhanChangTips_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : moxuezhanchangTips
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.moxueleftTopTipsSprite);
         }
         return viewComponent as moxuezhanchangTips;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         this.readyEnterTimerData = TimerManager.createTimer(1000,0,this.onReadyTimerUpdate);
         this.readyEnterTimerData.timer.stop();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      public function setLeftTopTips(param1:int, param2:int = 0, param3:int = 0, param4:int = 0) : void
      {
         this.syNum = param3;
         this.endTime = param2;
         if(param1)
         {
            this.panel.x = 10;
            this.panel.y = 180;
            GameInstance.uiInstance.letterContainer.addChild(this.panel);
            if(param4 == 1)
            {
               if(param2 < 1)
               {
                  return;
               }
               if(!Fun.isVisible(this.panel))
               {
                  this.panel.x = 10;
                  this.panel.y = 180;
                  GameInstance.uiInstance.letterContainer.addChild(this.panel);
               }
               if(this.timer == null)
               {
                  this.timer = new Timer(1000);
                  this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               }
               this.timer.reset();
               this.timer.start();
            }
            else
            {
               if(this.timer != null)
               {
                  this.timer.stop();
               }
               this.panel.setFT(null,param3);
            }
         }
         else
         {
            if(this.timer != null && this.timer.running)
            {
               this.timer.stop();
            }
            if(this.panel != null && this.panel.parent != null)
            {
               this.panel.parent.removeChild(this.panel);
            }
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         if(this.endTime < 1)
         {
            if(this.timer != null && this.timer.running)
            {
               this.timer.stop();
               this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
               this.timer = null;
            }
            this.endTime = 0;
         }
         var _loc2_:Array = TimeManager.getTime1(this.endTime * 1000);
         --this.endTime;
         this.panel.setFT(_loc2_,this.syNum);
      }
      
      private function onReadyTimerUpdate() : void
      {
         if(this.readyEnterTimerCount <= 0)
         {
            this.readyEnterTimerData.timer.stop();
         }
         if(this.readyEnterTimerCount == 11)
         {
            NoticeManager.notify(NoticeManager.CENTER,"魔怪已被清除，下一轮入侵倒计时开启：" + this.readyEnterTimerCount,false);
         }
         else
         {
            NoticeManager.notify(NoticeManager.CENTER," " + this.readyEnterTimerCount + "",false);
         }
         --this.readyEnterTimerCount;
      }
      
      public function readyEnter(param1:int) : void
      {
         this.readyEnterTimerCount = param1;
         this.readyEnterTimerData.timer.stop();
         this.readyEnterTimerData.timer.reset();
         this.readyEnterTimerData.timer.start();
      }
   }
}

