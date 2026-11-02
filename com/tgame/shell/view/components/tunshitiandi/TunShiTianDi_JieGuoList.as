package com.tgame.shell.view.components.tunshitiandi
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class TunShiTianDi_JieGuoList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var paiming:FTextArea;
      
      private var mingzi:FTextArea;
      
      private var jifen:FTextArea;
      
      public function TunShiTianDi_JieGuoList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 34;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.paiming = new FTextArea();
         addChild(this.paiming);
         this.paiming.multiline = true;
         this.paiming.defaultTextFormat = this.tf;
         this.paiming.wordWrap = true;
         this.paiming.width = 65;
         this.paiming.height = 200;
         this.paiming.x = -3;
         this.paiming.y = 4;
         this.paiming.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.index + " </font>";
         this.mingzi = new FTextArea();
         addChild(this.mingzi);
         this.mingzi.multiline = true;
         this.mingzi.defaultTextFormat = this.tf;
         this.mingzi.wordWrap = true;
         this.mingzi.width = 125;
         this.mingzi.height = 200;
         this.mingzi.x = 35 + 71 + 10 + 7 + 4 - 50 - 15 - 5;
         this.mingzi.y = 4;
         this.mingzi.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         this.jifen = new FTextArea();
         addChild(this.jifen);
         this.jifen.defaultTextFormat = this.tf;
         this.jifen.wordWrap = true;
         this.jifen.width = 150;
         this.jifen.height = 25;
         this.jifen.x = 125;
         this.jifen.y = 4;
         this.jifen.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.socre + " </font>";
      }
   }
}

