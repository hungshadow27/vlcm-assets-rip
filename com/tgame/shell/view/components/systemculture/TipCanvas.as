package com.tgame.shell.view.components.systemculture
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.utils.ITooltip;
   import flash.text.TextFieldAutoSize;
   
   public class TipCanvas extends FCanvas implements ITooltip
   {
      
      private var tip:FTextArea;
      
      public function TipCanvas(param1:String, param2:int)
      {
         super();
         this.skin = "backGroud";
         this.tip = new FTextArea();
         this.tip.x = 2;
         this.tip.y = 5;
         this.tip.width = param2;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.textColor = StaticValue.WHITE;
         this.tip.filters = StaticValue.filter;
         this.tip.wordWrap = true;
         this.tip.text = param1;
         addChild(this.tip);
         this.width = this.tip.x + this.tip.textWidth + 5;
         this.height = this.tip.y + this.tip.height + 5;
      }
      
      public function set htmlText(param1:String) : void
      {
         this.tip.htmlText = param1;
         this.width = this.tip.x + this.tip.textWidth + 5;
         this.height = this.tip.y + this.tip.height + 5;
      }
   }
}

