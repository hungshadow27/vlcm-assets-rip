package com.tgame.shell.view.components.wishingTree
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   
   public class WaterRecordRanader extends FListCellRenderer
   {
      
      public function WaterRecordRanader()
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
            x = 20;
            textColor = StaticValue.WHITE;
            text = data.name;
         }
         addChild(lb);
         lb = new FLabel();
         lb.x = 135;
         lb.textColor = StaticValue.WHITE;
         lb.text = LanResManager.getLanCommonTextWords("前来浇水");
         addChild(lb);
      }
   }
}

