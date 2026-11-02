package com.fireice.base
{
   import flash.display.Sprite;
   
   public class FUIComponent extends Sprite implements IFUIComponent
   {
      
      private static var INSTANCE_INDEX:int = int.MAX_VALUE;
      
      protected var $pid:String;
      
      protected var $proto:Object;
      
      public function FUIComponent()
      {
         super();
         this.$pid = createId();
      }
      
      public static function createId() : String
      {
         if(INSTANCE_INDEX <= 0)
         {
            INSTANCE_INDEX = int.MAX_VALUE;
         }
         --INSTANCE_INDEX;
         return "@FUI-" + INSTANCE_INDEX;
      }
      
      public function get pid() : String
      {
         return this.$pid;
      }
      
      public function set proto(param1:Object) : void
      {
         this.$proto = param1;
      }
      
      public function get proto() : Object
      {
         return this.$proto;
      }
   }
}

