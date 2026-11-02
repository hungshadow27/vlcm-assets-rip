package com.fireice.util
{
   import com.fireice.init.SkinInit;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Rectangle;
   
   public class F9GridBitmap extends Shape
   {
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _originalWidth:int = 1;
      
      private var _skin:*;
      
      private var className:String;
      
      private var _bmpScale9Grid:Scale9GridDrawer;
      
      private var _bdGetFun:Function;
      
      public function F9GridBitmap(param1:* = null)
      {
         var _loc2_:XML = null;
         super();
         this._skin = param1;
         if(!this._skin)
         {
            return;
         }
         if(Tools.getBD != null)
         {
            this._bdGetFun = Tools.getBD;
         }
         else
         {
            this._bdGetFun = FBitmapDataBufferManager.getBD;
         }
         if(param1 is XML)
         {
            _loc2_ = param1;
         }
         else
         {
            _loc2_ = SkinInit.getSkinConfigByName(param1).backgroundImage[0];
         }
         this.className = String(_loc2_.@name);
         var _loc3_:Rectangle = new Rectangle(_loc2_.@x,_loc2_.@y,_loc2_.@width,_loc2_.@height);
         if(!this.validGrid(_loc3_))
         {
            throw new Error("九宫格尺寸与图片不匹配 name = " + this.className);
         }
         this._bmpScale9Grid = new Scale9GridDrawer(this._bdGetFun(this.className),_loc3_);
         this._originalWidth = this._width = this._bmpScale9Grid.bitmapData.width;
         this._height = this._bmpScale9Grid.bitmapData.height;
         this.resizeBitmap(this._bmpScale9Grid.bitmapData.width,this._bmpScale9Grid.bitmapData.height);
      }
      
      private function validGrid(param1:Rectangle) : Boolean
      {
         return param1.right <= (this._bdGetFun(this.className) as BitmapData).width && param1.bottom <= (this._bdGetFun(this.className) as BitmapData).height;
      }
      
      private function resizeBitmap(param1:Number, param2:Number) : void
      {
         if(!this._skin)
         {
            this.graphics.clear();
            this.graphics.beginFill(0);
            this.graphics.drawRect(0,0,10,10);
            this.graphics.endFill();
            return;
         }
         this._bmpScale9Grid.setSize(param1,param2);
         this._bmpScale9Grid.draw(this.graphics);
      }
      
      override public function set width(param1:Number) : void
      {
         if(param1 != this._width && param1 > 0)
         {
            this._width = param1;
            this.setSize(param1,height);
         }
      }
      
      override public function set height(param1:Number) : void
      {
         if(param1 != this._height && param1 > 0)
         {
            this._height = param1;
            this.setSize(width,param1);
         }
      }
      
      override public function set scaleX(param1:Number) : void
      {
         var _loc2_:int = this._originalWidth * param1;
         _loc2_ = _loc2_ < 1 ? 1 : _loc2_;
         this.resizeBitmap(_loc2_,height);
      }
      
      public function setSize(param1:Number, param2:Number) : void
      {
         if(!this._skin)
         {
            this.resizeBitmap(param1,param2);
            return;
         }
         var _loc3_:BitmapData = this._bdGetFun(this.className) as BitmapData;
         param1 = Math.max(param1,_loc3_.width - this._bmpScale9Grid.scale9Grid.width);
         param2 = Math.max(param2,_loc3_.height - this._bmpScale9Grid.scale9Grid.height);
         this.resizeBitmap(param1,param2);
      }
      
      public function set originalBitmap(param1:BitmapData) : void
      {
         this._bmpScale9Grid.bitmapData = param1;
         this.resizeBitmap(this._bmpScale9Grid.bitmapData.width,this._bmpScale9Grid.bitmapData.height);
      }
      
      public function get originalBitmap() : BitmapData
      {
         return this._bmpScale9Grid.bitmapData;
      }
      
      public function clone() : F9GridBitmap
      {
         return new F9GridBitmap(this._skin);
      }
   }
}

