package com.tgame.shell.view.components.team
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XinzengxinyuPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var biankuang:FCanvas;
      
      public var ft1:FTextInput;
      
      private var xinzengBtn:SecondButton;
      
      private var quxiaoBtn:SecondButton;
      
      public function XinzengxinyuPanel()
      {
         var ft:FTextArea;
         super();
         dragAble = true;
         this.skin = "panel_btn";
         this.dragRestrict = false;
         dragAble = true;
         showCloseButton = true;
         width = 300;
         height = 166;
         this.titleText = LanResManager.getLanCommonTextWords("新增轻语");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         ft = new FTextArea();
         with(ft)
         {
            x = 15;
            y = 7;
            width = 140;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"您要对TA说");
         addChild(ft);
         this.biankuang = new FCanvas();
         this.biankuang.skin = "box";
         this.biankuang.width = 280;
         this.biankuang.height = 65;
         this.biankuang.x = 10;
         this.biankuang.y = 25;
         addChild(this.biankuang);
         this.ft1 = new FTextInput();
         with(this.ft1)
         {
            x = 15;
            y = 30;
            width = 270;
            height = 60;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         this.ft1.setMaxChars(60);
         addChild(this.ft1);
         this.xinzengBtn = new SecondButton();
         this.xinzengBtn.label = LanResManager.getLanTextWords(this,"新增");
         addChild(this.xinzengBtn);
         this.xinzengBtn.x = 70;
         this.xinzengBtn.y = 100;
         this.xinzengBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.quxiaoBtn = new SecondButton();
         this.quxiaoBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.quxiaoBtn);
         this.quxiaoBtn.x = 190;
         this.quxiaoBtn.y = 100;
         this.quxiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.xinzengBtn:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_XINZENGXINYUPANEL_XINZENG,"",this.ft1.text));
               break;
            case this.quxiaoBtn:
               this.onClose();
         }
      }
   }
}

