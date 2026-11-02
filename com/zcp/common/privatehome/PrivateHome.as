package com.zcp.common.privatehome
{
   import flash.utils.Dictionary;
   
   public class PrivateHome
   {
      
      private var _objDict:Dictionary = new Dictionary();
      
      public function PrivateHome()
      {
         super();
      }
      
      public function addObject(param1:Object) : void
      {
         this._objDict[param1] = true;
      }
      
      public function removeObject(param1:Object) : void
      {
         this._objDict[param1] = null;
         delete this._objDict[param1];
      }
      
      public function clear() : void
      {
         var _loc1_:* = undefined;
         for each(_loc1_ in this._objDict)
         {
            this._objDict[_loc1_] = null;
            delete this._objDict[_loc1_];
         }
      }
   }
}

