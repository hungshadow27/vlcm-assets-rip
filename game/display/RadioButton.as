package game.display
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import game.common.UIState;
   
   public class RadioButton extends Button
   {
      
      private var _selected:Boolean;
      
      private var _data:Object;
      
      public function RadioButton()
      {
         super();
         this._selected = false;
         addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         if(!enabled)
         {
            return;
         }
         if(this._selected == true)
         {
            this.state = UIState.STATE_DOWN;
         }
         else
         {
            this.state = UIState.STATE_NORMAL;
         }
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         mouseChildren = param1;
         mouseEnabled = param1;
         if(param1)
         {
            if(this._selected)
            {
               this.state = UIState.STATE_DOWN;
            }
            else
            {
               this.state = UIState.STATE_NORMAL;
            }
         }
         else
         {
            this.state = UIState.STATE_DISABLE;
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent is RadioButtonGroup == false)
         {
            this.selected = !this.selected;
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      override protected function onMouseEvent(param1:MouseEvent) : void
      {
         if(this._selected == false)
         {
            super.onMouseEvent(param1);
         }
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
   }
}

