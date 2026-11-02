package gs
{
   import flash.errors.*;
   import flash.utils.*;
   import gs.core.tween.*;
   
   public class OverwriteManager
   {
      
      public static var mode:int;
      
      public static var enabled:Boolean;
      
      public static const version:Number = 5;
      
      public static const NONE:int = 0;
      
      public static const ALL:int = 1;
      
      public static const AUTO:int = 2;
      
      public static const CONCURRENT:int = 3;
      
      public function OverwriteManager()
      {
         super();
      }
      
      public static function getGlobalActive(param1:Tweenable) : Boolean
      {
         var _loc2_:Tweenable = param1;
         while(_loc2_ != null)
         {
            if(!_loc2_.active)
            {
               return false;
            }
            _loc2_ = _loc2_.timeline;
         }
         return true;
      }
      
      public static function manageOverwrites(param1:TweenLite, param2:Object, param3:Array) : void
      {
         var _loc9_:* = 0;
         var _loc10_:TweenLite = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Tweenable = null;
         var _loc14_:Number = NaN;
         var _loc15_:SimpleTimeline = null;
         var _loc4_:Object = param1.vars;
         var _loc5_:int = _loc4_.overwrite == undefined ? mode : int(_loc4_.overwrite);
         if(_loc5_ < 2 || param3 == null)
         {
            return;
         }
         var _loc6_:Number = param1.startTime;
         var _loc7_:Array = [];
         var _loc8_:Array = [];
         _loc9_ = int(param3.length - 1);
         while(_loc9_ > -1)
         {
            _loc10_ = param3[_loc9_];
            if(!(_loc10_ == param1 || _loc10_.gc))
            {
               if(_loc10_.active && getGlobalActive(_loc10_) || _loc10_.timeline == param1.timeline && _loc10_.startTime <= _loc6_ && _loc10_.startTime + _loc10_.totalDuration > _loc6_)
               {
                  _loc7_[_loc7_.length] = _loc10_;
               }
               else if(_loc10_.timeline != param1.timeline)
               {
                  _loc8_[_loc8_.length] = _loc10_;
               }
            }
            _loc9_--;
         }
         if(_loc8_.length != 0)
         {
            _loc11_ = param1.cachedTimeScale;
            _loc12_ = _loc6_;
            _loc15_ = param1.timeline;
            while(_loc15_ != null)
            {
               _loc11_ *= _loc15_.cachedTimeScale;
               _loc12_ += _loc15_.startTime;
               _loc15_ = _loc15_.timeline;
            }
            _loc6_ = _loc11_ * _loc12_;
            _loc9_ = int(_loc8_.length - 1);
            while(_loc9_ > -1)
            {
               _loc13_ = _loc8_[_loc9_];
               _loc11_ = _loc13_.cachedTimeScale;
               _loc12_ = _loc13_.startTime;
               _loc15_ = _loc13_.timeline;
               while(_loc15_ != null)
               {
                  _loc11_ *= _loc15_.cachedTimeScale;
                  _loc12_ += _loc15_.startTime;
                  _loc15_ = _loc15_.timeline;
               }
               _loc14_ = _loc11_ * _loc12_;
               if(_loc14_ <= _loc6_ && _loc14_ + _loc13_.totalDuration * _loc11_ > _loc6_)
               {
                  _loc7_[_loc7_.length] = _loc13_;
               }
               _loc9_--;
            }
         }
         if(_loc7_.length == 0)
         {
            return;
         }
         if(_loc5_ == AUTO)
         {
            _loc9_ = int(_loc7_.length - 1);
            while(_loc9_ > -1)
            {
               _loc7_[_loc9_].killVars(param2);
               _loc9_--;
            }
         }
         else
         {
            _loc9_ = int(_loc7_.length - 1);
            while(_loc9_ > -1)
            {
               _loc7_[_loc9_].enabled = false;
               _loc9_--;
            }
         }
      }
      
      public static function init(param1:int = 2) : int
      {
         if(TweenLite.version < 11)
         {
            trace("TweenLite warning: Your TweenLite class needs to be updated to work with OverwriteManager (or you may need to clear your ASO files). Please download and install the latest version from http://www.tweenlite.com.");
         }
         TweenLite.overwriteManager = OverwriteManager;
         mode = param1;
         enabled = true;
         return mode;
      }
   }
}

