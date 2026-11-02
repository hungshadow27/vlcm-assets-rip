package com.tgame.shell.view.components
{
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ZhongZhiXuanYuanJianPanel extends FPanel
   {
      
      public static const UI_ZHONGZHIJIAN_QUEREN:String = "UI_ZHONGZHIJIAN_QUEREN";
      
      private var okBtn:SecondButton;
      
      private var quxiaoBtn:SecondButton;
      
      private var BYTE:int = 0;
      
      public var check1:FCheckBox;
      
      public var check2:FCheckBox;
      
      public var check3:FCheckBox;
      
      public function ZhongZhiXuanYuanJianPanel()
      {
         var _loc1_:FTextArea = null;
         super();
         skin = "panel_btn";
         width = 360 - 105;
         height = 190 + 35;
         showCloseButton = true;
         dragAble = true;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 230;
         _loc1_.height = 110;
         _loc1_.x = 20;
         _loc1_.y = 10;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("您可以将佩剑放置在以下位置：") + "</font>";
         addChild(_loc1_);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 230;
         _loc1_.height = 110;
         _loc1_.x = 20;
         _loc1_.y = 10 + 20;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("坐标1：襄阳城（289，57）") + "</font>";
         addChild(_loc1_);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 230;
         _loc1_.height = 110;
         _loc1_.x = 20;
         _loc1_.y = 10 + 20 + 40;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("坐标2：襄阳城（282，64）") + "</font>";
         addChild(_loc1_);
         _loc1_ = new FTextArea();
         _loc1_.multiline = true;
         _loc1_.filters = StaticValue.filter;
         _loc1_.width = 230;
         _loc1_.height = 110;
         _loc1_.x = 20;
         _loc1_.y = 10 + 20 + 80;
         _loc1_.textColor = StaticValue.ORANGE;
         _loc1_.htmlText = "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("坐标3：襄阳城（294，63）") + "</font>";
         addChild(_loc1_);
         this.check1 = new FCheckBox();
         addChild(this.check1);
         this.check1.x = 220;
         this.check1.y = 30;
         this.check1.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.check2 = new FCheckBox();
         addChild(this.check2);
         this.check2.x = 220;
         this.check2.y = 70;
         this.check2.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.check3 = new FCheckBox();
         addChild(this.check3);
         this.check3.x = 220;
         this.check3.y = 110;
         this.check3.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 100;
         this.okBtn.y = 120 + 35;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onCreate);
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.check1:
               if(this.check1.selectState)
               {
                  this.check2.selectState = false;
                  this.check3.selectState = false;
               }
               this.BYTE = 1;
               break;
            case this.check2:
               if(this.check2.selectState)
               {
                  this.check3.selectState = false;
                  this.check1.selectState = false;
               }
               this.BYTE = 2;
               break;
            case this.check3:
               if(this.check3.selectState)
               {
                  this.check2.selectState = false;
                  this.check1.selectState = false;
               }
               this.BYTE = 3;
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onCreate(param1:Event) : void
      {
         switch(param1.target)
         {
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_ZHONGZHIJIAN_QUEREN,"",this.BYTE));
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
         this.check1.selectState = false;
         this.check2.selectState = false;
         this.check3.selectState = false;
      }
   }
}

