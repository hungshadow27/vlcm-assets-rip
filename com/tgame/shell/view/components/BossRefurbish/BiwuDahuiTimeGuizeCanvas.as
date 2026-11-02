package com.tgame.shell.view.components.BossRefurbish
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
   import flash.text.TextFieldAutoSize;
   
   public class BiwuDahuiTimeGuizeCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var closeBtn:FSimpleButton;
      
      private var bg9:F9GridBitmap;
      
      private var titleImg:DisplayObject;
      
      private var canvas:FCanvas;
      
      private var txt_time:FTextArea;
      
      private var tz:Sprite;
      
      private var fc:FCanvas;
      
      public function BiwuDahuiTimeGuizeCanvas()
      {
         super();
         this.bgCanvas = new FCanvas();
         this.bgCanvas.x = 0;
         this.bgCanvas.y = 0;
         this.bgCanvas.width = 330;
         this.bgCanvas.height = 444 + 80;
         this.bgCanvas.skin = "backGroud";
         addChild(this.bgCanvas);
         this.fc = new FCanvas();
         this.fc.skin = "canvas1";
         this.fc.x = 0;
         this.fc.y = 0;
         this.fc.width = 330;
         this.fc.height = 444 + 80;
         addChild(this.fc);
         this.titleImg = StaticValue.getBitmapByClassName("ui.biwuDahui.shijianYaoqiu.txt");
         addChild(this.titleImg);
         this.titleImg.x = width / 2 - this.titleImg.width / 2;
         this.titleImg.y = 20;
         this.txt_time = new FTextArea();
         this.txt_time.textColor = StaticValue.ORANGE;
         this.txt_time.autoSize = TextFieldAutoSize.LEFT;
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
         this.bgCanvas.width = this.txt_time.x + this.txt_time.width + 20;
         this.fc.width = this.txt_time.x + this.txt_time.width + 20;
         this.closeBtn.x = width - this.closeBtn.width - 2;
         this.titleImg.x = (this.fc.width - this.titleImg.width) / 2;
      }
   }
}

