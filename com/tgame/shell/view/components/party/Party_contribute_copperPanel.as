package com.tgame.shell.view.components.party
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.PartyContributePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class Party_contribute_copperPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var subBtn:FSimpleButton;
      
      private var sumBtn:FSimpleButton;
      
      private var maxBtn:SmallButton;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var copper:FLabel;
      
      private var copperInput:FTextInput;
      
      public function Party_contribute_copperPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var ft:FTextArea;
         super();
         skin = "sceondPanel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 272;
         height = 206;
         titleText = LanResManager.getLanCommonTextWords("帮贡");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         addChild(img);
         img.name = "ui.party.contribute.money.ui";
         img.x = 6;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         this.DynamicManageImages = v;
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 8;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         ft.text = LanResManager.getLanTextWords(this,"您的背包中拥有铜币");
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 76;
         img.y = 25;
         this.copper = new FLabel();
         with(this.copper)
         {
            x = 102;
            y = 27;
            textColor = StaticValue.WHITE;
            text = "99999";
         }
         addChild(this.copper);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 52;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         ft.text = LanResManager.getLanTextWords(this,"您希望贡献多少到帮贡仓库");
         addChild(ft);
         this.subBtn = new FSimpleButton();
         this.subBtn.skin = "subButton";
         addChild(this.subBtn);
         this.subBtn.x = 59;
         this.subBtn.y = 71;
         this.subBtn.addEventListener(MouseEvent.CLICK,this.onSetMoney);
         this.copperInput = new FTextInput();
         with(this.copperInput)
         {
            x = 83;
            width = 106;
            multiline = false;
            y = 73;
            height = 20;
            textColor = StaticValue.WHITE;
            restrict = "0-9";
            text = "10000";
         }
         addChild(this.copperInput);
         this.copperInput.addEventListener(Event.CHANGE,this.onChange);
         this.sumBtn = new FSimpleButton();
         this.sumBtn.skin = "sumButton";
         addChild(this.sumBtn);
         this.sumBtn.x = 196;
         this.sumBtn.y = 71;
         this.sumBtn.addEventListener(MouseEvent.CLICK,this.onSetMoney);
         this.maxBtn = new SmallButton();
         this.maxBtn.label = "MAX";
         addChild(this.maxBtn);
         this.maxBtn.x = 216;
         this.maxBtn.y = 71;
         this.maxBtn.addEventListener(MouseEvent.CLICK,this.onSetMoney);
         ft = new FTextArea();
         with(ft)
         {
            x = 10;
            y = 102;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
         }
         ft.htmlText = LanResManager.getLanTextWords(this,"每捐献30万铜币增加贡献值1");
         addChild(ft);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 50;
         this.okBtn.y = 150;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onSetMoney);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - this.cancelBtn.width - 50;
         this.cancelBtn.y = 150;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onSetMoney);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
      }
      
      private function onChange(param1:Event) : void
      {
         if(Number(this.copperInput.text) > Number(this.copper.text))
         {
            this.copperInput.text = this.copper.text;
         }
      }
      
      private function onSetMoney(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.subBtn:
               if(Number(this.copperInput.text) > 10000)
               {
                  this.copperInput.text = (Number(this.copperInput.text) - 10000).toString();
               }
               break;
            case this.sumBtn:
               if(Number(this.copperInput.text) + 10000 < Number(this.copper.text))
               {
                  this.copperInput.text = (Number(this.copperInput.text) + 10000).toString();
               }
               break;
            case this.maxBtn:
               this.copperInput.text = this.copper.text;
               break;
            case this.okBtn:
               this.onClose();
               this.$parent.dispatchEvent(new BaseEvent(PartyContributePanel.UI_PARTYFLAGPANEL_CONTRIBUTE_COPPER_OK,"",Number(this.copperInput.text)));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function setCopper(param1:Number) : void
      {
         this.copper.text = param1.toString();
         if(param1 < 10000)
         {
            this.subBtn.enabled = this.sumBtn.enabled = this.maxBtn.enabled = this.okBtn.enabled = false;
         }
         else if(param1 < 20000)
         {
            this.sumBtn.enabled = false;
         }
         else
         {
            this.subBtn.enabled = this.sumBtn.enabled = this.maxBtn.enabled = this.okBtn.enabled = true;
         }
      }
   }
}

