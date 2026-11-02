package com.tgame.shell.view.components.ride
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class UpgradeLevelLessPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var tip:FLabel;
      
      private var tip1:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var canceBtn:SecondButton;
      
      public function UpgradeLevelLessPanel()
      {
         var img:Bitmap;
         super();
         skin = "sceondPanel_btn";
         width = 228;
         height = 160;
         titleText = LanResManager.getLanCommonTextWords("等级不足");
         img = StaticValue.getBitmapByClassName("ui.level.deficiency.ui");
         addChild(img);
         img.x = 6;
         img.y = 2;
         this.tip = new FLabel();
         with(this.tip)
         {
            x = 16;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("成功进阶后的新坐骑：XXXX");
         }
         addChild(this.tip);
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            x = 16;
            y = 40;
            width = 200;
            height = 60;
            wordWrap = true;
            htmlText = "";
         }
         addChild(this.tip1);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("继续进阶");
         addChild(this.okBtn);
         this.okBtn.x = 30;
         this.okBtn.y = 105;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.canceBtn = new SecondButton();
         this.canceBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.canceBtn);
         this.canceBtn.x = width - this.canceBtn.width - 30;
         this.canceBtn.y = 105;
         this.canceBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:DisplayObject = this.$parent;
         this.onClose();
         switch(param1.target)
         {
            case this.okBtn:
               _loc2_.dispatchEvent(new BaseEvent(RidePanel.GRADEUPGRADE_KEEP));
               break;
            case this.canceBtn:
         }
      }
      
      public function setData(param1:String, param2:int) : void
      {
         this.tip.text = LanResManager.getLanCommonTextWords("成功进阶后的新坐骑：") + param1;
         this.tip1.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"坐骑进阶提醒",[param2,StaticValue.GREEN_HTML]) + "</textformat>";
      }
   }
}

