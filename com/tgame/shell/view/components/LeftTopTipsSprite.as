package com.tgame.shell.view.components
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   
   public class LeftTopTipsSprite extends Sprite
   {
      
      private var timeFta:FTextArea;
      
      private var fta1:FTextArea;
      
      public function LeftTopTipsSprite()
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
         this.fta1 = new FTextArea();
         this.fta1.width = 250;
         this.fta1.height = 100;
         this.fta1.wordWrap = true;
         with(this.fta1)
         {
            filters = StaticValue.filter;
            x = 50;
            y = 100;
         }
         addChild(this.fta1);
         this.timeFta = new FTextArea();
         this.timeFta.width = 250;
         with(this.timeFta)
         {
            filters = StaticValue.filter;
            x = 50;
            y = 200;
         }
         addChild(this.timeFta);
      }
      
      public function setPartyBossTips(param1:Array) : void
      {
         this.fta1.htmlText = "<textformat leading=\'1\'><font size=\'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("未能在副本关闭前击杀帮派，将会放走帮派，副本将立即关闭，所有玩家将被立即传出副本。") + "</font></textformat>";
         this.timeFta.htmlText = "<font size=\'15\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + "      " + LanResManager.getLanCommonTextWords("副本关闭倒计时：") + "<br>         " + param1[1] + LanResManager.getLanCommonTextWords("分") + param1[2] + LanResManager.getLanCommonTextWords("秒") + "</font>";
      }
      
      public function setWoHuCangLongTips(param1:Array) : void
      {
         this.fta1.htmlText = "<font size=\'15\' color=\'" + StaticValue.GREEN_HTML + "\'>" + "";
         this.timeFta.htmlText = "<font size=\'15\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + "      " + LanResManager.getLanCommonTextWords(" 比赛剩余倒计时：") + "<br>         " + param1[1] + LanResManager.getLanCommonTextWords("分") + param1[2] + LanResManager.getLanCommonTextWords("秒") + "</font>";
      }
   }
}

