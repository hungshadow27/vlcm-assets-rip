package com.zcp.common.loader.vo
{
   public class LoadData
   {
      
      private var _url:String;
      
      private var _name:String;
      
      private var _key:String;
      
      private var _priority:int;
      
      private var _onComplete:Function;
      
      private var _onUpdate:Function;
      
      private var _onError:Function;
      
      private var _decode:Function;
      
      private var _userData:Object;
      
      public function LoadData(param1:String, param2:Function = null, param3:Function = null, param4:Function = null, param5:String = "", param6:String = "", param7:int = 0, param8:Function = null)
      {
         super();
         this._url = param1;
         this._name = param5;
         this._key = param6;
         this._priority = param7;
         this._onComplete = param2;
         this._onUpdate = param3;
         this._onError = param4;
         this._decode = param8;
      }
      
      public function get userData() : Object
      {
         if(this._userData == null)
         {
            this._userData = {};
         }
         return this._userData;
      }
      
      public function get url() : String
      {
         return this._url;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get key() : String
      {
         return this._key;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function get onComplete() : Function
      {
         return this._onComplete;
      }
      
      public function get onUpdate() : Function
      {
         return this._onUpdate;
      }
      
      public function get onError() : Function
      {
         return this._onError;
      }
      
      public function get decode() : Function
      {
         return this._decode;
      }
   }
}

