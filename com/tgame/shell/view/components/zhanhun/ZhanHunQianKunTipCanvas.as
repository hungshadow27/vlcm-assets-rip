package com.tgame.shell.view.components.zhanhun
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ZhanHunPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ZhanHunQianKunTipCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var checkBox:FCheckBox;
      
      private var closeBtn:FSimpleButton;
      
      private var ft:FTextArea;
      
      public function ZhanHunQianKunTipCanvas()
      {
         super();
         skin = "menuBg";
         width = 200;
         height = 135;
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 5;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 30;
            width = 160;
            wordWrap = true;
            autoSize = TextFieldAutoSize.CENTER;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("使用乾坤一掷，需要消耗200元宝，是否继续？") + "</font>";
         }
         addChild(this.ft);
         this.checkBox = new FCheckBox();
         this.checkBox.border = true;
         this.checkBox.textColor = StaticValue.WHITE;
         this.checkBox.text = LanResManager.getLanCommonTextWords("下次不弹出本提示");
         addChild(this.checkBox);
         this.checkBox.x = 5;
         this.checkBox.y = 75;
         this.okBtn = new SecondButton();
         with(this.okBtn)
         {
            x = 50 - okBtn.width / 2;
            y = 100;
            label = LanResManager.getLanCommonTextWords("确定");
         }
         addChild(this.okBtn);
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         with(this.cancelBtn)
         {
            x = 150 - cancelBtn.width / 2;
            y = 100;
            label = LanResManager.getLanCommonTextWords("取消");
         }
         addChild(this.cancelBtn);
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_OK));
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(ZhanHunPanel.UI_ZHANHUNQIANKUNYIZHITIPSHOW_CANCLE));
         }
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      public function getCheckSta() : Boolean
      {
         return this.checkBox.selectState;
      }
   }
}

