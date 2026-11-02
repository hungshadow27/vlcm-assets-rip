package com.tgame.shell.view.components.utils.tooltip
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.utils.ITooltip;
   import com.tgame.shell.view.components.utils.UITools;
   import flash.text.TextFieldAutoSize;
   
   public class DefaultTooltip extends FCanvas implements ITooltip
   {
      
      private static var tip:FTextArea;
      
      private var maxWidth:Number = 400;
      
      public function DefaultTooltip()
      {
         super();
         this.skin = "backGroud";
         this.creatChildren();
      }
      
      private function creatChildren() : void
      {
         tip = new FTextArea();
         tip.autoSize = TextFieldAutoSize.LEFT;
         tip.textColor = StaticValue.WHITE;
         tip.filters = StaticValue.filter;
         tip.multiline = true;
         UITools.addChildAtPos(tip,this,3,3);
      }
      
      public function set htmlText(param1:String) : void
      {
         if(tip.wordWrap)
         {
            tip.wordWrap = false;
         }
         tip.htmlText = param1;
         if(tip.width >= this.maxWidth)
         {
            tip.wordWrap = true;
            tip.width = this.maxWidth;
         }
         this.width = tip.width + 4;
         this.height = tip.height + 4;
      }
   }
}

