package com.tgame.shell.view.components.biwuCrossPlatform
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class BiwuDahuiTimeGuizeCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var bg9:F9GridBitmap;
      
      private var titleImg:DisplayObject;
      
      private var canvas:FCanvas;
      
      private var txt_time:FTextArea;
      
      private var tz:Sprite;
      
      public function BiwuDahuiTimeGuizeCanvas()
      {
         var _loc1_:FCanvas = null;
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 330;
         this.bgCanvas.height = 444;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         _loc1_ = new FCanvas();
         _loc1_.skin = "canvas1";
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = 330;
         _loc1_.height = 444;
         addChild(_loc1_);
         this.bg9 = Tools.get9GridBitmpByName("biwuDahui_bg");
         this.bg9.width = 316;
         this.bg9.height = 424;
         addChild(this.bg9);
         this.bg9.x = 7;
         this.bg9.y = 10;
         this.titleImg = StaticValue.getBitmapByClassName("ui.biwuDahui.shijianYaoqiu.txt");
         addChild(this.titleImg);
         this.titleImg.x = width / 2 - this.titleImg.width / 2;
         this.titleImg.y = 20;
         this.canvas = new FCanvas();
         this.canvas.skin = "backGroud";
         this.canvas.width = 309;
         this.canvas.height = 320;
         addChild(this.canvas);
         this.canvas.x = 10;
         this.canvas.y = 88;
         this.txt_time = new FTextArea();
         this.txt_time.textColor = StaticValue.ORANGE;
         this.txt_time.width = 311;
         this.txt_time.height = 385;
         this.txt_time.wordWrap = true;
         this.txt_time.htmlText = "";
         addChild(this.txt_time);
         this.txt_time.x = 12;
         this.txt_time.y = 42;
         this.tz = new Sprite();
         this.tz.graphics.beginFill(0,0);
         this.tz.graphics.drawRect(0,0,234,35);
         this.tz.graphics.endFill();
         this.tz.width = 317;
         this.tz.height = 47;
         this.tz.x = 0;
         this.tz.y = 0;
         this.tz.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDowns);
         addEventListener(MouseEvent.MOUSE_UP,this.mouseReleaseds);
         addChild(this.tz);
         this.closeBtn = new FSimpleButton();
         this.closeBtn.skin = "closeButton";
         addChild(this.closeBtn);
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.closeBtn.y = 2;
         this.closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
      }
      
      private function mouseDowns(param1:MouseEvent) : void
      {
         this.parent.setChildIndex(this,parent.numChildren - 1);
         this.startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this.width,Tools.currentStage.stageHeight - this.height));
      }
      
      private function mouseReleaseds(param1:MouseEvent) : void
      {
         this.stopDrag();
      }
      
      public function onClose(param1:MouseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setTime(param1:String) : void
      {
         this.txt_time.htmlText = "<textformat leading=\'1\'>" + param1 + "</textformat>";
      }
   }
}

