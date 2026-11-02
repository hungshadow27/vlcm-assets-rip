package com.tgame.shell.view.components.team
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   
   public class OrderListRender extends FListCellRenderer
   {
      
      public function OrderListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var fb:FLabel;
         _height = 26;
         fb = new FLabel();
         with(fb)
         {
            x = 3;
            textColor = data.isopen == "0" ? 5921370 : StaticValue.GREEN;
            text = data.label + "(" + (data.isopen == "0" ? LanResManager.getLanTextWords(this,"未学") : LanResManager.getLanTextWords(this,"已学")) + ")";
         }
         addChild(fb);
      }
   }
}

