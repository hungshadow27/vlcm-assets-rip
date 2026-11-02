package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.events.MouseEvent;
   
   public class YunchengShuomingPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var guanbi:SecondButton;
      
      public function YunchengShuomingPanel()
      {
         super();
         this.skin = "panel_btn";
         this.showCloseButton = true;
         dragAble = true;
         width = 480;
         height = 210;
         titleText = LanResManager.getLanCommonTextWords("运程说明");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ft = new FTextArea();
         this.ft.x = 15;
         this.ft.y = 5;
         this.ft.width = 450;
         this.ft.height = 130;
         this.ft.wordWrap = true;
         this.ft.filters = StaticValue.filter;
         this.ft.htmlText = LanResManager.getLanTextWords(this,"生肖是中华民族用来代表年份和人的出生年的十二种动物分别为鼠牛",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML]) + "</textformat>";
         addChild(this.ft);
         this.guanbi = new SecondButton();
         this.guanbi.label = LanResManager.getLanCommonTextWords("关闭");
         addChild(this.guanbi);
         this.guanbi.x = 240;
         this.guanbi.y = 180 - 35;
         this.guanbi.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.onClose();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

