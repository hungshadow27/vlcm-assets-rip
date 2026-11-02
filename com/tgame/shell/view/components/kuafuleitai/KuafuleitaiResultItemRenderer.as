package com.tgame.shell.view.components.kuafuleitai
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class KuafuleitaiResultItemRenderer extends FListCellRenderer
   {
      
      public function KuafuleitaiResultItemRenderer()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         _height = 24;
         lb = new FLabel();
         with(lb)
         {
            x = 2;
            y = 5;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = data.playerName;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 90;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.level;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 150;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.deathCount;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 218;
            y = 5;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = data.beatCount;
         }
         addChild(lb);
      }
   }
}

