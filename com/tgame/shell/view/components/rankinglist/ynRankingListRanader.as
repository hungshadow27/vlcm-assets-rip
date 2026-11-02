package com.tgame.shell.view.components.rankinglist
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class ynRankingListRanader extends FListCellRenderer
   {
      
      private var bt_bit:Bitmap;
      
      private var line:Bitmap;
      
      public function ynRankingListRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var color:uint;
         var tf:TextFormat;
         var lb:FTextArea;
         _height = 22;
         color = uint(StaticValue.WHITE);
         if(data.index == "1")
         {
            color = uint(StaticValue.GREEN);
         }
         if(data.index == "2" || data.index == "3")
         {
            color = uint(StaticValue.BLUE);
         }
         if(data.index % 2 == 0)
         {
            this.bt_bit = StaticValue.getBitmapByClassName("ui.tongyong.touming1");
            this.bt_bit.x = 0;
            this.bt_bit.y = 0;
            this.bt_bit.width = 400 - 20;
            this.bt_bit.height = 24;
            addChild(this.bt_bit);
         }
         this.line = new Bitmap();
         this.line = StaticValue.getBitmapByClassName("ui.line");
         this.line.x = 4;
         this.line.y = 23;
         this.line.width = 370;
         addChild(this.line);
         tf = new TextFormat();
         tf.align = "center";
         lb = new FTextArea();
         with(lb)
         {
            x = 0;
            y = 2;
            width = 49;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.index;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 90;
            y = 2;
            width = 81;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            if(data.name.charAt(0) == "[" && data.name.indexOf("]") != -1)
            {
               text = data.name.split("]")[1];
            }
            else
            {
               text = data.name;
            }
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 240;
            y = 2;
            width = 86;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.val;
         }
         addChild(lb);
      }
   }
}

