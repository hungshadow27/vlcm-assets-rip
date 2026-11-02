package game.display
{
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class DragBar extends Component
   {
      
      private static const STAGE_OFFSET:int = 30;
      
      private var _parent:Sprite;
      
      private var _stage:Stage;
      
      private var _isDragging:Boolean;
      
      private var _dragRectangle:Rectangle;
      
      public function DragBar()
      {
         super();
         this._isDragging = false;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      public function set setDragRectangle(param1:Rectangle) : void
      {
         this._dragRectangle = param1;
      }
      
      private function onAddToStage(param1:Event) : void
      {
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._parent = this.parent as Sprite;
         this._stage = this.stage;
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         if(this._isDragging == true)
         {
            this.endDrag();
         }
         this._parent = null;
         this._stage = null;
      }
      
      private function onMouseDown(param1:MouseEvent) : void
      {
         if(this.parent.parent != null)
         {
            this.parent.parent.addChild(this.parent);
         }
         this.beginDrag();
      }
      
      private function onMouseUp(param1:MouseEvent) : void
      {
         this.endDrag();
      }
      
      private function beginDrag() : void
      {
         this._parent.startDrag(false,this._dragRectangle);
         this._stage.addEventListener(Event.MOUSE_LEAVE,this.onMouseUp);
         this._stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._isDragging = true;
      }
      
      private function endDrag() : void
      {
         this._parent.stopDrag();
         this.adjustParentPosition();
         this._stage.removeEventListener(Event.MOUSE_LEAVE,this.onMouseUp);
         this._stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._isDragging = false;
      }
      
      private function adjustParentPosition() : void
      {
         if(this._parent.y < 0)
         {
            this._parent.y = 0;
         }
         else if(this._parent.y > this._stage.stageHeight - STAGE_OFFSET)
         {
            this._parent.y = this._stage.stageHeight - this._parent.height;
         }
         if(this._parent.x < -this._parent.width + STAGE_OFFSET)
         {
            this._parent.x = 0;
         }
         else if(this._parent.x > this._stage.stageWidth - STAGE_OFFSET)
         {
            this._parent.x = this._stage.stageWidth - this._parent.width;
         }
      }
      
      override protected function createVariableReference() : void
      {
         this.createHotArea();
      }
      
      private function createHotArea() : void
      {
         var _loc1_:Graphics = this.graphics;
         _loc1_.beginFill(0,0);
         _loc1_.drawRect(0,0,this.width,this.height);
         _loc1_.endFill();
      }
   }
}

