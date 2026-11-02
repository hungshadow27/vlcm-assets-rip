package com.tgame.shell.view.components.instanceportal
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class IngressFubenTishiCanvas extends FCanvas
   {
      
      private var closeBtn:FSimpleButton;
      
      private var tip:FTextArea;
      
      public function IngressFubenTishiCanvas()
      {
         var tf:TextFormat;
         super();
         skin = "menuBg";
         width = 280;
         height = 75;
         tf = new TextFormat();
         tf.align = "center";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 7;
            y = 12;
            width = 250;
            wordWrap = true;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,0,[StaticValue.GREEN_HTML]) + "</textformat>";
         }
         addChild(this.tip);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 5;
         this.closeBtn.y = 5;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

