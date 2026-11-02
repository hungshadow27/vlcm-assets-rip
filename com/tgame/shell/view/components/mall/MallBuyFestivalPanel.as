package com.tgame.shell.view.components.mall
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.MallFestivalPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.*;
   
   public class MallBuyFestivalPanel extends FPanel
   {
      
      public static const TYPE_SILVER:String = "TYPE_SILVER";
      
      public static const TYPE_LIJIN:String = "TYPE_LIJIN";
      
      private static var _type:String = TYPE_SILVER;
      
      private static var txt:String = "";
      
      private static var icoClass:String = "ui.ico.money.silver";
      
      public var $parent:DisplayObject;
      
      private var bigIco:DisplayObject;
      
      private var ico:Bitmap;
      
      private var goodsName:FLabel;
      
      private var price:FLabel;
      
      private var effect:FTextArea;
      
      private var count:FTextInput;
      
      private var spendSilver:FLabel;
      
      private var silver:FLabel;
      
      private var tip:FLabel;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var okBtn:SecondButton;
      
      private var id:int;
      
      public function MallBuyFestivalPanel()
      {
         var img:Bitmap;
         var lb:FLabel;
         var ft:FTextArea;
         super();
         this.skin = "sceondPanel_btn";
         this.showCloseButton = true;
         width = 209;
         height = 290;
         this.titleText = LanResManager.getLanCommonTextWords("兑换道具");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.festivalMall.item.exchange.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         this.ico = new Bitmap();
         addChild(this.ico);
         this.ico.x = 15;
         this.ico.y = 5;
         this.goodsName = new FLabel();
         with(this.goodsName)
         {
            x = 96;
            y = 18;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.goodsName);
         lb = new FLabel();
         with(lb)
         {
            x = 96;
            y = 40;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("售价") + "：";
         }
         addChild(lb);
         img = StaticValue.getBitmapByClassName(icoClass);
         addChild(img);
         img.x = 131;
         img.y = 40;
         this.price = new FLabel();
         with(this.price)
         {
            x = 156;
            y = 40;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "125300";
         }
         addChild(this.price);
         this.effect = new FTextArea();
         with(this.effect)
         {
            x = 16;
            y = 78;
            width = 175;
            height = 45;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(MallBuyFestivalPanel,"佩戴能够增加攻击力");
         }
         addChild(this.effect);
         ft = new FTextArea();
         with(ft)
         {
            x = 16;
            y = 136;
            wordWrap = true;
            width = 180;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(MallBuyFestivalPanel,"您将免费兑得该商品10件",[StaticValue.YELLOW_HTML,StaticValue.RED_HTML,StaticValue.RED_HTML]);
         }
         addChild(ft);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"确认兑换");
         addChild(this.okBtn);
         this.okBtn.x = (width - this.okBtn.width) / 2;
         this.okBtn.y = 235;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public static function set type(param1:String) : void
      {
         _type = param1;
         if(_type == TYPE_SILVER)
         {
            txt = LanResManager.getLanCommonTextWords("元宝");
            icoClass = "ui.ico.money.silver";
         }
         else
         {
            txt = LanResManager.getLanCommonTextWords("礼金");
            icoClass = "ui.ico.money.lijin";
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(int(this.count.text) > 0)
               {
                  this.count.text = (int(this.count.text) - 1).toString();
                  this.spendSilver.text = (int(this.price.text) * int(this.count.text)).toString();
                  if(int(this.spendSilver.text) > int(this.silver.text))
                  {
                     this.tip.visible = true;
                     this.okBtn.enabled = false;
                  }
                  else
                  {
                     this.tip.visible = false;
                     this.okBtn.enabled = true;
                  }
               }
               break;
            case this.addBtn:
               this.count.text = (int(this.count.text) + 1).toString();
               this.spendSilver.text = (int(this.price.text) * int(this.count.text)).toString();
               if(int(this.spendSilver.text) > int(this.silver.text))
               {
                  this.tip.visible = true;
                  this.okBtn.enabled = false;
               }
               else
               {
                  this.tip.visible = false;
                  this.okBtn.enabled = true;
               }
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(MallFestivalPanel.UI_MALLPANEL_BUY,"",[this.id,int(10)]));
               this.onClose();
         }
      }
      
      private function onLink(param1:TextEvent) : void
      {
         GameConfig.chongzhi();
      }
      
      private function onChange(param1:Event) : void
      {
         if(int(this.count.text) < 0)
         {
            this.count.text = "0";
         }
         this.spendSilver.text = (int(this.price.text) * int(this.count.text)).toString();
         if(int(this.spendSilver.text) > int(this.silver.text))
         {
            this.tip.visible = true;
            this.okBtn.enabled = false;
         }
         else
         {
            this.tip.visible = false;
            this.okBtn.enabled = true;
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent is POPWindowManager)
         {
            POPWindowManager.closeWindow();
         }
         else if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setItem(param1:int, param2:String, param3:String, param4:int, param5:String, param6:int) : void
      {
         if(Boolean(this.bigIco) && Boolean(this.bigIco.parent))
         {
            this.bigIco.parent.removeChild(this.bigIco);
         }
         this.bigIco = FLoader.startLoad(param2,65,65);
         addChild(this.bigIco);
         this.bigIco.x = 21;
         this.bigIco.y = 7;
         this.id = param1;
         this.goodsName.text = param3;
         this.price.text = param4.toString();
         this.effect.text = param5;
      }
   }
}

