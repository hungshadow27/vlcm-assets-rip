package com.fireice.util
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   
   public class FScaleBox extends Sprite
   {
      
      public static const FSCALEBOX_BOX_MOVE:String = "FSCALEBOX_BOX_MOVE";
      
      private var _dragEnable:Boolean = true;
      
      private var _scaleEnable:Boolean = true;
      
      private var _is8dot:Boolean = true;
      
      private var _boxWidth:Number;
      
      private var _boxHeight:Number;
      
      private var changeW:int;
      
      private var changeH:int;
      
      private var isMove:Boolean = false;
      
      private var lockX:Number;
      
      private var lockY:Number;
      
      private var bottomRightX:Number;
      
      private var bottomRightY:Number;
      
      private var dotList:Array = [];
      
      private var _dragRect:Rectangle;
      
      private var _ratio:Number = 0;
      
      private var hitSprite:Sprite;
      
      public function FScaleBox()
      {
         super();
         this.initUI();
         mouseEnabled = false;
         this.addMouseCursorHandler();
         addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownHandler);
         this.is8dot = this.is8dot;
         this.resize(this.boxWidth,this.boxHeight);
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         var _loc6_:Dot = null;
         if(isNaN(param1) || isNaN(param2))
         {
            return;
         }
         if(param1 < 1 || param2 < 1)
         {
            return;
         }
         if(x < 0)
         {
            this.x = 0;
            return;
         }
         if(y < 0)
         {
            this.y = 0;
            return;
         }
         if(param1 > this.dragRect.width - x)
         {
            param1 = this.dragRect.width - x;
         }
         if(param2 > this._dragRect.height - y)
         {
            param2 = this._dragRect.height - y;
         }
         if(this._ratio > 0)
         {
            if(param1 - this._boxWidth > param2 - this._boxHeight)
            {
               param2 = param1 / this._ratio;
            }
            else
            {
               param1 = param2 * this._ratio;
            }
         }
         this._boxWidth = param1;
         this._boxHeight = param2;
         this.bottomRightX = x + param1;
         this.bottomRightY = y + param2;
         var _loc3_:Number = param1 * 0.5;
         var _loc4_:Number = param2 * 0.5;
         var _loc5_:int = 0;
         while(_loc5_ < 8)
         {
            _loc6_ = this.dotList[_loc5_];
            _loc6_.x = _loc3_ * _loc6_.lx;
            _loc6_.y = _loc4_ * _loc6_.ly;
            _loc5_++;
         }
         this.graphics.clear();
         this.graphics.lineStyle(1);
         this.graphics.drawRect(0,0,param1,param2);
         this.graphics.endFill();
         this.hitSprite.width = param1;
         this.hitSprite.height = param2;
         dispatchEvent(new Event(Event.RESIZE));
      }
      
      public function get boxWidth() : Number
      {
         return this._boxWidth;
      }
      
      public function set boxWidth(param1:Number) : void
      {
         this.resize(param1,this._boxHeight);
      }
      
      public function get boxHeight() : Number
      {
         return this._boxHeight;
      }
      
      public function set boxHeight(param1:Number) : void
      {
         this.resize(this._boxWidth,param1);
      }
      
      public function set dragRect(param1:Rectangle) : void
      {
         this._dragRect = param1;
      }
      
      public function get dragRect() : Rectangle
      {
         if(!this._dragRect)
         {
            this._dragRect = new Rectangle(0,0,100,100);
         }
         return this._dragRect;
      }
      
      override public function set x(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         super.x = param1;
         this.bottomRightX = param1 + this._boxWidth;
         dispatchEvent(new Event(FSCALEBOX_BOX_MOVE));
      }
      
      override public function set y(param1:Number) : void
      {
         if(isNaN(param1))
         {
            return;
         }
         super.y = param1;
         this.bottomRightY = param1 + this._boxHeight;
         dispatchEvent(new Event(FSCALEBOX_BOX_MOVE));
      }
      
      public function get is8dot() : Boolean
      {
         return this._is8dot;
      }
      
      public function set is8dot(param1:Boolean) : void
      {
         if(this._scaleEnable && this._is8dot != param1)
         {
            this._is8dot = param1;
            this.dotList[1].visible = param1;
            this.dotList[3].visible = param1;
            this.dotList[5].visible = param1;
            this.dotList[7].visible = param1;
         }
      }
      
      public function get scaleEnable() : Boolean
      {
         return this._scaleEnable;
      }
      
      public function set scaleEnable(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         if(this._scaleEnable != param1)
         {
            this._scaleEnable = param1;
            for each(_loc2_ in this.dotList)
            {
               _loc2_.visible = param1;
            }
            if(param1 && !this.is8dot)
            {
               this._is8dot = !param1;
               this.is8dot = param1;
            }
         }
      }
      
      public function set ratio(param1:Number) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._ratio = param1;
      }
      
      public function get ratio() : Number
      {
         return this._ratio;
      }
      
      public function get dragEnable() : Boolean
      {
         return this._dragEnable;
      }
      
      public function set dragEnable(param1:Boolean) : void
      {
         if(this._dragEnable != param1)
         {
            this._dragEnable = param1;
            if(param1)
            {
               addChildAt(this.hitSprite,0);
            }
            else
            {
               removeChild(this.hitSprite);
            }
         }
      }
      
      private function mouseOverHandler(param1:MouseEvent) : void
      {
         if(param1.target is Dot)
         {
            Mouse.cursor = MouseCursor.BUTTON;
         }
         else
         {
            Mouse.cursor = MouseCursor.HAND;
         }
      }
      
      private function rollOutHandler(param1:MouseEvent) : void
      {
         Mouse.cursor = MouseCursor.AUTO;
      }
      
      private function mouseDownHandler(param1:MouseEvent) : void
      {
         var _loc2_:Dot = null;
         if(param1.target is Dot)
         {
            this.isMove = false;
            _loc2_ = param1.target as Dot;
            this.changeW = _loc2_.lx - 1;
            this.changeH = _loc2_.ly - 1;
         }
         else
         {
            this.isMove = true;
            this.lockX = mouseX;
            this.lockY = mouseY;
         }
         this.removeMouseCursorHandler();
         stage.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
      }
      
      private function mouseUpHandler(param1:MouseEvent) : void
      {
         stopDrag();
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpHandler);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.mouseMoveHandler);
         this.addMouseCursorHandler();
      }
      
      private function mouseMoveHandler(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         if(this.isMove)
         {
            startDrag(false,new Rectangle(0,0,this.dragRect.width - this.boxWidth,this.dragRect.height - this.boxHeight));
         }
         else
         {
            stopDrag();
            _loc4_ = x;
            _loc5_ = y;
            if(this.changeW < 0)
            {
               _loc4_ = mouseX + _loc4_;
            }
            else if(this.changeW > 0)
            {
               this.bottomRightX = mouseX + _loc4_;
            }
            if(this.changeH < 0)
            {
               _loc5_ = mouseY + _loc5_;
            }
            else if(this.changeH > 0)
            {
               this.bottomRightY = mouseY + _loc5_;
            }
            _loc2_ = this.bottomRightX - _loc4_;
            _loc3_ = this.bottomRightY - _loc5_;
            if(_loc2_ < 8 || _loc3_ < 8)
            {
               return;
            }
            super.x = _loc4_;
            super.y = _loc5_;
            this.resize(_loc2_,_loc3_);
         }
         dispatchEvent(new Event(FSCALEBOX_BOX_MOVE));
      }
      
      private function addMouseCursorHandler() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.mouseOverHandler);
         addEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
      }
      
      private function removeMouseCursorHandler() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.mouseOverHandler);
         removeEventListener(MouseEvent.ROLL_OUT,this.rollOutHandler);
      }
      
      private function initUI() : void
      {
         var _loc2_:Dot = null;
         this.hitSprite = new Sprite();
         this.hitSprite.graphics.beginFill(0,0);
         this.hitSprite.graphics.drawRect(0,0,10,10);
         this.hitSprite.graphics.endFill();
         addChild(this.hitSprite);
         var _loc1_:int = 0;
         while(_loc1_ < 8)
         {
            _loc2_ = new Dot();
            addChild(_loc2_);
            this.dotList.push(_loc2_);
            _loc2_.lx = _loc1_ % 3;
            _loc2_.ly = _loc1_ / 3;
            if(4 == _loc1_)
            {
               _loc2_.lx = 2;
               _loc2_.ly = 2;
            }
            _loc1_++;
         }
      }
   }
}

import flash.display.Sprite;

class Dot extends Sprite
{
   
   public var lx:int;
   
   public var ly:int;
   
   public function Dot()
   {
      super();
      graphics.lineStyle(2,16777215);
      graphics.beginFill(0);
      graphics.drawRect(-3,-3,6,6);
      graphics.endFill();
      cacheAsBitmap = true;
   }
}
