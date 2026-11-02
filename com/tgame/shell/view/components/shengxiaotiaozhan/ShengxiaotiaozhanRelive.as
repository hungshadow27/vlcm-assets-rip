package com.tgame.shell.view.components.shengxiaotiaozhan
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.utils.Fun;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ShengxiaotiaozhanRelive extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var ftYB:FTextArea;
      
      private var lbYB:FLabel;
      
      private var ftTime:FTextArea;
      
      private var btnOk:SecondButton;
      
      private var btnCancel:SecondButton;
      
      private var lbTime:FLabel;
      
      private var time:Timer = new Timer(1000,0);
      
      private var i:int;
      
      private var j:int = 1;
      
      private var YB:int = 0;
      
      public function ShengxiaotiaozhanRelive()
      {
         super();
         width = 200;
         height = 200;
         dragAble = false;
         skin = "panel_btn";
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 60;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'16\'>" + LanResManager.getLanCommonTextWords("您被击败了！") + "</font>";
         addChild(this.ft);
         this.ftYB = new FTextArea();
         this.ftYB.x = 25;
         this.ftYB.y = 40;
         this.ftYB.width = 180;
         this.ftYB.height = 60;
         this.ftYB.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("复活需要消耗XX元宝") + "</font>";
         addChild(this.ftYB);
         this.ft = new FTextArea();
         this.ft.x = 100 - 35;
         this.ft.y = 70;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("是否复活？") + "</font>";
         addChild(this.ft);
         this.lbTime = new FLabel();
         this.lbTime.x = 95;
         this.lbTime.y = 100;
         this.lbTime.width = 10;
         this.lbTime.textColor = StaticValue.RED;
         this.lbTime.text = "15";
         addChild(this.lbTime);
         this.ft = new FTextArea();
         this.ft.x = 55;
         this.ft.y = 100;
         this.ft.width = 50;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您将在") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 108;
         this.ft.y = 100;
         this.ft.width = 70;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("秒后退出") + "</font>";
         addChild(this.ft);
         this.btnOk = new SecondButton();
         this.btnOk.x = 42;
         this.btnOk.y = 135;
         this.btnOk.label = LanResManager.getLanCommonTextWords("接受");
         this.btnOk.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOk);
         this.btnCancel = new SecondButton();
         this.btnCancel.x = 105;
         this.btnCancel.y = 135;
         this.btnCancel.label = LanResManager.getLanCommonTextWords("拒绝");
         this.btnCancel.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnCancel);
      }
      
      private function tiFun(param1:TimerEvent = null) : void
      {
         --this.i;
         this.lbTime.text = String(this.i);
         if(this.i <= 0)
         {
            this.time.removeEventListener(TimerEvent.TIMER,this.tiFun);
            this.time.stop();
            this.time = null;
            this.onClose();
            if(Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
            {
               GameInstance.uiInstance.shengxiaoRightSpr.onclose();
               GameInstance.uiInstance.mainUI.setTrackVisible(true);
               GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
            }
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnOk:
               PipeManager.sendMsg(PipeConstants.SEND_SHENGXIAOTIAOZHAN_RELIVE,0);
               if(GameInstance.mainCharData.moneyInfo.gold >= this.YB)
               {
                  this.time.removeEventListener(TimerEvent.TIMER,this.tiFun);
                  this.time.stop();
               }
               break;
            case this.btnCancel:
               PipeManager.sendMsg(PipeConstants.SEND_SHENGXIAOTIAOZHAN_RELIVE,1);
               this.time.removeEventListener(TimerEvent.TIMER,this.tiFun);
               this.time.stop();
         }
      }
      
      public function setData(param1:int, param2:int = -1) : void
      {
         this.ftYB.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("复活需要消耗") + "</font><font color=\'" + StaticValue.RED_HTML + "\'>" + param1 + "</font><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("元宝") + "</font>";
         this.YB = param1;
         if(param2 != 0)
         {
            this.i = 15;
            this.time.start();
            this.time.addEventListener(TimerEvent.TIMER,this.tiFun);
         }
         else
         {
            this.time.removeEventListener(TimerEvent.TIMER,this.tiFun);
            this.time.stop();
         }
      }
   }
}

