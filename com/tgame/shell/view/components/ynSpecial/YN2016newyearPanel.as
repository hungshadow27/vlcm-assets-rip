package com.tgame.shell.view.components.ynSpecial
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   
   public class YN2016newyearPanel extends FPanel
   {
      
      public function YN2016newyearPanel()
      {
         super();
         width = 315;
         height = 180;
         dragAble = true;
         showCloseButton = true;
         titleText = LanResManager.getLanCommonTextWords("2016年春节活动介绍");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.init();
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function init() : void
      {
         var _loc1_:FTextArea = null;
         _loc1_ = new FTextArea();
         _loc1_.x = 45;
         _loc1_.y = 5;
         _loc1_.textColor = StaticValue.YELLOW;
         _loc1_.htmlText = LanResManager.getLanCommonTextWords("我是越南2016年春节活动说明面板的描述！黄色字体");
         _loc1_.width = 240;
         _loc1_.height = 130;
         _loc1_.wordWrap = true;
         _loc1_.multiline = true;
         addChild(_loc1_);
         _loc1_ = new FTextArea();
         _loc1_.x = 140;
         _loc1_.y = 115;
         _loc1_.textColor = StaticValue.GREEN;
         _loc1_.htmlText = LanResManager.getLanCommonTextWords("我是越南2016春节活动面板描述！绿色字体");
         _loc1_.width = 165;
         addChild(_loc1_);
      }
   }
}

