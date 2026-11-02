package com.tgame.shell.view.components.npcshop
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.NPCShopPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class NPCShopTradingPopWindow extends FPanel
   {
      
      public static const TYPE_BUY:String = "TYPE_BUY";
      
      public static const TYPE_SELL:String = "TYPE_SELL";
      
      public var $parent:DisplayObject;
      
      private var goods:Goods;
      
      private var _type:String;
      
      private var itemName:FLabel;
      
      private var danjia:Number;
      
      private var zhongjia:Number;
      
      private var price:FTextArea;
      
      private var priceCount:FTextArea;
      
      private var subBtn:FSimpleButton;
      
      private var sumBtn:FSimpleButton;
      
      private var count:FTextInput;
      
      private var tip:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var copper:Number;
      
      private var total:int;
      
      public function NPCShopTradingPopWindow()
      {
         var img:Bitmap;
         var lb:FLabel;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 200;
         height = 202;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.shop.buy.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 9;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"物品") + "：";
         addChild(lb);
         this.itemName = new FLabel();
         with(this.itemName)
         {
            x = 76;
            y = 9;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.itemName);
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 32;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"单价") + "：";
         addChild(lb);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 75;
         img.y = 32;
         this.price = new FTextArea();
         with(this.price)
         {
            x = 100;
            y = 34;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
         }
         addChild(this.price);
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 55;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"总价") + "：";
         addChild(lb);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 75;
         img.y = 55;
         this.priceCount = new FTextArea();
         with(this.priceCount)
         {
            x = 100;
            y = 57;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
         }
         addChild(this.priceCount);
         lb = new FLabel();
         with(lb)
         {
            x = 14;
            y = 80;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"数量") + "：";
         addChild(lb);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 72;
         this.subBtn.y = 81;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.count = new FTextInput();
         with(this.count)
         {
            x = 98;
            y = 83;
            defaultTextFormat = new TextFormat(null,null,null,null,null,null,null,null,"center");
            width = 65;
            height = 20;
            restrict = "0-9";
            textColor = StaticValue.ORANGE;
            text = "1";
         }
         addChild(this.count);
         this.count.addEventListener(Event.CHANGE,this.onChange);
         this.sumBtn = new FSimpleButton();
         this.sumBtn.skin = "sumButton";
         addChild(this.sumBtn);
         this.sumBtn.x = 168;
         this.sumBtn.y = 81;
         this.sumBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 8;
            y = 110;
            width = 183;
            height = 36;
            wordWrap = true;
            defaultTextFormat = new TextFormat(null,null,StaticValue.RED,null,null,null,null,null,"center");
            filters = StaticValue.filter;
            text = "";
         }
         addChild(this.tip);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 30;
         this.okBtn.y = 146;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width - this.cancelBtn.width - 30;
         this.cancelBtn.y = 146;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onChange(param1:Event) : void
      {
         if(Number(this.count.text) <= 0)
         {
            this.count.text = "1";
         }
         if(this._type == TYPE_SELL && Number(this.count.text) > this.total)
         {
            this.count.text = this.total.toString();
         }
         if(this._type == TYPE_BUY)
         {
            this.zhongjia = this.danjia * (1 + GameConfig.xiangyangcheng_shuilv) * Number(this.count.text);
            if(this.zhongjia > this.copper)
            {
               this.priceCount.htmlText = this.danjia * int(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + int(this.danjia * GameConfig.xiangyangcheng_shuilv * int(this.count.text)) + "</font>";
               this.count.text = int(this.copper / (this.danjia * (1 + GameConfig.xiangyangcheng_shuilv))).toString();
               this.tip.text = "";
               this.okBtn.enabled = true;
            }
            else
            {
               this.priceCount.htmlText = this.danjia * Number(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + Number(this.danjia * GameConfig.xiangyangcheng_shuilv * Number(this.count.text)) + "</font>";
            }
         }
         else
         {
            this.tip.text = "";
            this.okBtn.enabled = true;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(Number(this.count.text) > 1)
               {
                  this.count.text = (Number(this.count.text) - 1).toString();
                  if(this._type == TYPE_BUY)
                  {
                     this.zhongjia = this.danjia * (1 + GameConfig.xiangyangcheng_shuilv) * Number(this.count.text);
                     if(this.zhongjia > this.copper)
                     {
                        this.priceCount.htmlText = this.danjia * int(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + int(this.danjia * GameConfig.xiangyangcheng_shuilv * int(this.count.text)) + "</font>";
                        this.count.text = int(this.copper / (this.danjia * (1 + GameConfig.xiangyangcheng_shuilv))).toString();
                        this.tip.text = "";
                        this.okBtn.enabled = true;
                     }
                     else
                     {
                        this.priceCount.htmlText = this.danjia * Number(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + Number(this.danjia * GameConfig.xiangyangcheng_shuilv * Number(this.count.text)) + "</font>";
                     }
                  }
                  else
                  {
                     this.tip.text = "";
                     this.okBtn.enabled = true;
                  }
               }
               else
               {
                  this.count.text = "1";
                  if(this._type == TYPE_BUY)
                  {
                     this.zhongjia = this.danjia * (1 + GameConfig.xiangyangcheng_shuilv) * Number(this.count.text);
                     if(this.zhongjia > this.copper)
                     {
                        this.priceCount.htmlText = this.danjia * int(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + int(this.danjia * GameConfig.xiangyangcheng_shuilv * int(this.count.text)) + "</font>";
                        this.count.text = int(this.copper / (this.danjia * (1 + GameConfig.xiangyangcheng_shuilv))).toString();
                        this.tip.text = "";
                        this.okBtn.enabled = true;
                     }
                     else
                     {
                        this.priceCount.htmlText = this.danjia * Number(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + Number(this.danjia * GameConfig.xiangyangcheng_shuilv * Number(this.count.text)) + "</font>";
                     }
                  }
                  else
                  {
                     this.tip.text = "";
                     this.okBtn.enabled = true;
                  }
               }
               break;
            case this.sumBtn:
               if(this._type == TYPE_SELL && Number(this.count.text) >= this.total)
               {
                  this.count.text = this.total.toString();
               }
               else
               {
                  this.count.text = (Number(this.count.text) + 1).toString();
               }
               if(this._type == TYPE_BUY)
               {
                  this.zhongjia = this.danjia * (1 + GameConfig.xiangyangcheng_shuilv) * Number(this.count.text);
                  if(this.zhongjia > this.copper)
                  {
                     this.priceCount.htmlText = this.danjia * int(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + int(this.danjia * GameConfig.xiangyangcheng_shuilv * int(this.count.text)) + "</font>";
                     this.count.text = int(this.copper / (this.danjia * (1 + GameConfig.xiangyangcheng_shuilv))).toString();
                     this.tip.text = "";
                     this.okBtn.enabled = true;
                  }
                  else
                  {
                     this.priceCount.htmlText = this.danjia * Number(this.count.text) + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + Number(this.danjia * GameConfig.xiangyangcheng_shuilv * Number(this.count.text)) + "</font>";
                  }
               }
               else
               {
                  this.tip.text = "";
                  this.okBtn.enabled = true;
               }
               break;
            case this.okBtn:
               if(this._type == TYPE_BUY)
               {
                  this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_BUY_OK,"",[this.goods.res.id_kind,Number(this.count.text)]));
               }
               if(this._type == TYPE_SELL)
               {
                  this.$parent.dispatchEvent(new BaseEvent(NPCShopPanel.UI_NPC_SHOP_SELL_OK,"",[this.goods.res.id_kind,Number(this.count.text)]));
               }
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         this.reset();
         POPWindowManager.closeWindow();
      }
      
      private function reset() : void
      {
         this.itemName.text = "";
         this.price.text = "0";
         this.priceCount.text = "0";
         this.count.text = "1";
         this.tip.text = "";
         this.okBtn.enabled = true;
         this.copper = 0;
         this.total = 0;
         this.goods = null;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
         if(param1 == "TYPE_BUY")
         {
            this.titleText = LanResManager.getLanCommonTextWords("购买物品");
         }
         if(param1 == "TYPE_SELL")
         {
            this.titleText = LanResManager.getLanCommonTextWords("出售物品");
         }
      }
      
      public function setItem(param1:Goods, param2:Number, param3:Number) : void
      {
         this.goods = param1;
         this.danjia = param2;
         this.copper = param3;
         this.total = this.goods.count;
         this.itemName.text = this.goods.res.name;
         if(this._type == TYPE_BUY)
         {
            this.price.htmlText = this.danjia + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + Number(this.danjia * GameConfig.xiangyangcheng_shuilv) + "</font>";
            this.count.text = "1";
            this.count.text = Number(param3 / (param2 * (1 + GameConfig.xiangyangcheng_shuilv))) >= 1 ? "1" : "0";
            this.priceCount.htmlText = Number(this.count.text) * param2 + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>+" + Number(this.danjia * GameConfig.xiangyangcheng_shuilv * Number(this.count.text)) + "</font>";
            if(param2 * (1 + GameConfig.xiangyangcheng_shuilv) > param3)
            {
               this.tip.text = LanResManager.getLanTextWords(this,"您背包中的铜钱不足");
               this.okBtn.enabled = false;
            }
            else
            {
               this.tip.text = "";
               this.okBtn.enabled = true;
            }
         }
         if(this._type == TYPE_SELL)
         {
            this.price.htmlText = this.danjia.toString();
            this.count.text = this.total.toString();
            this.priceCount.htmlText = (this.total * param2).toString();
            this.tip.text = "";
            this.okBtn.enabled = true;
         }
      }
   }
}

