package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class XinMoList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var bit:Bitmap;
      
      private var shijian:FTextArea;
      
      private var didian:FTextArea;
      
      private var mingcheng:FTextArea;
      
      private var jishazhe:FTextArea;
      
      public function XinMoList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 25;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.shijian = new FTextArea();
         addChild(this.shijian);
         this.shijian.multiline = true;
         this.shijian.defaultTextFormat = this.tf;
         this.shijian.wordWrap = true;
         this.shijian.width = 65;
         this.shijian.height = 200;
         this.shijian.x = -3;
         this.shijian.y = 4;
         this.shijian.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.shijian + " </font>";
         this.didian = new FTextArea();
         addChild(this.didian);
         this.didian.multiline = true;
         this.didian.defaultTextFormat = this.tf;
         this.didian.wordWrap = true;
         this.didian.width = 125;
         this.didian.height = 200;
         this.didian.x = 35 + 71 + 10 + 7 + 4 - 50 - 15 - 5;
         this.didian.y = 4;
         this.didian.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.didian + " </font>";
         this.mingcheng = new FTextArea();
         addChild(this.mingcheng);
         this.mingcheng.defaultTextFormat = this.tf;
         this.mingcheng.wordWrap = true;
         this.mingcheng.width = 150 + 10 + 15 + 15;
         this.mingcheng.height = 25;
         this.mingcheng.x = 35 + 204 + 10 - 60 - 7 - 15;
         this.mingcheng.y = 4;
         this.mingcheng.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         this.jishazhe = new FTextArea();
         addChild(this.jishazhe);
         this.jishazhe.multiline = true;
         this.jishazhe.defaultTextFormat = this.tf;
         this.jishazhe.wordWrap = true;
         this.jishazhe.width = 110 + 10 + 20;
         this.jishazhe.height = 200;
         this.jishazhe.x = 280 - 13 + 60 + 5;
         this.jishazhe.y = 4;
         this.jishazhe.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.jisha + " </font>";
      }
   }
}

