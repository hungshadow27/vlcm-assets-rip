package com.tgame.shell.view.components.itemsynthesize
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class EquipSynthesizeTipCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var checkBox:FCheckBox;
      
      public function EquipSynthesizeTipCanvas()
      {
         var ft:FTextArea;
         super();
         skin = "menuBg";
         ft = new FTextArea();
         with(ft)
         {
            x = 5;
            y = 15;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font><br><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + "</font><br><br>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanTextWords(this,5) + "</font><br><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,6) + "</font><br>" + "</textformat>";
         }
         addChild(ft);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 50;
         this.okBtn.y = ft.y + ft.height + 20;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = ft.x + ft.width - 45 - this.cancelBtn.width;
         this.cancelBtn.y = ft.y + ft.height + 20;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.checkBox = new FCheckBox();
         this.checkBox.border = true;
         this.checkBox.textColor = StaticValue.WHITE;
         this.checkBox.text = LanResManager.getLanCommonTextWords("下次不弹出本提示");
         addChild(this.checkBox);
         this.checkBox.x = 5;
         this.checkBox.y = this.okBtn.y + this.okBtn.height + 10;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onClick);
         width = ft.width + 10;
         height = this.checkBox.y + this.checkBox.height + 5;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_OPTION,"",true));
               POPWindowManager.closeWindow();
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_OPTION,"",false));
               POPWindowManager.closeWindow();
               break;
            case this.checkBox:
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_ITEMSYNTESIZE_EQUIPSYNTHESIZE_TIPCANVAS_NEXT_IS_SHOW,"",this.checkBox.selectState));
         }
      }
   }
}

