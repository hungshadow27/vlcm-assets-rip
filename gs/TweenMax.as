package gs
{
   import flash.events.*;
   import flash.utils.*;
   import gs.core.tween.*;
   import gs.events.TweenEvent;
   import gs.plugins.*;
   
   public class TweenMax extends TweenLite implements IEventDispatcher
   {
      
      private static var _pauseAllTime:Number;
      
      public static const version:Number = 11.07;
      
      private static var _activatedPlugins:Boolean = TweenPlugin.activate([TintPlugin,RemoveTintPlugin,FramePlugin,AutoAlphaPlugin,VisiblePlugin,VolumePlugin,EndArrayPlugin,HexColorsPlugin,BlurFilterPlugin,ColorMatrixFilterPlugin,BevelFilterPlugin,DropShadowFilterPlugin,GlowFilterPlugin,RoundPropsPlugin,BezierPlugin,BezierThroughPlugin,ShortRotationPlugin]);
      
      private static var _overwriteMode:int = OverwriteManager.enabled ? OverwriteManager.mode : OverwriteManager.init();
      
      public static var killTweensOf:Function = TweenLite.killTweensOf;
      
      public static var killDelayedCallsTo:Function = TweenLite.killTweensOf;
      
      public static var removeTween:Function = TweenLite.removeTween;
      
      protected var _reversed:Boolean;
      
      public var yoyo:Boolean;
      
      protected var _repeat:int;
      
      protected var _dispatcher:EventDispatcher;
      
      protected var _hasUpdateListener:Boolean;
      
      protected var _pauseTime:Number;
      
      protected var _repeatDelay:Number;
      
      public function TweenMax(param1:Object, param2:Number, param3:Object)
      {
         super(param1,param2,param3);
         if(TweenLite.version < 11.07)
         {
            trace("TweenMax error! Please update your TweenLite class or try deleting your ASO files. TweenMax requires a more recent version. Download updates at http://www.TweenMax.com.");
         }
         if(!isNaN(this.vars.yoyo) || this.vars.loop != undefined)
         {
            trace("WARNING: Your tween uses the old \'yoyo\' or \'loop\' syntax which technically still works for now but has been deprecated in favor of the new, more flexible \'repeat\' and \'yoyo\' usage. See http://www.TweenMax.com for details.");
         }
         if(this.vars.yoyo != undefined && this.vars.yoyo != false)
         {
            this.yoyo = true;
         }
         _repeat = this.vars.loop != undefined ? (this.vars.loop == 0 ? -1 : int(Number(this.vars.loop))) : (typeof this.vars.yoyo == "number" ? int(this.vars.yoyo) : int(this.vars.repeat)) || 0;
         _repeatDelay = Number(this.vars.repeatDelay) || 0;
         this.cacheIsDirty = true;
         if(this.vars.onCompleteListener != null || this.vars.onUpdateListener != null || this.vars.onStartListener != null)
         {
            initDispatcher();
            if(param2 == 0 && this.delay == 0)
            {
               _dispatcher.dispatchEvent(new TweenEvent(TweenEvent.UPDATE));
               _dispatcher.dispatchEvent(new TweenEvent(TweenEvent.COMPLETE));
            }
         }
      }
      
      public static function set globalTimeScale(param1:Number) : void
      {
         TweenLite.rootFramesTimeline.cachedTimeScale = TweenLite.rootTimeline.cachedTimeScale = param1;
      }
      
      public static function pauseAll(param1:Boolean = true, param2:Boolean = false) : void
      {
         changePause(true,param1,param2);
      }
      
      public static function getTweensOf(param1:Object) : Array
      {
         var _loc4_:* = 0;
         var _loc2_:Array = masterList[param1];
         var _loc3_:Array = [];
         if(_loc2_ != null)
         {
            _loc4_ = int(_loc2_.length - 1);
            while(_loc4_ > -1)
            {
               if(!_loc2_[_loc4_].gc)
               {
                  _loc3_[_loc3_.length] = _loc2_[_loc4_];
               }
               _loc4_--;
            }
         }
         return _loc3_;
      }
      
      public static function killAllDelayedCalls(param1:Boolean = false) : void
      {
         killAll(param1,false,true);
      }
      
      public static function get globalTimeScale() : Number
      {
         return TweenLite.rootTimeline.cachedTimeScale;
      }
      
      public static function delayedCall(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenMax
      {
         return new TweenMax(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function isTweening(param1:Object) : Boolean
      {
         var _loc3_:* = 0;
         var _loc2_:Array = getTweensOf(param1);
         _loc3_ = int(_loc2_.length - 1);
         while(_loc3_ > -1)
         {
            if((Boolean(_loc2_[_loc3_].active) || Boolean(_loc2_[_loc3_].startTime == _loc2_[_loc3_].cachedTime)) && !_loc2_[_loc3_].gc)
            {
               return true;
            }
            _loc3_--;
         }
         return false;
      }
      
      public static function killAll(param1:Boolean = false, param2:Boolean = true, param3:Boolean = true) : void
      {
         var _loc5_:Boolean = false;
         var _loc6_:* = 0;
         var _loc4_:Array = getAllTweens();
         _loc6_ = int(_loc4_.length - 1);
         while(_loc6_ > -1)
         {
            _loc5_ = _loc4_[_loc6_].target == _loc4_[_loc6_].vars.onComplete;
            if(_loc5_ == param3 || _loc5_ != param2)
            {
               if(param1)
               {
                  _loc4_[_loc6_].complete(false);
               }
               else
               {
                  TweenLite.removeTween(_loc4_[_loc6_]);
               }
            }
            _loc6_--;
         }
      }
      
      public static function changePause(param1:Boolean, param2:Boolean = true, param3:Boolean = false) : void
      {
         var _loc5_:* = 0;
         var _loc6_:Boolean = false;
         var _loc4_:Array = getAllTweens();
         _loc5_ = int(_loc4_.length - 1);
         while(_loc5_ > -1)
         {
            _loc6_ = _loc4_[_loc5_].target == _loc4_[_loc5_].vars.onComplete;
            if(_loc4_[_loc5_] is TweenMax && (_loc6_ == param3 || _loc6_ != param2))
            {
               (_loc4_[_loc5_] as TweenMax).paused = param1;
            }
            _loc5_--;
         }
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : TweenMax
      {
         param3.runBackwards = true;
         if(param3.renderOnStart != true)
         {
            param3.forceImmediateRender = true;
         }
         return new TweenMax(param1,param2,param3);
      }
      
      public static function killAllTweens(param1:Boolean = false) : void
      {
         killAll(param1,true,false);
      }
      
      public static function getAllTweens() : Array
      {
         var _loc3_:Array = null;
         var _loc4_:* = 0;
         var _loc1_:Dictionary = masterList;
         var _loc2_:Array = [];
         for each(_loc3_ in _loc1_)
         {
            _loc4_ = int(_loc3_.length - 1);
            while(_loc4_ > -1)
            {
               if(!_loc3_[_loc4_].gc)
               {
                  _loc2_[_loc2_.length] = _loc3_[_loc4_];
               }
               _loc4_--;
            }
         }
         return _loc2_;
      }
      
      public static function resumeAll(param1:Boolean = true, param2:Boolean = false) : void
      {
         changePause(false,param1,param2);
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenMax
      {
         return new TweenMax(param1,param2,param3);
      }
      
      override public function renderTime(param1:Number) : void
      {
         var _loc3_:Tweenable = null;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc2_:Number = this.cacheIsDirty ? this.totalDuration : this.cachedTotalDuration;
         var _loc4_:Number = this.cachedTime;
         if(param1 >= _loc2_)
         {
            if(_reversed)
            {
               this.cachedTotalTime = this.cachedTime = _loc6_ = 0;
            }
            else
            {
               this.cachedTotalTime = _loc2_;
               this.cachedTime = this.cachedDuration;
               _loc6_ = 1;
            }
            _loc5_ = true;
         }
         else if(param1 <= 0)
         {
            if(param1 < 0)
            {
               this.active = false;
            }
            if(_reversed)
            {
               this.cachedTotalTime = _loc2_;
               this.cachedTime = this.cachedDuration;
               _loc6_ = 1;
               _loc5_ = true;
            }
            else
            {
               this.cachedTotalTime = this.cachedTime = _loc6_ = 0;
            }
         }
         else
         {
            this.cachedTotalTime = this.cachedTime = _reversed ? _loc2_ - param1 : param1;
            if(_repeat == 0)
            {
               _loc6_ = this.ease(this.cachedTime,0,1,this.cachedDuration);
            }
         }
         if(_repeat != 0)
         {
            _loc8_ = this.cachedDuration + _repeatDelay;
            this.cachedTime = this.yoyo && this.cachedTotalTime / _loc8_ % 2 >= 1 || !this.yoyo && !(this.cachedTotalTime / _loc8_ % 1) ? this.cachedDuration - this.cachedTotalTime % _loc8_ : this.cachedTotalTime % _loc8_;
            if(this.cachedTime >= this.cachedDuration)
            {
               this.cachedTime = this.cachedDuration;
               _loc6_ = 1;
            }
            else if(this.cachedTime <= 0)
            {
               this.cachedTime = _loc6_ = 0;
            }
            else
            {
               _loc6_ = this.ease(this.cachedTime,0,1,this.cachedDuration);
            }
         }
         if(!this.initted)
         {
            init();
            if(!this.cachedPaused)
            {
               this.active = true;
            }
            if(this.vars.onStart != null)
            {
               this.vars.onStart.apply(null,this.vars.onStartParams);
            }
            if(_dispatcher != null)
            {
               _dispatcher.dispatchEvent(new TweenEvent(TweenEvent.START));
            }
         }
         else if(_loc4_ == this.cachedTime)
         {
            return;
         }
         var _loc7_:PropTween = _firstPropTween;
         while(_loc7_ != null)
         {
            _loc7_.target[_loc7_.property] = _loc7_.start + _loc6_ * _loc7_.change;
            _loc7_ = _loc7_.nextNode;
         }
         if(_hasUpdate)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(_hasUpdateListener)
         {
            _dispatcher.dispatchEvent(new TweenEvent(TweenEvent.UPDATE));
         }
         if(_loc5_)
         {
            if(!_reversed)
            {
               complete(true);
            }
            else if(_dispatcher != null)
            {
               _dispatcher.dispatchEvent(new TweenEvent(TweenEvent.REVERSE_COMPLETE));
            }
         }
      }
      
      public function set reversed(param1:Boolean) : void
      {
         if(param1 != _reversed)
         {
            reverse(true);
         }
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return _dispatcher == null ? false : _dispatcher.willTrigger(param1);
      }
      
      public function restart(param1:Boolean = false) : void
      {
         this.totalTime = param1 ? -_delay : 0;
         this.paused = false;
      }
      
      override protected function init() : void
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:PropTween = null;
         if(this.vars.startAt != null)
         {
            this.vars.startAt.overwrite = 0;
            new TweenMax(this.target,0,this.vars.startAt);
         }
         super.init();
         if(this.vars.roundProps is Array && TweenLite.plugins.roundProps != null)
         {
            _loc5_ = this.vars.roundProps;
            _loc1_ = int(_loc5_.length - 1);
            while(_loc1_ > -1)
            {
               _loc3_ = _loc5_[_loc1_];
               _loc7_ = this._firstPropTween;
               while(_loc7_ != null)
               {
                  if(_loc7_.name == _loc3_)
                  {
                     if(_loc7_.isPlugin)
                     {
                        _loc7_.target.round = true;
                     }
                     else if(_loc6_ == null)
                     {
                        _loc6_ = new TweenLite.plugins.roundProps();
                        _loc6_.add(_loc7_.target,_loc3_,_loc7_.start,_loc7_.change);
                        _hasPlugins = true;
                        this._firstPropTween = insertPropTween(_loc6_,"changeFactor",0,1,"_MULTIPLE_",true,this._firstPropTween);
                     }
                     else
                     {
                        _loc6_.add(_loc7_.target,_loc3_,_loc7_.start,_loc7_.change);
                        this.removePropTween(_loc7_);
                     }
                  }
                  else if(_loc7_.isPlugin && _loc7_.name == "_MULTIPLE_" && !_loc7_.target.round)
                  {
                     _loc4_ = " " + _loc7_.target.overwriteProps.join(" ") + " ";
                     if(_loc4_.indexOf(" " + _loc3_ + " ") != -1)
                     {
                        _loc7_.target.round = true;
                     }
                  }
                  _loc7_ = _loc7_.nextNode;
               }
               _loc1_--;
            }
         }
      }
      
      public function get totalProgress() : Number
      {
         return _reversed ? 1 - this.cachedTotalTime / this.totalDuration : this.cachedTotalTime / this.totalDuration;
      }
      
      protected function adjustStartValues() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:PropTween = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc1_:Number = this.progress;
         if(_loc1_ != 0)
         {
            _loc2_ = this.ease(_loc1_,0,1,1);
            _loc3_ = 1 / (1 - _loc2_);
            _loc4_ = _firstPropTween;
            while(_loc4_ != null)
            {
               _loc5_ = _loc4_.start + _loc4_.change;
               if(_loc4_.isPlugin)
               {
                  _loc4_.change = (_loc5_ - _loc2_) * _loc3_;
               }
               else
               {
                  _loc4_.change = (_loc5_ - _loc4_.target[_loc4_.property]) * _loc3_;
               }
               _loc4_.start = _loc5_ - _loc4_.change;
               _loc4_ = _loc4_.nextNode;
            }
         }
      }
      
      public function set time(param1:Number) : void
      {
         this.totalTime = param1;
      }
      
      override public function set delay(param1:Number) : void
      {
         super.delay = param1;
         setDirtyCache(true);
      }
      
      public function set totalProgress(param1:Number) : void
      {
         this.totalTime = _reversed ? (1 - param1) * this.totalDuration : this.totalDuration * param1;
      }
      
      override public function set duration(param1:Number) : void
      {
         this.timeScale = this.duration / param1;
      }
      
      public function resume() : void
      {
         this.paused = false;
      }
      
      public function get paused() : Boolean
      {
         return this.cachedPaused;
      }
      
      public function killProperties(param1:Array) : void
      {
         var _loc3_:* = 0;
         var _loc2_:Object = {};
         _loc3_ = int(param1.length - 1);
         while(_loc3_ > -1)
         {
            _loc2_[param1[_loc3_]] = true;
            _loc3_--;
         }
         killVars(_loc2_);
      }
      
      public function get progress() : Number
      {
         return _reversed ? 1 - this.cachedTime / this.duration : this.cachedTime / this.duration;
      }
      
      public function get totalTime() : Number
      {
         return this.cachedTotalTime;
      }
      
      override public function complete(param1:Boolean = false) : void
      {
         super.complete(param1);
         if(_dispatcher != null)
         {
            _dispatcher.dispatchEvent(new TweenEvent(TweenEvent.COMPLETE));
         }
      }
      
      public function invalidate(param1:Boolean = true) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:PropTween = null;
         if(this.initted)
         {
            _loc2_ = this.totalProgress;
            if(!param1)
            {
               if(this.vars.runBackwards == true)
               {
                  _loc4_ = _firstPropTween;
                  while(_loc4_ != null)
                  {
                     _loc4_.start += _loc4_.change;
                     _loc4_.change = -_loc4_.change;
                     _loc4_ = _loc4_.nextNode;
                  }
               }
               this.totalProgress = 0;
            }
            _firstPropTween = null;
            _hasPlugins = _hasUpdate = _hasUpdateListener = false;
            init();
            this.cachedTimeScale = Number(this.vars.timeScale) || 1;
            _loc3_ = !isNaN(this.vars.delay) ? this.vars.delay - _delay : -_delay;
            _delay = Number(this.vars.delay) || 0;
            this.startTime += _loc3_;
            setDirtyCache(true);
            if(this.vars.onCompleteListener != null || this.vars.onUpdateListener != null || this.vars.onStartListener != null)
            {
               _dispatcher = null;
               initDispatcher();
            }
            if(_loc2_ != 0)
            {
               if(param1)
               {
                  adjustStartValues();
               }
               else
               {
                  this.totalProgress = _loc2_;
               }
            }
         }
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return _dispatcher == null ? false : _dispatcher.dispatchEvent(param1);
      }
      
      public function get reversed() : Boolean
      {
         return _reversed;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(_dispatcher != null)
         {
            _dispatcher.removeEventListener(param1,param2,param3);
         }
      }
      
      public function setDestination(param1:String, param2:*, param3:Boolean = true) : void
      {
         var _loc4_:Object = {};
         _loc4_[param1] = param2;
         updateProperties(_loc4_,param3);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(_dispatcher == null)
         {
            initDispatcher();
         }
         if(param1 == TweenEvent.UPDATE)
         {
            _hasUpdateListener = true;
         }
         _dispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      protected function initDispatcher() : void
      {
         if(_dispatcher == null)
         {
            _dispatcher = new EventDispatcher(this);
            if(this.vars.onStartListener is Function)
            {
               _dispatcher.addEventListener(TweenEvent.START,this.vars.onStartListener,false,0,true);
            }
            if(this.vars.onUpdateListener is Function)
            {
               _dispatcher.addEventListener(TweenEvent.UPDATE,this.vars.onUpdateListener,false,0,true);
               _hasUpdateListener = true;
            }
            if(this.vars.onCompleteListener is Function)
            {
               _dispatcher.addEventListener(TweenEvent.COMPLETE,this.vars.onCompleteListener,false,0,true);
            }
         }
      }
      
      protected function setDirtyCache(param1:Boolean = true) : void
      {
         var _loc2_:Tweenable = param1 ? this : this.timeline;
         while(_loc2_ != null)
         {
            _loc2_.cacheIsDirty = true;
            _loc2_ = _loc2_.timeline;
         }
      }
      
      public function set progress(param1:Number) : void
      {
         this.totalTime = _reversed ? (1 - param1) * this.duration : this.duration * param1;
      }
      
      protected function updateProperties(param1:Object, param2:Boolean = true) : void
      {
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc3_:PropTween = _firstPropTween;
         var _loc4_:Number = this.cachedTotalTime;
         if(this.initted)
         {
            if(!param2)
            {
               this.time = 0;
            }
            killVars(param1);
            for(_loc5_ in param1)
            {
               if(!(_loc5_ in _reservedProps))
               {
                  if(_loc5_ in plugins)
                  {
                     _loc6_ = new plugins[_loc5_]();
                     if(_loc6_.onInitTween(this.target,param1[_loc5_],this) == false)
                     {
                        _firstPropTween = insertPropTween(this.target,_loc5_,this.target[_loc5_],param1[_loc5_],_loc5_,false,_firstPropTween);
                     }
                     else
                     {
                        _firstPropTween = insertPropTween(_loc6_,"changeFactor",0,1,_loc6_.overwriteProps.length == 1 ? _loc6_.overwriteProps[0] : "_MULTIPLE_",true,_firstPropTween);
                        _hasPlugins = true;
                     }
                  }
                  else
                  {
                     _firstPropTween = insertPropTween(this.target,_loc5_,this.target[_loc5_],param1[_loc5_],_loc5_,false,_firstPropTween);
                  }
               }
               this.vars[_loc5_] = param1[_loc5_];
            }
            if(param2 && this.cachedTotalTime != 0)
            {
               adjustStartValues();
               this.time = _loc4_;
            }
         }
         else
         {
            for(_loc5_ in param1)
            {
               this.vars[_loc5_] = param1[_loc5_];
            }
         }
      }
      
      public function set totalTime(param1:Number) : void
      {
         this.startTime = this.timeline.cachedTotalTime - param1 / this.cachedTimeScale;
         renderTime(param1);
         setDirtyCache(false);
         this.enabled = true;
      }
      
      public function set paused(param1:Boolean) : void
      {
         if(param1 != this.cachedPaused)
         {
            if(!param1)
            {
               this.startTime = this.timeline.cachedTotalTime - this.totalProgress * this.totalDuration / this.cachedTimeScale;
            }
            setDirtyCache(false);
            this.cachedPaused = param1;
            this.active = Boolean(!this.cachedPaused && this.cachedTotalTime > 0 && this.cachedTotalTime < this.cachedTotalDuration);
         }
         if(!param1 && this.gc)
         {
            this.enabled = true;
         }
      }
      
      public function get time() : Number
      {
         return this.cachedTime;
      }
      
      public function reverse(param1:Boolean = true) : void
      {
         this.startTime = this.timeline.cachedTotalTime - (1 - this.progress) * this.totalDuration / this.cachedTimeScale;
         _reversed = !_reversed;
         setDirtyCache(false);
         if(param1)
         {
            this.paused = false;
            if(this.progress == 1)
            {
               this.time = 0;
            }
         }
         else
         {
            this.enabled = true;
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return _dispatcher == null ? false : _dispatcher.hasEventListener(param1);
      }
      
      public function pause() : void
      {
         this.paused = true;
      }
      
      override public function set totalDuration(param1:Number) : void
      {
         this.timeScale = this.totalDuration / param1;
      }
      
      override public function get totalDuration() : Number
      {
         if(this.cacheIsDirty)
         {
            this.cachedTotalDuration = _repeat == -1 ? Infinity : this.cachedDuration * (_repeat + 1) + _repeatDelay * _repeat;
            this.cacheIsDirty = false;
         }
         return this.cachedTotalDuration;
      }
      
      public function set timeScale(param1:Number) : void
      {
         this.startTime = this.cachedTotalTime - (this.cachedTotalTime - this.startTime) * this.cachedTimeScale / param1;
         this.cachedTimeScale = param1;
      }
      
      public function get timeScale() : Number
      {
         return this.cachedTimeScale;
      }
   }
}

