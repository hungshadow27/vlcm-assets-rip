package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ZhanHunTiShiCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var checkBox:FCheckBox;
      
      private var closeBtn:FSimpleButton;
      
      private var ft1:FTextArea;
      
      private var ft:FTextArea;
      
      public function ZhanHunTiShiCanvas()
      {
         super();
         skin = "menuBg";
         width = 270;
         height = 175;
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 5;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 15;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<font size=\'16\' color=\'" + StaticValue.ORANGE_HTML + "\'>【" + LanResManager.getLanCommonTextWords("温馨提示") + "】</font>" + "<font  color=\'" + StaticValue.ORANGE_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("装备的阶层数直接影响着装备可镶嵌的战魂数量，装备阶层数越高，可镶嵌的战魂越多。") + "</font>";
         }
         addChild(this.ft1);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 15;
            y = 90;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("镶嵌后的装备，将变为绑定，如果兑换、丢弃、卖出，随之镶嵌的战魂也将消失，请慎重操作。") + "</font>";
         }
         addChild(this.ft);
         this.checkBox = new FCheckBox();
         this.checkBox.border = true;
         this.checkBox.textColor = StaticValue.WHITE;
         this.checkBox.text = LanResManager.getLanCommonTextWords("下次不弹出本提示");
         addChild(this.checkBox);
         this.checkBox.x = 5;
         this.checkBox.y = 150;
      }
      
      public function setCheckSta(param1:Boolean) : void
      {
         this.checkBox.selectState = param1;
      }
      
      private function onClose(param1:MouseEvent) : void
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

