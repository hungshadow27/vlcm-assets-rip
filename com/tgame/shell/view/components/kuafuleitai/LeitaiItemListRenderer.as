package com.tgame.shell.view.components.kuafuleitai
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class LeitaiItemListRenderer extends FListCellRenderer
   {
      
      public function LeitaiItemListRenderer()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         var bg:F9GridBitmap = null;
         var sp:Sprite = null;
         _height = 26;
         bg = Tools.get9GridBitmpByName("selectCharListBg");
         bg.width = 200;
         sp = new Sprite();
         sp.addChild(bg);
         sp.x = 0;
         sp.y = 2;
         sp.width = 200;
         sp.height = 24;
         addChild(sp);
         lb = new FLabel();
         with(lb)
         {
            x = 80;
            y = 4;
            if(data.isfull == 0)
            {
               textColor = StaticValue.GREEN;
            }
            else
            {
               textColor = StaticValue.RED;
            }
            filters = StaticValue.filter;
            text = data.label;
         }
         lb.mouseEnabled = false;
         lb.defaultTextFormat = new TextFormat(null,13,null,true,null,null,null,null,"center");
         addChild(lb);
      }
   }
}

