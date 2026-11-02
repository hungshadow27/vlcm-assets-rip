package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class AnqiTupopingjingTishiPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var fta:FTextArea;
      
      private var JixutupoBtn:SecondButton;
      
      private var GuanbimianbanBtn:SecondButton;
      
      private var ftTime:FTextArea;
      
      public function AnqiTupopingjingTishiPanel()
      {
         super();
         dragAble = true;
         this.skin = "panel_btn";
         width = 285;
         height = 185;
         this.titleText = LanResManager.getLanCommonTextWords("突破瓶颈");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.fta = new FTextArea();
         with(this.fta)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            width = 280;
            height = 70;
            x = 13;
            y = 5;
            textColor = StaticValue.BLUE;
            htmlText = "";
         }
         addChild(this.fta);
         this.JixutupoBtn = new SecondButton();
         this.JixutupoBtn.label = LanResManager.getLanCommonTextWords("继续突破");
         addChild(this.JixutupoBtn);
         this.JixutupoBtn.x = 41;
         this.JixutupoBtn.y = 120;
         this.JixutupoBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.GuanbimianbanBtn = new SecondButton();
         this.GuanbimianbanBtn.label = LanResManager.getLanCommonTextWords("关闭面板");
         addChild(this.GuanbimianbanBtn);
         this.GuanbimianbanBtn.x = 153;
         this.GuanbimianbanBtn.y = 120;
         this.GuanbimianbanBtn.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.ftTime = new FTextArea();
         with(this.ftTime)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            width = 130;
            height = 20;
            x = 13;
            y = 39;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ftTime);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK));
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.JixutupoBtn:
               POPWindowManager.closeWindow();
               break;
            case this.GuanbimianbanBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_ANQITUPOPINGJINGTISHI_GUANBITUPO_CLICK));
               POPWindowManager.closeWindow();
         }
      }
      
      public function setInitialize(param1:int, param2:int) : void
      {
         this.fta.htmlText = "<textformat leading=\'5\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"您本次突破瓶颈积累了突破幸运值",[param1]) + "<font>" + LanResManager.getLanTextWords(this,"请注意暗器修炼突破瓶颈时最好一鼓作气") + "<font></textformat>";
      }
      
      public function setRTime(param1:int) : void
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(param1 == 0)
         {
            this.ftTime.htmlText = "";
         }
         else
         {
            _loc2_ = LanResManager.getLanCommonTextWords("祝福值清空倒计时：");
            _loc3_ = LanResManager.getLanCommonTextWords("时");
            _loc4_ = LanResManager.getLanCommonTextWords("分");
            this.ftTime.htmlText = "";
         }
      }
   }
}

