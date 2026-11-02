package com.tgame.shell.view.components.attribute
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.text.*;
   
   public class JiuyinzhenjingList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var ft:FTextArea;
      
      private var bit:Bitmap;
      
      private var item:ItemFace;
      
      public function JiuyinzhenjingList()
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

