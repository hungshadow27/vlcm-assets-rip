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
   
   public class QiShangQuanJieShao extends FPanel
   {
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var guanBiBtn:SecondButton;
      
      public function QiShangQuanJieShao()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 345;
         height = 235;
         addEventListener(FCloseEvent.CLOSE,this.onClose1);
         titleText = LanResManager.getLanCommonTextWords("七伤拳介绍");
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 30;
            y = 15;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("崆峒派传世武功，此拳法出拳时声势煊赫，一拳中有七股不同的劲力，或刚猛、或阴柔、或刚中有柔，或柔中有刚，或横出，或直送，或内缩，敌人抵挡不住这源源而来的劲力，便会深受内伤。谢逊曾以此拳击毙少林神僧空见大师。但这七伤拳倘由内力未臻化境的人来练，对自己便有极大伤害。人体内有阴阳二气、金木水火土五行，一练七伤，七者皆伤。所以所谓“七伤”，乃是先伤己，再伤人。") + "</font>" + "</textformat>";
         }
         addChild(this.fta1);
         this.guanBiBtn = new SecondButton();
         this.guanBiBtn.label = LanResManager.getLanCommonTextWords("关闭");
         addChild(this.guanBiBtn);
         this.guanBiBtn.x = 150;
         this.guanBiBtn.y = 169;
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

