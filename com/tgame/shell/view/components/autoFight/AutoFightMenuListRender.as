package com.tgame.shell.view.components.autoFight
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class AutoFightMenuListRender extends FListCellRenderer
   {
      
      public function AutoFightMenuListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var fb:FLabel;
         _height = 20;
         fb = new FLabel();
         with(fb)
         {
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.show;
         }
         addChild(fb);
      }
   }
}

