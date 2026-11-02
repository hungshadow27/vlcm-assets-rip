package com.fireice.base
{
   import flash.text.TextField;
   
   public class FUITextField extends TextField implements IFUIComponent
   {
      
      protected var $pid:String;
      
      protected var $proto:Object;
      
      public function FUITextField()
      {
         super();
         this.$pid = FUIComponent.createId();
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

