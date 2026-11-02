package com.tgame.shell.view.components
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   
   public class YNRenamePanel extends FPanel
   {
      
      public static const UI_RENAMEPANEL_CLICK:String = "UI_RENAMEPANEL_CLICK";
      
      private var ft:FTextArea;
      
      private var btnOK:SecondButton;
      
      private var btnCancle:SecondButton;
      
      private var ftName:FTextArea;
      
      private var inputName:FTextInput;
      
      public function YNRenamePanel()
      {
         super();
         width = 300;
         height = 200;
         titleText = LanResManager.getLanCommonTextWords("更名卡");
         dragAble = true;
         showCloseButton = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:FCanvas = null;
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 15;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("当前名称：");
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 40;
         this.ft.textColor = StaticValue.WHITE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("新名称：");
         addChild(this.ft);
         this.ftName = new FTextArea();
         this.ftName.x = 100;
         this.ftName.y = 15;
         this.ftName.textColor = StaticValue.WHITE;
         addChild(this.ftName);
         this.inputName = new FTextInput();
         this.inputName.textColor = 16777215;
         this.inputName.border = true;
         addChild(this.inputName);
         this.inputName.x = 100;
         this.inputName.y = 40;
         this.inputName.width = 160;
         this.inputName.height = 20;
         _loc1_ = new FCanvas();
         _loc1_.skin = "box";
         _loc1_.x = 11;
         _loc1_.y = 105;
         _loc1_.width = 280;
         _loc1_.height = 50;
         addChild(_loc1_);
         this.ft = new FTextArea();
         this.ft.x = 20;
         this.ft.y = 110;
         this.ft.width = 255;
         this.ft.height = 50;
         this.ft.wordWrap = true;
         this.ft.textColor = StaticValue.RED;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("备注：玩家换名成功后，在想换名，要过24小时后才能继续换。");
         addChild(this.ft);
         this.btnOK = new SecondButton();
         this.btnOK.x = 60;
         this.btnOK.y = 75;
         this.btnOK.label = LanResManager.getLanCommonTextWords("确定");
         this.btnOK.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnOK);
         this.btnCancle = new SecondButton();
         this.btnCancle.x = 185;
         this.btnCancle.y = 75;
         this.btnCancle.label = LanResManager.getLanCommonTextWords("取消");
         this.btnCancle.addEventListener(MouseEvent.CLICK,this.onClick);
         addChild(this.btnCancle);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnOK:
               if(this.inputName.text == "")
               {
                  FAlert.show(LanResManager.getLanCommonTextWords("新名称不可为空！"),LanResManager.getLanCommonTextWords("提示"));
                  return;
               }
               dispatchEvent(new BaseEvent(UI_RENAMEPANEL_CLICK,"",this.inputName.text));
               break;
            case this.btnCancle:
               this.onClose();
         }
      }
      
      public function setData(param1:String) : void
      {
         this.ftName.htmlText = param1;
      }
   }
}

