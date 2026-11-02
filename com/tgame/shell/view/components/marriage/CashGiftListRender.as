package com.tgame.shell.view.components.marriage
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class CashGiftListRender extends FListCellRenderer
   {
      
      public function CashGiftListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 21;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 2;
            width = 114;
            height = 20;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            if(data.isLine == "0")
            {
               textColor = 6052956;
            }
            else
            {
               textColor = StaticValue.WHITE;
            }
            text = data.label;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 114;
            y = 2;
            width = 54;
            height = 16;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.lv;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 188;
            y = 2;
            width = 60;
            height = 16;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.count;
         }
         addChild(ft);
      }
   }
}

