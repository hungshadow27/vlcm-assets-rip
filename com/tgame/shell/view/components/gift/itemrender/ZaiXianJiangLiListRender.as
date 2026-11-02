package com.tgame.shell.view.components.gift.itemrender
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class ZaiXianJiangLiListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function ZaiXianJiangLiListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         var img:Bitmap;
         var dengluBar1:ColorBar;
         var item:ItemFace = null;
         _height = 39;
         tf = new TextFormat();
         tf.align = TextFormatAlign.CENTER;
         ft = new FTextArea();
         with(ft)
         {
            width = 120;
            height = 20;
            x = 0;
            y = 0;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,0,[data.maxTime]) + "</font>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            width = 100;
            height = 20;
            x = 0;
            y = 17;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(DengLuYouLiGiftListRender,1) + "</font>";
         }
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
         addChild(img);
         img.x = 38;
         img.y = 16;
         dengluBar1 = new ColorBar(1,95,11);
         addChild(dengluBar1);
         dengluBar1.x = 53;
         dengluBar1.y = 19;
         if(data.minTime >= data.maxTime)
         {
            dengluBar1.type = 5;
            dengluBar1.setValue(data.maxTime,data.maxTime);
         }
         else
         {
            dengluBar1.type = 1;
            dengluBar1.setValue(data.minTime,data.maxTime);
         }
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 198;
         img.y = 0;
         item = new ItemFace(data.items as Goods);
         addChild(item);
         item.x = 200;
         item.y = 2;
         ft = new FTextArea();
         with(ft)
         {
            width = 150;
            height = 20;
            x = 248;
            y = 11;
            filters = StaticValue.filter;
         }
         addChild(ft);
         if(data.drawTime <= 0)
         {
            ft.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + "【" + LanResManager.getLanTextWords(this,1) + "】" + "</font>";
         }
         else
         {
            ft.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + "【" + LanResManager.getLanTextWords(this,2,[data.drawTime]) + "】" + "</font>";
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
      }
   }
}

