package com.fireice.dragAndDrop
{
   public class SourceData
   {
      
      private var name:String;
      
      private var data:*;
      
      public function SourceData(param1:String, param2:*)
      {
         super();
         this.name = param1;
         this.data = param2;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function getData() : *
      {
         return this.data;
      }
   }
}

