package com.tgame.shell.view.components.yitiantulong
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class YiTianTuLongJiShi extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var quxiaoBtn:SecondButton;
      
      private var timer:Timer;
      
      private var timeFta:FTextArea;
      
      private var timerCount:int = 0;
      
      private var isWaiting:Boolean;
      
      public function YiTianTuLongJiShi()
      {
         super();
         skin = "panel_btn";
         dragAble = false;
         this.dragRestrict = false;
         width = 348 - 100;
         height = 230 - 80;
         titleText = LanResManager.getLanCommonTextWords("匹配中");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.quxiaoBtn = new SecondButton();
         this.quxiaoBtn.label = LanResManager.getLanCommonTextWords("取消匹配");
         addChild(this.quxiaoBtn);
         this.quxiaoBtn.x = 85;
         this.quxiaoBtn.y = 165 - 80;
         this.quxiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.timeFta = new FTextArea();
         this.timeFta.filters = StaticValue.filter;
         this.timeFta.width = 210;
         this.timeFta.height = 60;
         this.timeFta.x = 100 - 70;
         this.timeFta.y = 37 - 20;
         this.timeFta.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "已等待：1秒" + "<br>" + LanResManager.getLanCommonTextWords("注：可点击取消匹配退出匹配界面。") + "</font>";
         addChild(this.timeFta);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
         this.timerCount = 0;
         if(this.timer)
         {
            this.timer.stop();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.quxiaoBtn:
               this.$parent.dispatchEvent(new BaseEvent(YiTianTuLong.UI_YITIANTULONG_JINCHANG_CLICK,"",0));
               this.onClose();
         }
      }
      
      public function setPipei(param1:Boolean) : void
      {
         this.isWaiting = param1;
         this.timeFta.htmlText = "";
         if(this.isWaiting)
         {
            if(this.timer == null)
            {
               this.timer = new Timer(1000);
               this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
               this.timer.start();
               this.timerCount = 0;
            }
            else if(!this.timer.running)
            {
               this.timer.reset();
               this.timer.start();
               this.timerCount = 0;
            }
         }
         else
         {
            this.timerCount = 0;
            if(this.timer)
            {
               this.timer.stop();
            }
         }
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         ++this.timerCount;
         this.timeFta.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("已等待：") + (this.timerCount >= 60 ? Math.floor(this.timerCount / 60) + LanResManager.getLanCommonTextWords("分") : "") + this.timerCount % 60 + LanResManager.getLanCommonTextWords("秒") + "<br>" + LanResManager.getLanCommonTextWords("注：可点击取消匹配退出匹配界面。") + "</font>";
         if(this.timerCount == 120)
         {
            this.onClose();
            this.$parent.dispatchEvent(new BaseEvent(YiTianTuLong.UI_YITIANTULONG_JINCHANG_CLICK,"",0));
         }
      }
   }
}

