package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class HuanXingTianFuOKPanel extends FPanel
   {
      
      private var ft:FTextArea;
      
      private var ftCopper:FTextArea;
      
      private var ftGas:FTextArea;
      
      private var chk:FCheckBox;
      
      private var btnOk:SecondButton;
      
      public var $parent:DisplayObject;
      
      private var o:Object;
      
      public function HuanXingTianFuOKPanel()
      {
         super();
         width = 265;
         height = 160;
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         this.titleText = LanResManager.getLanCommonTextWords("唤醒天赋");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         POPWindowManager.closeWindow();
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:TextFormat = null;
         _loc1_ = new TextFormat();
         _loc1_.align = "center";
         _loc1_.size = 16;
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 10;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("该天赋已经沉睡，重新唤醒需要消耗：");
         this.ft.textColor = StaticValue.RED;
         this.ft.width = 300;
         this.ft.defaultTextFormat = _loc1_;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 40;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("铜币：");
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.width = 50;
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 25;
         this.ft.y = 65;
         this.ft.textColor = StaticValue.ORANGE;
         this.ft.htmlText = LanResManager.getLanCommonTextWords("真气：");
         this.ft.width = 50;
         addChild(this.ft);
         this.ftCopper = new FTextArea();
         this.ftCopper.x = 80;
         this.ftCopper.y = 40;
         this.ftCopper.htmlText = "";
         this.ftCopper.textColor = StaticValue.WHITE;
         this.ftCopper.width = 120;
         addChild(this.ftCopper);
         this.ftGas = new FTextArea();
         this.ftGas.x = 80;
         this.ftGas.y = 65;
         this.ftGas.htmlText = "";
         this.ftGas.width = 120;
         this.ftGas.textColor = StaticValue.WHITE;
         addChild(this.ftGas);
         this.chk = new FCheckBox();
         this.chk.x = 128;
         this.chk.y = 75;
         this.chk.text = LanResManager.getLanCommonTextWords("使用【唤醒精粹】");
         this.chk.textColor = StaticValue.ORANGE;
         this.btnOk = new SecondButton();
         this.btnOk.x = 105;
         this.btnOk.y = 95 - 10;
         this.btnOk.label = LanResManager.getLanCommonTextWords("确定唤醒");
         addChild(this.btnOk);
         this.btnOk.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.o.jc = this.chk.selectState;
         this.$parent.dispatchEvent(new BaseEvent(XiangQianTianFuPanel.UI_HUANXINGTIANFU_CLICK,"",this.o));
         this.onClose();
      }
      
      public function setData(param1:int, param2:int, param3:Object) : void
      {
         this.ftCopper.htmlText = String(param1);
         this.ftGas.htmlText = String(param2);
         this.o = param3;
      }
   }
}

