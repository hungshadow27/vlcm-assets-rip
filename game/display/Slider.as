package game.display
{
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class Slider extends Container
   {
      
      private static var Vertical:String = "Vertical";
      
      private static var Horizontal:String = "Horizontal";
      
      private var _stage:Stage;
      
      private var _isBtnDrag:Boolean;
      
      private var _btn:SimpleButton;
      
      private var _track:Image;
      
      private var _mask:Shape;
      
      private var _value:Number;
      
      private var _boundOffset:Number = 0;
      
      private var _dragRect:Rectangle;
      
      private var _maxValue:int = 1;
      
      private var _type:String;
      
      public function Slider()
      {
         super();
         this._isBtnDrag = false;
         this._value = 0;
         this._dragRect = new Rectangle();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this._stage = this.stage;
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         if(this._isBtnDrag == true)
         {
            this.endDrag();
         }
         this._stage = null;
      }
      
      override protected function createVariableReference() : void
      {
         this._btn = getChildByName("btn") as SimpleButton;
         this._track = getChildByName("track") as Image;
         if(this._track.width > this._track.height)
         {
            this._type = Horizontal;
         }
         else
         {
            this._type = Vertical;
         }
         this.updateDragRect();
         this.updateBtnPosition();
         this.addBtnEventListener();
      }
      
      private function updateDragRect() : void
      {
         if(this._type == Vertical)
         {
            this._dragRect.x = this._btn.x;
            this._dragRect.y = this._track.y - this._boundOffset;
            this._dragRect.width = 0;
            this._dragRect.height = this._track.height - this._btn.height + this._boundOffset + this._boundOffset;
         }
         else
         {
            this._dragRect.x = this._track.x - this._boundOffset;
            this._dragRect.y = this._btn.y;
            this._dragRect.width = this._track.width - this._btn.width + this._boundOffset + this._boundOffset;
            this._dragRect.height = 0;
         }
      }
      
      private function createTrackMask() : void
      {
         this._mask = new Shape();
         this._mask.name = "mask";
         var _loc1_:Graphics = this._mask.graphics;
         _loc1_.beginFill(0);
         _loc1_.drawRect(0,0,this._track.width,this._track.height);
         _loc1_.endFill();
         this._mask.x = this._track.x;
         this._mask.y = this._track.y;
      }
      
      private function updateMask() : void
      {
         this._mask.width = this._btn.x + (this._btn.width >> 1) - this._track.x;
      }
      
      private function updateBtnPosition() : void
      {
         if(this._type == Vertical)
         {
            this._btn.y = this._dragRect.y + this._value / this._maxValue * this._dragRect.height;
         }
         else
         {
            this._btn.x = this._dragRect.x + this._value / this._maxValue * this._dragRect.width;
         }
      }
      
      private function addBtnEventListener() : void
      {
         this._btn.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this._btn.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         this.beginDrag();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.endDrag();
      }
      
      private function beginDrag() : void
      {
         this._btn.startDrag(false,this._dragRect);
         this._stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this._isBtnDrag = true;
      }
      
      private function endDrag() : void
      {
         this._btn.stopDrag();
         this._stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this._isBtnDrag = false;
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function set value(param1:Number) : void
      {
         this._value = param1;
         this.updateBtnPosition();
      }
      
      public function get value() : Number
      {
         if(this._type == Vertical)
         {
            this._value = this._maxValue * (this._btn.y - this._dragRect.y) / this._dragRect.height;
         }
         else
         {
            this._value = this._maxValue * (this._btn.x - this._dragRect.x) / this._dragRect.width;
         }
         return this._value;
      }
      
      public function set boundOffset(param1:Number) : void
      {
         this._boundOffset = param1;
         this.updateDragRect();
         this.updateBtnPosition();
      }
      
      public function get boundOffset() : Number
      {
         return this._boundOffset;
      }
      
      public function get maxValue() : int
      {
         return this._maxValue;
      }
      
      public function set maxValue(param1:int) : void
      {
         this._maxValue = param1;
      }
   }
}

