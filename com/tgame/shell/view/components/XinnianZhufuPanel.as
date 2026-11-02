package com.tgame.shell.view.components
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
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class XinnianZhufuPanel extends FPanel
   {
      
      public static const XINCHUNZHUFU:String = "XINCHUNZHUFU";
      
      private var zhufuInput:FTextInput;
      
      private var fta:FTextArea;
      
      private var okBtn:MainButton;
      
      private var cancelBtn:MainButton;
      
      private var playerID:int = -1;
      
      public function XinnianZhufuPanel()
      {
         super();
         skin = "panel_btn";
         width = 300;
         height = 175;
         titleText = LanResManager.getLanCommonTextWords("春节祝福");
         dragAble = true;
         this.showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         this.zhufuInput.text = "";
         POPWindowManager.closeWindow();
      }
      
      private function init() : void
      {
         this.fta = new FTextArea();
         this.fta.x = 40;
         this.fta.y = 20;
         this.fta.width = 200;
         this.fta.htmlText = "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("请输入您的新春祝福:") + "</font>";
         addChild(this.fta);
         this.zhufuInput = new FTextInput();
         this.zhufuInput.border = true;
         this.zhufuInput.textColor = 16777215;
         addChild(this.zhufuInput);
         this.zhufuInput.x = 40;
         this.zhufuInput.y = 50;
         this.zhufuInput.width = 220;
         this.zhufuInput.height = 20;
         this.okBtn = new MainButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = width / 2 - width / 2 / 2 - this.okBtn.width / 2;
         this.okBtn.y = 125 - 15;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new MainButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = width / 2 + width / 2 / 2 - this.cancelBtn.width / 2;
         this.cancelBtn.y = 125 - 15;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               if(this.zhufuInput.text.length == 0 || this.zhufuInput.text == "")
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("祝福语不得为空！"));
                  return;
               }
               dispatchEvent(new BaseEvent(XINCHUNZHUFU,"",[this.zhufuInput.text,this.playerID]));
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      public function setPlayerID(param1:int = -1) : void
      {
         this.playerID = param1;
      }
   }
}

