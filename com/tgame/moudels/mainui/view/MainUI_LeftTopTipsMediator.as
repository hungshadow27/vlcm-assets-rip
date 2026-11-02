package com.tgame.moudels.mainui.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.TimeManager;
   import com.tgame.shell.view.components.LeftTopTipsSprite;
   import com.zcp.common.utils.Fun;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MainUI_LeftTopTipsMediator extends Mediator
   {
      
      public static const NAME:String = "MainUI_LeftTopTipsMediator";
      
      private var tipsType:int = 1;
      
      private var paramArray:Array;
      
      private var timer:Timer;
      
      private var endTime:int = -1;
      
      public function MainUI_LeftTopTipsMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : LeftTopTipsSprite
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.leftTopTipsSprite);
         }
         return viewComponent as LeftTopTipsSprite;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      public function setLeftTopTips(param1:Boolean, param2:int = 1, param3:int = 0, param4:Array = null) : void
      {
         if(param1)
         {
            this.tipsType = param2;
            this.paramArray = param4;
            if(param3 - this.endTime > 10 || param3 - this.endTime < -10)
            {
               this.endTime = param3;
            }
            if(!Fun.isVisible(this.panel))
            {
               GameInstance.uiInstance.letterContainer.addChild(this.panel);
               this.timer = new Timer(1000);
               this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               this.timer.start();
            }
         }
         else
         {
            if(this.panel != null && this.panel.parent != null)
            {
               this.panel.parent.removeChild(this.panel);
            }
            if(this.timer != null && this.timer.running)
            {
               this.timer.stop();
            }
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         --this.endTime;
         if(this.endTime < 0)
         {
            this.timer.stop();
         }
         var _loc2_:Array = TimeManager.getTime1(this.endTime * 1000);
         if(this.tipsType == 1)
         {
            this.panel.setPartyBossTips(_loc2_);
         }
         else if(this.tipsType == 2)
         {
            this.panel.setWoHuCangLongTips(_loc2_);
         }
      }
      
      private function closeTime() : void
      {
         Fun.clearChildren(this.panel);
         this.timer.stop();
      }
   }
}

