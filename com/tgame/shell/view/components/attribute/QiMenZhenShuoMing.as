package com.tgame.shell.view.components.attribute
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.events.MouseEvent;
   
   public class QiMenZhenShuoMing extends FPanel
   {
      
      private var bgCanvas:FCanvas;
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var guanBiBtn:SecondButton;
      
      public function QiMenZhenShuoMing()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.showCloseButton = true;
         width = 345;
         height = 235;
         addEventListener(FCloseEvent.CLOSE,this.onClose1);
         titleText = LanResManager.getLanCommonTextWords("奇门阵介绍");
         this.fta1 = new FTextArea();
         with(this.fta1)
         {
            filters = StaticValue.filter;
            width = 285;
            height = 140;
            x = 30;
            y = 15;
            wordWrap = true;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("上古奇阵，相传在轩辕帝时期就已经出现，有阵法之首美誉，变化多端，克敌制胜，无往不利。按遁甲分为八门，分别是休门、生门、伤门、杜门、景门、死门、惊门，开门。八门对应后天八卦“坎、艮、震、巽、离、坤、兑、乾”八个方位。据史料记载黄帝和风后（为轩辕帝大帅）合力借此研制出了上古天书八阵图。") + "</font>" + "</textformat>";
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

