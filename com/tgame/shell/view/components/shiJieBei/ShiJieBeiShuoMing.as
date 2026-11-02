package com.tgame.shell.view.components.shiJieBei
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.tgame.common.GameConfig;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class ShiJieBeiShuoMing extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var bgImg:DisplayObject;
      
      public function ShiJieBeiShuoMing()
      {
         var _loc1_:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 607;
         this.bgCanvas.height = 503;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 607;
         _loc1_.height = 430;
         addChild(_loc1_);
         this.bgImg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/shuoming1.swf");
         this.bgImg.x = 0;
         this.bgImg.y = 0;
         addChild(this.bgImg);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

