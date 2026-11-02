package com.tgame.shell.view.components.ride
{
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
   
   public class DianFengShouJiHuoPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var gongXunFta:FTextArea;
      
      private var nowGongXunFta:FTextArea;
      
      private var jiHuoBtn:SecondButton;
      
      private var mountId:int;
      
      public function DianFengShouJiHuoPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         titleText = LanResManager.getLanCommonTextWords("激活巅峰兽");
         skin = "panel_btn";
         width = 360 - 105 + 83;
         height = 190 + 35;
         showCloseButton = true;
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 300;
         _loc1_.height = 30;
         _loc1_.x = 30;
         _loc1_.y = 30;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("你可以使用【卧虎藏龙】功勋值激活巅峰兽") + "</font>";
         addChild(_loc1_);
         this.gongXunFta = new FTextArea();
         this.gongXunFta.x = 30;
         this.gongXunFta.y = 60;
         this.gongXunFta.width = 300;
         this.gongXunFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活所需功勋值：") + "</font>";
         addChild(this.gongXunFta);
         this.nowGongXunFta = new FTextArea();
         this.nowGongXunFta.x = 30;
         this.nowGongXunFta.y = 90;
         this.nowGongXunFta.width = 300;
         this.nowGongXunFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前功勋值：") + "</font>";
         addChild(this.nowGongXunFta);
         this.jiHuoBtn = new SecondButton();
         this.jiHuoBtn.label = LanResManager.getLanCommonTextWords("激活");
         addChild(this.jiHuoBtn);
         this.jiHuoBtn.x = 200;
         this.jiHuoBtn.y = 60;
         this.jiHuoBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.jiHuoBtn:
               this.$parent.dispatchEvent(new BaseEvent(DianFengShouPanel.UI_DIANFENGSHOUPANEL_JIHUO_CLICK,"",[this.mountId,0]));
               this.onClose();
         }
      }
      
      public function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         POPWindowManager.closeWindow();
      }
      
      public function setData(param1:int, param2:int, param3:int) : void
      {
         this.mountId = param1;
         this.gongXunFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("激活所需功勋值：") + param2 + "</font>";
         this.nowGongXunFta.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前功勋值：") + param3 + "</font>";
      }
   }
}

