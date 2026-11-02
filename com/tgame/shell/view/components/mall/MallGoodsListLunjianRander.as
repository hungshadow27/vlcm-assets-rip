package com.tgame.shell.view.components.mall
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.MallLunjianPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MallGoodsListLunjianRander extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function MallGoodsListLunjianRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ico:DisplayObject;
         var lb:FLabel;
         var btn:SmallButton;
         var img:Bitmap = null;
         var ft:FTextArea = null;
         _height = 100;
         img = StaticValue.getBitmapByClassName("ui.mall.goods.slot");
         addChild(img);
         img.x = 14;
         img.y = 2;
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 596;
         img.y = 100;
         ico = FLoader.startLoad(data.bigRes,65,65);
         addChild(ico);
         ico.x = 16;
         ico.y = 4;
         lb = new FLabel();
         with(lb)
         {
            x = 85;
            y = 15;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.goodsName;
         }
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 200;
            y = 0;
            width = 332;
            height = 45;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = data.describe2;
         }
         addChild(lb);
         ft = new FTextArea();
         with(ft)
         {
            x = 200;
            y = 40;
            width = 332;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            text = data.describe;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 85;
            y = 31;
            width = 120;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(ft);
         if(data.type == 2)
         {
            ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("声望类型：") + "</font>" + LanResManager.getLanCommonTextWords("论剑声望");
         }
         else if(data.type == 1)
         {
            ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("声望类型：") + "</font>" + LanResManager.getLanCommonTextWords("城战声望");
         }
         else if(data.type == 5)
         {
            ft.htmlText = "";
         }
         else if(data.type == 6)
         {
            ft.htmlText = "";
         }
         ft = new FTextArea();
         with(ft)
         {
            x = 85;
            y = 46;
            width = 120;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         if(data.type == 5)
         {
            ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所需侠侣值：") + "</font>" + data.price;
         }
         else if(data.type == 6)
         {
            ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所需功勋值：") + "</font>" + data.price;
         }
         else if(data.type == 7)
         {
            ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所需积分：") + "</font>" + data.price;
         }
         else
         {
            ft.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("所需声望：") + "</font>" + data.price;
         }
         addChild(ft);
         btn = new SmallButton();
         btn.label = LanResManager.getLanCommonTextWords("购买");
         addChild(btn);
         btn.x = 538;
         btn.y = 36;
         btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(MallLunjianPanel.UI_MALLPANEL_BUYBTN_CLICK,"",int(data.label)));
      }
   }
}

