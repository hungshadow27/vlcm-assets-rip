package game.utils
{
   import flash.display.BitmapData;
   import game.manager.ImageCacheManager;
   
   public class SkinTools
   {
      
      public function SkinTools()
      {
         super();
      }
      
      public static function getChildSkinByName(param1:Object, param2:String) : *
      {
         var _loc6_:Object = null;
         var _loc3_:Array = param1.children;
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:* = int(_loc4_ - 1);
         while(_loc5_ >= 0)
         {
            _loc6_ = _loc3_[_loc5_];
            if(_loc6_.name == param2)
            {
               return _loc6_;
            }
            _loc5_--;
         }
         return null;
      }
      
      public static function getSkinByUrlName(param1:Object, param2:String) : *
      {
         var _loc5_:Object = null;
         var _loc3_:Array = param2.split(".");
         var _loc4_:Object = param1;
         while(_loc3_.length > 0)
         {
            _loc4_ = _loc5_ = getChildSkinByName(_loc4_,_loc3_.shift());
         }
         return _loc5_;
      }
      
      public static function getBitmapDataBySkin(param1:Object, param2:String = "normal", param3:Boolean = true, param4:Function = null) : BitmapData
      {
         var _loc5_:String = param1[param2].link;
         return ImageCacheManager.getBitmapData(_loc5_,param1.width,param1.height,param3,param4);
      }
      
      public static function getBitmapDataBySkinName(param1:Object, param2:String, param3:Boolean = true, param4:Function = null) : BitmapData
      {
         var _loc5_:Object = getSkinByLink(param1,param2);
         if(!_loc5_)
         {
            return null;
         }
         return ImageCacheManager.getBitmapData(param2,_loc5_.width,_loc5_.height,param3,param4);
      }
      
      protected static function getSkinByLink(param1:Object, param2:String) : *
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc3_:Array = param1.children;
         if(!_loc3_)
         {
            return null;
         }
         var _loc4_:int = int(_loc3_.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = _loc3_[_loc5_];
            if(_loc6_.children)
            {
               _loc7_ = getSkinByLink(_loc6_,param2);
               if(_loc7_)
               {
                  return _loc7_;
               }
            }
            else
            {
               if(Boolean(_loc6_.normal) && _loc6_.normal.link == param2)
               {
                  return _loc6_;
               }
               if(Boolean(_loc6_.over) && _loc6_.over.link == param2)
               {
                  return _loc6_;
               }
               if(Boolean(_loc6_.down) && _loc6_.down.link == param2)
               {
                  return _loc6_;
               }
               if(Boolean(_loc6_.disable) && _loc6_.disable.link == param2)
               {
                  return _loc6_;
               }
            }
            _loc5_++;
         }
         return null;
      }
   }
}

