package com.tgame.shell.view.components.huodong
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class TimeBaozangGoodsListRander extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function TimeBaozangGoodsListRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var img:Bitmap;
         var imgLine:*;
         var ico:DisplayObject;
         var lb1:FLabel;
         var lb2:FLabel;
         var ft1:FTextArea;
         var btn:SmallButton;
         _height = 75;
         img = StaticValue.getBitmapByClassName("ui.mall.goods.slot");
         addChild(img);
         img.x = 14;
         img.y = 2;
         imgLine = StaticValue.getBitmapByClassName("ui.line");
         addChild(imgLine);
         imgLine.width = 596;
         imgLine.y = 73;
         ico = FLoader.startLoad(data.bigRes,65,65);
         addChild(ico);
         ico.x = 16;
         ico.y = 4;
         lb1 = new FLabel();
         with(lb1)
         {
            x = 96;
            y = 5;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = data.goodsName + " X " + data.goodsNum;
         }
         addChild(lb1);
         lb2 = new FLabel();
         with(lb2)
         {
            x = 96;
            y = 50;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = data.spName + " X " + data.spNum;
         }
         addChild(lb2);
         ft1 = new FTextArea();
         with(ft1)
         {
            x = 220;
            y = 5;
            width = 322;
            height = 71;
            multiline = true;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = data.describe;
         }
         addChild(ft1);
         btn = new SmallButton();
         btn.label = LanResManager.getLanCommonTextWords("兑换");
         addChild(btn);
         btn.x = 548;
         btn.y = 36;
         btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(timeBaozangPanel.UI_TIMEBAOZANG_DUIHUAN_CLICK,"",int(data.mallId)));
      }
   }
}

