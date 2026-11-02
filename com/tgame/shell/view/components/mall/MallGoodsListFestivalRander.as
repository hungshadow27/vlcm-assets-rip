package com.tgame.shell.view.components.mall
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.MallFestivalPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MallGoodsListFestivalRander extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function MallGoodsListFestivalRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ico:DisplayObject;
         var lb:FLabel;
         var ft:FTextArea;
         var btn:SmallButton;
         var img:Bitmap = null;
         var img2:Bitmap = null;
         _height = 75;
         img = StaticValue.getBitmapByClassName("ui.mall.goods.slot");
         addChild(img);
         img.x = 14;
         img.y = 2;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 596;
         img.y = 70;
         ico = FLoader.startLoad(data.bigRes,65,65);
         addChild(ico);
         ico.x = 16;
         ico.y = 4;
         lb = new FLabel();
         with(lb)
         {
            x = 96;
            if(data.isOff == "1")
            {
               y = 10;
            }
            else
            {
               y = 16;
            }
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = data.goodsName;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 200;
            y = 16;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = data.effect;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 96;
            if(data.isOff == "1")
            {
               y = 28;
            }
            else
            {
               y = 38;
            }
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("售价") + "：";
         }
         addChild(lb);
         if(data.type == "0")
         {
            img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         }
         else
         {
            img = StaticValue.getBitmapByClassName("ui.ico.money.lijin");
         }
         addChild(img);
         img.x = 133;
         if(data.isOff == "1")
         {
            img.y = 29;
         }
         else
         {
            img.y = 39;
         }
         lb = new FLabel();
         with(lb)
         {
            x = 158;
            if(data.isOff == "1")
            {
               y = 28;
            }
            else
            {
               y = 38;
            }
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.price;
         }
         addChild(lb);
         ft = new FTextArea();
         with(ft)
         {
            x = 200;
            y = 36;
            width = 332;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            text = data.describe;
         }
         addChild(ft);
         if(data.isOff == "1")
         {
            ft = new FTextArea();
            with(ft)
            {
               
               x = 96;
               y = 46;
               autoSize = TextFieldAutoSize.LEFT;
            }
            ft.htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("原价") + "：" + data.price0 + "</font>";
            addChild(ft);
         }
         if(data.isHot == "1")
         {
            img = StaticValue.getBitmapByClassName("ui.mall.label.hot");
            addChild(img);
            img.x = 415;
            img.y = 2;
         }
         else if(data.isHot == "2")
         {
            img = StaticValue.getBitmapByClassName("ui.mall.label.xiangou");
            addChild(img);
            img.x = -10;
            img.y = -8;
         }
         else if(data.isHot == "3")
         {
            img = StaticValue.getBitmapByClassName("ui.mall.label.hot");
            addChild(img);
            img.x = 415;
            img.y = 2;
            img2 = StaticValue.getBitmapByClassName("ui.mall.label.xiangou");
            addChild(img2);
            img2.x = -10;
            img2.y = -8;
         }
         if(data.isOff == "1")
         {
            img = StaticValue.getBitmapByClassName("ui.mall.label.off");
            addChild(img);
            img.x = 475;
            img.y = 2;
         }
         btn = new SmallButton();
         btn.label = LanResManager.getLanCommonTextWords("兑换");
         addChild(btn);
         btn.x = 538;
         btn.y = 36;
         btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(MallFestivalPanel.UI_MALLPANEL_BUYBTN_CLICK,"",int(data.label)));
      }
   }
}

