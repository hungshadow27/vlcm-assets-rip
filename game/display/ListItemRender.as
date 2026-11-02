package game.display
{
   public class ListItemRender extends Container
   {
      
      protected var _selected:Boolean;
      
      protected var _data:Object;
      
      protected var _index:int;
      
      public function ListItemRender()
      {
         super();
      }
      
      override protected function createVariableReference() : void
      {
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function set index(param1:int) : void
      {
         this._index = param1;
      }
   }
}

