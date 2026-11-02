package com.tgame.shell.view.components.team
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class SeekingSearchListRender extends FListCellRenderer
   {
      
      public function SeekingSearchListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ft:FTextArea;
         var tf:TextFormat = new TextFormat();
         tf.align = "left";
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 48;
            y = 6;
            width = 110;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.name;
         }
         addChild(ft);
         _height = 55;
      }
   }
}

