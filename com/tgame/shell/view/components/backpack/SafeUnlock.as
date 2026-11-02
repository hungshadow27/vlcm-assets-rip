package com.tgame.shell.view.components.backpack
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.shell.view.components.Backpack;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class SafeUnlock extends FPanel
   {
      
      private var fta:FTextArea;
      
      private var fta1:FTextArea;
      
      private var ftaDesc:FTextArea;
      
      private var passwordInput1:FTextInput;
      
      private var passwordInput2:FTextInput;
      
      private var okBtn:MainButton;
      
      private var cancelBtn:MainButton;
      
      public var $parent:DisplayObject;
      
      private var types:int;
      
      public function SafeUnlock()
      {
         super();
         skin = "panel_btn";
         width = 280;
         height = 180;
         titleText = LanResManager.getLanCommonTextWords("宝箱锁");
         dragAble = true;
         this.showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ftaDesc = new FTextArea();
         this.ftaDesc.x = 15;
         this.ftaDesc.y = 5;
         this.ftaDesc.width = 255;
         this.ftaDesc.height = 65;
         this.ftaDesc.wordWrap = true;
         this.ftaDesc.textColor = StaticValue.YELLOW;
         this.ftaDesc.text = LanResManager.getLanCommonTextWords("请您填上正确密码设置宝箱锁。");
         addChild(this.ftaDesc);
         this.fta = new FTextArea();
         this.fta.x = 15;
         this.fta.y = 45;
         this.fta.width = 190;
         this.fta.textColor = StaticValue.BLUE;
         this.fta.text = LanResManager.getLanCommonTextWords("请输入密码：");
         addChild(this.fta);
         this.fta.visible = true;
         this.fta1 = new FTextArea();
         this.fta1.x = 15;
         this.fta1.y = 75;
         this.fta1.width = 190;
         this.fta1.textColor = StaticValue.BLUE;
         this.fta1.text = LanResManager.getLanCommonTextWords("请再次输入密码：");
         addChild(this.fta1);
         this.passwordInput1 = new FTextInput();
         this.passwordInput1.displayAsPassword = true;
         this.passwordInput1.border = true;
         this.passwordInput1.textColor = 16777215;
         addChild(this.passwordInput1);
         this.passwordInput1.x = 110;
         this.passwordInput1.y = 45;
         this.passwordInput1.width = 160 - 15;
         this.passwordInput1.height = 20;
         this.passwordInput2 = new FTextInput();
         this.passwordInput2.displayAsPassword = true;
         this.passwordInput2.border = true;
         this.passwordInput2.textColor = 16777215;
         addChild(this.passwordInput2);
         this.passwordInput2.x = 110;
         this.passwordInput2.y = 75;
         this.passwordInput2.width = 160 - 15;
         this.passwordInput2.height = 20;
         this.okBtn = new MainButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 50;
         this.okBtn.y = 125 - 15;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new MainButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 200;
         this.cancelBtn.y = 125 - 15;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addEventListener(Event.ADDED_TO_STAGE,this.addEvents);
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.removeEvents);
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this.passwordInput1.text = "";
         this.passwordInput2.text = "";
         POPWindowManager.closeWindow();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(this.types == 1)
               {
                  if(this.passwordInput2.text == "" || this.passwordInput1.text == "")
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("密码不得为空！请重新输入"));
                     break;
                  }
                  if(this.passwordInput1.text.length < 4 || this.passwordInput1.text.length > 10 || this.passwordInput2.text.length < 4 || this.passwordInput2.text.length > 10)
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("密码长度不得少于4或大于10！请重新输入"));
                     break;
                  }
                  if(this.passwordInput1.text != this.passwordInput2.text)
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("两次密码不一致，请重新输入"));
                     break;
                  }
               }
               else
               {
                  if(this.passwordInput1.text == "")
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("密码不得为空！请重新输入"));
                     break;
                  }
                  if(this.passwordInput1.text.length < 4 || this.passwordInput1.text.length > 10)
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("密码长度不得少于4或大于10！请重新输入"));
                     break;
                  }
                  this.passwordInput2.text = "";
               }
               this.$parent.dispatchEvent(new BaseEvent(Backpack.UI_SAFEUNLOCK_CLICK,"",[this.passwordInput1.text,this.passwordInput2.text,this.types]));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function addEvents(param1:Event = null) : void
      {
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function removeEvents(param1:Event = null) : void
      {
         this.okBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn.removeEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function destory() : void
      {
         this.removeEvents();
      }
      
      public function txtDesc(param1:int) : void
      {
         this.types = param1;
         if(param1 == 1)
         {
            this.ftaDesc.y = 12;
            this.ftaDesc.text = LanResManager.getLanCommonTextWords("请您填上正确密码设置宝箱锁。");
            this.fta1.visible = true;
            this.passwordInput2.visible = true;
            this.fta.y = 45;
            this.fta1.y = 75;
            this.passwordInput1.y = 45;
            this.passwordInput2.y = 75;
         }
         else
         {
            this.ftaDesc.y = 12;
            this.ftaDesc.text = LanResManager.getLanCommonTextWords("为了保证您的账号安全，请先输入您的密码用以解锁您的宝箱锁。");
            this.fta.y = 60;
            this.passwordInput1.y = 60;
            this.fta1.visible = false;
            this.passwordInput2.visible = false;
         }
      }
   }
}

