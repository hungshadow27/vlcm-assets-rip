package game.display
{
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class ScrollBar extends Container
   {
      
      public static const MODE_HIDE_THUMB:int = 0;
      
      public static const MODE_HIDE_BAR:int = 1;
      
      private var _mode:int;
      
      private var _stage:Stage;
      
      private var _arrowUp:SimpleButton;
      
      private var _arrowDown:SimpleButton;
      
      private var _thumb:Button;
      
      private var _thumbIcon:Image;
      
      private var _track:Container;
      
      private var _scrollStep:int = 5;
      
      private var _target:DisplayObject;
      
      private var _targetLabel:TextField;
      
      private var _isText:Boolean;
      
      private var _targetStartY:int;
      
      private var _maskWidth:Number;
      
      private var _maskHeight:Number;
      
      private var _mask:Shape;
      
      private var _dragRect:Rectangle;
      
      private var _isThumbDrag:Boolean;
      
      public function ScrollBar()
      {
         super();
         this._dragRect = new Rectangle();
         this._scrollStep = 5;
         this._mask = new Shape();
         this._mode = MODE_HIDE_THUMB;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this._stage = this.stage;
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         if(this._isThumbDrag == true)
         {
            this.endDrag();
         }
         this._stage = null;
      }
      
      override protected function createVariableReference() : void
      {
         this._track = getChildByName("track") as Container;
         this._arrowUp = getChildByName("arrowUp") as SimpleButton;
         this._arrowDown = getChildByName("arrowDown") as SimpleButton;
         this._thumb = getChildByName("thumb") as Button;
         this._thumbIcon = getChildByName("thumbIcon") as Image;
         this._thumb.visible = false;
         this._thumb.y = this._track.y;
         if(this._thumbIcon)
         {
            this._thumb.addChild(this._thumbIcon);
         }
         this._maskHeight = this._arrowDown.y + this._arrowDown.height - this._arrowUp.y;
      }
      
      private function addMouseEventListener() : void
      {
         if(this._isText)
         {
            this._targetLabel.addEventListener(Event.SCROLL,this.onTextMouseWheelHander);
            this._targetLabel.addEventListener(Event.CHANGE,this.onTextMouseWheelHander);
         }
         else
         {
            this._target.addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheelHandler);
         }
         this._arrowUp.addEventListener(MouseEvent.CLICK,this.onArrowClick);
         this._arrowDown.addEventListener(MouseEvent.CLICK,this.onArrowClick);
         this._track.addEventListener(MouseEvent.CLICK,this.onTrackClick);
         this._thumb.addEventListener(MouseEvent.MOUSE_DOWN,this.onThumbMouseDown);
         this._thumb.addEventListener(MouseEvent.MOUSE_UP,this.onThumbMouseUp);
         addEventListener(MouseEvent.MOUSE_WHEEL,this.onMouseWheelHandler);
      }
      
      private function onTextMouseWheelHander(param1:Event) : void
      {
         this.update();
      }
      
      private function onMouseWheelHandler(param1:MouseEvent) : void
      {
         if(param1.delta > 0)
         {
            this.scrollOneStep(-this._scrollStep);
         }
         else if(param1.delta < 0)
         {
            this.scrollOneStep(this._scrollStep);
         }
      }
      
      private function onArrowClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this._arrowUp:
               this.scrollOneStep(-this._scrollStep);
               break;
            case this._arrowDown:
               this.scrollOneStep(this._scrollStep);
         }
      }
      
      public function scrollOneStep(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:int = this._track.y;
         var _loc3_:int = this._track.y + this._track.height - this._thumb.height;
         if(this._isText)
         {
            _loc4_ = this._thumb.y + this._dragRect.height / this._targetLabel.maxScrollV * (param1 / this._scrollStep);
         }
         else
         {
            _loc4_ = this._thumb.y + param1;
         }
         this._thumb.y = Math.min(Math.max(_loc4_,_loc2_),_loc3_);
         this.scrollTarget();
      }
      
      public function set scrollStep(param1:int) : void
      {
         if(param1 <= 0)
         {
            return;
         }
         this._scrollStep = param1;
      }
      
      public function get scrollStep() : int
      {
         return this._scrollStep;
      }
      
      private function onTrackClick(param1:MouseEvent) : void
      {
         var _loc2_:int = this._thumb.height >> 1;
         var _loc3_:int = param1.localY;
         var _loc4_:int = Math.min(Math.max(_loc3_,this._track.y + _loc2_),this._track.y + this._track.height - _loc2_);
         this._thumb.y = _loc4_ - _loc2_;
         this.scrollTarget();
      }
      
      private function onThumbMouseDown(param1:MouseEvent) : void
      {
         this.beginDrag();
      }
      
      private function onThumbMouseUp(param1:MouseEvent) : void
      {
         this.endDrag();
      }
      
      private function beginDrag() : void
      {
         this._thumb.startDrag(false,this._dragRect);
         this._stage.addEventListener(MouseEvent.MOUSE_UP,this.onThumbMouseUp);
         this._stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this._isThumbDrag = true;
      }
      
      private function endDrag() : void
      {
         this._thumb.stopDrag();
         this._stage.removeEventListener(MouseEvent.MOUSE_UP,this.onThumbMouseUp);
         this._stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
         this._isThumbDrag = false;
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         this.scrollTarget();
      }
      
      private function scrollTarget() : void
      {
         var _loc1_:Number = (this._thumb.y - this._dragRect.y) / this._dragRect.height;
         if(this._isText)
         {
            this._targetLabel.removeEventListener(Event.SCROLL,this.onTextMouseWheelHander);
            this._targetLabel.scrollV = (this._thumb.y - this._dragRect.y) / (this._dragRect.height / this._targetLabel.maxScrollV);
            this._targetLabel.addEventListener(Event.SCROLL,this.onTextMouseWheelHander);
         }
         else if(this._target.height <= this._maskHeight)
         {
            this._target.y = this._targetStartY;
         }
         else
         {
            this._target.y = this._targetStartY - (this._target.height - this._maskHeight) * _loc1_;
         }
      }
      
      public function scrollToBottom() : void
      {
         var _loc1_:int = this._track.y + this._track.height - this._thumb.height;
         this._thumb.y = _loc1_;
         this.scrollTarget();
      }
      
      public function set target(param1:DisplayObject) : void
      {
         if(!param1)
         {
            return;
         }
         if(this._target != null)
         {
            this._target.y = this._targetStartY;
         }
         this._target = param1;
         this._isText = false;
         if(this._target is TextField)
         {
            this._targetLabel = this._target as TextField;
            this._isText = true;
         }
         else
         {
            this._targetStartY = this._target.y;
            this._mask.x = this._target.x;
            this._mask.y = this._target.y;
            if(this._target.parent != null)
            {
               this._target.parent.addChild(this._mask);
            }
         }
         this.addMouseEventListener();
         this.update();
      }
      
      public function get target() : DisplayObject
      {
         return this._target;
      }
      
      override public function set height(param1:Number) : void
      {
         this._track.height = param1 - this._arrowUp.height - this._arrowDown.height;
         this._arrowDown.y = this._track.y + this._track.height;
         this._maskHeight = param1;
         this.target = this._target;
      }
      
      public function update() : void
      {
         this.updateTargetPosition();
         this.updateMask();
         this.updateThumbHeight();
         this.updateVisibility();
         this.updateThumbPosition();
      }
      
      private function updateTargetPosition() : void
      {
         if(this._isText)
         {
            return;
         }
         if(this._target.height <= this._maskHeight)
         {
            this._target.y = this._targetStartY;
         }
         else if(this._target.y + this._target.height < this._maskHeight + this._targetStartY)
         {
            this._target.y = this._targetStartY + this._maskHeight - this._target.height;
         }
      }
      
      private function updateMask() : void
      {
         if(this._isText)
         {
            return;
         }
         this._maskWidth = this._target.width;
         this.updateMaskShape(this._maskWidth,this._maskHeight);
         this._target.mask = this._mask;
         this._mask.x = this._target.x;
         this._mask.y = this._targetStartY;
      }
      
      private function updateMaskShape(param1:int, param2:int) : void
      {
         var _loc3_:Graphics = this._mask.graphics;
         _loc3_.clear();
         _loc3_.beginFill(0);
         _loc3_.drawRect(0,0,param1,param2);
         _loc3_.endFill();
      }
      
      private function updateThumbHeight() : void
      {
         var _loc1_:int = this._track.height;
         var _loc2_:int = 0;
         var _loc3_:int = this._isText ? this._targetLabel.maxScrollV : int(this._target.height);
         if(this._isText)
         {
            if(this._targetLabel.maxScrollV != 1)
            {
               _loc2_ = _loc1_ * (this._targetLabel.bottomScrollV - this._targetLabel.scrollV) / _loc3_;
            }
            else
            {
               _loc2_ = _loc1_;
            }
         }
         else if(this._target.height > this._maskHeight)
         {
            _loc2_ = _loc1_ * _loc1_ / _loc3_;
         }
         else
         {
            _loc2_ = _loc1_;
         }
         this._thumb.height = _loc2_;
         this.updateThumbIcon();
         this.updateDragRect();
      }
      
      private function updateVisibility() : void
      {
         if(this._thumb.height < this._track.height)
         {
            this.visible = true;
            this._thumb.visible = true;
            this.updateThumbIcon();
         }
         else
         {
            this._thumb.visible = false;
            if(this._mode == MODE_HIDE_BAR)
            {
               this.visible = false;
            }
         }
      }
      
      private function updateThumbPosition() : void
      {
         var _loc1_:Number = NaN;
         if(this._thumb.visible != true)
         {
            return;
         }
         var _loc2_:Number = (this._thumb.y - this._dragRect.y) / this._dragRect.height;
         if(!this._isText)
         {
            _loc1_ = (this._targetStartY - this._target.y) / (this._target.height - this._maskHeight);
            if(_loc2_ > _loc1_)
            {
               this._thumb.y = this._dragRect.y + this._dragRect.height * _loc1_;
            }
         }
         else
         {
            _loc1_ = this._targetLabel.scrollV == 1 ? 0 : this._targetLabel.scrollV / this._targetLabel.maxScrollV;
            this._thumb.y = this._dragRect.y + this._dragRect.height * _loc1_;
         }
      }
      
      private function updateThumbIcon() : void
      {
         if(this._thumbIcon != null)
         {
            this._thumbIcon.x = this._thumb.width - this._thumbIcon.width >> 1;
            this._thumbIcon.y = this._thumb.height - this._thumbIcon.height >> 1;
         }
      }
      
      private function updateDragRect() : void
      {
         this._dragRect.x = this._thumb.x;
         this._dragRect.y = this._track.y;
         this._dragRect.width = 0;
         this._dragRect.height = this._track.height - this._thumb.height;
      }
      
      public function set mode(param1:int) : void
      {
         this._mode = param1;
      }
      
      public function get mode() : int
      {
         return this._mode;
      }
   }
}

