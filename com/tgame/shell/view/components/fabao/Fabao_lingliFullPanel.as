package com.tgame.shell.view.components.fabao
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   
   public class Fabao_lingliFullPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var btnFB:SecondButton;
      
      private var btnLL:SecondButton;
      
      public function Fabao_lingliFullPanel()
      {
         super();
         skin = "panel_btn";
         width = 300;
         height = 180;
         titleText = LanResManager.getLanCommonTextWords("灵力值已满");
         this.showCloseButton = false;
         this.init();
      }
      
      private function init() : void
      {
         this.ft = new FTextArea();
         this.ft.x = 30;
         this.ft.y = 30;
         this.ft.width = 250;
         this.ft.height = 50;
         this.ft.wordWrap = true;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("灵力值满100万点，无法继续累积，您可以进行一下操作消耗灵力.") + "</font>";
         addChild(this.ft);
         this.btnFB = new SecondButton();
         this.btnFB.x = width / 2 - width / 2 / 2 - this.btnFB.width / 2;
         this.btnFB.y = 115;
         this.btnFB.label = LanResManager.getLanCommonTextWords("强化法宝");
         this.btnFB.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnFB);
         this.btnLL = new SecondButton();
         this.btnLL.y = 115;
         this.btnLL.label = LanResManager.getLanCommonTextWords("凝结灵力丹");
         this.btnLL.addEventListener(MouseEvent.CLICK,this.onClick);
         this.btnLL.x = width / 2 + width / 2 / 2 - this.btnLL.width / 2;
         addChild(this.btnLL);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnFB:
               PipeManager.sendMsg(PipeConstants.REQUEST_FABAOPANEL,-1);
               this.onClose();
               break;
            case this.btnLL:
               PipeManager.sendMsg(PipeConstants.REQUEST_FABAOLINGLIPANEL);
               this.onClose();
         }
      }
   }
}

