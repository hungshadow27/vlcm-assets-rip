package com.tgame.shell.view.components.equippuddingTwo
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.EquipPuddingTwoPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class ZanWenKeHuaTipCanvas extends FCanvas
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var checkBox:FCheckBox;
      
      public function ZanWenKeHuaTipCanvas()
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
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"图腾战纹的威力异常",[StaticValue.YELLOW_HTML]) + LanResManager.getLanTextWords(this,"战纹刻画失败",[StaticValue.RED_HTML]) + LanResManager.getLanTextWords(this,"镇魂符不会破碎",[StaticValue.GREEN_HTML]) + LanResManager.getLanTextWords(this,"放入镇魂符",[StaticValue.RED_HTML]) + "</textformat>";
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
         this.checkBox.text = LanResManager.getLanTextWords(this,"下次不弹出本提示");
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
               this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_OPTION,"",true));
               POPWindowManager.closeWindow();
               break;
            case this.cancelBtn:
               this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_OPTION,"",false));
               POPWindowManager.closeWindow();
               break;
            case this.checkBox:
               this.$parent.dispatchEvent(new BaseEvent(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_TIPCANVAS_NEXT_IS_SHOW,"",this.checkBox.selectState));
         }
      }
   }
}

