package com.tgame.shell.view.components.zzzs
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   
   public class ZhiZhanZhiShang_Tips extends Sprite
   {
      
      private var timeFta:FTextArea;
      
      private var redKillFta:FTextArea;
      
      private var buleKillFta:FTextArea;
      
      public function ZhiZhanZhiShang_Tips()
      {
         super();
         mouseEnabled = false;
         mouseChildren = false;
         this.timeFta = new FTextArea();
         this.timeFta.width = 350;
         with(this.timeFta)
         {
            filters = StaticValue.filter;
            x = 50;
            y = 100;
         }
         addChild(this.timeFta);
         this.buleKillFta = new FTextArea();
         this.buleKillFta.width = 200;
         with(this.buleKillFta)
         {
            filters = StaticValue.filter;
            x = 50;
            y = 125;
         }
         addChild(this.buleKillFta);
         this.redKillFta = new FTextArea();
         this.redKillFta.width = 200;
         with(this.redKillFta)
         {
            filters = StaticValue.filter;
            x = 50;
            y = 150;
         }
         addChild(this.redKillFta);
      }
      
      public function setZZZSTip(param1:Array, param2:int, param3:int) : void
      {
         this.timeFta.htmlText = "<font size=\'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("战场结束倒计时：") + param1[0] + LanResManager.getLanCommonTextWords("时") + param1[1] + LanResManager.getLanCommonTextWords("分") + param1[2] + LanResManager.getLanCommonTextWords("秒") + "</font>";
         this.redKillFta.htmlText = "<font size=\'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("红方斩杀人数：") + param2 + "</font>";
         this.buleKillFta.htmlText = "<font size=\'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("蓝方斩杀人数：") + param3 + "</font>";
      }
   }
}

