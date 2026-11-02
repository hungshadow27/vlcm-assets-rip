package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   
   public class ChaoJiLaBaPanel extends FPanel
   {
      
      public static const UI_CHAOJILABA_QUEREN:String = "UI_CHAOJILABA_QUEREN";
      
      public var nameInput:FTextInput;
      
      private var okBtn:SecondButton;
      
      private var quxiaoBtn:SecondButton;
      
      public function ChaoJiLaBaPanel()
      {
         super();
         skin = "panel_btn";
         width = 360;
         height = 190;
         showCloseButton = true;
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.nameInput = new FTextInput();
         this.nameInput.textColor = 16777215;
         this.nameInput.border = true;
         this.nameInput.wordWrap = true;
         addChild(this.nameInput);
         this.nameInput.setMaxChars(60);
         this.nameInput.x = 12;
         this.nameInput.y = 10;
         this.nameInput.width = 160 + 175;
         this.nameInput.height = 20 + 75;
         this.nameInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.nameInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 100;
         this.okBtn.y = 120;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onCreate);
         this.quxiaoBtn = new SecondButton();
         this.quxiaoBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.quxiaoBtn);
         this.quxiaoBtn.x = 230;
         this.quxiaoBtn.y = 120;
         this.quxiaoBtn.addEventListener(MouseEvent.CLICK,this.onCreate);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         if(param1.type == FocusEvent.FOCUS_IN)
         {
            switch(param1.target)
            {
               case this.nameInput:
                  this.nameInput.text = "";
            }
         }
         else if(param1.type == FocusEvent.FOCUS_OUT)
         {
            switch(param1.target)
            {
               case this.nameInput:
                  if(this.nameInput.text == "")
                  {
                     this.nameInput.text = LanResManager.getLanCommonTextWords("请输入你要说的话");
                  }
            }
         }
      }
      
      private function onCreate(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_CHAOJILABA_QUEREN,"",this.nameInput.text));
               break;
            case this.quxiaoBtn:
         }
         this.onClose1();
      }
      
      private function onClose1() : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setCs() : void
      {
         this.nameInput.text = LanResManager.getLanCommonTextWords("请输入你要说的话");
      }
   }
}

