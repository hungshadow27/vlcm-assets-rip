package gs.core.tween
{
   public class SimpleTimeline extends Tweenable
   {
      
      public var autoRemoveChildren:Boolean;
      
      protected var _lastChild:Tweenable;
      
      protected var _firstChild:Tweenable;
      
      public function SimpleTimeline(param1:Object = null)
      {
         super(0,param1);
      }
      
      override public function renderTime(param1:Number) : void
      {
         this.cachedTotalTime = this.cachedTime = param1;
         var _loc2_:Tweenable = _firstChild;
         while(_loc2_ != null)
         {
            if(_loc2_.active || param1 >= _loc2_.startTime && !_loc2_.cachedPaused)
            {
               _loc2_.renderTime((param1 - _loc2_.startTime) * _loc2_.cachedTimeScale);
            }
            _loc2_ = _loc2_.nextNode;
         }
      }
      
      public function addChild(param1:Tweenable) : void
      {
         if(param1.timeline != null && !param1.gc)
         {
            param1.timeline.remove(param1);
         }
         if(_firstChild != null)
         {
            _firstChild.prevNode = param1;
            param1.nextNode = _firstChild;
         }
         else
         {
            param1.nextNode = null;
         }
         _firstChild = param1;
         param1.prevNode = null;
         param1.timeline = this;
         param1.gc = false;
      }
      
      public function remove(param1:Tweenable) : void
      {
         if(param1.nextNode != null)
         {
            param1.nextNode.prevNode = param1.prevNode;
         }
         else if(_lastChild == param1)
         {
            _lastChild = param1.prevNode;
         }
         if(param1.prevNode != null)
         {
            param1.prevNode.nextNode = param1.nextNode;
         }
         else if(_firstChild == param1)
         {
            _firstChild = param1.nextNode;
         }
         param1.gc = true;
         param1.active = false;
      }
   }
}

