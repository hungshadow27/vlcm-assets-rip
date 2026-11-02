package com.tgame.shell.view.components.cycletask
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   
   public class CycTaskRideListRender extends FListCellRenderer
   {
      
      public function CycTaskRideListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var color:int;
         var lb:FLabel;
         _height = 21;
         color = int(StaticValue.rideColors[int(data.quality)]);
         lb = new FLabel();
         with(lb)
         {
            x = 32;
            y = 2;
            textColor = color;
            filters = StaticValue.filter;
            text = data.rideName;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 135;
            y = 2;
            textColor = color;
            filters = StaticValue.filter;
            text = data.level + LanResManager.getLanCommonTextWords("级");
         }
         addChild(lb);
      }
   }
}

