package com.tgame.shell.view.components.attribute
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.text.*;
   
   public class ZiXiaShenGongList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var bit:Bitmap;
      
      public function ZiXiaShenGongList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 90;
         this.tf = new TextFormat();
         this.tf.align = "left";
         this.bit = StaticValue.getBitmapByClassName("ui.char.dugu.lineBar");
         this.bit.width = 160;
         addChild(this.bit);
         this.bit.x = 0;
         this.bit.y = 0;
         this.ft = new FTextArea();
         with(this.ft)
         {
            defaultTextFormat = tf;
            x = 3;
            y = 4;
            width = 160;
            height = 20;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            htmlText = "";
         }
         addChild(this.ft);
         if(data.lingwu)
         {
            this.ft.htmlText = data.zhaoshi + LanResManager.getLanCommonTextWords("【已领悟】");
         }
         else
         {
            this.ft.htmlText = data.zhaoshi + "<font color=\'" + StaticValue.SKY_BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("【尚未领悟】") + "</font>";
         }
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            defaultTextFormat = tf;
            x = 3;
            y = 21;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.YELLOW;
            htmlText = "<textformat leading=\'2\'>" + data.shuxing[0] + "<br>" + data.shuxing[1] + "<br>" + data.shuxing[2] + "<br>" + data.shuxing[3] + "<br>" + "</textformat>";
         }
         addChild(this.ft1);
      }
   }
}

