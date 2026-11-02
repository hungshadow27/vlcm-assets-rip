package gs.plugins
{
   import flash.display.*;
   import gs.*;
   
   public class VisiblePlugin extends TweenPlugin
   {
      
      public static const VERSION:Number = 1.51;
      
      public static const API:Number = 1;
      
      protected var _tween:TweenLite;
      
      protected var _hideAtStart:Boolean;
      
      protected var _target:Object;
      
      protected var _visible:Boolean;
      
      public function VisiblePlugin()
      {
         super();
         this.propName = "visible";
         this.overwriteProps = ["visible"];
         this.onComplete = onCompleteTween;
      }
      
      public function onCompleteTween() : void
      {
         if(!_hideAtStart && (_tween.cachedTime != 0 || _tween.duration == 0))
         {
            _target.visible = _visible;
         }
      }
      
      protected function init(param1:Object, param2:Boolean, param3:TweenLite) : void
      {
         _target = param1;
         _tween = param3;
         _visible = param2;
         if(_tween.vars.runBackwards == true && _tween.vars.renderOnStart != false && param2 == false)
         {
            _hideAtStart = true;
         }
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         init(param1,Boolean(param2),param3);
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         if(_hideAtStart && _tween.cachedTotalTime == 0)
         {
            _target.visible = false;
         }
         else if(_target.visible != true)
         {
            _target.visible = true;
         }
      }
   }
}

