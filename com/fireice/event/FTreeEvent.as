package com.fireice.event
{
   import com.fireice.tree.FTreeCellRenderer;
   import flash.events.Event;
   
   public class FTreeEvent extends Event
   {
      
      public static const CLICK_NODE:String = "clickNode";
      
      public var item:FTreeCellRenderer;
      
      public function FTreeEvent(param1:String, param2:FTreeCellRenderer, param3:Boolean = false, param4:Boolean = false)
      {
         this.item = param2;
         super(param1,param3,param4);
      }
   }
}

