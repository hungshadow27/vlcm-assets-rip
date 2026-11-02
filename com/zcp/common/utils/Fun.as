package com.zcp.common.utils
{
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Loader;
   import flash.display.Stage;
   import flash.net.LocalConnection;
   
   public class Fun
   {
      
      public function Fun()
      {
         super();
      }
      
      public static function clearChildren(param1:DisplayObject, param2:Boolean = false, param3:Boolean = true) : void
      {
         var _loc4_:* = 0;
         if(param1 == null)
         {
            return;
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc4_ = (param1 as DisplayObjectContainer).numChildren;
            while(_loc4_-- > 0)
            {
               if(param3)
               {
                  clearChildren((param1 as DisplayObjectContainer).getChildAt(_loc4_),param2,param3);
               }
               if(!(param1 is Loader))
               {
                  (param1 as DisplayObjectContainer).removeChildAt(_loc4_);
               }
            }
         }
         else if(param2 && param1 is Bitmap && Boolean((param1 as Bitmap).bitmapData))
         {
            (param1 as Bitmap).bitmapData.dispose();
         }
      }
      
      public static function clearChildrenByName(param1:DisplayObject, param2:String, param3:Boolean = false, param4:Boolean = true) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc5_:DisplayObjectContainer = param1 as DisplayObjectContainer;
         var _loc6_:DisplayObject = _loc5_.getChildByName(param2);
         if(_loc6_ != null)
         {
            _loc5_.removeChild(_loc6_);
            clearChildren(_loc6_,param3,param4);
         }
      }
      
      public static function isParentChild(param1:DisplayObjectContainer, param2:DisplayObject) : Boolean
      {
         if(param2 == null || param1 == null || param2.parent == null)
         {
            return false;
         }
         if(param2.parent == param1)
         {
            return true;
         }
         return isParentChild(param1,param2.parent);
      }
      
      public static function isVisible(param1:DisplayObject) : Boolean
      {
         if(param1 == null || param1.visible == false)
         {
            return false;
         }
         if(param1 is Stage)
         {
            return true;
         }
         return isVisible(param1.parent);
      }
      
      public static function doGC() : void
      {
         try
         {
            new LocalConnection().connect("foo");
            new LocalConnection().connect("foo");
         }
         catch(error:Error)
         {
         }
      }
   }
}

