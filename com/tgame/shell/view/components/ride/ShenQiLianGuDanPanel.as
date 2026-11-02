package com.tgame.shell.view.components.ride
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ShenQiLianGuDanPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function ShenQiLianGuDanPanel()
      {
         var ft:FTextArea;
         var ico:Bitmap;
         var lb:FLabel;
         var line:Bitmap = null;
         super();
         this.skin = "panel";
         this.showCloseButton = true;
         width = 363;
         height = 411;
         this.titleText = LanResManager.getLanCommonTextWords("神奇炼骨丹");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 10;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"神奇炼骨丹活动说明1",[StaticValue.GREEN_HTML,StaticValue.RED_HTML,StaticValue.YELLOW_HTML,StaticValue.WHITE_HTML,StaticValue.RED_HTML,StaticValue.RED_HTML]);
         addChild(ft);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 342;
         line.x = 10;
         line.y = 205;
         ico = StaticValue.getBitmapByClassName("ui.ride.ico.exclamation");
         addChild(ico);
         ico.x = 23;
         ico.y = 252;
         lb = new FLabel();
         with(lb)
         {
            x = 134;
            y = 212;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("特别公告");
         }
         addChild(lb);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 342;
         line.x = 10;
         line.y = 325;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("立即使用");
         addChild(this.okBtn);
         this.okBtn.x = 50;
         this.okBtn.y = 335;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("稍后使用");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - 50 - this.cancelBtn.width;
         this.cancelBtn.y = 335;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_RIDE_REED_SHENQILIANGUDAN_USR));
               break;
            case this.cancelBtn:
         }
         this.onClose();
      }
   }
}

