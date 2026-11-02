package com.fireice.event
{
   public class FCloseEvent extends FEvent
   {
      
      public static const CLOSE:String = "close";
      
      public function FCloseEvent(param1:String, param2:Object)
      {
         super(param1,null,param2);
      }
   }
}

