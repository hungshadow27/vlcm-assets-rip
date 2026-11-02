package gs.core.tween
{
   import gs.*;
   
   public class Tweenable
   {
      
      protected static var _classInitted:Boolean;
      
      public static const version:Number = 0.1;
      
      public var timeline:SimpleTimeline;
      
      public var initted:Boolean;
      
      protected var _hasUpdate:Boolean;
      
      public var active:Boolean;
      
      protected var _delay:Number;
      
      public var startTime:Number;
      
      public var nextNode:Tweenable;
      
      public var cachedTime:Number;
      
      public var gc:Boolean;
      
      public var cachedDuration:Number;
      
      public var prevNode:Tweenable;
      
      public var cacheIsDirty:Boolean;
      
      public var vars:Object;
      
      public var cachedTotalTime:Number;
      
      public var cachedPaused:Boolean;
      
      public var cachedTotalDuration:Number;
      
      public var data:*;
      
      public var cachedTimeScale:Number;
      
      public function Tweenable(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 || {};
         this.cachedDuration = this.cachedTotalDuration = param1 || 0;
         _delay = Number(this.vars.delay) || 0;
         this.cachedTimeScale = Number(this.vars.timeScale) || 1;
         this.active = Boolean(param1 == 0 && _delay == 0);
         this.cachedTotalTime = this.cachedTime = 0;
         this.data = this.vars.data;
         if(!_classInitted)
         {
            if(!isNaN(TweenLite.rootFrame))
            {
               return;
            }
            TweenLite.initClass();
            _classInitted = true;
         }
         var _loc3_:SimpleTimeline = this.vars.timeline is SimpleTimeline ? this.vars.timeline : (this.vars.useFrames ? TweenLite.rootFramesTimeline : TweenLite.rootTimeline);
         this.startTime = _loc3_.cachedTotalTime + _delay;
         _loc3_.addChild(this);
      }
      
      public function complete(param1:Boolean = false) : void
      {
      }
      
      public function set enabled(param1:Boolean) : void
      {
         var _loc2_:Object = null;
         if(param1 == this.gc)
         {
            if(param1)
            {
               if(this is TweenLite)
               {
                  _loc2_ = (this as TweenLite).target;
                  if(!(_loc2_ in TweenLite.masterList))
                  {
                     TweenLite.masterList[_loc2_] = [this];
                  }
                  else
                  {
                     TweenLite.masterList[_loc2_].push(this);
                  }
               }
               this.timeline.addChild(this);
            }
            else
            {
               this.timeline.remove(this);
            }
         }
      }
      
      public function renderTime(param1:Number) : void
      {
      }
      
      public function get enabled() : Boolean
      {
         return !this.gc;
      }
      
      public function get delay() : Number
      {
         return _delay;
      }
      
      public function get duration() : Number
      {
         return this.cachedDuration;
      }
      
      public function set delay(param1:Number) : void
      {
         this.startTime += param1 - _delay;
         _delay = param1;
      }
      
      public function set totalDuration(param1:Number) : void
      {
         this.duration = param1;
      }
      
      public function set duration(param1:Number) : void
      {
         this.cachedDuration = this.cachedTotalDuration = param1;
      }
      
      public function get totalDuration() : Number
      {
         return this.cachedTotalDuration;
      }
   }
}

