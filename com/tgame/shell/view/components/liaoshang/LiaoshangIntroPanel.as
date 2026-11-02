package com.tgame.shell.view.components.liaoshang
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   
   public class LiaoshangIntroPanel extends FPanel
   {
      
      public function LiaoshangIntroPanel()
      {
         var ft:FTextArea;
         var line:Bitmap = null;
         var box:FCanvas = null;
         super();
         skin = "sceondPanel";
         this.dragRestrict = false;
         dragAble = false;
         showCloseButton = false;
         width = 284;
         height = 267;
         titleText = LanResManager.getLanCommonTextWords("疗伤说明");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         line = StaticValue.getBitmapByClassName("ui.line");
         addChild(line);
         line.width = 272;
         line.x = 6;
         line.y = 58;
         box = new FCanvas();
         box.skin = "box";
         box.width = 272;
         box.height = 110;
         box.x = 6;
         box.y = 95;
         addChild(box);
         ft = new FTextArea();
         with(ft)
         {
            x = 35;
            y = 16;
            width = 225;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"请输入您希望治疗的玩家们") + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 70;
            width = 282;
            height = 20;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"治疗完成后") + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 98;
            width = 270;
            height = 110;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"注意") + "</textformat>";
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

