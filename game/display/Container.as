package game.display
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class Container extends Component
   {
      
      public function Container()
      {
         super();
      }
      
      public function getDescendant(param1:String) : DisplayObject
      {
         var _loc4_:String = null;
         var _loc5_:DisplayObject = null;
         var _loc2_:Array = param1.split(".");
         var _loc3_:DisplayObjectContainer = this;
         while(_loc2_.length > 0)
         {
            _loc4_ = _loc2_.shift();
            _loc5_ = _loc3_.getChildByName(_loc4_);
            if(_loc5_ == null)
            {
               throw new Error("显示对象 " + _loc4_ + " 不存在!");
            }
            if(_loc2_.length > 0)
            {
               _loc3_ = _loc5_ as DisplayObjectContainer;
               if(_loc3_ == null)
               {
                  throw new Error("显示对象 " + _loc4_ + " 不是容器");
               }
            }
         }
         return _loc5_;
      }
   }
}

