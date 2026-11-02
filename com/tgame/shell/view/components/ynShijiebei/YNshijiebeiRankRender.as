package com.tgame.shell.view.components.ynShijiebei
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   
   public class YNshijiebeiRankRender extends FListCellRenderer
   {
      
      private var bt_bit:Bitmap;
      
      private var line:Bitmap;
      
      public function YNshijiebeiRankRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var color:uint;
         var lb:FLabel;
         _height = 24;
         color = uint(StaticValue.WHITE);
         if(data.index == "1")
         {
            color = uint(StaticValue.YELLOW);
         }
         if(data.index == "2")
         {
            color = uint(StaticValue.GREEN);
         }
         if(data.index == "3")
         {
            color = uint(StaticValue.BLUE);
         }
         if(data.index % 2 == 0)
         {
            this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
            this.bt_bit.x = 0;
            this.bt_bit.y = 0;
            this.bt_bit.width = 238 + 60;
            this.bt_bit.height = 24;
            addChild(this.bt_bit);
         }
         if(this.bt_bit != null)
         {
            if(data.type == 1)
            {
               this.bt_bit.width = 238;
            }
            else
            {
               this.bt_bit.width = 238 + 60;
            }
         }
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 4;
         this.line.y = 23;
         this.line.width = 238 + 60;
         addChild(this.line);
         if(data.type == 1)
         {
            this.line.width = 238;
         }
         else
         {
            this.line.width = 238 + 60;
         }
         lb = new FLabel();
         with(lb)
         {
            x = 10 + 10;
            y = 0;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.index;
         }
         addChild(lb);
         if(data.type == 1)
         {
            lb.x = 10;
         }
         else
         {
            lb.x = 10 + 10;
         }
         lb = new FLabel();
         with(lb)
         {
            x = 50 + 55;
            y = 0;
            width = 110;
            textColor = color;
            filters = StaticValue.filter;
            text = data.name;
         }
         addChild(lb);
         if(data.type == 1)
         {
            lb.x = 50;
         }
         else
         {
            lb.x = 50 + 55;
         }
         lb = new FLabel();
         with(lb)
         {
            x = 170 + 60;
            y = 0;
            width = 110;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.count;
         }
         addChild(lb);
         if(data.type == 1)
         {
            lb.x = 170;
         }
         else
         {
            lb.x = 170 + 60;
         }
      }
   }
}

