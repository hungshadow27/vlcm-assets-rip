package com.fireice.event
{
   import com.fireice.list.FListCellRenderer;
   import flash.events.Event;
   
   public class FListEvent extends Event
   {
      
      public static const CLICK_CELL:String = "list.click.cell";
      
      private var _item:FListCellRenderer;
      
      public function FListEvent(param1:String, param2:FListCellRenderer, param3:Boolean = false, param4:Boolean = false)
      {
         this._item = param2;
         super(param1,param3,param4);
      }
      
      public function get item() : FListCellRenderer
      {
         return this._item;
      }
      
      public function set item(param1:FListCellRenderer) : void
      {
         this._item = param1;
      }
   }
}

