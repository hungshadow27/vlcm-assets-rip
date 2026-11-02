package com.tgame.shell.view.components.rankinglist
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class RankingListRanader extends FListCellRenderer
   {
      
      public function RankingListRanader()
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
         if(data.NO == "1")
         {
            color = uint(StaticValue.GREEN);
         }
         if(data.NO == "2" || data.NO == "3")
         {
            color = uint(StaticValue.BLUE);
         }
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
            text = data.NO;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 49;
            y = 2;
            width = 81;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            if(data.player.charAt(0) == "[" && data.player.indexOf("]") != -1)
            {
               text = data.player.split("]")[1];
            }
            else
            {
               text = data.player;
            }
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 132;
            y = 2;
            width = 86;
            height = 18;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.count;
         }
         addChild(lb);
      }
   }
}

