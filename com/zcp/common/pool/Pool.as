package com.zcp.common.pool
{
   import com.zcp.manager.RslLoaderManager;
   
   public class Pool
   {
      
      private var _name:String;
      
      private var _maxSize:int;
      
      private var _objArr:Array;
      
      public function Pool(param1:String = "", param2:int = 2147483647)
      {
         super();
         if(param2 < 0)
         {
            throw new Error("Pool constructor error , wrong params!");
         }
         this._name = param1;
         this._maxSize = param2;
         this._objArr = [];
      }
      
      public function createObj(param1:Class, ... rest) : IPoolClass
      {
         var _loc3_:IPoolClass = null;
         if(this._objArr.length == 0)
         {
            _loc3_ = RslLoaderManager.getInstanceByClass(param1,rest);
         }
         else
         {
            _loc3_ = this._objArr.shift();
            _loc3_.reSet(rest);
         }
         return _loc3_;
      }
      
      public function disposeObj(param1:IPoolClass) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.dispose();
         if(this._objArr.indexOf(param1) == -1)
         {
            this._objArr[this._objArr.length] = param1;
            this.resize(this._maxSize);
         }
      }
      
      public function getRestingObjsNum() : int
      {
         return this._objArr.length;
      }
      
      public function resize(param1:int) : void
      {
         if(param1 < 0)
         {
            return;
         }
         this._maxSize = param1;
         while(this._objArr.length > this._maxSize)
         {
            this._objArr.shift();
         }
      }
      
      public function removeObj(param1:IPoolClass) : void
      {
         param1.dispose();
         var _loc2_:int = this._objArr.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._objArr.splice(_loc2_,1);
         }
      }
      
      public function removeAllObjs() : void
      {
         var _loc1_:IPoolClass = null;
         for each(_loc1_ in this._objArr)
         {
            _loc1_.dispose();
         }
         this._objArr = [];
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}

