package com.tgame.common.utils
{
   import flash.display.MovieClip;
   import flash.utils.Dictionary;
   
   public class SuperContentCache
   {
      
      private static var defaultCache:SuperContentCache;
      
      private var contentCaches:Dictionary = new Dictionary();
      
      private var contentCachesFun:Dictionary = new Dictionary();
      
      private var keys:Array = new Array();
      
      public function SuperContentCache()
      {
         super();
      }
      
      public static function getCache() : SuperContentCache
      {
         if(defaultCache == null)
         {
            defaultCache = new SuperContentCache();
         }
         return defaultCache;
      }
      
      public function getContent(param1:String) : MovieClip
      {
         return this.contentCaches[param1];
      }
      
      public function getKey(param1:String) : Boolean
      {
         return this.contentCaches.hasOwnProperty(param1);
      }
      
      public function setContent(param1:String, param2:*) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         this.contentCaches[param1] = param2;
         this.keys.push(param1);
         if(this.contentCachesFun[param1] != null)
         {
            _loc3_ = this.contentCachesFun[param1];
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               _loc3_[_loc4_](param2);
               _loc4_++;
            }
            this.contentCachesFun[param1] = null;
         }
      }
      
      public function setContentFun(param1:String, param2:Function) : void
      {
         if(this.contentCachesFun[param1] == null)
         {
            this.contentCachesFun[param1] = new Array();
         }
         var _loc3_:Array = this.contentCachesFun[param1];
         _loc3_.push(param2);
         this.contentCachesFun[param1] = _loc3_;
      }
   }
}

