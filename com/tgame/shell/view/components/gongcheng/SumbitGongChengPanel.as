package com.tgame.shell.view.components.gongcheng
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XiangYangGuiShuPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.*;
   import flash.text.*;
   
   public class SumbitGongChengPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var okBtn:SecondButton;
      
      private var tips:FTextArea;
      
      public function SumbitGongChengPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 264;
         titleText = LanResManager.getLanCommonTextWords("提交攻城申请");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.gongcheng.application.ui";
         addChild(img);
         img.x = 6;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 13;
            y = 4;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,0,[StaticValue.ORANGE_HTML]) + "</textformat>";
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 16;
            y = 64;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'\'>" + LanResManager.getLanTextWords(this,1,[StaticValue.ORANGE_HTML]) + LanResManager.getLanTextWords(this,2,[StaticValue.WHITE_HTML]) + "</textformat>";
         }
         addChild(ft);
         this.tips = new FTextArea();
         with(this.tips)
         {
            x = 10;
            y = 107;
            width = 270;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         addChild(this.tips);
         this.okBtn = new SecondButton();
         with(this.okBtn)
         {
            label = LanResManager.getLanTextWords(this,3);
            x = (panelWidth - okBtn.width) / 2;
            y = 212;
            addEventListener(MouseEvent.CLICK,onClick);
         }
         addChild(this.okBtn);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.onClose();
         this.$parent.dispatchEvent(new BaseEvent(XiangYangGuiShuPanel.UI_XIANGYANGGUISHU_SUMBIT_OK));
      }
      
      public function setTime(param1:Date) : void
      {
         this.tips.htmlText = "<textformat leading=\'0.1\'>" + LanResManager.getLanTextWords(this,"襄阳攻城战将在每周三举行您今日申请成功则会被安排在年月日申请",[StaticValue.GREEN_HTML,param1.fullYear,param1.month + 1,param1.date,StaticValue.RED_HTML],false) + "</textformat>";
      }
   }
}

