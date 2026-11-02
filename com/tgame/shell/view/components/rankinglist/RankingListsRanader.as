package com.tgame.shell.view.components.rankinglist
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class RankingListsRanader extends FListCellRenderer
   {
      
      public function RankingListsRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         _height = 20;
         lb = new FLabel();
         with(lb)
         {
            x = 10;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = data.label;
         }
         addChild(lb);
      }
   }
}

