package com.zcp.common.observer
{
   public class Notification
   {
      
      public var name:*;
      
      public var body:*;
      
      public function Notification(param1:*, param2:* = null)
      {
         super();
         this.name = param1;
         this.body = param2;
      }
   }
}

