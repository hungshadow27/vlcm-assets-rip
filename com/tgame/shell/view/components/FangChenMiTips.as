package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class FangChenMiTips extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var ft:FTextArea;
      
      public function FangChenMiTips()
      {
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 370;
         this.bgCanvas.height = 118;
         this.bgCanvas.skin = "box";
         addChild(this.bgCanvas);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this.ft = new FTextArea();
         with(this.ft)
         {
            filters = StaticValue.filter;
            textColor = StaticValue.RED;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.ft);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setTips(param1:int) : *
      {
         if(param1 == 1)
         {
            this.ft.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("防沉迷1") + "</textformat>";
         }
         else if(param1 == 2)
         {
            this.ft.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("防沉迷2") + "</textformat>";
         }
         else if(param1 == 3)
         {
            this.ft.htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("请玩家合理安排游戏时间！") + "</textformat>";
         }
         this.ft.x = (width - this.ft.width) / 2;
         this.ft.y = (height - this.ft.height) / 2;
      }
   }
}

