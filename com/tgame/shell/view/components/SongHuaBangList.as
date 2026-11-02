package com.tgame.shell.view.components
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class SongHuaBangList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var bit:Bitmap;
      
      private var shijian:FTextArea;
      
      private var didian:FTextArea;
      
      private var mingcheng:FTextArea;
      
      public function SongHuaBangList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 22;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.shijian = new FTextArea();
         addChild(this.shijian);
         this.shijian.multiline = true;
         this.shijian.defaultTextFormat = this.tf;
         this.shijian.wordWrap = true;
         this.shijian.width = 65;
         this.shijian.height = 200;
         this.shijian.x = -3 - 5;
         this.shijian.y = 4;
         this.shijian.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.paiming + " </font>";
         this.didian = new FTextArea();
         addChild(this.didian);
         this.didian.multiline = true;
         this.didian.defaultTextFormat = this.tf;
         this.didian.wordWrap = true;
         this.didian.width = 125;
         this.didian.height = 200;
         this.didian.x = 35 + 71 + 10 + 7 + 4 - 50 - 15 - 5 - 5;
         this.didian.y = 4;
         this.didian.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         this.mingcheng = new FTextArea();
         addChild(this.mingcheng);
         this.mingcheng.defaultTextFormat = this.tf;
         this.mingcheng.wordWrap = true;
         this.mingcheng.width = 150 + 10 + 15 + 15;
         this.mingcheng.height = 25;
         this.mingcheng.x = 35 + 204 + 10 - 60 - 7 - 15 - 60 + 27;
         this.mingcheng.y = 4;
         this.mingcheng.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.num + " </font>";
      }
   }
}

