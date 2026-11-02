package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class FuQiJingjiList extends FListCellRenderer
   {
      
      public function FuQiJingjiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var color:uint;
         var tf:TextFormat;
         var lb:FTextArea;
         _height = 21.5;
         color = uint(StaticValue.WHITE);
         if(data.index == "1")
         {
            color = uint(StaticValue.GREEN);
         }
         if(data.index == "2" || data.index == "3")
         {
            color = uint(StaticValue.BLUE);
         }
         tf = new TextFormat();
         tf.align = "center";
         lb = new FTextArea();
         with(lb)
         {
            x = 0;
            y = 2;
            width = 62;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.index;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 55;
            y = 2;
            width = 151;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.name1 + "&" + data.name2;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 250;
            y = 2;
            width = 40;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.shengwang;
         }
         addChild(lb);
      }
   }
}

