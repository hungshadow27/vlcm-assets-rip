package com.asQuery
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   internal class ASQueryHelper
   {
      
      public function ASQueryHelper()
      {
         super();
      }
      
      public static function setAttr(param1:DisplayObject, param2:String, param3:*) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         if(param3 is String)
         {
            _loc4_ = param3 as String;
            _loc5_ = _loc4_.substr(0,2);
            switch(_loc5_)
            {
               case "+=":
                  param1[param2] += Number(_loc4_.substr(2));
                  break;
               case "-=":
                  param1[param2] -= Number(_loc4_.substr(2));
                  break;
               case "*=":
                  param1[param2] *= Number(_loc4_.substr(2));
                  break;
               case "/=":
                  param1[param2] /= Number(_loc4_.substr(2));
                  break;
               default:
                  param1[param2] = _loc4_;
            }
         }
         else
         {
            param1[param2] = param3;
         }
      }
      
      public static function findChildByName(param1:String, param2:DisplayObjectContainer, param3:Array) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc7_:RegExp = null;
         var _loc8_:Boolean = false;
         _loc4_ = param2.getChildByName(param1);
         if(_loc4_)
         {
            param3.push(_loc4_);
            return;
         }
         var _loc5_:int = param2.numChildren;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2.getChildAt(_loc6_);
            if(param1.substr(0,1) == "^" && param1.length > 2)
            {
               _loc7_ = new RegExp(param1);
               _loc8_ = _loc7_.test(_loc4_.name);
               if(_loc8_)
               {
                  param3.push(_loc4_);
               }
            }
            else if(_loc4_.name == param1)
            {
            }
            _loc6_++;
         }
      }
      
      public static function findAllChildByName(param1:String, param2:DisplayObjectContainer, param3:Array) : void
      {
         var _loc4_:DisplayObject = null;
         var _loc7_:RegExp = null;
         var _loc8_:Boolean = false;
         _loc4_ = param2.getChildByName(param1);
         if(_loc4_)
         {
            param3.push(_loc4_);
            if(_loc4_ is DisplayObjectContainer)
            {
               findAllChildByName(param1,DisplayObjectContainer(_loc4_),param3);
            }
            return;
         }
         var _loc5_:int = param2.numChildren;
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc4_ = param2.getChildAt(_loc6_);
            if(param1.substr(0,1) == "^" && param1.length > 2)
            {
               _loc7_ = new RegExp(param1);
               _loc8_ = _loc7_.test(_loc4_.name);
               if(_loc8_)
               {
                  param3.push(_loc4_);
               }
            }
            else if(_loc4_.name == param1)
            {
            }
            if(_loc4_ is DisplayObjectContainer)
            {
               findAllChildByName(param1,DisplayObjectContainer(_loc4_),param3);
            }
            _loc6_++;
         }
      }
      
      public static function findChildByClass(param1:Class, param2:DisplayObjectContainer, param3:Array) : void
      {
         var _loc6_:DisplayObject = null;
         var _loc4_:int = param2.numChildren;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param2.getChildAt(_loc5_);
            if(_loc6_ is param1)
            {
               param3.push(_loc6_);
            }
            _loc5_++;
         }
      }
      
      public static function findAllChildByClass(param1:Class, param2:DisplayObjectContainer, param3:Array) : void
      {
         var _loc6_:DisplayObject = null;
         var _loc4_:int = param2.numChildren;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param2.getChildAt(_loc5_);
            if(_loc6_ is param1)
            {
               param3.push(_loc6_);
            }
            if(_loc6_ is DisplayObjectContainer)
            {
               findAllChildByClass(param1,DisplayObjectContainer(_loc6_),param3);
            }
            _loc5_++;
         }
      }
   }
}

