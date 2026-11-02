package game.display
{
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import game.base.Istate;
   import game.common.UIState;
   
   public class SimpleButton extends Container implements Istate
   {
      
      private var _state:String;
      
      private var _image:Image;
      
      private var _enabled:Boolean;
      
      public function SimpleButton()
      {
         super();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.enabled = true;
      }
      
      private function addMouseEventListener() : void
      {
         addEventListener(MouseEvent.ROLL_OVER,this.onMouseEvent);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
      }
      
      private function removeMouseEventListener() : void
      {
         removeEventListener(MouseEvent.ROLL_OVER,this.onMouseEvent);
         removeEventListener(MouseEvent.ROLL_OUT,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
      }
      
      protected function onMouseEvent(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.ROLL_OUT:
               this.state = UIState.STATE_NORMAL;
               break;
            case MouseEvent.ROLL_OVER:
               this.state = UIState.STATE_OVER;
               break;
            case MouseEvent.MOUSE_DOWN:
               this.state = UIState.STATE_DOWN;
               break;
            case MouseEvent.MOUSE_UP:
               this.state = UIState.STATE_OVER;
         }
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
         if(param1 == true)
         {
            this.addMouseEventListener();
            this.state = UIState.STATE_NORMAL;
         }
         else
         {
            this.removeMouseEventListener();
            this.state = UIState.STATE_DISABLE;
         }
      }
      
      override public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set state(param1:String) : void
      {
         var _loc4_:Istate = null;
         this._state = param1;
         var _loc2_:int = this.numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.getChildAt(_loc3_) as Istate;
            if(_loc4_ != null)
            {
               _loc4_.state = this._state;
            }
            _loc3_++;
         }
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      override protected function createVariableReference() : void
      {
         this._image = this.getChildByType(Image) as Image;
      }
      
      private function getChildByType(param1:Class) : DisplayObject
      {
         var _loc4_:DisplayObject = null;
         var _loc2_:int = this.numChildren;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.getChildAt(_loc3_);
            if(_loc4_ is param1)
            {
               return _loc4_;
            }
            _loc3_++;
         }
         return null;
      }
      
      override public function set width(param1:Number) : void
      {
      }
      
      override public function set height(param1:Number) : void
      {
      }
   }
}

