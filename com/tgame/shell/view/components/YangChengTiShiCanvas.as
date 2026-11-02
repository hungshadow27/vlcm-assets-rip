package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class YangChengTiShiCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var checkBox:FCheckBox;
      
      private var ft1:FTextArea;
      
      private var ft:FTextArea;
      
      public function YangChengTiShiCanvas()
      {
         super();
         skin = "menuBg";
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 5;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 5;
            y = 40;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.ft);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 50;
         this.okBtn.y = this.ft.y + this.ft.height + 20;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = this.ft.x + this.ft.width - 45 - this.cancelBtn.width;
         this.cancelBtn.y = this.ft.y + this.ft.height + 20;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkBox = new FCheckBox();
         this.checkBox.border = true;
         this.checkBox.textColor = StaticValue.WHITE;
         this.checkBox.text = LanResManager.getLanCommonTextWords("下次不弹出本提示");
         addChild(this.checkBox);
         this.checkBox.x = 5;
         this.checkBox.y = this.okBtn.y + this.okBtn.height + 10;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onClick);
         width = this.ft.width + 10;
         height = this.checkBox.y + this.checkBox.height + 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_CLICK,"",[true]));
               POPWindowManager.closeWindow();
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_CLICK,"",[false]));
               POPWindowManager.closeWindow();
               break;
            case this.checkBox:
               this.$parent.dispatchEvent(new BaseEvent(ZhuangBeiYangChengPanel.UI_EQUIP_YANGCHENG_CANVAS_NEXT_IS_SHOW,"",[this.checkBox.selectState]));
         }
      }
      
      public function setText(param1:String, param2:String) : void
      {
         this.ft.htmlText = param2;
         this.ft1.htmlText = param1;
         this.okBtn.x = 50;
         this.okBtn.y = this.ft.y + this.ft.height + 20;
         this.cancelBtn.x = this.ft.x + this.ft.width - 45 - this.cancelBtn.width;
         this.cancelBtn.y = this.ft.y + this.ft.height + 20;
         this.checkBox.x = 5;
         this.checkBox.y = this.okBtn.y + this.okBtn.height + 10;
         width = this.ft.width + 10;
         height = this.checkBox.y + this.checkBox.height + 5;
      }
      
      public function setCheckSta(param1:Boolean) : void
      {
         this.checkBox.selectState = param1;
      }
   }
}

