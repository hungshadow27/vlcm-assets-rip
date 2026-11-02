package com.tgame.shell.view.components.fengzhengjie
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class FengZhengJieRandListRender extends FListCellRenderer
   {
      
      public function FengZhengJieRandListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         _height = 23;
         lb = new FLabel();
         with(lb)
         {
            x = 5;
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

