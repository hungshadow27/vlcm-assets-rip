package com.tgame.shell.view.components.instanceportal
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class GumuMishiChuansongListRender extends FListCellRenderer
   {
      
      public function GumuMishiChuansongListRender()
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
         ft = new FTextArea();
         with(ft)
         {
            width = 140;
            height = 20;
            x = 2;
            y = 2;
            textColor = StaticValue.BLUE;
            htmlText = data.name;
            defaultTextFormat = tf;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            width = 100;
            height = 20;
            x = 155;
            y = 2;
            textColor = StaticValue.WHITE;
            htmlText = data.grade;
            defaultTextFormat = tf;
         }
         addChild(ft);
      }
   }
}

