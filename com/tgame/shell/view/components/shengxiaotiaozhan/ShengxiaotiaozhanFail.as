package com.tgame.shell.view.components.shengxiaotiaozhan
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.utils.Fun;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ShengxiaotiaozhanFail extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var ftTime:FTextArea;
      
      private var lbTime:FLabel;
      
      public function ShengxiaotiaozhanFail()
      {
         super();
         width = 260;
         height = 170;
         dragAble = false;
         titleText = LanResManager.getLanCommonTextWords("挑战失败");
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 95;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\' size=\'16\'>" + LanResManager.getLanCommonTextWords("挑战失败") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 38;
         this.ft.y = 40;
         this.ft.width = 210;
         this.ft.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("请提升战斗力后，再次挑战！") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 80;
         this.ft.y = 90;
         this.ft.width = 50;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("您将在") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 140;
         this.ft.y = 90;
         this.ft.width = 60;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("秒后退出") + "</font>";
         addChild(this.ft);
         this.lbTime = new FLabel();
         this.lbTime.x = 128;
         this.lbTime.y = 90;
         this.lbTime.textColor = StaticValue.RED;
         addChild(this.lbTime);
         this.ftTime = new FTextArea();
         this.ftTime.x = 80;
         this.ftTime.y = 90;
         addChild(this.ftTime);
         this.setTime();
      }
      
      private function setTime() : void
      {
         var time:Timer = null;
         var i:int = 0;
         var tiFun:Function = null;
         tiFun = function():void
         {
            --i;
            lbTime.text = String(i);
            if(i <= 0)
            {
               time.removeEventListener(TimerEvent.TIMER,tiFun);
               time.stop();
               time = null;
               onClose();
               if(Fun.isVisible(GameInstance.uiInstance.shengxiaoRightSpr))
               {
                  GameInstance.uiInstance.shengxiaoRightSpr.onclose();
                  GameInstance.uiInstance.mainUI.setTrackVisible(true);
                  GameInstance.uiInstance.mainUI.setImageLeadContainerVisible(true);
               }
            }
         };
         time = new Timer(1000,5);
         time.start();
         time.addEventListener(TimerEvent.TIMER,tiFun);
         i = 5;
      }
   }
}

