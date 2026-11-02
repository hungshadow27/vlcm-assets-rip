package com.fireice.util
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class Scale9GridDrawer
   {
      
      private static const _defaultBitmapData_:BitmapData = new BitmapData(10,10,false,16777215);
      
      private var _bitmapdata:BitmapData;
      
      private var _scale9Grid:Rectangle;
      
      private var _drawRect:Rectangle = new Rectangle();
      
      private var _cutRect:Rectangle;
      
      private var _scale9GridRect:Array;
      
      public function Scale9GridDrawer(param1:BitmapData = null, param2:Rectangle = null, param3:Rectangle = null)
      {
         super();
         this._bitmapdata = param1 || _defaultBitmapData_;
         this._scale9Grid = param2 || new Rectangle(80,30,121,340);
         this._drawRect = param3 || new Rectangle();
         this.updataCutRectangle();
      }
      
      public function set x(param1:int) : void
      {
         this._drawRect.x = param1;
         this.updataCutRectangle();
      }
      
      public function set y(param1:int) : void
      {
         this._drawRect.y = param1;
         this.updataCutRectangle();
      }
      
      public function setPos(param1:int, param2:int) : void
      {
         this._drawRect.x = param1;
         this._drawRect.y = param2;
         this.updataCutRectangle();
      }
      
      public function set width(param1:Number) : void
      {
         this._drawRect.width = param1;
         this.updataCutRectangle();
      }
      
      public function set height(param1:Number) : void
      {
         this._drawRect.height = param1;
         this.updataCutRectangle();
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this._drawRect.width = param1;
         this._drawRect.height = param2;
         this.updataCutRectangle();
      }
      
      public function set drawRect(param1:Rectangle) : void
      {
         this._drawRect = param1;
         this.updataCutRectangle();
      }
      
      public function get drawRect() : Rectangle
      {
         return new Rectangle(this._drawRect.x,this._drawRect.y,this._drawRect.width,this._drawRect.height);
      }
      
      public function set scale9Grid(param1:Rectangle) : void
      {
         this._scale9Grid = param1;
         this.updataCutRectangle();
      }
      
      public function get scale9Grid() : Rectangle
      {
         return this._scale9Grid;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         this._bitmapdata = param1;
         this.updataCutRectangle();
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapdata;
      }
      
      public function draw(param1:Graphics, param2:Boolean = true) : void
      {
         var _loc4_:Rectangle = null;
         var _loc5_:Matrix = null;
         param1.clear();
         var _loc3_:int = 0;
         while(_loc3_ < 9)
         {
            _loc4_ = this._scale9GridRect[_loc3_].rect;
            _loc5_ = this._scale9GridRect[_loc3_].matrix;
            param1.beginBitmapFill(this._bitmapdata,_loc5_,false,false);
            if(_loc3_ != 4 || param2)
            {
               param1.drawRect(_loc4_.x + this._drawRect.x,_loc4_.y + this._drawRect.y,_loc4_.width,_loc4_.height);
            }
            _loc3_++;
         }
      }
      
      private function updataCutRectangle() : void
      {
         var _loc13_:int = 0;
         var _loc14_:Matrix = null;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         if(this._bitmapdata == null || this._bitmapdata.width == 0 || this._bitmapdata.height == 0)
         {
            return;
         }
         var _loc1_:Rectangle = this._bitmapdata.rect;
         var _loc2_:int = this._drawRect.width - this._scale9Grid.x - (_loc1_.right - this._scale9Grid.right);
         var _loc3_:int = this._drawRect.height - this._scale9Grid.y - (_loc1_.bottom - this._scale9Grid.bottom);
         if(_loc2_ < 0)
         {
            _loc2_ = 0;
         }
         if(_loc3_ < 0)
         {
            _loc3_ = 0;
         }
         this._cutRect = new Rectangle(this._scale9Grid.x,this._scale9Grid.y,_loc2_,_loc3_);
         var _loc4_:Vector.<int> = new <int>[0,this._scale9Grid.x,this._scale9Grid.right];
         var _loc5_:Vector.<int> = new <int>[0,this._scale9Grid.y,this._scale9Grid.bottom];
         var _loc6_:Vector.<int> = new <int>[this._scale9Grid.x,this._scale9Grid.width,_loc1_.right - this._scale9Grid.right];
         var _loc7_:Vector.<int> = new <int>[this._scale9Grid.y,this._scale9Grid.height,_loc1_.bottom - this._scale9Grid.bottom];
         var _loc8_:Vector.<int> = new <int>[0,this._cutRect.x,this._cutRect.right];
         var _loc9_:Vector.<int> = new <int>[0,this._cutRect.y,this._cutRect.bottom];
         var _loc10_:Vector.<int> = new <int>[this._cutRect.x,this._cutRect.width,_loc1_.right - this._scale9Grid.right];
         var _loc11_:Vector.<int> = new <int>[this._cutRect.y,this._cutRect.height,_loc1_.bottom - this._scale9Grid.bottom];
         this._scale9GridRect = new Array();
         var _loc12_:int = 0;
         while(_loc12_ < 3)
         {
            _loc13_ = 0;
            while(_loc13_ < 3)
            {
               _loc14_ = new Matrix();
               _loc15_ = _loc10_[_loc12_] / _loc6_[_loc12_];
               _loc16_ = _loc11_[_loc13_] / _loc7_[_loc13_];
               _loc14_.scale(_loc15_,_loc16_);
               _loc14_.tx = _loc8_[_loc12_] - _loc4_[_loc12_] + this._drawRect.x;
               _loc14_.ty = _loc9_[_loc13_] - _loc5_[_loc13_] + this._drawRect.y;
               if(_loc12_ == 1)
               {
                  _loc14_.tx = (1 - _loc15_) * _loc8_[1] + this._drawRect.x;
               }
               if(_loc13_ == 1)
               {
                  _loc14_.ty = (1 - _loc16_) * _loc9_[1] + this._drawRect.y;
               }
               this._scale9GridRect.push({
                  "rect":new Rectangle(_loc8_[_loc12_],_loc9_[_loc13_],_loc10_[_loc12_],_loc11_[_loc13_]),
                  "matrix":_loc14_
               });
               _loc13_++;
            }
            _loc12_++;
         }
      }
   }
}

