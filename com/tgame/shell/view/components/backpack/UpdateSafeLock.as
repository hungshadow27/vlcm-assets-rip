package com.tgame.shell.view.components.backpack
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.MainButton;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.TaskTracker;
   import com.tgame.shell.view.components.Backpack;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.TimerManager;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class UpdateSafeLock extends FPanel
   {
      
      private var fta:FTextArea;
      
      private var ftaDesc:FTextArea;
      
      private var passwordInput:FTextInput;
      
      private var passwordInput1:FTextInput;
      
      private var passwordInput2:FTextInput;
      
      private var okBtn:MainButton;
      
      private var cancelBtn:MainButton;
      
      private var yiwangBtn:MainButton;
      
      public var $parent:DisplayObject;
      
      private var types:int;
      
      private var xianshiTimer:TimerData;
      
      public function UpdateSafeLock()
      {
         super();
         skin = "panel_btn";
         width = 280;
         height = 200;
         titleText = LanResManager.getLanCommonTextWords("宝箱锁");
         dragAble = true;
         this.showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ftaDesc = new FTextArea();
         this.ftaDesc.x = 15 + 5;
         this.ftaDesc.y = 0;
         this.ftaDesc.width = 240;
         this.ftaDesc.height = 65;
         this.ftaDesc.textColor = StaticValue.YELLOW;
         this.ftaDesc.wordWrap = true;
         this.ftaDesc.text = LanResManager.getLanCommonTextWords("经常更改密码，为了保护您的账号安全，建议您一个月更改一次。");
         addChild(this.ftaDesc);
         this.fta = new FTextArea();
         this.fta.x = 5 + 5 + 10;
         this.fta.y = 40;
         this.fta.width = 190;
         this.fta.textColor = StaticValue.BLUE;
         this.fta.text = LanResManager.getLanCommonTextWords("老密码：");
         addChild(this.fta);
         this.fta = new FTextArea();
         this.fta.x = 5 + 5 + 10;
         this.fta.y = 65;
         this.fta.width = 190;
         this.fta.textColor = StaticValue.BLUE;
         this.fta.text = LanResManager.getLanCommonTextWords("更改密码：");
         addChild(this.fta);
         this.fta = new FTextArea();
         this.fta.x = 5 + 5 + 10;
         this.fta.y = 90;
         this.fta.width = 190;
         this.fta.textColor = StaticValue.BLUE;
         this.fta.text = LanResManager.getLanCommonTextWords("确认密码：");
         addChild(this.fta);
         this.passwordInput = new FTextInput();
         this.passwordInput.displayAsPassword = true;
         this.passwordInput.border = true;
         this.passwordInput.textColor = 16777215;
         addChild(this.passwordInput);
         this.passwordInput.x = 115 + 5;
         this.passwordInput.y = 40;
         this.passwordInput.width = 140;
         this.passwordInput.height = 20;
         this.passwordInput1 = new FTextInput();
         this.passwordInput1.displayAsPassword = true;
         this.passwordInput1.border = true;
         this.passwordInput1.textColor = 16777215;
         addChild(this.passwordInput1);
         this.passwordInput1.x = 115 + 5;
         this.passwordInput1.y = 65;
         this.passwordInput1.width = 140;
         this.passwordInput1.height = 20;
         this.passwordInput2 = new FTextInput();
         this.passwordInput2.displayAsPassword = true;
         this.passwordInput2.border = true;
         this.passwordInput2.textColor = 16777215;
         addChild(this.passwordInput2);
         this.passwordInput2.x = 115 + 5;
         this.passwordInput2.y = 90;
         this.passwordInput2.width = 140;
         this.passwordInput2.height = 20;
         this.okBtn = new MainButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 100 + 14 + 10;
         this.okBtn.y = 130;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new MainButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("消灭");
         addChild(this.cancelBtn);
         this.cancelBtn.x = 200;
         this.cancelBtn.y = 130;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.yiwangBtn = new MainButton();
         this.yiwangBtn.label = LanResManager.getLanCommonTextWords("破锁");
         addChild(this.yiwangBtn);
         this.yiwangBtn.x = 50 - 12 - 5;
         this.yiwangBtn.y = 130;
         this.yiwangBtn.addEventListener(MouseEvent.CLICK,this.onClicks);
         this.addEventListener(Event.ADDED_TO_STAGE,this.addEvents);
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.removeEvents);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.yiwangBtn:
               this.$parent.dispatchEvent(new BaseEvent(Backpack.UI_YIWANGLOCK_CLICK));
               break;
            case this.okBtn:
               if(this.passwordInput.text == "")
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("老密码不得为空！请重新输入"));
                  break;
               }
               if(this.passwordInput1.text != "" || this.passwordInput2.text != "")
               {
                  if(this.passwordInput1.text.length < 4 || this.passwordInput1.text.length > 10 || this.passwordInput2.text.length < 4 || this.passwordInput2.text.length > 10)
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("更改密码长度不得少于4或大于10！请重新输入"));
                     break;
                  }
                  if(this.passwordInput1.text != this.passwordInput2.text)
                  {
                     FAlert.show(LanResManager.getLanCommonTextWords("两次密码不一致，请重新输入"));
                     break;
                  }
               }
               this.$parent.dispatchEvent(new BaseEvent(Backpack.UI_SETSAFELOCK_CLICK,"",[this.passwordInput.text,this.passwordInput1.text,this.passwordInput2.text]));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function onClicks(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(Backpack.UI_YIWANGLOCK_CLICK));
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this.passwordInput.text = "";
         this.passwordInput1.text = "";
         this.passwordInput2.text = "";
         POPWindowManager.closeWindow();
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
      
      public function posuo(param1:int) : void
      {
         var onUpdate:Function;
         var str:String = null;
         var lostTimeStr:String = null;
         var time:int = param1;
         if(time == -1)
         {
            str = "";
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("确定破除安全锁，会在三天之后对安全锁进行重置。") + "</font></textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("请求破锁");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消返回");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  $parent.dispatchEvent(new BaseEvent(Backpack.UI_POCHULOCK_CLICK));
               }
            });
         }
         else
         {
            onUpdate = function(param1:Number):void
            {
               var _loc2_:Function = Math.floor;
               var _loc3_:int = _loc2_(param1 / 86400);
               var _loc4_:int = _loc2_(param1 % 86400 / 3600);
               var _loc5_:int = _loc2_(param1 % 86400 % 3600 / 60);
               var _loc6_:int = _loc2_(param1 % 86400 % 3600 % 60);
               lostTimeStr += LanResManager.getLanTextWords(TaskTracker,"天时分秒",[_loc3_,_loc4_,_loc5_,_loc6_]);
            };
            lostTimeStr = "";
            this.xianshiTimer = TimerManager.createExactTimer(time,time,0,onUpdate,null,60);
            onUpdate(time);
            str = "";
            str = "<textformat leading=\'\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("破锁所需剩余时间：") + lostTimeStr + "</font></textformat>";
            FAlert.okLabel = LanResManager.getLanCommonTextWords("继续破锁");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消破锁");
            FAlert.show(str,"",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.CANCEL)
               {
                  $parent.dispatchEvent(new BaseEvent(Backpack.UI_QUXIAOLOCK_CLICK));
               }
            });
         }
      }
   }
}

