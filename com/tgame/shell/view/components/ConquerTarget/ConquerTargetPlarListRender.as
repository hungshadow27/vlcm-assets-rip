package com.tgame.shell.view.components.ConquerTarget
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class ConquerTargetPlarListRender extends FListCellRenderer
   {
      
      public function ConquerTargetPlarListRender()
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
            x = 0;
            y = 0;
            width = 110;
            height = 20;
            textColor = StaticValue.WHITE;
            text = data.name;
         }
         addChild(ft);
         _height = ft.height;
      }
   }
}

