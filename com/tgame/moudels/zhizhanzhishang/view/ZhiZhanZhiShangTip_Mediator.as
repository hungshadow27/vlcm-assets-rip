package com.tgame.moudels.zhizhanzhishang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.TimeManager;
   import com.tgame.shell.view.components.zzzs.ZhiZhanZhiShang_Tips;
   import com.zcp.common.utils.Fun;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhiZhanZhiShangTip_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhiZhanZhiShangTip_Mediator";
      
      private var timer:Timer;
      
      private var endTime:int = -1;
      
      private var redKill:int;
      
      private var buleKill:int;
      
      public function ZhiZhanZhiShangTip_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : ZhiZhanZhiShang_Tips
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhiZhanZhiShang_Tips);
         }
         return viewComponent as ZhiZhanZhiShang_Tips;
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
      
      public function setTip(param1:Boolean, param2:int, param3:int, param4:int) : void
      {
         if(param1)
         {
            if(param2 - this.endTime > 10 || param2 - this.endTime < -10)
            {
               this.endTime = param2;
            }
            this.redKill = param3;
            this.buleKill = param4;
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
         var _loc2_:Array = TimeManager.getTime1(this.endTime * 1000);
         this.panel.setZZZSTip(_loc2_,this.redKill,this.buleKill);
      }
      
      private function closeTime() : void
      {
         Fun.clearChildren(this.panel);
         this.timer.stop();
      }
   }
}

