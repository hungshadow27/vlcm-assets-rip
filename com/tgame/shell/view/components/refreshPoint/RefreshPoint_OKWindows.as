package com.tgame.shell.view.components.refreshPoint
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.RefreshPointPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   
   public class RefreshPoint_OKWindows extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var tip:FTextArea;
      
      private var tip1:FTextArea;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function RefreshPoint_OKWindows()
      {
         var img:Bitmap = null;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         width = 286;
         height = 162;
         titleText = LanResManager.getLanCommonTextWords("洗点");
         img = StaticValue.getBitmapByClassName("ui.line");
         addChild(img);
         img.width = 269;
         img.x = 10;
         img.y = 62;
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 20;
            y = 10;
            width = 245;
            height = 55;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.tip);
         this.tip1 = new FTextArea();
         with(this.tip1)
         {
            x = 20;
            y = 65;
            width = 245;
            height = 40;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.tip1);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 40;
         this.okBtn.y = 111;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - this.cancelBtn.width - 40;
         this.cancelBtn.y = 111;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               this.$parent.dispatchEvent(new BaseEvent(RefreshPointPanel.UI_REFRESHPOINTPANEL_OK));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function setValue(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.tip.htmlText = LanResManager.getLanTextWords(this,"技能点分配2",[param1,param2,param3,param4]);
         this.tip1.htmlText = LanResManager.getLanTextWords(this,"技能点分配1",[param5,param6]);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
   }
}

