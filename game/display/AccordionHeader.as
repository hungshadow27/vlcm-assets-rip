package game.display
{
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class AccordionHeader extends Container
   {
      
      protected var _label:Label;
      
      protected var _radioButton:RadioButton;
      
      protected var _content:Container;
      
      protected var _index:int;
      
      private var clickRect:Sprite;
      
      public function AccordionHeader()
      {
         super();
      }
      
      override protected function createVariableReference() : void
      {
         this._label = getChildByName("label") as Label;
         this._radioButton = getChildByName("radioButton") as RadioButton;
         this._label.mouseEnabled = false;
         this._label.mouseWheelEnabled = false;
         this.clickRect = new Sprite();
         this.clickRect.name = "clickRect";
         this.clickRect.graphics.beginFill(0,0);
         this.clickRect.graphics.drawRect(0,0,skin.width,skin.height);
         this.clickRect.graphics.endFill();
         addChild(this.clickRect);
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         this.reDraw();
      }
      
      public function set label(param1:String) : void
      {
         this._label.htmlText = param1;
      }
      
      public function get label() : String
      {
         return this._label.text;
      }
      
      public function set content(param1:Container) : void
      {
         this._content = param1;
      }
      
      public function get content() : Container
      {
         return this._content;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._radioButton.selected = param1;
         this.reDraw();
      }
      
      public function get selected() : Boolean
      {
         return this._radioButton.selected;
      }
      
      private function reDraw() : void
      {
         if(this._radioButton.selected)
         {
            if(Boolean(this._content) && !this._content.parent)
            {
               this._content.y = this.height;
               addChild(this._content);
            }
         }
         else if(Boolean(this._content) && Boolean(this._content.parent))
         {
            this._content.parent.removeChild(this._content);
         }
      }
      
      public function set index(param1:int) : void
      {
         this._index = param1;
      }
      
      public function get index() : int
      {
         return this._index;
      }
   }
}

