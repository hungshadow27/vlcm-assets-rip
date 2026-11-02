package com.tgame.shell.view.components.team
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class WeddingListRender extends FListCellRenderer
   {
      
      public function WeddingListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 26;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 0;
            y = 5;
            width = 56;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.guimo;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 52;
            y = 5;
            width = 120;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.time;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 150;
            y = 5;
            width = 115;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.fettle;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 250;
            y = 5;
            width = 118;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.xinlang;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 363;
            y = 5;
            width = 123;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.xinniang;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 463;
            y = 5;
            width = 115;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.line;
         }
         addChild(ft);
      }
   }
}

