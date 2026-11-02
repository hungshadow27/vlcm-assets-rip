package com.zcp.common.linkedlist
{
   public class LNode
   {
      
      private var _id:String;
      
      private var _data:Object;
      
      private var _pre:LNode;
      
      private var _next:LNode;
      
      public function LNode(param1:Object, param2:String = null)
      {
         super();
         this._data = param1;
         this._id = param2;
         this._next = null;
         this._pre = null;
      }
      
      public function get pre() : LNode
      {
         return this._pre;
      }
      
      public function set pre(param1:LNode) : void
      {
         this._pre = param1;
      }
      
      public function get next() : LNode
      {
         return this._next;
      }
      
      public function set next(param1:LNode) : void
      {
         this._next = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get id() : String
      {
         return this._id;
      }
   }
}

