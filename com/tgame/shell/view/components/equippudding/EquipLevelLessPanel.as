package com.tgame.shell.view.components.equippudding
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.ItemSynthesizePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class EquipLevelLessPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var tip:FLabel;
      
      private var tip1:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var canceBtn:SecondButton;
      
      public function EquipLevelLessPanel()
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
            text = LanResManager.getLanTextWords(this,0);
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
            htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'> " + LanResManager.getLanTextWords(this,1) + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font></textformat>";
         }
         addChild(this.tip1);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanTextWords(this,"继续合成");
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
         this.onClose();
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(ItemSynthesizePanel.UI_EQUIPPUDDING_EQUIPSTRENGTHEN_KEEP));
               break;
            case this.canceBtn:
         }
      }
      
      public function setData(param1:String, param2:int) : void
      {
         this.tip.text = LanResManager.getLanTextWords(this,3) + param1;
         this.tip1.htmlText = "<textformat ><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,4) + param2 + "</font><br><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,5) + "</font></textformat>";
      }
   }
}

