package com.asQuery
{
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   internal class ASQueryListenerMap
   {
      
      private static var _instance:ASQueryListenerMap;
      
      private var _dic:Dictionary;
      
      public function ASQueryListenerMap(param1:SingletonEnforcer)
      {
         super();
         this._dic = new Dictionary(true);
      }
      
      public static function getInstance() : ASQueryListenerMap
      {
         if(_instance == null)
         {
            _instance = new ASQueryListenerMap(new SingletonEnforcer());
         }
         return _instance;
      }
      
      public function add(param1:IEventDispatcher, param2:String, param3:Function, param4:Function = null) : void
      {
         if(this._dic[param1] == null)
         {
            this._dic[param1] = new Dictionary(true);
         }
         if(this._dic[param1][param2] == null)
         {
            this._dic[param1][param2] = new Dictionary(true);
         }
         if(param4 != null)
         {
            this._dic[param1][param2][param4] = param3;
         }
         else
         {
            this._dic[param1][param2][param3] = param3;
         }
         param1.addEventListener(param2,param3);
      }
      
      public function remove(param1:Object, param2:String = null, param3:Function = null) : void
      {
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         if(param2 == null && param3 == null)
         {
            for(_loc4_ in this._dic[param1])
            {
               for(_loc5_ in this._dic[param1][_loc4_])
               {
                  param1.removeEventListener(_loc4_,this._dic[param1][_loc4_][_loc5_]);
               }
            }
            delete this._dic[param1];
         }
         else if(param3 == null)
         {
            for(_loc5_ in this._dic[param1][param2])
            {
               param1.removeEventListener(param2,this._dic[param1][param2][_loc5_]);
            }
            delete this._dic[param1][param2];
         }
         else
         {
            param1.removeEventListener(param2,this._dic[param1][param2][param3]);
            delete this._dic[param1][param2][param3];
         }
      }
   }
}

class SingletonEnforcer
{
   
   public function SingletonEnforcer()
   {
      super();
   }
}
