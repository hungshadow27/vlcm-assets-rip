package com.tgame.shell.view.components.party
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.PartyFlagPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class Party_change_flagNamePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var nameInput:FTextInput;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      public function Party_change_flagNamePanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 210;
         height = 165;
         titleText = LanResManager.getLanCommonTextWords("帮旗改名");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.flag.rename.ui";
         img.x = 6;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 16;
            y = 6;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         ft.text = LanResManager.getLanTextWords(this,"请输入新的帮旗名称");
         addChild(ft);
         this.nameInput = new FTextInput();
         with(this.nameInput)
         {
            x = 46;
            y = 28;
            width = 114;
            height = 20;
            multiline = false;
            textColor = StaticValue.WHITE;
         }
         this.nameInput.setMaxChars(12);
         addChild(this.nameInput);
         ft = new FTextArea();
         with(ft)
         {
            x = 16;
            y = 60;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"每次帮旗改名需要消耗");
         addChild(ft);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 30;
         this.okBtn.y = 110;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - 30 - this.cancelBtn.width;
         this.cancelBtn.y = 110;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(this.nameInput.text == "")
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"帮旗名字不能为空"));
                  return;
               }
               if(this.nameInput.text.length < 2)
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"帮旗名字最短2个字"));
                  return;
               }
               this.onClose();
               this.$parent.dispatchEvent(new BaseEvent(PartyFlagPanel.UI_PARTYFLAGPANEL_RENAME_OK,"",this.nameInput.text));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
   }
}

