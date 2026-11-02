package com.tgame.shell.view.components.playershop
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.character.Mount;
   import com.tgame.shell.view.components.PlayerShopPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class PlayerShopRideShowPopWindow extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var itemName:FLabel;
      
      private var slot:Bitmap;
      
      private var item:Bitmap;
      
      private var count:FLabel;
      
      private var copper:FTextInput;
      
      private var silver:FTextInput;
      
      private var okBtn:SecondButton;
      
      public function PlayerShopRideShowPopWindow()
      {
         var lb:FLabel;
         var img:Bitmap;
         var bg:F9GridBitmap = null;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 182;
         height = 179;
         titleText = LanResManager.getLanCommonTextWords("坐骑上架");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         lb = new FLabel();
         with(lb)
         {
            x = 30;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"坐骑名称");
         addChild(lb);
         bg = Tools.get9GridBitmpByName("inputBg");
         addChild(bg);
         bg.x = 20;
         bg.y = 24;
         bg.width = 76;
         this.itemName = new FLabel();
         with(this.itemName)
         {
            x = 23;
            y = 23;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.itemName.text = LanResManager.getLanTextWords(PlayerShopItemBuyPopWindow,"物品名称");
         addChild(this.itemName);
         this.slot = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.slot);
         this.slot.x = 120;
         this.slot.y = 13;
         lb = new FLabel();
         with(lb)
         {
            x = 11;
            y = 50;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"等级");
         addChild(lb);
         bg = Tools.get9GridBitmpByName("countBg");
         addChild(bg);
         bg.width = 96;
         bg.x = 61;
         bg.y = 69;
         bg = Tools.get9GridBitmpByName("countBg");
         addChild(bg);
         bg.width = 96;
         bg.x = 61;
         bg.y = 91;
         lb = new FLabel();
         with(lb)
         {
            x = 11;
            y = 66;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanCommonTextWords("总价") + "：";
         addChild(lb);
         this.count = new FLabel();
         with(this.count)
         {
            x = 64;
            y = 50;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "99";
         }
         addChild(this.count);
         this.copper = new FTextInput();
         with(this.copper)
         {
            x = 86;
            y = 69;
            maxChars = 9;
            restrict = "0-9";
            width = 66;
            height = 20;
            textColor = StaticValue.YELLOW;
            text = "0";
         }
         addChild(this.copper);
         this.silver = new FTextInput();
         with(this.silver)
         {
            x = 86;
            y = 91;
            maxChars = 9;
            restrict = "0-9";
            width = 66;
            height = 20;
            textColor = StaticValue.YELLOW;
            text = "0";
         }
         addChild(this.silver);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 61;
         img.y = 69;
         img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         addChild(img);
         img.x = 61;
         img.y = 91;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"上架");
         addChild(this.okBtn);
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 120;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onChange(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.copper:
               if(int(this.copper.text) < 1)
               {
                  this.copper.text = "1";
               }
               break;
            case this.silver:
               if(int(this.silver.text) < 1)
               {
                  this.silver.text = "1";
               }
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.copper.text == "" && this.silver.text == "")
         {
            FAlert.show(LanResManager.getLanTextWords(this,"请输入坐骑总价",[StaticValue.RED_HTML]));
            return;
         }
         if(int(this.copper.text) == 0 && int(this.silver.text) == 0)
         {
            FAlert.show(LanResManager.getLanTextWords(this,"坐骑总价不能为",[StaticValue.RED_HTML]));
            return;
         }
         this.$parent.dispatchEvent(new BaseEvent(PlayerShopPanel.UI_SHOPPANEL_RIDE_SHOW_OK,"",[int(this.copper.text),int(this.silver.text)]));
         this.onClose();
      }
      
      public function setRide(param1:Mount) : void
      {
         this.itemName.text = param1.res.name;
         this.count.text = param1.mountAttributeInfo.lv.toString();
         if(this.item != null && this.item.parent != null)
         {
            removeChild(this.item);
         }
         this.item = param1.getSmallICO();
         addChild(this.item);
         this.item.x = this.slot.x + 2;
         this.item.y = this.slot.y + 2;
      }
   }
}

