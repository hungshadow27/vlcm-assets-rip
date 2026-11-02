package com.tgame.shell.view.components.BossRefurbish
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class KuafuLunjianGuizeChaxunCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var bgImg:DisplayObject;
      
      public function KuafuLunjianGuizeChaxunCanvas()
      {
         var _loc1_:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 665;
         this.bgCanvas.height = 430;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 665;
         _loc1_.height = 430;
         addChild(_loc1_);
         this.bgImg = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/kuaFuHelpBg.jpg",647,407);
         this.bgImg.x = 9;
         this.bgImg.y = 12;
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

