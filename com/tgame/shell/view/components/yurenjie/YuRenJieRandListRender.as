package com.tgame.shell.view.components.yurenjie
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class YuRenJieRandListRender extends FListCellRenderer
   {
      
      public function YuRenJieRandListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         _height = 25;
         lb = new FLabel();
         with(lb)
         {
            x = 0;
            y = 0;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.name;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            y = 0;
            width = 110;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.cishu;
            x = 130 + 47 - lb.textWidth / 2;
         }
         addChild(lb);
      }
   }
}

