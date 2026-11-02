package com.tgame.shell.view.components.wishingTree
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class WishingTreeDescPanel extends FPanel
   {
      
      private var ftName:FTextArea;
      
      private var ft:FTextArea;
      
      private var bg:FCanvas;
      
      public function WishingTreeDescPanel()
      {
         super();
         width = 240;
         height = 220;
         dragAble = false;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         this.ftName = new FTextArea();
         this.ftName.x = 10;
         this.ftName.y = 10;
         this.ftName.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("某某某的许愿树寄语：") + "</font>";
         addChild(this.ftName);
         this.ftName.width = 160;
         this.bg = new FCanvas();
         this.bg.skin = "box";
         this.bg.width = 220;
         this.bg.height = 153;
         addChild(this.bg);
         this.bg.x = 10;
         this.bg.y = 30;
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 35;
         addChild(this.ft);
         this.ft.width = 210;
         this.ft.height = 145;
      }
      
      public function setInit(param1:String, param2:String) : void
      {
         this.ftName.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + param1 + LanResManager.getLanCommonTextWords("的寄语：") + "</font>";
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
      }
   }
}

