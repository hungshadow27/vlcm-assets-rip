package com.tgame.shell.view.components.gift.itemrender
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class DengLuYouLiGiftListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function DengLuYouLiGiftListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         var dengluBar1:ColorBar;
         var arr:Array;
         var len:int;
         var btn:SmallButton;
         var i:int = 0;
         var item:ItemFace = null;
         var img:Bitmap = null;
         _height = 39;
         tf = new TextFormat();
         tf.align = TextFormatAlign.CENTER;
         ft = new FTextArea();
         with(ft)
         {
            width = 150;
            height = 20;
            x = 0;
            y = 0;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,0,[data.day]) + "</font>";
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
            htmlText = "<font color=\'" + StaticValue.BlUE50_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font>";
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
         if(data.count >= data.day)
         {
            dengluBar1.type = 5;
         }
         dengluBar1.setValue(data.count,data.day);
         arr = data.items;
         len = int(arr.length);
         i = 0;
         while(i < len)
         {
            img = StaticValue.getBitmapByClassName("ui.tiem.slot");
            addChild(img);
            img.x = 198 + i * 40;
            img.y = 0;
            item = new ItemFace(arr[i] as Goods);
            addChild(item);
            item.x = i * 40 + 200;
            item.y = 2;
            i++;
         }
         btn = new SmallButton();
         addChild(btn);
         btn.x = 311;
         btn.y = 7;
         if(data.isOpen)
         {
            btn.label = LanResManager.getLanTextWords(this,2);
            btn.enabled = false;
         }
         else
         {
            btn.label = LanResManager.getLanTextWords(this,3);
            btn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_DENGLUY_GET_BTN_CLICK,"",data.id));
      }
   }
}

