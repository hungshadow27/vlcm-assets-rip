package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.manager.PipeManager;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class YNjinxiangPanel extends FPanel
   {
      
      public static const UI_YUENAN_JINXIANG_CLICK:String = "UI_YUENAN_JINXIANG_CLICK";
      
      private var bg:DisplayObject;
      
      private var ft:FTextArea;
      
      private var lbTime:FTextArea;
      
      private var CjBar:ColorBar;
      
      private var countDownLb:FLabel;
      
      private var myTimer:Timer;
      
      private var Ti:int;
      
      private var btn:SecondButton;
      
      private var type:int = -1;
      
      public function YNjinxiangPanel()
      {
         super();
         skin = "panel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 286;
         height = 170;
         titleText = LanResManager.getLanCommonTextWords("进香");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.myTimer)
         {
            this.setTime(0);
         }
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         var bg:DisplayObject = null;
         bg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/duanwujie/bar_bg.png",235,19);
         bg.x = 27;
         bg.y = 35 + 25;
         addChild(bg);
         this.CjBar = new ColorBar(7,232,8,false);
         addChild(this.CjBar);
         this.CjBar.x = 27;
         this.CjBar.y = 37 + 25;
         this.CjBar.setValue(0,10);
         this.lbTime = new FTextArea();
         with(this.lbTime)
         {
            x = 25;
            y = 10;
            width = 238;
            wordWrap = true;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("点击按钮开始进香，进香过程中不可关闭面板，否则进香失败，无法获得礼包。");
         }
         addChild(this.lbTime);
         this.countDownLb = new FLabel();
         with(this.countDownLb)
         {
            x = 49 + 70 - 30 + 15;
            y = 62;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.countDownLb);
         this.btn = new SecondButton();
         addChild(this.btn);
         this.btn.x = 87;
         this.btn.y = 105;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               if(this.type == 1)
               {
                  this.setTime(120);
               }
               else if(this.type == 2 || this.type == 3 || this.type == 4 || this.type == 5)
               {
                  this.setTime(5);
               }
               else if(this.type == 6 || this.type == 7)
               {
                  this.setTime(30);
               }
               else if(this.type == 8)
               {
                  this.setTime(60);
               }
         }
      }
      
      private function countDownFun(param1:TimerEvent) : void
      {
         --this.Ti;
         if(this.Ti == 0)
         {
            if(this.type == 1)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("进香");
               this.CjBar.setValue(0,120);
               this.btn.x = 115;
            }
            else if(this.type == 2)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("捡竹椎");
               this.CjBar.setValue(0,30);
            }
            else if(this.type == 3)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("采摘水果");
               this.CjBar.setValue(0,30);
            }
            else if(this.type == 4)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加宴会");
            }
            else if(this.type == 5)
            {
               this.btn.label = "祈福";
            }
            else if(this.type == 6 || this.type == 7 || this.type == 8)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
            }
            this.btn.enabled = true;
            this.countDownLb.text = " ";
            PipeManager.sendMsg(PipeConstants.YN_REQUEST_JINXIANG,this.type);
            this.setTime(0);
         }
         else
         {
            if(this.type == 1)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("进香中");
               this.CjBar.setValue(this.Ti,120);
               this.btn.x = 55;
            }
            else if(this.type == 2)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("捡竹椎");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 3)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("采摘水果");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 4)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加宴会");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 5)
            {
               this.btn.label = "祈福";
               this.CjBar.setValue(this.Ti,5);
            }
            else if(this.type == 6 || this.type == 7)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 8)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
               this.CjBar.setValue(this.Ti,60);
            }
            this.countDownLb.text = LanResManager.getLanCommonTextWords("剩余时间") + "：" + String(this.Ti) + LanResManager.getLanCommonTextWords("秒");
            this.btn.enabled = false;
         }
      }
      
      private function setTime(param1:int) : void
      {
         if(param1 <= 0)
         {
            this.myTimer.stop();
            this.myTimer.reset();
            this.Ti = 0;
            if(this.type == 1)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("进香");
            }
            else if(this.type == 2)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("捡竹椎");
            }
            else if(this.type == 3)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("采摘水果");
            }
            else if(this.type == 4)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加宴会");
            }
            else if(this.type == 5)
            {
               this.btn.label = "祈福";
            }
            else if(this.type == 6 || this.type == 7 || this.type == 8)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
            }
            this.btn.x = 87;
            this.btn.enabled = true;
            this.countDownLb.text = " ";
            this.CjBar.setValue(0,30);
         }
         else
         {
            this.Ti = param1;
            if(this.type == 1)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("进香中");
               this.CjBar.setValue(this.Ti,120);
            }
            else if(this.type == 2)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("捡竹椎");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 3)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("采摘水果");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 4)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加宴会");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 5)
            {
               this.btn.label = "祈福";
               this.CjBar.setValue(this.Ti,5);
            }
            else if(this.type == 6 || this.type == 7)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
               this.CjBar.setValue(this.Ti,30);
            }
            else if(this.type == 8)
            {
               this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
               this.CjBar.setValue(this.Ti,60);
            }
            this.btn.x = 87;
            this.btn.enabled = false;
            this.myTimer.stop();
            this.myTimer.reset();
            this.myTimer.repeatCount = this.Ti;
            this.myTimer.start();
         }
      }
      
      public function setType(param1:int) : void
      {
         this.type = param1;
         if(this.type == 1)
         {
            this.myTimer = new Timer(1000,120);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = LanResManager.getLanCommonTextWords("进香");
            this.btn.label = LanResManager.getLanCommonTextWords("进香");
            this.lbTime.text = LanResManager.getLanCommonTextWords("点击按钮开始进香，进香过程中不可关闭面板，否则进香失败，无法获得礼包。");
         }
         else if(this.type == 2)
         {
            this.myTimer = new Timer(1000,30);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = LanResManager.getLanCommonTextWords("捡竹椎");
            this.btn.label = LanResManager.getLanCommonTextWords("捡竹椎");
            this.lbTime.text = LanResManager.getLanCommonTextWords("点击按钮开始捡竹椎，捡竹椎过程中不可关闭面板，否则捡拾失败，无法获得竹椎。");
         }
         else if(this.type == 3)
         {
            this.myTimer = new Timer(1000,30);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = LanResManager.getLanCommonTextWords("采摘水果");
            this.btn.label = LanResManager.getLanCommonTextWords("采摘水果");
            this.lbTime.text = LanResManager.getLanCommonTextWords("点击按钮开始采摘水果，采摘水果过程中不可关闭面板，否则采摘水果失败，无法获得水果。");
         }
         else if(this.type == 4)
         {
            this.myTimer = new Timer(1000,30);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = LanResManager.getLanCommonTextWords("端午节宴会");
            this.btn.label = LanResManager.getLanCommonTextWords("参加宴会");
            this.lbTime.text = LanResManager.getLanCommonTextWords("点击按钮参加端午节宴会，参加过程中不可关闭面板，否则失败，无法获得礼包。");
         }
         else if(this.type == 5)
         {
            this.myTimer = new Timer(1000,5);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = "上香祈福";
            this.btn.label = "祈福";
            this.lbTime.text = "点击按钮开始祈福，祈福过程中不可关闭面板，否则失败，无法获得礼包。";
         }
         else if(this.type == 6)
         {
            this.myTimer = new Timer(1000,30);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = LanResManager.getLanCommonTextWords("国庆餐桌");
            this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
            this.lbTime.text = LanResManager.getLanCommonTextWords("点击按钮开始，此过程中不可关闭面板，否则失败，无法获得礼包。");
         }
         else if(this.type == 7)
         {
            this.myTimer = new Timer(1000,30);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = LanResManager.getLanCommonTextWords("圣诞餐桌");
            this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
            this.lbTime.text = LanResManager.getLanCommonTextWords("点击按钮开始，此过程中不可关闭面板，否则失败，无法获得礼包。");
         }
         else if(this.type == 8)
         {
            this.myTimer = new Timer(1000,60);
            this.myTimer.addEventListener(TimerEvent.TIMER,this.countDownFun);
            titleText = LanResManager.getLanCommonTextWords("新年餐桌");
            this.btn.label = LanResManager.getLanCommonTextWords("参加餐桌");
            this.lbTime.text = LanResManager.getLanCommonTextWords("点击按钮开始，此过程中不可关闭面板，否则失败，无法获得礼包。");
         }
      }
   }
}

