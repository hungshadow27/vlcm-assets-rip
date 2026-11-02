package game.display
{
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class ScaleBitmapData extends Shape
   {
      
      private var _w:Number;
      
      private var _h:Number;
      
      private var s9Grid:Rectangle;
      
      private var _bitmapdata:BitmapData;
      
      private var _scale9GridRect:Array;
      
      private var _scale9Grid:Rectangle;
      
      private var _drawRect:Rectangle;
      
      private var _cutRect:Rectangle;
      
      public function ScaleBitmapData(param1:BitmapData = null, param2:Rectangle = null)
      {
         var $bitmapData:BitmapData = param1;
         var $s9Grid:Rectangle = param2;
         this._drawRect = new Rectangle();
         super();
         addEventListener(Event.ADDED_TO_STAGE,function(param1:Event):void
         {
            if(!(parent is ScaleImage))
            {
               throw new Error("类game.display.ScaleBitmapData只能与ScaleImage配合使用，不能做为单独的显示对象使用 ");
            }
         });
         if(!$bitmapData)
         {
            $bitmapData = new BitmapData(20,20,true,1549556828);
         }
         if(!$s9Grid)
         {
            $s9Grid = new Rectangle(1,1,1,1);
         }
         this._scale9Grid = $s9Grid;
         this._w = $bitmapData.width;
         this._h = $bitmapData.height;
         this._bitmapdata = $bitmapData;
         this._drawRect = new Rectangle(0,0,this._w,this._h);
         this.setSize(this._w,this._h);
      }
      
      override public function set width(param1:Number) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         this._w = param1;
         this.resize();
      }
      
      override public function get width() : Number
      {
         return this._w;
      }
      
      override public function set height(param1:Number) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         this._h = param1;
         this.resize();
      }
      
      override public function get height() : Number
      {
         return this._h;
      }
      
      private function resize() : void
      {
         this.setSize(this._w,this._h);
      }
      
      public function setSize(param1:int, param2:int) : void
      {
         this._drawRect.width = param1;
         this._drawRect.height = param2;
         this.updataCutRectangle();
         this.draw();
      }
      
      private function draw() : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Matrix = null;
         graphics.clear();
         var _loc1_:int = 0;
         while(_loc1_ < 9)
         {
            _loc2_ = this._scale9GridRect[_loc1_].rect;
            _loc3_ = this._scale9GridRect[_loc1_].matrix;
            graphics.beginBitmapFill(this._bitmapdata,_loc3_,true,true);
            graphics.drawRect(_loc2_.x,_loc2_.y,_loc2_.width,_loc2_.height);
            graphics.endFill();
            _loc1_++;
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
         var _loc2_:int = this._drawRect.width - this._scale9Grid.x - (_loc1_.width - this._scale9Grid.right);
         var _loc3_:int = this._drawRect.height - this._scale9Grid.y - (_loc1_.height - this._scale9Grid.bottom);
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
         var _loc6_:Vector.<int> = new <int>[this._scale9Grid.x,this._scale9Grid.width,_loc1_.width - this._scale9Grid.right];
         var _loc7_:Vector.<int> = new <int>[this._scale9Grid.y,this._scale9Grid.height,_loc1_.height - this._scale9Grid.bottom];
         var _loc8_:Vector.<int> = new <int>[0,this._cutRect.x,this._cutRect.right];
         var _loc9_:Vector.<int> = new <int>[0,this._cutRect.y,this._cutRect.bottom];
         var _loc10_:Vector.<int> = new <int>[this._cutRect.x,this._cutRect.width,_loc1_.width - this._scale9Grid.right];
         var _loc11_:Vector.<int> = new <int>[this._cutRect.y,this._cutRect.height,_loc1_.height - this._scale9Grid.bottom];
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
      
      public function dispose() : void
      {
         this._bitmapdata.dispose();
      }
   }
}

