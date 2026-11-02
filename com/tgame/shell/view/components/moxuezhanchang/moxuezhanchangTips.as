package com.tgame.shell.view.components.moxuezhanchang
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Sprite;
   
   public class moxuezhanchangTips extends Sprite
   {
      
      private var ft:FTextArea;
      
      private var ft_time:FTextArea;
      
      private var ft_Num:FTextArea;
      
      public function moxuezhanchangTips()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 10;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("战场怪物下轮刷新剩余时间") + "：</font>";
         addChild(this.ft);
         this.ft.width = 300;
         this.ft_time = new FTextArea();
         this.ft_time.x = 180 + 20;
         this.ft_time.y = 10;
         this.ft_time.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'14\'>  " + "15" + LanResManager.getLanCommonTextWords("分") + "0" + LanResManager.getLanCommonTextWords("秒") + "</font>";
         addChild(this.ft_time);
         this.ft_time.width = 300;
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 40;
         this.ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\' size=\'14\'>" + LanResManager.getLanCommonTextWords("战场怪物剩余数量") + "：</font>";
         addChild(this.ft);
         this.ft.width = 300;
         this.ft_Num = new FTextArea();
         this.ft_Num.x = 180;
         this.ft_Num.y = 40;
         addChild(this.ft_Num);
      }
      
      public function setFT(param1:Array, param2:int) : void
      {
         if(param1 != null)
         {
            this.ft_time.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'14\'>" + param1[1] + LanResManager.getLanCommonTextWords("分") + param1[2] + LanResManager.getLanCommonTextWords("秒") + "</font>";
         }
         else
         {
            this.ft_time.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'14\'>  15" + LanResManager.getLanCommonTextWords("分") + "0" + LanResManager.getLanCommonTextWords("秒") + "</font>";
         }
         this.ft_Num.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\' size=\'14\'>" + String(param2) + "</font>";
      }
   }
}

