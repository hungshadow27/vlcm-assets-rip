package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class DantianWuxuedanJianyiCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var fta:FTextArea;
      
      public function DantianWuxuedanJianyiCanvas()
      {
         var fc:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 425;
         this.bgCanvas.height = 107;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         fc = new FCanvas();
         fc.skin = "canvas1";
         fc.x = 0;
         fc.y = 0;
         fc.width = 425;
         fc.height = 107;
         addChild(fc);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 185;
            y = 20;
            textColor = StaticValue.YELLOW;
            htmlText = LanResManager.getLanCommonTextWords("使用建议");
         }
         addChild(this.fta);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 40;
            textColor = StaticValue.BlUE20;
            htmlText = "<textformat leading=\'1\'>" + LanResManager.getLanTextWords(this,"丹田等级最高级为",[],false) + "</textformat>";
         }
         addChild(this.fta);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

