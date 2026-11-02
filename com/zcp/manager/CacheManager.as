package com.zcp.manager
{
   import com.zcp.common.cache.Cache;
   import com.zcp.common.log.ZLog;
   import flash.utils.*;
   
   public class CacheManager
   {
      
      private static var _cacheArr:Array = [];
      
      public function CacheManager()
      {
         super();
         throw new Error("Can not New!");
      }
      
      public static function hasCache(param1:Cache) : Boolean
      {
         return _cacheArr.indexOf(param1) != -1;
      }
      
      public static function hasNamedCache(param1:String) : Boolean
      {
         var _loc2_:Cache = null;
         for each(_loc2_ in _cacheArr)
         {
            if(_loc2_.name == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getCache(param1:String) : Cache
      {
         var _loc2_:Cache = null;
         for each(_loc2_ in _cacheArr)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function creatNewCache(param1:String = "", param2:int = 2147483647) : Cache
      {
         var _loc3_:Cache = _cacheArr[_cacheArr.length] = new Cache(param1,param2);
         ZLog.add("CacheManager.creatNewCache::_cacheArr.length:" + getCachesNum());
         return _loc3_;
      }
      
      public static function deleteCache(param1:Cache) : void
      {
         var _loc2_:Cache = null;
         for each(_loc2_ in _cacheArr)
         {
            if(_loc2_ == param1)
            {
               _cacheArr.splice(_cacheArr.indexOf(param1),1);
               ZLog.add("CacheManager.deleteCache::_cacheArr.length:" + getCachesNum());
               _loc2_.dispose();
               break;
            }
         }
      }
      
      public static function deleteCacheByName(param1:String) : void
      {
         var _loc2_:Cache = null;
         for each(_loc2_ in _cacheArr)
         {
            if(_loc2_.name == param1)
            {
               _cacheArr.splice(_cacheArr.indexOf(_loc2_),1);
               ZLog.add("CacheManager.deleteCacheByName::_cacheArr.length:" + getCachesNum());
               _loc2_.dispose();
               break;
            }
         }
      }
      
      public static function deleteAllCaches() : void
      {
         var _loc1_:Cache = null;
         for each(_loc1_ in _cacheArr)
         {
            _loc1_.dispose();
         }
         _cacheArr = [];
         ZLog.add("CacheManager.deleteAllCaches::_cacheArr.length:0");
      }
      
      public static function getCachesNum() : int
      {
         return _cacheArr.length;
      }
   }
}

