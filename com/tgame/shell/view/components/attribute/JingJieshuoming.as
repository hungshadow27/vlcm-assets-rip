package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class JingJieshuoming extends FPanel
   {
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var guanBiBtn:SecondButton;
      
      public function JingJieshuoming()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 530;
         height = 257;
         addEventListener(FCloseEvent.CLOSE,this.onClose1);
         titleText = LanResManager.getLanCommonTextWords("境界说明");
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 15;
            htmlText = "<textformat leading=\'3\'>" + LanResManager.getLanTextWords(this,"朝廷积弱铁骑犯境大侠郭靖为救百姓于水火邀天下英雄于少林寺商讨",[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML],false) + "</textformat>";
         }
         addChild(this.fta1);
         this.guanBiBtn = new SecondButton();
         this.guanBiBtn.label = LanResManager.getLanCommonTextWords("关闭");
         addChild(this.guanBiBtn);
         this.guanBiBtn.x = 227;
         this.guanBiBtn.y = 189;
         this.guanBiBtn.addEventListener(MouseEvent.CLICK,this.onClose2);
      }
      
      private function onClose1(param1:FCloseEvent) : void
      {
         this.deleteShuoming();
      }
      
      private function onClose2(param1:MouseEvent) : void
      {
         this.deleteShuoming();
      }
      
      private function deleteShuoming() : void
      {
         if(this != null && this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

