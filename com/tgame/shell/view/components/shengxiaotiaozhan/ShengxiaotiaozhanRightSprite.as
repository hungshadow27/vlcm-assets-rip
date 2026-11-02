package com.tgame.shell.view.components.shengxiaotiaozhan
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Timer;
   import flash.utils.getTimer;
   
   public class ShengxiaotiaozhanRightSprite extends FCanvas
   {
      
      public static const UI_SHENGXIAOTIAOZHAN_LEAVECLICK:String = "UI_XUYUANFUBEN_LEAVECLICK";
      
      private var ft:FTextArea;
      
      private var ftCount:FTextArea;
      
      private var ftdiaolv:FTextArea;
      
      private var chunlianTimer:Timer;
      
      private var tim:int;
      
      private var stratTime:int;
      
      private var ftTime:FTextArea;
      
      private var ftGuai:FTextArea;
      
      private var ftBoss:FTextArea;
      
      private var btnLeave:SecondButton;
      
      public function ShengxiaotiaozhanRightSprite()
      {
         super();
         skin = "menuBg";
         width = 180;
         height = 200;
         this.init();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 50;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("十二生肖副本") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前挑战：") + "</font>";
         addChild(this.ft);
         this.ftCount = new FTextArea();
         this.ftCount.x = 70;
         this.ftCount.y = 30;
         this.ftCount.htmlText = "";
         addChild(this.ftCount);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 50;
         this.ft.height = 50;
         this.ft.width = 140;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("通关条件：") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("5分钟内消灭所有副本怪物") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 80;
         this.ft.height = 20;
         this.ft.width = 80;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("剩余时间：") + "</font>";
         addChild(this.ft);
         this.ftTime = new FTextArea();
         this.ftTime.x = 70;
         this.ftTime.y = 80;
         this.ftTime.height = 20;
         this.ftTime.width = 80;
         this.ftTime.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>5:00</font>";
         addChild(this.ftTime);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 100;
         this.ft.height = 20;
         this.ft.width = 80;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("剩余怪物：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 40;
         this.ft.y = 120;
         this.ft.height = 20;
         this.ft.width = 80;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("普通怪物：") + "</font>";
         addChild(this.ft);
         this.ftGuai = new FTextArea();
         this.ftGuai.x = 100;
         this.ftGuai.y = 120;
         this.ftGuai.height = 20;
         this.ftGuai.width = 80;
         this.ftGuai.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>3/30</font>";
         addChild(this.ftGuai);
         this.ft = new FTextArea();
         this.ft.x = 40;
         this.ft.y = 140;
         this.ft.height = 20;
         this.ft.width = 80;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>BOSS：</font>";
         addChild(this.ft);
         this.ftBoss = new FTextArea();
         this.ftBoss.x = 80;
         this.ftBoss.y = 140;
         this.ftBoss.height = 20;
         this.ftGuai.width = 80;
         this.ftBoss.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>1/5</font>";
         addChild(this.ftBoss);
         this.btnLeave = new SecondButton();
         this.btnLeave.label = LanResManager.getLanCommonTextWords("离开");
         addChild(this.btnLeave);
         this.btnLeave.x = 180 / 2 - this.btnLeave.width / 2;
         this.btnLeave.y = 165;
         this.btnLeave.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onclose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         FAlert.show(LanResManager.getLanCommonTextWords("是否确定离开副本？"),LanResManager.getLanCommonTextWords("提示"),2,function(param1:FAlertEvent = null):void
         {
            if(Boolean(param1) && param1.eventData != FAlert.OK)
            {
               return;
            }
            PipeManager.sendMsg(PipeConstants.SEND_SHENGXIAOTIAOZHAN_LEAVE);
         });
      }
      
      public function setTime(param1:int) : void
      {
         if(this.chunlianTimer != null)
         {
            this.chunlianTimer.stop();
            this.chunlianTimer = null;
            removeEventListener(Event.ENTER_FRAME,this.onEnterFarme);
         }
         this.tim = param1;
         this.stratTime = getTimer();
         addEventListener(Event.ENTER_FRAME,this.onEnterFarme);
      }
      
      private function onEnterFarme(param1:Event) : void
      {
         var _loc2_:int = (getTimer() - this.stratTime) / 1000;
         _loc2_ = this.tim - _loc2_;
         if(_loc2_ > 0)
         {
            this.ftTime.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + int(_loc2_ / 60) + ":" + _loc2_ % 60 + "" + "</font>";
         }
         else
         {
            this.ftTime.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>0:0</font>";
         }
      }
      
      public function setData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.ftCount.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("第") + param1 + LanResManager.getLanCommonTextWords("层") + "</font>";
         this.setTime(param2);
         this.ftBoss.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param5 + "/" + param6 + "</font>";
         this.ftGuai.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + param3 + "/" + param4 + "</font>";
      }
   }
}

