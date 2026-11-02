package com.tgame.common.utils
{
   import com.zcp.loader.DobjLoadManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class BlitFace extends Bitmap
   {
      
      private var _bitmapDataList:Vector.<BitmapData>;
      
      private var _currentFrame:int;
      
      private var _totalFrame:int;
      
      private var _delay:int;
      
      private var _repeat:int;
      
      private var _preTime:int;
      
      private var _nowTime:int;
      
      private var _dTime:int;
      
      private var _playCount:int;
      
      private var _running:Boolean = true;
      
      private var _mcUrl:String;
      
      private var _loadMcComplete:Function;
      
      public function BlitFace()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      }
      
      public function get blit_running() : Boolean
      {
         return this._running;
      }
      
      public function blit_start() : void
      {
         if(!this._running)
         {
            this._running = true;
            if(this.stage)
            {
               this.onAddToStage(null);
            }
         }
      }
      
      public function blit_stop() : void
      {
         if(this._running)
         {
            if(this.stage)
            {
               this.onRemoveFromStage(null);
            }
            this._running = false;
         }
      }
      
      public function blit_clear() : void
      {
         bitmapData = null;
         this._bitmapDataList = null;
         this._currentFrame = 0;
         this._totalFrame = 0;
         this._delay = 0;
         this._repeat = 0;
         this._preTime = 0;
         this._nowTime = 0;
         this._dTime = 0;
         this._playCount = 0;
         if(this._mcUrl != null)
         {
            DobjLoadManager.cancelLoadByUrlAndUrlCallBack(this._mcUrl,this._loadMcComplete);
         }
         this._mcUrl = null;
         this._loadMcComplete = null;
      }
      
      public function blit_fromBitmapDataList(param1:Vector.<BitmapData>, param2:int, param3:int = 0) : void
      {
         this.blit_clear();
         this._bitmapDataList = param1;
         this._delay = param2;
         this._repeat = param3;
         this._totalFrame = this._bitmapDataList.length;
      }
      
      public function blit_fromMovieClip(param1:MovieClip, param2:int, param3:int = 0) : void
      {
         var _loc7_:BitmapData = null;
         this.blit_clear();
         var _loc4_:Vector.<BitmapData> = new Vector.<BitmapData>();
         var _loc5_:int = param1.totalFrames;
         var _loc6_:int = 1;
         while(_loc6_ <= _loc5_)
         {
            param1.gotoAndStop(_loc6_);
            _loc7_ = new BitmapData(param1.width,param1.height,true,0);
            _loc7_.draw(param1);
            _loc4_.push(_loc7_);
            _loc6_++;
         }
         this.blit_fromBitmapDataList(_loc4_,param2,param3);
      }
      
      public function blit_fromLoadMovieClip(param1:String, param2:int, param3:int = 0, param4:Function = null) : void
      {
         this.blit_clear();
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         if(this._running)
         {
            this.addEventListener(Event.ENTER_FRAME,this.enterFrame);
         }
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         this.removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
         if(this._running)
         {
            this.removeEventListener(Event.ENTER_FRAME,this.enterFrame);
         }
      }
      
      private function enterFrame(param1:Event) : void
      {
         if(this._totalFrame > 0)
         {
            this._nowTime = getTimer();
            this._dTime = this._nowTime - this._preTime;
            if(this._dTime >= this._delay)
            {
               if(this._currentFrame == this._totalFrame)
               {
                  ++this._playCount;
                  if(!(this._repeat == 0 || this._playCount < this._repeat))
                  {
                     this.blit_clear();
                     return;
                  }
                  this._currentFrame = 0;
               }
               ++this._currentFrame;
               bitmapData = this._bitmapDataList[this._currentFrame - 1];
               this._preTime = this._nowTime;
            }
         }
      }
      
      public function getListLength() : int
      {
         var _loc1_:int = 0;
         if(this._bitmapDataList)
         {
            _loc1_ = int(this._bitmapDataList.length);
         }
         return _loc1_;
      }
      
      public function setCurrentFram(param1:int) : void
      {
         this._currentFrame = param1;
      }
   }
}

