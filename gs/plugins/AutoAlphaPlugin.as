package gs.plugins
{
   import flash.display.*;
   import gs.*;
   
   public class AutoAlphaPlugin extends VisiblePlugin
   {
      
      public static const VERSION:Number = 2;
      
      public static const API:Number = 1;
      
      protected var _ignoreVisible:Boolean;
      
      public function AutoAlphaPlugin()
      {
         super();
         this.propName = "autoAlpha";
         this.overwriteProps = ["alpha","visible"];
      }
      
      override public function killProps(param1:Object) : void
      {
         super.killProps(param1);
         _ignoreVisible = Boolean("visible" in param1);
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         init(param1,Boolean(param2 != 0),param3);
         addTween(param1,"alpha",param1.alpha,param2,"alpha");
         return true;
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         updateTweens(param1);
         if(!_ignoreVisible)
         {
            super.changeFactor = param1;
         }
      }
   }
}

