package com.tgame.shell.view.components.mall
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.MysteryMallPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MysteryMallGoodsListRander extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function MysteryMallGoodsListRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ico:DisplayObject;
         var lb:FLabel;
         var ft11:FTextArea;
         var miaoshuFt:FTextArea;
         var ft:FTextArea;
         var btn:SmallButton;
         var img2:Bitmap = null;
         var img:Bitmap = StaticValue.getBitmapByClassName("ui.mall.goods.slot");
         addChild(img);
         img.x = 14;
         img.y = 2;
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
         ft11 = new FTextArea();
         with(ft11)
         {
            x = 200;
            y = 16;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = data.effect;
         }
         addChild(ft11);
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
         else if(data.type == "4")
         {
            img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
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
         if(data.type == "4")
         {
            img.y = 25;
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
         miaoshuFt = new FTextArea();
         with(miaoshuFt)
         {
            x = 200;
            y = 36;
            multiline = true;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            width = 340;
            filters = StaticValue.filter;
            htmlText = data.describe;
         }
         addChild(miaoshuFt);
         ft = new FTextArea();
         if(data.isOff == "1")
         {
            ft = new FTextArea();
            with(ft)
            {
               
               x = 96;
               y = 46;
               autoSize = TextFieldAutoSize.LEFT;
               htmlText = "<font color=\'" + StaticValue.BlUE20_HTML + "\'>" + LanResManager.getLanCommonTextWords("原价") + "：" + data.price0 + "</font>";
            }
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
         btn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(btn);
         btn.x = 538;
         btn.y = 36;
         btn.addEventListener(MouseEvent.CLICK,this.onClick);
         if(ico.height + ico.y > miaoshuFt.height + miaoshuFt.y)
         {
            _height = ico.y + ico.height + 5;
         }
         else
         {
            _height = miaoshuFt.y + miaoshuFt.height + 5;
         }
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 596;
         img.y = _height - 2;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(MysteryMallPanel.UI_MALLPANEL_BUYBTN_CLICK,"",[int(data.label),int(data.type)]));
      }
   }
}

