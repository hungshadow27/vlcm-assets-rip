package gs
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import gs.core.tween.*;
   import gs.plugins.*;
   
   public class TweenLite extends Tweenable
   {
      
      public static var rootTimeline:SimpleTimeline;
      
      public static var rootFramesTimeline:SimpleTimeline;
      
      public static var overwriteManager:Object;
      
      public static var rootFrame:Number;
      
      public static const version:Number = 11.07;
      
      public static var plugins:Object = {};
      
      public static var killDelayedCallsTo:Function = TweenLite.killTweensOf;
      
      public static var defaultEase:Function = TweenLite.easeOut;
      
      public static var masterList:Dictionary = new Dictionary(false);
      
      public static var timingSprite:Sprite = new Sprite();
      
      protected static var _reservedProps:Object = {
         "ease":1,
         "delay":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "useFrames":1,
         "runBackwards":1,
         "startAt":1,
         "onUpdate":1,
         "onUpdateParams":1,
         "roundProps":1,
         "onStart":1,
         "onStartParams":1,
         "renderOnStart":1,
         "proxiedEase":1,
         "easeParams":1,
         "yoyo":1,
         "loop":1,
         "onCompleteListener":1,
         "onUpdateListener":1,
         "onStartListener":1,
         "orientToBezier":1,
         "persist":1,
         "timeScale":1,
         "forceImmediateRender":1,
         "repeat":1,
         "repeatDelay":1,
         "timeline":1,
         "data":1
      };
      
      protected var _hasPlugins:Boolean;
      
      public var propTweenLookup:Object;
      
      protected var _overwrittenProps:Object;
      
      public var target:Object;
      
      public var ease:Function;
      
      protected var _firstPropTween:PropTween;
      
      public function TweenLite(param1:Object, param2:Number, param3:Object)
      {
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:TweenLite = null;
         super(param2,param3);
         if(param1 == null)
         {
            return;
         }
         this.target = param1;
         this.ease = typeof this.vars.ease != "function" ? defaultEase : this.vars.ease;
         if(this.vars.easeParams != null)
         {
            this.vars.proxiedEase = this.ease;
            this.ease = easeProxy;
         }
         propTweenLookup = {};
         if(!(param1 in masterList))
         {
            masterList[param1] = [this];
         }
         else
         {
            _loc4_ = param3.overwrite == undefined || !overwriteManager.enabled && param3.overwrite > 1 ? int(overwriteManager.mode) : int(param3.overwrite);
            if(_loc4_ == 1)
            {
               _loc5_ = masterList[param1];
               for each(_loc6_ in _loc5_)
               {
                  if(!_loc6_.gc)
                  {
                     _loc6_.timeline.remove(_loc6_);
                  }
               }
               masterList[param1] = [this];
            }
            else
            {
               masterList[param1].push(this);
            }
         }
         if(this.active || Boolean(this.vars.forceImmediateRender))
         {
            renderTime(0);
         }
      }
      
      public static function delayedCall(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenLite
      {
         return new TweenLite(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function initClass() : void
      {
         TweenPlugin.activate([TintPlugin,RemoveTintPlugin,FramePlugin,AutoAlphaPlugin,VisiblePlugin,VolumePlugin,EndArrayPlugin]);
         rootFrame = 0;
         rootTimeline = new SimpleTimeline(null);
         rootFramesTimeline = new SimpleTimeline(null);
         rootTimeline.startTime = getTimer() * 0.001;
         rootFramesTimeline.startTime = rootFrame;
         rootTimeline.autoRemoveChildren = rootFramesTimeline.autoRemoveChildren = true;
         timingSprite.addEventListener(Event.ENTER_FRAME,updateAll,false,0,true);
         if(overwriteManager == null)
         {
            overwriteManager = {
               "mode":1,
               "enabled":false
            };
         }
      }
      
      public static function removeTween(param1:TweenLite) : void
      {
         if(param1 != null)
         {
            param1.timeline.remove(param1);
         }
      }
      
      public static function killTweensOf(param1:Object, param2:Boolean = false) : void
      {
         var _loc3_:Array = null;
         var _loc4_:* = 0;
         if(param1 != null && param1 in masterList)
         {
            _loc3_ = masterList[param1];
            _loc4_ = int(_loc3_.length - 1);
            while(_loc4_ > -1)
            {
               if(!_loc3_[_loc4_].gc)
               {
                  if(param2)
                  {
                     _loc3_[_loc4_].complete(false);
                  }
                  else
                  {
                     _loc3_[_loc4_].timeline.remove(_loc3_[_loc4_] as Tweenable);
                  }
               }
               _loc4_--;
            }
            delete masterList[param1];
         }
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : TweenLite
      {
         param3.runBackwards = true;
         if(param3.renderOnStart != true)
         {
            param3.forceImmediateRender = true;
         }
         return new TweenLite(param1,param2,param3);
      }
      
      protected static function easeOut(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return -param3 * (param1 = param1 / param4) * (param1 - 2) + param2;
      }
      
      protected static function updateAll(param1:Event = null) : void
      {
         var _loc2_:Dictionary = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:* = 0;
         rootTimeline.renderTime((getTimer() * 0.001 - rootTimeline.startTime) * rootTimeline.cachedTimeScale);
         ++rootFrame;
         rootFramesTimeline.renderTime(rootFrame * rootFramesTimeline.cachedTimeScale);
         if(!(rootFrame % 30))
         {
            _loc2_ = masterList;
            for(_loc3_ in _loc2_)
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = int(_loc4_.length - 1);
               while(_loc5_ > -1)
               {
                  if(_loc4_[_loc5_].gc)
                  {
                     _loc4_.splice(_loc5_,1);
                  }
                  _loc5_--;
               }
               if(_loc4_.length == 0)
               {
                  delete _loc2_[_loc3_];
               }
            }
         }
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenLite
      {
         return new TweenLite(param1,param2,param3);
      }
      
      protected function easeProxy(param1:Number, param2:Number, param3:Number, param4:Number) : Number
      {
         return this.vars.proxiedEase.apply(null,arguments.concat(this.vars.easeParams));
      }
      
      override public function renderTime(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Boolean = false;
         var _loc4_:Number = this.cachedTime;
         if(param1 >= this.cachedDuration)
         {
            this.cachedTotalTime = this.cachedTime = this.cachedDuration;
            _loc2_ = 1;
            _loc3_ = true;
         }
         else if(param1 <= 0)
         {
            this.cachedTotalTime = this.cachedTime = _loc2_ = 0;
            if(param1 < 0)
            {
               this.active = false;
            }
         }
         else
         {
            this.cachedTotalTime = this.cachedTime = param1;
            _loc2_ = this.ease(param1,0,1,this.cachedDuration);
         }
         if(!this.initted)
         {
            init();
            this.active = true;
            if(this.vars.onStart != null)
            {
               this.vars.onStart.apply(null,this.vars.onStartParams);
            }
         }
         else if(this.cachedTime == _loc4_)
         {
            return;
         }
         var _loc5_:PropTween = _firstPropTween;
         while(_loc5_ != null)
         {
            _loc5_.target[_loc5_.property] = _loc5_.start + _loc2_ * _loc5_.change;
            _loc5_ = _loc5_.nextNode;
         }
         if(_hasUpdate)
         {
            this.vars.onUpdate.apply(null,this.vars.onUpdateParams);
         }
         if(_loc3_)
         {
            complete(true);
         }
      }
      
      protected function removePropTween(param1:PropTween) : void
      {
         if(param1.nextNode != null)
         {
            param1.nextNode.prevNode = param1.prevNode;
         }
         if(param1.prevNode != null)
         {
            param1.prevNode.nextNode = param1.nextNode;
         }
         else if(_firstPropTween == param1)
         {
            _firstPropTween = param1.nextNode;
         }
      }
      
      protected function insertPropTween(param1:Object, param2:String, param3:Number, param4:*, param5:String, param6:Boolean, param7:PropTween) : PropTween
      {
         var _loc9_:Array = null;
         var _loc10_:* = 0;
         var _loc8_:PropTween = new PropTween(param1,param2,param3,typeof param4 == "number" ? param4 - param3 : Number(param4),param5,param6,param7);
         if(param7 != null)
         {
            param7.prevNode = _loc8_;
         }
         if(param6 && param5 == "_MULTIPLE_")
         {
            _loc9_ = param1.overwriteProps;
            _loc10_ = int(_loc9_.length - 1);
            while(_loc10_ > -1)
            {
               propTweenLookup[_loc9_[_loc10_]] = _loc8_;
               _loc10_--;
            }
         }
         else
         {
            propTweenLookup[param5] = _loc8_;
         }
         return _loc8_;
      }
      
      protected function init() : void
      {
         var _loc1_:String = null;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc5_:PropTween = null;
         var _loc4_:Object = this.vars.isTV == true ? this.vars.exposedVars : this.vars;
         propTweenLookup = {};
         if(_loc4_.timeScale != undefined && this.target is Tweenable)
         {
            _firstPropTween = insertPropTween(this.target,"timeScale",this.target.timeScale,_loc4_.timeScale,"timeScale",false,_firstPropTween);
         }
         for(_loc1_ in _loc4_)
         {
            if(!(_loc1_ in _reservedProps))
            {
               if(_loc1_ in plugins)
               {
                  _loc3_ = new plugins[_loc1_]();
                  if(_loc3_.onInitTween(this.target,_loc4_[_loc1_],this) == false)
                  {
                     _firstPropTween = insertPropTween(this.target,_loc1_,this.target[_loc1_],_loc4_[_loc1_],_loc1_,false,_firstPropTween);
                  }
                  else
                  {
                     _firstPropTween = insertPropTween(_loc3_,"changeFactor",0,1,_loc3_.overwriteProps.length == 1 ? _loc3_.overwriteProps[0] : "_MULTIPLE_",true,_firstPropTween);
                     _hasPlugins = true;
                  }
               }
               else
               {
                  _firstPropTween = insertPropTween(this.target,_loc1_,this.target[_loc1_],_loc4_[_loc1_],_loc1_,false,_firstPropTween);
               }
            }
         }
         if(this.vars.runBackwards == true)
         {
            _loc5_ = _firstPropTween;
            while(_loc5_ != null)
            {
               _loc5_.start += _loc5_.change;
               _loc5_.change = -_loc5_.change;
               _loc5_ = _loc5_.nextNode;
            }
         }
         _hasUpdate = Boolean(this.vars.onUpdate != null);
         if(_overwrittenProps != null)
         {
            killVars(_overwrittenProps);
         }
         if(Boolean(TweenLite.overwriteManager.enabled) && Boolean(this._firstPropTween != null) && this.target in masterList)
         {
            overwriteManager.manageOverwrites(this,propTweenLookup,masterList[this.target]);
         }
         this.initted = true;
      }
      
      override public function complete(param1:Boolean = false) : void
      {
         var _loc2_:PropTween = null;
         if(!param1)
         {
            renderTime(this.cachedTotalDuration);
            return;
         }
         if(_hasPlugins)
         {
            _loc2_ = _firstPropTween;
            while(_loc2_ != null)
            {
               if(_loc2_.isPlugin && _loc2_.target.onComplete != null)
               {
                  _loc2_.target.onComplete();
               }
               _loc2_ = _loc2_.nextNode;
            }
         }
         if(this.timeline.autoRemoveChildren)
         {
            this.timeline.remove(this);
         }
         else
         {
            this.active = false;
         }
         if(this.vars.onComplete != null)
         {
            this.vars.onComplete.apply(null,this.vars.onCompleteParams);
         }
      }
      
      public function killVars(param1:Object, param2:Boolean = true) : void
      {
         var _loc3_:String = null;
         var _loc4_:PropTween = null;
         if(_overwrittenProps == null)
         {
            _overwrittenProps = {};
         }
         for(_loc3_ in param1)
         {
            if(_loc3_ in propTweenLookup)
            {
               _loc4_ = propTweenLookup[_loc3_];
               if(_loc4_.isPlugin && _loc4_.name == "_MULTIPLE_")
               {
                  _loc4_.target.killProps(param1);
                  if(_loc4_.target.overwriteProps.length == 0)
                  {
                     removePropTween(_loc4_);
                     delete propTweenLookup[_loc3_];
                  }
               }
               else
               {
                  removePropTween(_loc4_);
                  delete propTweenLookup[_loc3_];
               }
            }
            if(param2)
            {
               _overwrittenProps[_loc3_] = 1;
            }
         }
      }
   }
}

