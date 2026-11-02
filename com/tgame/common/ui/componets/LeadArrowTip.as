package com.tgame.common.ui.componets
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class LeadArrowTip extends Sprite
   {
      
      private static var arrowTip:LeadArrowTip;
      
      private var container:FCanvas;
      
      private var tip:FTextArea;
      
      private var arrow:MovieClip;
      
      private var closeBtn:FSimpleButton;
      
      public function LeadArrowTip()
      {
         super();
         this.container = new FCanvas();
         this.container.skin = "menuBg";
         addChild(this.container);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 10;
            y = 20;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
         }
         addChild(this.tip);
         this.arrow = StaticValue.getMCByClassName("ui.arrowhead") as MovieClip;
         addChild(this.arrow);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      public static function showTip(param1:DisplayObject, param2:String, param3:Number, param4:Number, param5:int = -1, param6:int = -1) : LeadArrowTip
      {
         arrowTip = new LeadArrowTip();
         param1.parent.addChild(arrowTip);
         arrowTip.x = param3;
         arrowTip.y = param4;
         arrowTip.setTips(param2,param5,param6);
         return arrowTip;
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this.close();
      }
      
      private function setTips(param1:String, param2:Number, param3:Number) : void
      {
         this.tip.htmlText = param1;
         this.resize();
         var _loc4_:Number = param2 - x;
         var _loc5_:Number = param3 - y;
         this.arrow.visible = true;
         if(_loc5_ < 0)
         {
            this.arrow.rotation = 180;
            this.arrow.x = _loc4_;
            this.arrow.y = _loc5_ + this.arrow.height / 2;
         }
         else if(_loc5_ > this.container.height)
         {
            this.arrow.rotation = 0;
            this.arrow.x = _loc4_;
            this.arrow.y = _loc5_ - this.arrow.height / 2;
         }
         else if(_loc5_ >= 0 && _loc5_ <= this.container.height && _loc4_ < 0)
         {
            this.arrow.rotation = 90;
            this.arrow.x = _loc4_ + this.arrow.width / 2;
            this.arrow.y = _loc5_;
         }
         else if(_loc5_ >= 0 && _loc5_ <= this.container.height && _loc4_ > this.container.width)
         {
            this.arrow.rotation = -90;
            this.arrow.x = _loc4_ - this.arrow.width / 2;
            this.arrow.y = _loc5_;
         }
         else
         {
            this.arrow.visible = false;
         }
      }
      
      private function resize() : void
      {
         this.container.width = this.tip.width + 20;
         this.container.height = this.tip.height + 30;
         this.closeBtn.x = this.container.width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
      }
      
      public function close() : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

