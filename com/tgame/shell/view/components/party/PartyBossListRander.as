package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   
   public class PartyBossListRander extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var arrColor:Array = [StaticValue.GREEN,StaticValue.RED];
      
      public function PartyBossListRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var go:Goods;
         var i:int;
         var lb:FLabel;
         var img:Bitmap = null;
         var ico:DisplayObject = null;
         var bmpStar:Bitmap = null;
         _height = 75;
         img = StaticValue.getBitmapByClassName("ui.mall.goods.slot");
         addChild(img);
         img.x = 7;
         img.y = 2;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 234;
         img.y = 70;
         go = new Goods(data.bigRes);
         ico = FLoader.startLoad(go.getBigICOPath(),65,65);
         addChild(ico);
         ico.x = 9;
         ico.y = 4;
         i = 0;
         while(i < 10)
         {
            if(i < data.grade)
            {
               bmpStar = StaticValue.getBitmapByClassName("itemtip.s2");
            }
            else
            {
               bmpStar = StaticValue.getBitmapByClassName("itemtip.s1");
            }
            bmpStar.x = i * 16 + 75;
            bmpStar.y = 28;
            addChild(bmpStar);
            i++;
         }
         lb = new FLabel();
         with(lb)
         {
            x = 85;
            y = 8;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.name;
         }
         addChild(lb);
         if(data.tiaozhan == 1)
         {
            lb = new FLabel();
            with(lb)
            {
               
               x = 195 - 35;
               y = 8 + 42;
               textColor = StaticValue.RED;
               filters = StaticValue.filter;
               text = LanResManager.getLanCommonTextWords("挑战中");
            }
            addChild(lb);
         }
      }
   }
}

