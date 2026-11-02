package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class XinXiList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var jieci:FTextArea;
      
      private var shijian:FTextArea;
      
      private var renyuan:FTextArea;
      
      private var tianshu:FTextArea;
      
      public function XinXiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 28;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.jieci = new FTextArea();
         addChild(this.jieci);
         this.jieci.multiline = true;
         this.jieci.defaultTextFormat = this.tf;
         this.jieci.wordWrap = true;
         this.jieci.width = 65;
         this.jieci.height = 200;
         this.jieci.x = -3;
         this.jieci.y = 4;
         this.jieci.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.jieci + " </font>";
         this.shijian = new FTextArea();
         addChild(this.shijian);
         this.shijian.multiline = true;
         this.shijian.defaultTextFormat = this.tf;
         this.shijian.wordWrap = true;
         this.shijian.width = 125;
         this.shijian.height = 200;
         this.shijian.x = 35 + 71 + 10 + 7 + 4 - 50 - 15 - 5;
         this.shijian.y = 4;
         this.shijian.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.shijian + " </font>";
         this.renyuan = new FTextArea();
         addChild(this.renyuan);
         this.renyuan.defaultTextFormat = this.tf;
         this.renyuan.wordWrap = true;
         this.renyuan.width = 150 + 10 + 15 + 15;
         this.renyuan.height = 25;
         this.renyuan.x = 35 + 204 + 10 - 60 - 7 - 15;
         this.renyuan.y = 4;
         this.renyuan.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.renyuan + " </font>";
         this.tianshu = new FTextArea();
         addChild(this.tianshu);
         this.tianshu.multiline = true;
         this.tianshu.defaultTextFormat = this.tf;
         this.tianshu.wordWrap = true;
         this.tianshu.width = 125;
         this.tianshu.height = 200;
         this.tianshu.x = 35 + 204 + 10 - 60 - 7 - 15 + 100 + 76;
         this.tianshu.y = 4;
         this.tianshu.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.tianshu + " </font>";
      }
   }
}

