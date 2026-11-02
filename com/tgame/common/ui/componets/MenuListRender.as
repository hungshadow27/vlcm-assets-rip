package com.tgame.common.ui.componets
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import flash.text.TextFormat;
   
   public class MenuListRender extends FListCellRenderer
   {
      
      public function MenuListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ft:TextFormat;
         var fb:FTextArea;
         _height = 20;
         ft = new TextFormat();
         ft.align = "center";
         fb = new FTextArea();
         with(fb)
         {
            width = 85;
            height = 20;
            defaultTextFormat = ft;
            textColor = data.color != undefined ? data.color : StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.label;
         }
         addChild(fb);
         if(data.state == 0)
         {
            mouseChildren = false;
            mouseEnabled = false;
         }
      }
   }
}

