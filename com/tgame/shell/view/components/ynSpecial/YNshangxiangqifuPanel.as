package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class YNshangxiangqifuPanel extends Sprite
   {
      
      private var bg:DisplayObject;
      
      private var btn:NewButton;
      
      private var lbTime:FTextArea;
      
      private var CjBar:ColorBar;
      
      private var myTimer:Timer;
      
      private var Ti:int;
      
      private var countDownLb:FLabel;
      
      private var closeBtn:FSimpleButton;
      
      public function YNshangxiangqifuPanel()
      {
         var _loc1_:FCanvas = null;
         super();
         _loc1_ = new FCanvas();
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 240;
         _loc1_.height = 315;
         _loc1_.skin = "backGroud";
         addChild(_loc1_);
         this.init();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(this.myTimer)
         {
            this.setTime(0);
         }
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/ynSpecial/bg.swf");
         this.bg.x = 26;
         this.bg.y = 10;
         addChild(this.bg);
         this.CjBar = new ColorBar(7,150,5,false);
         addChild(this.CjBar);
         this.CjBar.x = 27 + 16;
         this.CjBar.y = 150;
         this.lbTime = new FTextArea();
         with(this.lbTime)
         {
            x = 12;
            y = 250;
            width = 215;
            height = 60;
            wordWrap = true;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = "<textformat leading=\'4\'>点击按钮开始祈福，祈福过程中不可关闭面板，否则祈福失败，无法获得礼包。</textformat>";
         }
         addChild(this.lbTime);
         this.btn = new NewButton();
         this.btn.label = LanResManager.getLanCommonTextWords("祈    福");
         this.btn.setSkin("ynQifu");
         this.btn.setColor(StaticValue.YELLOW);
         addChild(this.btn);
         this.btn.x = 75;
         this.btn.y = 215;
         this.btn.setPandding(3,2,25,8);
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.countDownLb = new FLabel();
         with(this.countDownLb)
         {
            x = 45 + 16;
            y = 150;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.countDownLb);
      }
      
      private function setTime(param1:int) : void
      {
         if(param1 <= 0)
         {
            this.myTimer.stop();
            this.myTimer.reset();
            this.Ti = 0;
            this.btn.label = LanResManager.getLanCommonTextWords("祈    福");
            this.btn.enabled = true;
            this.countDownLb.text = " ";
            this.CjBar.setValue(0,30);
         }
         else
         {
            this.Ti = param1;
            this.btn.label = LanResManager.getLanCommonTextWords("祈    福");
            this.CjBar.setValue(this.Ti,30);
            this.btn.enabled = false;
            this.myTimer.stop();
            this.myTimer.reset();
            this.myTimer.repeatCount = this.Ti;
            this.myTimer.start();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this.setTime(30);
         }
      }
      
      private function countDownFun(param1:TimerEvent) : void
      {
         --this.Ti;
         if(this.Ti == 0)
         {
            this.btn.label = LanResManager.getLanCommonTextWords("祈    福");
            this.btn.enabled = true;
            this.countDownLb.text = " ";
            PipeManager.sendMsg(PipeConstants.YN_REQUEST_JINXIANG,5);
            this.setTime(0);
         }
         else
         {
            this.btn.label = LanResManager.getLanCommonTextWords("祈    福");
            this.CjBar.setValue(this.Ti,30);
            this.countDownLb.text = LanResManager.getLanCommonTextWords("剩余时间") + "：" + String(this.Ti) + LanResManager.getLanCommonTextWords("秒");
            this.btn.enabled = false;
         }
      }
      
      public function setType(param1:int) : void
      {
         this.myTimer = new Timer(1000,30);
         this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
         this.btn.label = LanResManager.getLanCommonTextWords("祈    福");
         this.lbTime.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("点击按钮开始祈福，祈福过程中不可关闭面板，否则祈福失败，无法获得礼包。") + "</textformat>";
      }
   }
}

