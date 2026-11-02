package com.zcp.manager
{
   import com.zcp.common.log.ZLog;
   import com.zcp.common.pool.Pool;
   import flash.utils.*;
   
   public class PoolManager
   {
      
      private static var _poolArr:Array = [];
      
      public function PoolManager()
      {
         super();
         throw new Error("Can not New!");
      }
      
      public static function hasPool(param1:Pool) : Boolean
      {
         return _poolArr.indexOf(param1) != -1;
      }
      
      public static function hasNamedPool(param1:String) : Boolean
      {
         var _loc2_:Pool = null;
         for each(_loc2_ in _poolArr)
         {
            if(_loc2_.name == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public static function getPool(param1:String) : Pool
      {
         var _loc2_:Pool = null;
         for each(_loc2_ in _poolArr)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public static function creatPool(param1:String = "", param2:int = 2147483647) : Pool
      {
         var _loc3_:Pool = null;
         if(!hasNamedPool(param1))
         {
            _loc3_ = _poolArr[_poolArr.length] = new Pool(param1,param2);
            ZLog.add("PoolManager.creatPool::_poolArr.length:" + getPoolsNum());
         }
         else
         {
            _loc3_ = getPool(param1);
            _loc3_.resize(param2);
         }
         return _loc3_;
      }
      
      public static function deletePool(param1:Pool) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:int = _poolArr.indexOf(param1);
         if(_loc2_ != -1)
         {
            _poolArr.splice(_loc2_,1);
         }
         param1.removeAllObjs();
      }
      
      public static function deletePoolByName(param1:String) : void
      {
         var _loc2_:Pool = null;
         for each(_loc2_ in _poolArr)
         {
            if(_loc2_.name == param1)
            {
               _poolArr.splice(_poolArr.indexOf(_loc2_),1);
               _loc2_.removeAllObjs();
               break;
            }
         }
      }
      
      public static function deleteAllPools() : void
      {
         var _loc1_:Pool = null;
         for each(_loc1_ in _poolArr)
         {
            _loc1_.removeAllObjs();
         }
         _poolArr = [];
      }
      
      public static function getPoolsNum() : int
      {
         return _poolArr.length;
      }
   }
}

