package com.tgame.shell.view.components.gongcheng
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XiangYangGuiShuPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.*;
   import flash.text.*;
   
   public class RevenuePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var cessLabel:FTextArea;
      
      private var cess:int;
      
      private var newCessLabel:FTextArea;
      
      private var newCess:int;
      
      private var revenue:FLabel;
      
      private var revenueValue:FLabel;
      
      private var addBtn:FSimpleButton;
      
      private var subBtn:FSimpleButton;
      
      private var okBtn:SmallButton;
      
      private var getBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var tips:FTextArea;
      
      private var newCessValue:int;
      
      public function RevenuePanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var fb:FLabel;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 264;
         titleText = LanResManager.getLanCommonTextWords("襄阳城税率与税收");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.xiangyang.revenue.ui";
         addChild(img);
         img.x = 6;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         fb = new FLabel();
         with(fb)
         {
            x = 14;
            y = 10;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(fb);
         this.cessLabel = new FTextArea();
         with(this.cessLabel)
         {
            x = 137;
            y = 10;
            width = 75;
            height = 20;
            defaultTextFormat = StaticValue.format;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.cessLabel);
         fb = new FLabel();
         with(fb)
         {
            x = 14;
            y = 32;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,1);
         }
         addChild(fb);
         this.newCessLabel = new FTextArea();
         with(this.newCessLabel)
         {
            x = 137;
            y = 32;
            width = 75;
            height = 20;
            defaultTextFormat = StaticValue.format;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.newCessLabel);
         this.addBtn = new FSimpleButton();
         with(this.addBtn)
         {
            skin = "sumButton";
            x = 214;
            y = 31;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.addBtn);
         this.subBtn = new FSimpleButton();
         with(this.subBtn)
         {
            skin = "subButton";
            x = 115;
            y = 31;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.subBtn);
         this.okBtn = new SmallButton();
         with(this.okBtn)
         {
            label = LanResManager.getLanCommonTextWords("确定");
            x = 233;
            y = 31;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.okBtn);
         fb = new FLabel();
         with(fb)
         {
            x = 14;
            y = 60;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,2);
         }
         addChild(fb);
         this.revenue = new FLabel();
         with(this.revenue)
         {
            x = 118;
            y = 60;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.revenue);
         fb = new FLabel();
         with(fb)
         {
            x = 14;
            y = 82;
            textColor = StaticValue.BlUE50;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,3);
         }
         addChild(fb);
         this.revenueValue = new FLabel();
         with(this.revenueValue)
         {
            x = 118;
            y = 82;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         addChild(this.revenueValue);
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 14;
            y = 105;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tips.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,5,[StaticValue.GREEN_HTML]) + LanResManager.getLanTextWords(this,6,[StaticValue.RED_HTML]) + LanResManager.getLanTextWords(this,7,[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,8,[StaticValue.GREEN_HTML]) + "</textformat>";
         addChild(this.tips);
         this.getBtn = new SecondButton();
         with(this.getBtn)
         {
            label = LanResManager.getLanTextWords(this,9);
            x = 52;
            y = 211;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.getBtn);
         this.cancelBtn = new SecondButton();
         with(this.cancelBtn)
         {
            label = LanResManager.getLanCommonTextWords("取消");
            x = 174;
            y = 211;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.cancelBtn);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.addBtn:
               if(this.newCess < this.newCessValue)
               {
                  this.newCess += 1;
                  this.newCessLabel.text = this.newCess + "%";
               }
               break;
            case this.subBtn:
               if(this.newCess > 0)
               {
                  --this.newCess;
                  this.newCessLabel.text = this.newCess + "%";
               }
               break;
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_OK,"",this.newCess));
               break;
            case this.getBtn:
               this.onClose();
               this.$parent.dispatchEvent(new BaseEvent(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_REVENUE_GET));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function setCess(param1:int) : void
      {
         this.newCess = param1;
         this.cessLabel.text = param1 + "%";
         this.newCessLabel.text = param1 + "%";
      }
      
      public function setRevenue(param1:Number) : void
      {
         this.revenue.text = param1.toString();
      }
      
      public function setRevenueValue(param1:Number) : void
      {
         this.revenueValue.text = param1.toString();
      }
      
      public function setValue(param1:int, param2:int, param3:int) : void
      {
         this.newCessValue = param2;
         this.tips.htmlText = "<textformat leading=\'0.5\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + "</font><br>" + LanResManager.getLanTextWords(this,5,[StaticValue.GREEN_HTML,param3]) + LanResManager.getLanTextWords(this,6,[StaticValue.RED_HTML,param2]) + LanResManager.getLanTextWords(this,7,[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,8,[StaticValue.GREEN_HTML,param1]);
      }
   }
}

