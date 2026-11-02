package com.zcp.common.cache
{
   import com.zcp.common.linkedlist.LNode;
   import flash.utils.*;
   
   public class Cache
   {
      
      private static var _nextId:int = 0;
      
      private var _name:String;
      
      private var _length:int;
      
      private var _maxSize:int;
      
      private var _head:LNode;
      
      private var _dict:Dictionary;
      
      public function Cache(param1:String = "", param2:int = 2147483647)
      {
         super();
         if(param2 < 0)
         {
            throw new Error("缓存个数必须为非负数");
         }
         this._name = param1 != "" ? param1 : "Cache" + _nextId++;
         this._maxSize = param2;
         this._head = null;
         this._length = 0;
         this._dict = new Dictionary();
      }
      
      public function has(param1:String) : Boolean
      {
         return this._dict[param1] != null;
      }
      
      public function get(param1:String) : Object
      {
         var _loc2_:CacheUnit = this._dict[param1];
         this.promote(_loc2_);
         return _loc2_.data;
      }
      
      public function remove(param1:String) : void
      {
         var _loc2_:CacheUnit = this._dict[param1];
         if(_loc2_)
         {
            if(_loc2_ == this._head)
            {
               this._head = this._head.pre;
            }
            _loc2_.pre.next = _loc2_.next;
            _loc2_.next.pre = _loc2_.pre;
            this.destroy(_loc2_);
            --this._length;
         }
      }
      
      public function push(param1:Object, param2:String) : void
      {
         var _loc3_:LNode = null;
         if(this.has(param2))
         {
            this.promote(this._dict[param2]);
            return;
         }
         _loc3_ = new CacheUnit(param1,param2);
         this._dict[param2] = _loc3_;
         if(this._length == 0)
         {
            this._head = _loc3_;
            this._head.pre = _loc3_;
            this._head.next = _loc3_;
         }
         else
         {
            _loc3_.pre = this._head;
            _loc3_.next = this._head.next;
            _loc3_.pre.next = _loc3_;
            _loc3_.next.pre = _loc3_;
            this._head = _loc3_;
         }
         ++this._length;
         if(this._length > this._maxSize)
         {
            _loc3_ = this._head.next;
            _loc3_.pre.next = _loc3_.next;
            _loc3_.next.pre = _loc3_.pre;
            this.destroy(_loc3_);
            --this._length;
         }
      }
      
      public function resize(param1:int) : void
      {
         var _loc2_:LNode = null;
         if(param1 < 0 || param1 == this._maxSize)
         {
            return;
         }
         while(this._length > param1)
         {
            _loc2_ = this._head.next;
            _loc2_.pre.next = _loc2_.next;
            _loc2_.next.pre = _loc2_.pre;
            this.destroy(_loc2_);
            --this._length;
         }
         this._maxSize = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = this._maxSize;
         this.resize(0);
         this._maxSize = _loc1_;
      }
      
      public function getAllKeys() : Array
      {
         var _loc2_:CacheUnit = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._dict)
         {
            _loc1_.push(_loc2_.id);
         }
         return _loc1_;
      }
      
      public function getAllValues() : Array
      {
         var _loc2_:CacheUnit = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._dict)
         {
            _loc1_.push(_loc2_.data);
         }
         return _loc1_;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get length() : int
      {
         return this._length;
      }
      
      private function promote(param1:CacheUnit) : void
      {
         if(param1 == null || param1 == this._head)
         {
            return;
         }
         if(param1.pre == this._head)
         {
            this._head = param1;
         }
         else
         {
            param1.next.pre = param1.pre;
            param1.pre.next = param1.next;
            param1.pre = this._head;
            param1.next = this._head.next;
            this._head.next.pre = param1;
            this._head.next = param1;
            this._head = param1;
         }
      }
      
      private function destroy(param1:LNode) : void
      {
         delete this._dict[param1.id];
         (param1 as CacheUnit).dispose();
         param1 = null;
      }
   }
}

