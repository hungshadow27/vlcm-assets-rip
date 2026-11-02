package com.tgame.shell.view.components.friend
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class BlackListRender extends FListCellRenderer
   {
      
      public function BlackListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 20;
         tf = new TextFormat();
         tf.align = "center";
         tf.color = data.line == "0" ? 6052956 : StaticValue.WHITE;
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            width = 200;
            height = 20;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            htmlText = data.playerName;
         }
         addChild(ft);
         tf.color = StaticValue.WHITE;
         tf.align = "center";
      }
   }
}

