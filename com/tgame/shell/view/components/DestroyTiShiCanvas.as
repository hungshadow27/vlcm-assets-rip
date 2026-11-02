package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DestroyTiShiCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var ft1:FTextArea;
      
      private var ft:FTextArea;
      
      public function DestroyTiShiCanvas()
      {
         super();
         skin = "menuBg";
         width = 270;
         height = 110;
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
            htmlText = "<font size=\'16\' color=\'" + StaticValue.ORANGE_HTML + "\'>【" + LanResManager.getLanCommonTextWords("温馨提示") + "】<br></font>" + "<font  color=\'" + StaticValue.RED_HTML + "\'><br>" + LanResManager.getLanCommonTextWords("对不起，这件装备镶嵌了宝石或战魂，避免造成你的损失，请移除后再进行该操作。") + "</font>";
         }
         addChild(this.ft1);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
   }
}

