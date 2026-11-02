package com.tgame.shell.view.components.gift.itemrender
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.GiftPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class YaoQinYouLiGiftListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function YaoQinYouLiGiftListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         var arr:Array;
         var len:int;
         var i:int = 0;
         var item:ItemFace = null;
         var btn:SmallButton = null;
         _height = 41;
         tf = new TextFormat();
         tf.align = TextFormatAlign.CENTER;
         ft = new FTextArea();
         with(ft)
         {
            y = 20;
            width = 70;
            height = 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            defaultTextFormat = tf;
            text = data.count + LanResManager.getLanCommonTextWords("人");
         }
         addChild(ft);
         arr = data.items;
         len = int(arr.length);
         i = 0;
         while(i < len)
         {
            item = new ItemFace(arr[i] as Goods);
            addChild(item);
            item.x = i * 37 + 80;
            item.y = 3;
            i++;
         }
         btn = new SmallButton();
         addChild(btn);
         btn.x = 360;
         btn.y = 20;
         if(data.isOpen)
         {
            btn.label = LanResManager.getLanCommonTextWords("已领");
            btn.enabled = false;
         }
         else
         {
            btn.label = LanResManager.getLanCommonTextWords("领取");
            btn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(GiftPanel.UI_GIFTPANEL_YAOQING_GET_BTN_CLICK,"",data.id));
      }
   }
}

