package com.fireice.movie
{
   import com.fireice.util.Tools;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class BitmapMovie extends Bitmap
   {
      
      public var bitmapDatas:Vector.<BitmapData>;
      
      public var frameRate:Number;
      
      private var _enabledTick:Boolean;
      
      private var _currentFrame:int;
      
      private var frameTimer:int;
      
      private var prevTime:int;
      
      public function BitmapMovie(param1:Vector.<BitmapData>, param2:Number)
      {
         super(null);
         this.bitmapDatas = param1;
         this.frameRate = param2;
         this.currentFrame = 0;
         this.randomFrameTimer();
         this.play();
      }
      
      private function randomFrameTimer() : void
      {
         this.frameTimer += Math.random() * 1000 / this.frameRate;
      }
      
      public function get currentFrame() : int
      {
         return this._currentFrame;
      }
      
      public function set currentFrame(param1:int) : void
      {
         if(!this.bitmapDatas)
         {
            return;
         }
         var _loc2_:int = int(this.bitmapDatas.length);
         if(param1 >= _loc2_)
         {
            param1 = _loc2_ - 1;
         }
         this._currentFrame = param1;
         bitmapData = this.bitmapDatas[param1];
      }
      
      public function get totalFrame() : int
      {
         return this.bitmapDatas ? int(this.bitmapDatas.length) : 0;
      }
      
      public function get isPlaying() : Boolean
      {
         return this._enabledTick;
      }
      
      public function play() : void
      {
         if(this._enabledTick)
         {
            return;
         }
         this._enabledTick = true;
         Tools.currentStage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      public function stop() : void
      {
         if(!this._enabledTick)
         {
            return;
         }
         this._enabledTick = false;
         Tools.currentStage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      protected function onEnterFrame(param1:Event) : void
      {
         var _loc2_:int = getTimer();
         if(this.prevTime == 0)
         {
            this.tick(0);
         }
         else
         {
            this.tick(Math.min(_loc2_ - this.prevTime,3000));
         }
         this.prevTime = _loc2_;
      }
      
      private function tick(param1:int) : void
      {
         if(!this.bitmapDatas)
         {
            return;
         }
         this.frameTimer -= param1;
         while(this.frameTimer < 0)
         {
            if(this.currentFrame == this.bitmapDatas.length - 1)
            {
               this.currentFrame = 0;
            }
            else
            {
               ++this.currentFrame;
            }
            this.frameTimer += 1000 / this.frameRate;
         }
      }
      
      public function destory() : void
      {
         this.stop();
         while(this.bitmapDatas.length > 0)
         {
            this.bitmapDatas.shift().dispose();
         }
      }
   }
}

