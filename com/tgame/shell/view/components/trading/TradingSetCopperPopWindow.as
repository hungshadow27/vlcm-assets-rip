package com.tgame.shell.view.components.trading
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TradingPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class TradingSetCopperPopWindow extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var totalLabel:FLabel;
      
      private var total:Number = 0;
      
      private var count:FTextInput;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var maxBtn:SmallButton;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function TradingSetCopperPopWindow()
      {
         var lb:FLabel;
         var img:F9GridBitmap = null;
         super();
         this.skin = "sceondPanel";
         this.showCloseButton = true;
         width = 172;
         height = 162;
         this.titleText = LanResManager.getLanCommonTextWords("铜钱交易");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         lb = new FLabel();
         with(lb)
         {
            x = 10;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"您的包裹中拥有的铜钱");
         addChild(lb);
         lb = new FLabel();
         with(lb)
         {
            x = 10;
            y = 46;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         lb.text = LanResManager.getLanTextWords(this,"您希望交易多少给对方");
         addChild(lb);
         img = Tools.get9GridBitmpByName("countBg");
         addChild(img);
         img.width = 115;
         img.x = 30;
         img.y = 25;
         this.totalLabel = new FLabel();
         with(this.totalLabel)
         {
            x = 52;
            y = 25;
            textColor = StaticValue.YELLOW;
         }
         addChild(this.totalLabel);
         img = Tools.get9GridBitmpByName("inputBg");
         addChild(img);
         img.width = 60;
         img.x = 32;
         img.y = 70;
         this.count = new FTextInput();
         with(this.count)
         {
            width = 50;
            height = 20;
            x = 37;
            y = 70;
            restrict = "0-9";
            textColor = StaticValue.ORANGE;
            text = "0";
         }
         this.count.addEventListener(Event.CHANGE,this.onChange);
         addChild(this.count);
         this.maxBtn = new SmallButton();
         this.maxBtn.label = "MAX";
         addChild(this.maxBtn);
         this.maxBtn.x = 122;
         this.maxBtn.y = 70;
         this.maxBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addBtn = new FSimpleButton();
         this.addBtn.skin = "sumButton";
         addChild(this.addBtn);
         this.addBtn.x = 92;
         this.addBtn.y = 71;
         this.addBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 32 - this.subBtn.width;
         this.subBtn.y = 71;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onClick);
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
      
      private function onChange(param1:Event) : void
      {
         if(Number(this.count.text) < 0)
         {
            this.count.text = "0";
         }
         if(Number(this.count.text) > this.total)
         {
            this.count.text = this.total.toString();
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(Number(this.count.text) > 0)
               {
                  this.count.text = String(Number(this.count.text) - 1);
               }
               break;
            case this.addBtn:
               if(Number(this.count.text) < this.total)
               {
                  this.count.text = String(Number(this.count.text) + 1);
               }
               break;
            case this.maxBtn:
               this.count.text = this.total.toString();
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(TradingPanel.UI_TRADINGPANEL_INPUT_COPPER,"",Number(this.count.text)));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function setTotal(param1:Number) : void
      {
         this.total = param1;
         this.totalLabel.text = param1.toString();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
   }
}

