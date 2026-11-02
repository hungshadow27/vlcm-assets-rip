package game.display
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextFieldAutoSize;
   
   public class ToolTip extends Container
   {
      
      public static var Skin:Object;
      
      protected var _text:Label;
      
      protected var _backgroud:ScaleImage;
      
      protected var _data:String;
      
      protected var _target:DisplayObject;
      
      public function ToolTip()
      {
         super();
         if(ToolTip.Skin)
         {
            this.skin = ToolTip.Skin;
         }
      }
      
      override protected function createVariableReference() : void
      {
         this._text = getChildByName("content") as Label;
         this._text.wordWrap = false;
         this._text.autoSize = TextFieldAutoSize.LEFT;
         this._backgroud = getChildByName("backgroud") as ScaleImage;
      }
      
      protected function get label() : Label
      {
         if(!this._text)
         {
            this._text = new Label();
            this._text.wordWrap = false;
            this._text.autoSize = TextFieldAutoSize.LEFT;
            this._text.textColor = 16777215;
            this._text.filters = Label.FILTER_BLACK;
            addChild(this._text);
            this._text.x = this._text.y = 4;
         }
         return this._text;
      }
      
      protected function get backgroud() : ScaleImage
      {
         if(!this._backgroud)
         {
            this._backgroud = new ScaleImage(new ScaleBitmapData(new BitmapData(10,10,false,0)));
            addChildAt(this._backgroud,0);
         }
         return this._backgroud;
      }
      
      public function set tips(param1:String) : void
      {
         this._data = param1;
         this.label.htmlText = this._data;
         this.backgroud.width = this.label.width + this.label.x * 2;
         this.backgroud.height = this.label.height + this.label.y * 2;
      }
      
      public function get tips() : String
      {
         return this._data;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         this._target = param1;
         this._target.addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this._target.addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
      }
      
      public function get target() : DisplayObject
      {
         return this._target;
      }
      
      public function removeTarget() : void
      {
         this._target.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         this._target.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         this._target = null;
      }
      
      protected function onMouse(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               if(this._target.stage)
               {
                  this._target.stage.addChild(this);
                  _loc4_ = new Point();
                  _loc4_ = this._target.localToGlobal(_loc4_);
                  x = _loc4_.x;
                  y = _loc4_.y - height;
                  this._target.addEventListener(Event.ENTER_FRAME,this.onMouse);
               }
               break;
            case Event.ENTER_FRAME:
               _loc2_ = this._target.stage.mouseX + 10;
               _loc3_ = this.target.stage.mouseY - 10 - this.height;
               if(_loc2_ + this.width > this._target.stage.stageWidth)
               {
                  _loc2_ = this._target.stage.mouseX - this.width - 10;
               }
               if(_loc3_ < 0)
               {
                  _loc3_ = this._target.stage.mouseY + 30;
               }
               this.x += (_loc2_ - this.x) * 0.5;
               this.y += (_loc3_ - this.y) * 0.5;
               break;
            case MouseEvent.MOUSE_OUT:
               if(parent)
               {
                  parent.removeChild(this);
                  this._target.removeEventListener(Event.ENTER_FRAME,this.onMouse);
               }
         }
      }
   }
}

