package com.tgame.shell.view.components.backpack
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.Backpack;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class ItemDestroyPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var item:Bitmap;
      
      private var itemName:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function ItemDestroyPanel()
      {
         var lb:FLabel;
         var img:Bitmap;
         var tf:TextFormat;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 172;
         height = 162;
         titleText = LanResManager.getLanTextWords(this,"物品摧毁");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         lb = new FLabel();
         with(lb)
         {
            x = 15;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"销毁物品");
         }
         addChild(lb);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 67;
         img.y = 50;
         tf = new TextFormat();
         tf.align = "center";
         this.itemName = new FTextArea();
         with(this.itemName)
         {
            x = 6;
            y = 25;
            width = 160;
            height = 20;
            defaultTextFormat = tf;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
         }
         addChild(this.itemName);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 15;
         this.okBtn.y = 102;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 172 - 15 - this.cancelBtn.width;
         this.cancelBtn.y = 102;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(Backpack.UI_BACKPACK_DESTROYITEM));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      public function setItem(param1:Goods) : void
      {
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = param1.getSmallICO();
         this.item.x = 69;
         this.item.y = 52;
         addChild(this.item);
         this.itemName.textColor = StaticValue.itemColors[param1.quality];
         this.itemName.text = param1.res.name;
      }
   }
}

