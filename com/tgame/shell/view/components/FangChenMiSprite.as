package com.tgame.shell.view.components
{
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class FangChenMiSprite extends Sprite
   {
      
      private var countDownLb:FLabel;
      
      private var myTimer:Timer;
      
      private var Ti:int;
      
      public function FangChenMiSprite()
      {
         super();
         this.countDownLb = new FLabel();
         with(this.countDownLb)
         {
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.countDownLb);
         this.myTimer = new Timer(1000);
         this.myTimer.addEventListener(TimerEvent.TIMER,this.addTimeFun);
      }
      
      private function addTimeFun(param1:TimerEvent) : void
      {
         this.countDownLb.text = "【" + LanResManager.getLanCommonTextWords("在线时间") + "：" + Math.floor(this.Ti / 3600) + LanResManager.getLanCommonTextWords("时") + Math.floor(this.Ti % 3600 / 60) + LanResManager.getLanCommonTextWords("分") + Math.floor(this.Ti % 60) + LanResManager.getLanCommonTextWords("秒") + "】";
         ++this.Ti;
      }
      
      public function setTime(param1:int) : void
      {
         this.Ti = param1;
         if(param1 == -1)
         {
            this.myTimer.stop();
         }
         else
         {
            this.myTimer.stop();
            this.myTimer.reset();
            this.myTimer.start();
         }
      }
   }
}

