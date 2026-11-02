package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class RecoverRender extends FListCellRenderer
   {
      
      public function RecoverRender()
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
            text = data.name;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 95;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.dengji;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 145;
            y = 5;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.date;
         }
         addChild(lb);
      }
   }
}

