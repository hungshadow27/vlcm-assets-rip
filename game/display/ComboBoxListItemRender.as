package game.display
{
   public class ComboBoxListItemRender extends ListItemRender
   {
      
      protected var _label:String;
      
      public function ComboBoxListItemRender()
      {
         super();
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      public function get label() : String
      {
         return this._label;
      }
   }
}

