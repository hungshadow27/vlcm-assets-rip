package com.tgame.shell.view.components.shuangxiu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   
   public class ShuangXiuIntroPanel extends FPanel
   {
      
      public function ShuangXiuIntroPanel()
      {
         var ft:FTextArea;
         var line:Bitmap = null;
         var box:FCanvas = null;
         super();
         skin = "sceondPanel";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 267;
         titleText = LanResManager.getLanCommonTextWords("双修简介");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 272;
         line.x = 6;
         line.y = 58;
         box = new FCanvas();
         box.skin = "box";
         box.width = 272;
         box.height = 125;
         box.x = 6;
         box.y = 110;
         addChild(box);
         ft = new FTextArea();
         with(ft)
         {
            x = 35;
            y = 12;
            width = 225;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"进入打坐双修模式");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 35;
            y = 68;
            width = 225;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"双休真气与经验的提成");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 20;
            y = 126;
            width = 250;
            height = 110;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"双休的注意条件");
         }
         addChild(ft);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

