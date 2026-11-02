package com.tgame.shell.view.components.mainui
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.*;
   import flash.display.Shape;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class LevelTipCanvas extends FCanvas
   {
      
      private var tip:FTextArea;
      
      private var closeBtn:FSimpleButton;
      
      private var shape:Shape;
      
      public function LevelTipCanvas()
      {
         super();
         skin = "menuBg";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 10;
            y = 20;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.tip);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         addChild(this.closeBtn);
      }
      
      private function resize() : void
      {
         this.closeBtn.x = 0;
         width = this.tip.width + 20;
         height = this.tip.height + 30;
         this.closeBtn.x = width - this.closeBtn.width - 2;
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setTip(param1:String) : void
      {
         param1 = param1.replace(/\\n/g,"<br>");
         param1 = param1.replace(/{link\#\s*color:([A-Fa-f0-9]+)\s*,\s*type:([A-Za-z0-9]+)}/g,"<font color=\'#$1\'>");
         param1 = param1.replace(/{\s*\/\s*link\s*}/g,"</font>");
         this.tip.htmlText = param1;
         this.resize();
         this.x = (GameConfig.sceneWidth - this.width) / 2;
      }
   }
}

