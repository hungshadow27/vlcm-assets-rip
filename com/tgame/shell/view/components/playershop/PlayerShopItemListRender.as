package com.tgame.shell.view.components.playershop
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.*;
   import flash.display.Bitmap;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   
   public class PlayerShopItemListRender extends FListCellRenderer
   {
      
      public function PlayerShopItemListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var baseItem:Goods;
         var img:Bitmap;
         var item:ItemFace;
         var lb:FLabel;
         var bg:F9GridBitmap = null;
         var bg1:F9GridBitmap = null;
         _height = 41;
         baseItem = data.item as Goods;
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.y = 1;
         item = new ItemFace(baseItem);
         addChild(item);
         item.x = 2;
         item.y = 3;
         lb = new FLabel();
         with(lb)
         {
            x = 39;
            y = 10;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = baseItem.res.name;
         }
         addChild(lb);
         bg = Tools.get9GridBitmpByName("countBg");
         addChild(bg);
         bg.width = 88;
         bg.x = 125;
         bg.y = 1;
         bg1 = Tools.get9GridBitmpByName("countBg");
         addChild(bg1);
         bg1.width = 88;
         bg1.x = 125;
         bg1.y = 21;
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 120;
         img.y = 0;
         img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         addChild(img);
         img.x = 120;
         img.y = 22;
         lb = new FLabel();
         with(lb)
         {
            x = 140;
            y = 2;
            textColor = StaticValue.ORANGE;
            text = NumberFormatter.formatThousands(data.copper);
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 140;
            y = 22;
            textColor = StaticValue.ORANGE;
            text = NumberFormatter.formatThousands(data.silver);
         }
         addChild(lb);
         if(data.silver > 0)
         {
            bg1.filters = [new GlowFilter(StaticValue.RED,1,3,3,15,BitmapFilterQuality.LOW)];
         }
      }
   }
}

