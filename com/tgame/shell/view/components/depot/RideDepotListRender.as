package com.tgame.shell.view.components.depot
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   
   public class RideDepotListRender extends FListCellRenderer
   {
      
      public function RideDepotListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var color:uint = 0;
         var lb:FLabel = null;
         _height = 21;
         if(data.label == "0")
         {
            color = uint(StaticValue.WHITE);
            lb = new FLabel();
            with(lb)
            {
               
               x = 80;
               y = 2;
               textColor = color;
               filters = StaticValue.filter;
               text = LanResManager.getLanTextWords(this,0);
            }
            addChild(lb);
         }
         else if(data.label == "-1")
         {
            color = uint(StaticValue.BLUE);
            lb = new FLabel();
            with(lb)
            {
               
               x = 80;
               y = 2;
               textColor = color;
               filters = StaticValue.filter;
               text = LanResManager.getLanTextWords(this,1);
            }
            addChild(lb);
         }
         else
         {
            color = uint(StaticValue.rideColors[int(data.quality)]);
            lb = new FLabel();
            with(lb)
            {
               
               x = 60;
               y = 2;
               textColor = color;
               filters = StaticValue.filter;
               text = data.rideName;
            }
            addChild(lb);
            lb = new FLabel();
            with(lb)
            {
               
               x = 160;
               y = 2;
               textColor = color;
               filters = StaticValue.filter;
               text = data.level + LanResManager.getLanCommonTextWords("级");
            }
            addChild(lb);
         }
      }
   }
}

