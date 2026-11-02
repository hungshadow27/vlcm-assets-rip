package com.tgame.shell.view.components.ride
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class RideGradeUpgradeTipCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var checkBox:FCheckBox;
      
      public function RideGradeUpgradeTipCanvas()
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
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您的坐骑在炼骨进阶时将承受着极大的痛苦：") + "</font><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("如果您没有放入进阶符的话，坐骑的悟性，技能，品级均会重新生成。") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("如果您放入了进阶符，则坐骑的悟性，技能，品级均保持不变进阶。") + "</font><br><br>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您当前选择没有使用进阶符，您确认这样操作吗？") + "</font><br>" + "</textformat>";
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
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION,"",true));
               POPWindowManager.closeWindow();
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION,"",false));
               POPWindowManager.closeWindow();
               break;
            case this.checkBox:
               this.$parent.dispatchEvent(new BaseEvent(RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW,"",this.checkBox.selectState));
         }
      }
   }
}

