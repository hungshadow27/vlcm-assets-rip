package com.tgame.shell.view.components.gift
{
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   
   public class NewsAfficheCanvas extends Sprite
   {
      
      private var kuangBg:FCanvas;
      
      private var content:FTextArea;
      
      private var listContainer:Sprite;
      
      private var Scroll:FVScorllBar;
      
      public function NewsAfficheCanvas()
      {
         super();
         this.kuangBg = new FCanvas();
         this.kuangBg.skin = "box";
         addChild(this.kuangBg);
         this.kuangBg.width = 590;
         this.kuangBg.height = 342;
         this.content = new FTextArea();
         with(this.content)
         {
            mouseWheelEnabled = true;
            wordWrap = true;
            x = 5;
            y = 5;
            width = 565;
            height = 333;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.content);
         this.Scroll = new FVScorllBar(this.content,333);
         addChild(this.Scroll);
         this.Scroll.x = 570;
         this.Scroll.y = 5;
      }
      
      public function setNewSpaperMsg(param1:String) : void
      {
         this.content.htmlText = param1;
      }
   }
}

