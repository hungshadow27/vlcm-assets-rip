package com.tgame.shell.view.components.depot
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   
   public class RideListItemRender extends FListCellRenderer
   {
      
      public function RideListItemRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var color:int;
         var lb:FLabel;
         var ico:Bitmap = null;
         _height = 21;
         color = int(StaticValue.rideColors[int(data.quality)]);
         lb = new FLabel();
         with(lb)
         {
            x = 25;
            y = 2;
            textColor = color;
            filters = StaticValue.filter;
            text = data.rideName;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 110;
            y = 2;
            textColor = color;
            filters = StaticValue.filter;
            text = data.level;
         }
         addChild(lb);
         if(data.state == "1")
         {
            ico = StaticValue.getBitmapByClassName("ui.ride.state.qi");
            addChild(ico);
         }
         else if(data.state == "2")
         {
            ico = StaticValue.getBitmapByClassName("ui.ride.state.zhan");
            addChild(ico);
         }
      }
   }
}

