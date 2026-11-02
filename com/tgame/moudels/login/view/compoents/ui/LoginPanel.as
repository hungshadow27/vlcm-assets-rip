package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.alert.FAlert;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextInput;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.moudels.login.view.compoents.LoginUI;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class LoginPanel extends FPanel
   {
      
      public var nameInput:FTextInput;
      
      public var passwordInput:FTextInput;
      
      public var okBtn:MainButton;
      
      public var cancelBtn:MainButton;
      
      public function LoginPanel()
      {
         super();
         skin = "panel_btn";
         width = 304;
         height = 210;
         this.nameInput = new FTextInput();
         this.nameInput.textColor = 16777215;
         this.nameInput.border = true;
         addChild(this.nameInput);
         this.nameInput.x = 100;
         this.nameInput.y = 34;
         this.nameInput.width = 160;
         this.nameInput.height = 20;
         this.passwordInput = new FTextInput();
         this.passwordInput.displayAsPassword = true;
         this.passwordInput.border = true;
         this.passwordInput.textColor = 16777215;
         addChild(this.passwordInput);
         this.passwordInput.x = 100;
         this.passwordInput.y = 81;
         this.passwordInput.width = 160;
         this.passwordInput.height = 20;
         this.passwordInput.text = "zxcvbnm";
         this.okBtn = new MainButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 50;
         this.okBtn.y = 145;
         this.cancelBtn = new MainButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 200;
         this.cancelBtn.y = 145;
         this.addEventListener(Event.ADDED_TO_STAGE,this.addEvents);
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.removeEvents);
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case Keyboard.ENTER:
               if(this.nameInput.text == "")
               {
                  this.nameInput.text == "333";
                  FAlert.show(LanResManager.getLanTextWords(LoginPanel,"用户名不能为空"));
                  break;
               }
               if(this.passwordInput.text == "")
               {
                  FAlert.show(LanResManager.getLanTextWords(LoginPanel,"密码不能为空"));
                  break;
               }
               parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SUBMIT,"",[{
                  "name":this.nameInput.text,
                  "password":this.passwordInput.text
               }]));
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(this.nameInput.text == "")
               {
                  FAlert.show(LanResManager.getLanTextWords(LoginPanel,"用户名不能为空"));
                  break;
               }
               if(this.passwordInput.text == "")
               {
                  FAlert.show(LanResManager.getLanTextWords(LoginPanel,"密码不能为空"));
                  break;
               }
               parent.parent.dispatchEvent(new BaseEvent(LoginUI.UI_LOGIN_SUBMIT,"",[{
                  "name":this.nameInput.text,
                  "password":this.passwordInput.text
               }]));
               break;
            case this.cancelBtn:
         }
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         if(!param1)
         {
            this.removeEvents();
         }
         else
         {
            this.addEvents();
         }
      }
      
      private function addEvents(param1:Event = null) : void
      {
         Tools.currentStage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function removeEvents(param1:Event = null) : void
      {
         Tools.currentStage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.okBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function destory() : void
      {
         this.removeEvents();
      }
   }
}

