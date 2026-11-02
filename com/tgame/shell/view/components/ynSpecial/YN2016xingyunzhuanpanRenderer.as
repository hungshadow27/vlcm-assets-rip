package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class YN2016xingyunzhuanpanRenderer extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var tf:TextFormat;
      
      private var ft:FTextArea;
      
      private var bit:Bitmap;
      
      private var item:ItemFace;
      
      private var btn:SecondButton;
      
      public function YN2016xingyunzhuanpanRenderer()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 43;
         this.tf = new TextFormat();
         this.tf.align = "left";
         this.bit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.bit.x = 10;
         this.bit.y = 4;
         addChild(this.bit);
         this.item = new ItemFace(new Goods(data.goodsID));
         this.item.x = 12;
         this.item.y = 6;
         addChild(this.item);
         this.ft = new FTextArea();
         with(this.ft)
         {
            defaultTextFormat = tf;
            x = 63;
            y = 12;
            width = 40;
            height = 20;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = data.jileizhi;
         }
         addChild(this.ft);
         this.btn = new SecondButton();
         this.btn.x = 110;
         this.btn.y = 10;
         addChild(this.btn);
         this.btn.label = LanResManager.getLanCommonTextWords("兑换");
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent = null) : void
      {
         $parent.dispatchEvent(new BaseEvent(YN2016xingyunzhuanpanPanel.YN_XINGYUNZHUANPAN_DUIHUANWUPIN,"",data.goodsIndex));
      }
   }
}

