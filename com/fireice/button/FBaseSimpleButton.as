package com.fireice.button
{
   import com.fireice.base.FUIComponent;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.*;
   import flash.utils.Timer;
   
   public class FBaseSimpleButton extends FUIComponent
   {
      
      private var _up:F9GridBitmap;
      
      private var _over:F9GridBitmap;
      
      private var _down:F9GridBitmap;
      
      private var _swap:F9GridBitmap;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _enabled:Boolean;
      
      private var timer:Timer;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function FBaseSimpleButton(param1:F9GridBitmap, param2:F9GridBitmap, param3:F9GridBitmap)
      {
         var $up:F9GridBitmap = param1;
         var $over:F9GridBitmap = param2;
         var $down:F9GridBitmap = param3;
         super();
         buttonMode = true;
         mouseChildren = false;
         this._up = $up == null ? new F9GridBitmap() : $up;
         this._over = $over == null ? new F9GridBitmap() : $over;
         this._over.visible = false;
         this._down = $down == null ? new F9GridBitmap() : $down;
         this._down.visible = false;
         addChild(this._up);
         with(this._up)
         {
            graphics.beginFill(9079434,1);
            graphics.drawRect(0,0,15,15);
            graphics.endFill();
         }
         addChild(this._over);
         with(this._over)
         {
            graphics.beginFill(13619151,1);
            graphics.drawRect(0,0,15,15);
            graphics.endFill();
         }
         addChild(this._down);
         with(this._down)
         {
            graphics.beginFill(4868682,1);
            graphics.drawRect(0,0,15,15);
            graphics.endFill();
         }
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouse);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouse);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "toolTip";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            text = "";
         }
         this.tipCanvas.addChild(this.tip);
      }
      
      private function showTip() : void
      {
         if(this.tip.text == "")
         {
            return;
         }
         Tools.currentStage.addChild(this.tipCanvas);
         var _loc1_:Point = new Point(this.x,this.y);
         _loc1_ = this.parent.localToGlobal(_loc1_);
         if(_loc1_.x + this.width + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = _loc1_.x - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = _loc1_.x + this.width + 10;
         }
         if(_loc1_.y + this.height + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = _loc1_.y - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = _loc1_.y + this.height + 10;
         }
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         this._up.width = param1;
         this._over.width = param1;
         this._down.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         this._up.height = param1;
         this._over.height = param1;
         this._down.height = param1;
      }
      
      public function set toolTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
         if(param1)
         {
            filters = [];
            mouseEnabled = true;
         }
         else
         {
            filters = Tools.blackWhiteFilter;
            mouseEnabled = false;
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this._up.visible = false;
               this._over.visible = true;
               this._down.visible = false;
               this.showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               this._up.visible = true;
               this._over.visible = false;
               this._down.visible = false;
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_UP:
               this._up.visible = true;
               this._over.visible = false;
               this._down.visible = false;
               break;
            case MouseEvent.MOUSE_DOWN:
               this._up.visible = false;
               this._over.visible = false;
               this._down.visible = true;
         }
      }
      
      public function coruscateStart() : void
      {
         if(this.timer != null)
         {
            return;
         }
         this.timer = new Timer(500);
         this.timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer.start();
      }
      
      public function coruscateStop() : void
      {
         if(!this.timer)
         {
            return;
         }
         this.timer.stop();
         this.timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
         this.timer = null;
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         if(filters.length == 0)
         {
            filters = Tools.invertFilter;
         }
         else
         {
            filters = [];
         }
      }
      
      public function get up() : F9GridBitmap
      {
         return this._up;
      }
      
      public function set up(param1:F9GridBitmap) : void
      {
         removeChild(this._up);
         this._up = param1;
         addChildAt(this._up,0);
         this._up.width = this._width;
         this._up.height = this._height;
      }
      
      public function get over() : F9GridBitmap
      {
         return this._over.clone();
      }
      
      public function set over(param1:F9GridBitmap) : void
      {
         removeChild(this._over);
         this._over = param1;
         addChildAt(this._over,0);
         this._over.visible = false;
         this._over.width = this._width;
         this._over.height = this._height;
      }
      
      public function get down() : F9GridBitmap
      {
         return this._down.clone();
      }
      
      public function set down(param1:F9GridBitmap) : void
      {
         removeChild(this._down);
         this._down = param1;
         addChildAt(this._down,0);
         this._down.visible = false;
         this._down.width = this._width;
         this._down.height = this._height;
      }
      
      public function set swap(param1:F9GridBitmap) : void
      {
         this._swap = param1;
      }
      
      public function get swap() : F9GridBitmap
      {
         return this._swap.clone();
      }
      
      public function set skin(param1:String) : void
      {
      }
      
      public function get skin() : String
      {
         return "";
      }
      
      public function clone() : Object
      {
         var _loc1_:FBaseSimpleButton = new FBaseSimpleButton(null,null,null);
         _loc1_.up = (this._up as F9GridBitmap).clone();
         _loc1_.over = (this._over as F9GridBitmap).clone();
         _loc1_.down = (this._down as F9GridBitmap).clone();
         return _loc1_;
      }
   }
}

