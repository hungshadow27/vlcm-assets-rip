package com.tgame.shell.view.components.attribute
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class ShenQiPuTiDanTipCanvas extends FCanvas
   {
      
      private var closeBtn:FSimpleButton;
      
      private var tips:FTextArea;
      
      public function ShenQiPuTiDanTipCanvas()
      {
         var _loc1_:FTextArea = null;
         var _loc2_:FTextArea = null;
         var _loc3_:Bitmap = null;
         super();
         skin = "menuBg";
         width = 334;
         _loc1_ = new FTextArea();
         _loc1_.x = 2;
         _loc1_.y = 40;
         _loc1_.autoSize = TextFieldAutoSize.LEFT;
         _loc1_.textColor = StaticValue.YELLOW;
         _loc1_.filters = StaticValue.filter;
         _loc1_.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanTextWords(this,"当您的肉身境界达到阶脱胎换骨境界后您可以使用神奇菩提丹来提升",[StaticValue.BLUE_HTML,StaticValue.GREEN_HTML,StaticValue.YELLOW_HTML,StaticValue.PURPLE_HTML]) + "</textformat>";
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         _loc2_.width = _loc1_.width;
         _loc2_.height = 20;
         _loc2_.x = 2;
         _loc2_.y = 10;
         _loc2_.defaultTextFormat = StaticValue.format;
         _loc2_.textColor = StaticValue.YELLOW;
         _loc2_.filters = StaticValue.filter;
         _loc2_.text = LanResManager.getLanCommonTextWords("神奇菩提丹");
         addChild(_loc2_);
         _loc3_ = StaticValue.getBitmapByClassName("ui.line");
         addChild(_loc3_);
         _loc3_.x = 2;
         _loc3_.y = _loc1_.y + _loc1_.height + 10;
         _loc3_.width = _loc1_.width;
         this.tips = new FTextArea();
         this.tips.width = _loc1_.width;
         this.tips.height = 60;
         this.tips.x = 2;
         this.tips.y = _loc3_.y + 10;
         addChild(this.tips);
         width = _loc3_.width + 4;
         height = this.tips.y + 60 + 2;
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setTipType(param1:int) : void
      {
         switch(param1)
         {
            case 1:
               this.tips.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,"【很抱歉!") + "</font>";
               break;
            case 2:
               this.tips.htmlText = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanTextWords(this,"【很抱歉，您的背包中没有神奇菩提丹】") + "</font>";
               break;
            case 3:
               this.tips.htmlText = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("【肉身境界大于等于4阶，可以使用神奇菩提丹】") + "</font>";
               break;
            default:
               this.tips.htmlText = "";
         }
      }
   }
}

