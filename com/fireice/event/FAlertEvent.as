package com.fireice.event
{
   public class FAlertEvent extends FEvent
   {
      
      public static const CLOSE:String = "alert.close";
      
      public function FAlertEvent(param1:String, param2:Object)
      {
         super(param1,null,param2);
      }
   }
}

