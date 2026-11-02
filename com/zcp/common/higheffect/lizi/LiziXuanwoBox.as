package com.zcp.common.higheffect.lizi
{
   import com.zcp.common.utils.Fun;
   import flash.display.*;
   import flash.events.Event;
   import flash.filters.BlurFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class LiziXuanwoBox extends Sprite
   {
      
      private static const DENS:Number = 1 / 12000;
      
      private static const step_r:Number = 0.997;
      
      private static const step_an:Number = -0.016;
      
      private var _showArea:Rectangle;
      
      private var _xuanwoCenter:Point;
      
      private var _xuanwoWidth:Number;
      
      private var _xuanwoHeight:Number;
      
      private var max_r1:Number;
      
      private var max_r:Number;
      
      private var min_r:Number;
      
      private var min_r1:Number;
      
      private var y_scale:Number;
      
      private var _shaArr:Array;
      
      private var _eachSnowCount:Number = 1;
      
      private var _waitAddSnowCount:Number;
      
      private var toBig_matrix:Matrix;
      
      private var toBig_ct:ColorTransform;
      
      private var drawShape_matrix:Matrix;
      
      private var drawShape_ct:ColorTransform;
      
      private var bf:BlurFilter;
      
      private var alpha_shape:Shape;
      
      private var alpha_matrix:Matrix;
      
      private var _drawBMP:Bitmap;
      
      private var _drawBD:BitmapData;
      
      private var _isRunning:Boolean = false;
      
      public function LiziXuanwoBox(param1:Rectangle, param2:Point, param3:Number = 1000, param4:Number = 580, param5:Number = 100, param6:Number = 50, param7:Boolean = true)
      {
         super();
         this.blendMode = BlendMode.LAYER;
         this.alpha_shape = new Shape();
         this.alpha_shape.blendMode = BlendMode.ALPHA;
         this.addChild(this.alpha_shape);
         this.setShowArea(param1);
         this.setDrawArea(param2,param3,param4,param5,param6);
         this._shaArr = [];
         this._waitAddSnowCount = 0;
         if(param7)
         {
            this.start();
         }
      }
      
      public function get isRunning() : Boolean
      {
         return this._isRunning;
      }
      
      public function setShowArea(param1:Rectangle) : void
      {
         this._showArea = param1.clone();
         this.graphics.clear();
         this.graphics.beginFill(0,1);
         this.graphics.drawRect(this._showArea.x,this._showArea.y,this._showArea.width,this._showArea.height);
         this.graphics.endFill();
      }
      
      private function setDrawArea(param1:Point, param2:Number = 1000, param3:Number = 580, param4:Number = 150, param5:Number = 80) : void
      {
         this._xuanwoWidth = param2;
         this._xuanwoHeight = param3;
         this.min_r1 = param4;
         this._xuanwoCenter = param1.clone();
         this.y_scale = this._xuanwoHeight / this._xuanwoWidth;
         this.max_r1 = Math.max(this._xuanwoWidth / 2,this._xuanwoHeight / 2);
         this.max_r = this.max_r1 - param5;
         this.min_r = this.min_r1 + param5;
         if(this.min_r1 + param5 * 2 >= this.max_r1)
         {
            throw Error("最小半径 与 双过度 之和 应小于最大半径!");
         }
         this._eachSnowCount = this.max_r1 * DENS;
         this.toBig_matrix = new Matrix();
         var _loc6_:int = this._xuanwoWidth / 10000;
         var _loc7_:int = this._xuanwoHeight / (10000 * this.y_scale);
         this.toBig_matrix.a = (this._xuanwoWidth + _loc6_) / this._xuanwoWidth;
         this.toBig_matrix.d = (this._xuanwoHeight + _loc7_) / this._xuanwoHeight;
         this.toBig_matrix.tx = -_loc6_ / 2;
         this.toBig_matrix.ty = -_loc7_ / 2;
         this.toBig_ct = new ColorTransform(0.999,0.999,0.999);
         this.drawShape_matrix = new Matrix(1,0,0,1,this._xuanwoWidth / 2,this._xuanwoHeight / 2);
         this.drawShape_ct = new ColorTransform(1,1,1,1);
         this.bf = new BlurFilter(2,2,1);
         var _loc8_:Number = this.min_r1;
         var _loc9_:Matrix = new Matrix();
         _loc9_.createGradientBox(_loc8_ * 2,_loc8_ * 2,0,-_loc8_,-_loc8_);
         this.alpha_shape.graphics.clear();
         this.alpha_shape.graphics.beginGradientFill(GradientType.RADIAL,[0,0],[0,1],[0,255],_loc9_,SpreadMethod.PAD,InterpolationMethod.RGB);
         this.alpha_shape.graphics.drawCircle(0,0,_loc8_);
         this.alpha_shape.graphics.endFill();
         if(this.y_scale <= 1)
         {
            this.alpha_shape.height *= this.y_scale;
            this.alpha_shape.x = this._xuanwoCenter.x;
            this.alpha_shape.y = this._xuanwoCenter.y;
         }
         else
         {
            this.alpha_shape.width /= this.y_scale;
            this.alpha_shape.x = this._xuanwoCenter.x;
            this.alpha_shape.y = this._xuanwoCenter.y;
         }
      }
      
      public function start() : void
      {
         if(this._drawBMP == null)
         {
            this._drawBD = new BitmapData(this._xuanwoWidth,this._xuanwoHeight,false,0);
            this._drawBMP = new Bitmap(this._drawBD);
            this._drawBMP.x = this._xuanwoCenter.x - this._xuanwoWidth / 2;
            this._drawBMP.y = this._xuanwoCenter.y - this._xuanwoHeight / 2;
            addChildAt(this._drawBMP,0);
         }
         addEventListener(Event.ENTER_FRAME,this.loop);
         this._isRunning = true;
      }
      
      public function stop(param1:Boolean) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.loop);
         if(param1)
         {
            Fun.clearChildren(this,true);
            this._drawBD = null;
            this._drawBMP = null;
         }
         this._isRunning = false;
         this._shaArr = [];
         this._waitAddSnowCount = 0;
      }
      
      private function getELuojian(param1:Number, param2:Number) : Point
      {
         var _loc3_:Point = new Point();
         _loc3_.x = param1 * Math.cos(param2);
         _loc3_.y = param1 * Math.sin(param2);
         return _loc3_;
      }
      
      private function loop(param1:Event) : void
      {
         var _loc3_:* = 0;
         var _loc5_:Shape = null;
         var _loc6_:Array = null;
         var _loc7_:Number = NaN;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         this._waitAddSnowCount += this._eachSnowCount;
         while(this._waitAddSnowCount >= 1)
         {
            _loc5_ = new Shape();
            _loc5_.graphics.beginFill(Math.random() * 16777215,1);
            _loc5_.graphics.drawCircle(0,0,8 * Math.max(Math.random(),0.6));
            _loc5_.graphics.endFill();
            this._shaArr.push([_loc5_,this.max_r1,2 * Math.PI * Math.random()]);
            --this._waitAddSnowCount;
         }
         var _loc2_:BitmapData = this._drawBD.clone();
         this._drawBD.draw(_loc2_,this.toBig_matrix,this.toBig_ct,null,null,true);
         var _loc4_:int = int(this._shaArr.length);
         _loc3_ = int(_loc4_ - 1);
         while(_loc3_ >= 0)
         {
            _loc6_ = this._shaArr[_loc3_];
            _loc5_ = _loc6_[0];
            _loc6_[1] *= step_r;
            _loc6_[2] += step_an;
            _loc7_ = -step_an * _loc6_[1] / this.max_r1;
            _loc8_ = this.getELuojian(_loc6_[1],_loc6_[2] + _loc7_);
            _loc9_ = Point.distance(new Point(this._xuanwoCenter.x + _loc8_.x,this._xuanwoCenter.y + _loc8_.y),this._xuanwoCenter);
            if(_loc9_ > this.min_r1)
            {
               if(this.y_scale <= 1)
               {
                  this.drawShape_matrix.tx = this._xuanwoWidth / 2 + _loc8_.x;
                  this.drawShape_matrix.ty = this._xuanwoHeight / 2 + _loc8_.y * this.y_scale;
               }
               else
               {
                  this.drawShape_matrix.tx = this._xuanwoWidth / 2 + _loc8_.x * (1 / this.y_scale);
                  this.drawShape_matrix.ty = this._xuanwoHeight / 2 + _loc8_.y;
               }
               if(_loc9_ > this.max_r)
               {
                  this.drawShape_ct.alphaMultiplier = (this.max_r1 - _loc9_) / (this.max_r1 - this.max_r);
               }
               else if(_loc9_ > this.min_r)
               {
                  this.drawShape_ct.alphaMultiplier = 1;
               }
               else
               {
                  this.drawShape_ct.alphaMultiplier = 1 - (this.min_r - _loc9_) / (this.min_r - this.min_r1);
               }
               this._drawBD.draw(_loc5_,this.drawShape_matrix,this.drawShape_ct,null,null,true);
            }
            else
            {
               this._shaArr.splice(_loc3_,1);
            }
            _loc3_--;
         }
         this._drawBD.applyFilter(this._drawBD,this._drawBD.rect,new Point(0,0),this.bf);
      }
   }
}

