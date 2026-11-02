package com.tgame.shell.view.components.kungfu
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.KungFuBreakthroughPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class KungFuBreakthroughSeeAboutCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var closeBtn:FSimpleButton;
      
      private var tip:FTextArea;
      
      public function KungFuBreakthroughSeeAboutCanvas()
      {
         super();
         skin = "menuBg";
         width = 320;
         height = 256;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 20;
            y = 15;
            width = 300;
            textColor = StaticValue.WHITE;
            htmlText = LanResManager.getLanTextWords(this,0);
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 70;
            y = 50;
            width = 300;
            textColor = StaticValue.ORANGE;
            htmlText = LanResManager.getLanTextWords(this,1);
         }
         addChild(this.tip);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 58;
            y = 70;
            width = 300;
            height = 200;
            textColor = StaticValue.GREEN;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,2) + "</textformat>";
         }
         addChild(this.tip);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 55;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(KungFuBreakthroughPanel.XINFACHAXUN_CLICK));
      }
   }
}

