package com.tgame.shell.view.components.trading
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.TradingPanel;
   import flash.events.MouseEvent;
   
   public class TradingListRander extends FListCellRenderer
   {
      
      public function TradingListRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var goods:Goods;
         var item:ItemFace;
         var lb:FTextArea;
         _height = 41;
         goods = data.item as Goods;
         item = new ItemFace(goods);
         item.x = 5;
         item.y = 3;
         addChild(item);
         lb = new FTextArea();
         with(lb)
         {
            x = 43;
            y = 2;
            width = 88;
            height = 39;
            textColor = StaticValue.itemColors[goods.quality];
            text = goods.res.name;
            wordWrap = true;
         }
         addChild(lb);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         data.$parent.dispatchEvent(TradingPanel.UI_TRADINGPANEL_CLICK,"",(param1.target as ItemFace).getBaseItem());
      }
   }
}

