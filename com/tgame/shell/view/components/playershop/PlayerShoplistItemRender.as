package com.tgame.shell.view.components.playershop
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.tgame.common.ui.componets.*;
   
   public class PlayerShoplistItemRender extends FListCellRenderer
   {
      
      public function PlayerShoplistItemRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var lb:FLabel;
         _height = 21;
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.shopNO;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 54;
            y = 2;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            if(data.shopName.charAt(0) == "[" && data.shopName.indexOf("]") != -1)
            {
               text = data.shopName.split("]")[1];
            }
            else
            {
               text = data.shopName;
            }
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 178;
            y = 2;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            if(data.shopper.charAt(0) == "[" && data.shopper.indexOf("]") != -1)
            {
               text = data.shopper.split("]")[1];
            }
            else
            {
               text = data.shopper;
            }
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 277;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.level;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 328;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.itemCount;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 395;
            y = 2;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.rideCount;
         }
         addChild(lb);
      }
   }
}

