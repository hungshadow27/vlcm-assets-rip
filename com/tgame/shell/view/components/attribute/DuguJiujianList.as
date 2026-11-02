package com.tgame.shell.view.components.attribute
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.text.*;
   
   public class DuguJiujianList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var ft:FTextArea;
      
      private var bit:Bitmap;
      
      private var item:ItemFace;
      
      public function DuguJiujianList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 80;
         this.tf = new TextFormat();
         this.tf.align = "left";
         this.bit = StaticValue.getBitmapByClassName("ui.char.dugu.lineBar");
         addChild(this.bit);
         this.bit.x = 2;
         this.bit.y = 0;
         this.ft = new FTextArea();
         with(this.ft)
         {
            defaultTextFormat = tf;
            x = 3;
            y = 2;
            width = 160;
            height = 20;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.ft);
         if(data.lingwu > 0)
         {
            if(data.lingwu == 2)
            {
               this.ft.htmlText = data.zhaoshi + "【" + LanResManager.getLanCommonTextWords("已精通") + "】";
               _height = 80 + 15;
            }
            else
            {
               this.ft.htmlText = data.zhaoshi + LanResManager.getLanCommonTextWords("【已领悟】");
            }
         }
         else
         {
            this.ft.htmlText = data.zhaoshi + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("【尚未领悟】") + "</font>";
         }
         if(data.lingwu == 2)
         {
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               defaultTextFormat = tf;
               x = 5;
               y = 23;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.SKY_BLUE;
               htmlText = LanResManager.getLanCommonTextWords("攻击剑谱：") + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + data.gongjijianpu + "</font>";
            }
            addChild(this.ft);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               defaultTextFormat = tf;
               x = 5;
               y = 41;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.SKY_BLUE;
               htmlText = LanResManager.getLanCommonTextWords("防御剑谱：") + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + data.fangyujianpu + "</font>";
            }
            addChild(this.ft);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               defaultTextFormat = tf;
               x = 5;
               y = 59;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.SKY_BLUE;
               htmlText = LanResManager.getLanCommonTextWords("血量剑谱：") + "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + data.xueliangjianpu + "</font>";
            }
            addChild(this.ft);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               defaultTextFormat = tf;
               x = 5;
               y = 77;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.RED;
               htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：三种剑谱最多可用10000本") + "</font>";
            }
            addChild(this.ft);
         }
         else
         {
            this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChild(this.bit);
            this.bit.x = 3;
            this.bit.y = 25;
            this.item = new ItemFace(data.ico);
            this.item.setShowCount(false);
            this.item.showKungFuTag();
            this.item.x = 5;
            this.item.y = 27;
            addChild(this.item);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               defaultTextFormat = tf;
               x = 45;
               y = 23;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.SKY_BLUE;
               htmlText = LanResManager.getLanCommonTextWords("领悟难易度：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + data.nanyidu + "</font>";
            }
            addChild(this.ft);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               defaultTextFormat = tf;
               x = 45;
               y = 41;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.SKY_BLUE;
               htmlText = LanResManager.getLanCommonTextWords("领悟难度：") + "<font color=\'" + StaticValue.RED_HTML + "\'>" + data.nandu + "</font>";
            }
            addChild(this.ft);
            this.ft = new FTextArea();
            with(this.ft)
            {
               
               defaultTextFormat = tf;
               x = 45;
               y = 59;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.SKY_BLUE;
               htmlText = LanResManager.getLanCommonTextWords("奖励丰度：") + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + data.fengdu + "</font>";
            }
            addChild(this.ft);
         }
      }
   }
}

