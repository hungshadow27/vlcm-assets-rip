package com.zcp.common.higheffect.snow
{
   import com.zcp.common.pool.Pool;
   import com.zcp.common.utils.ZMath;
   import com.zcp.manager.PoolManager;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class SnowBox extends Sprite
   {
      
      private static var snowFacePool:Pool = PoolManager.creatPool("snowFacePool",100);
      
      public static const SNOW_COMPLETE:String = "SNOW_COMPLETE";
      
      private static const MARGIN:Number = 50;
      
      private static const MIN_X_STEP:Number = 0;
      
      private static const MAX_X_STEP:Number = 1;
      
      private static var MIN_Y_STEP:Number = 1;
      
      private static var MAX_Y_STEP:Number = 5;
      
      private static const DENS:Number = 1 / 3000;
      
      private var _showArea:Rectangle;
      
      private var _snowBDArr:Array;
      
      private var _eachSnowCount:Number = 1;
      
      private var _waitAddSnowCount:Number = 0;
      
      private var _isRunning:Boolean = false;
      
      private var _areaTop:Number;
      
      private var _areaLeft:Number;
      
      private var _areaWidth:Number;
      
      private var _areaHeight:Number;
      
      private var _areaBottom:Number;
      
      private var _areaRight:Number;
      
      public function SnowBox(param1:Rectangle, param2:Array = null, param3:Boolean = true)
      {
         super();
         mouseEnabled = mouseChildren = false;
         this.setShowArea(param1);
         this._snowBDArr = param2 || [];
         if(param3)
         {
            this.start();
         }
      }
      
      private static function createSnowFace(param1:BitmapData) : SnowFace
      {
         return snowFacePool.createObj(SnowFace,param1) as SnowFace;
      }
      
      private static function recycleSnowFace(param1:SnowFace) : void
      {
         snowFacePool.disposeObj(param1);
      }
      
      public function get isRunning() : Boolean
      {
         return this._isRunning;
      }
      
      public function setShowArea(param1:Rectangle) : void
      {
         var _loc3_:SnowFace = null;
         this._showArea = param1.clone();
         this._areaLeft = this._showArea.x - MARGIN;
         this._areaTop = this._showArea.y - MARGIN;
         this._areaWidth = this._showArea.width + MARGIN;
         this._areaHeight = this._showArea.height + MARGIN;
         this._areaRight = this._showArea.right;
         this._areaBottom = this._showArea.bottom;
         this._eachSnowCount = this._areaWidth * DENS;
         var _loc2_:* = int(numChildren - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = getChildAt(_loc2_) as SnowFace;
            _loc3_.setScope(this._areaLeft,this._areaRight,this._areaBottom);
            _loc2_--;
         }
      }
      
      public function start(param1:Boolean = false) : void
      {
         if(param1)
         {
            while(numChildren > 0)
            {
               removeChildAt(0);
            }
         }
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this._isRunning = true;
      }
      
      public function stop(param1:Boolean = false, param2:Boolean = false) : void
      {
         if(param1)
         {
            while(numChildren > 0)
            {
               removeChildAt(0);
            }
         }
         if(param2)
         {
            snowFacePool.removeAllObjs();
         }
         if(numChildren == 0)
         {
            this.stopEnterFrame();
         }
         this._isRunning = false;
      }
      
      private function stopEnterFrame() : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         dispatchEvent(new Event(SNOW_COMPLETE));
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc3_:SnowFace = null;
         if(this._isRunning)
         {
            this._waitAddSnowCount += this._eachSnowCount;
            while(this._waitAddSnowCount >= 1)
            {
               this.creatNewSnow();
               --this._waitAddSnowCount;
            }
         }
         var _loc2_:* = int(numChildren - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = getChildAt(_loc2_) as SnowFace;
            if(_loc3_.update())
            {
               removeChild(_loc3_);
               recycleSnowFace(_loc3_);
               if(!this._isRunning && numChildren == 0)
               {
                  this.stopEnterFrame();
               }
            }
            _loc2_--;
         }
      }
      
      private function creatNewSnow() : void
      {
         var _loc1_:BitmapData = null;
         if(this._snowBDArr.length > 0)
         {
            _loc1_ = this._snowBDArr[ZMath.getRandomNumber(0,this._snowBDArr.length - 1)] as BitmapData;
         }
         var _loc2_:SnowFace = createSnowFace(_loc1_);
         var _loc3_:Number = Math.random();
         _loc2_.setXY(this._areaLeft + Math.random() * this._areaWidth,this._areaTop);
         var _loc4_:Number = MIN_X_STEP + (MAX_X_STEP - MIN_X_STEP) * _loc3_;
         if(Math.random() > 0.5)
         {
            _loc4_ *= -1;
         }
         var _loc5_:Number = MIN_Y_STEP + (MAX_Y_STEP - MIN_Y_STEP) * _loc3_;
         _loc2_.setStep(_loc4_,_loc5_);
         _loc2_.setScope(this._areaLeft,this._areaRight,this._areaBottom);
         addChild(_loc2_);
      }
      
      public function setStepY(param1:int, param2:int) : void
      {
         if(param1 != -1)
         {
            MIN_Y_STEP = param1;
         }
         if(param2 != -1)
         {
            MAX_Y_STEP = param2;
         }
      }
   }
}

import com.zcp.common.pool.IPoolClass;
import flash.display.Bitmap;
import flash.display.BitmapData;

class SnowFace extends Bitmap implements IPoolClass
{
   
   private var _x_step:Number;
   
   private var _y_step:Number;
   
   private var _left:Number;
   
   private var _right:Number;
   
   private var _bottom:Number;
   
   public function SnowFace(param1:BitmapData = null)
   {
      super(null,"auto",false);
      this.reSet([param1]);
   }
   
   public function dispose() : void
   {
      bitmapData = null;
   }
   
   public function reSet(param1:Array) : void
   {
      bitmapData = param1[0];
   }
   
   internal function setXY(param1:Number, param2:Number) : void
   {
      x = param1;
      y = param2;
   }
   
   internal function setStep(param1:Number, param2:Number) : void
   {
      this._x_step = param1;
      this._y_step = param2;
   }
   
   internal function setScope(param1:Number, param2:Number, param3:Number) : void
   {
      this._left = param1;
      this._right = param2;
      this._bottom = param3;
   }
   
   internal function update() : Boolean
   {
      x += this._x_step;
      y += this._y_step;
      if(x < this._left || x > this._right || y > this._bottom)
      {
         return true;
      }
      return false;
   }
}
