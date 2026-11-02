package game.display
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import game.base.ISkin;
   import game.base.ITips;
   
   public class Component extends Sprite implements ISkin, ITips
   {
      
      private var _skin:Object;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _enabled:Boolean;
      
      private var _tip:ToolTip;
      
      private var _state:String;
      
      public function Component()
      {
         super();
      }
      
      private static function createUIByType(param1:String) : ISkin
      {
         var _loc2_:ISkin = null;
         switch(param1)
         {
            case "Image":
               _loc2_ = new Image();
               break;
            case "Button":
               _loc2_ = new Button();
               break;
            case "SimpleButton":
               _loc2_ = new SimpleButton();
               break;
            case "ScaleImage":
               _loc2_ = new ScaleImage();
               break;
            case "Container":
               _loc2_ = new Container();
               break;
            case "List":
               _loc2_ = new List();
               break;
            case "Label":
               _loc2_ = new Label();
               break;
            case "RadioButtonGroup":
               _loc2_ = new RadioButtonGroup();
               break;
            case "RadioButton":
               _loc2_ = new RadioButton();
               break;
            case "ScrollBar":
               _loc2_ = new ScrollBar();
               break;
            case "DragBar":
               _loc2_ = new DragBar();
               break;
            case "Slider":
               _loc2_ = new Slider();
               break;
            case "ComboBox":
               _loc2_ = new ComboBox();
               break;
            case "Stepper":
               _loc2_ = new Stepper();
               break;
            case "ToolTip":
               _loc2_ = new ToolTip();
               break;
            case "Accordion":
               _loc2_ = new Accordion();
               break;
            default:
               throw new Error("未找到类型 " + param1 + " 对应的类");
         }
         return _loc2_;
      }
      
      public function get skin() : Object
      {
         return this._skin;
      }
      
      public function set skin(param1:Object) : void
      {
         this._skin = param1;
         this.name = this._skin.name;
         this.x = this._skin.x;
         this.y = this._skin.y;
         this._width = this._skin.width;
         this._height = this._skin.height;
         if(this._skin.children != null)
         {
            this.createUI(this._skin);
         }
         this.createVariableReference();
      }
      
      public function set toolTip(param1:String) : void
      {
         if(param1 == "" || param1 == null)
         {
            return;
         }
         this.tip.tips = param1;
      }
      
      public function get toolTip() : String
      {
         if(!this._tip)
         {
            return "";
         }
         return this._tip.tips;
      }
      
      protected function get tip() : ToolTip
      {
         if(!this._tip)
         {
            this._tip = new ToolTip();
            this._tip.target = this;
         }
         return this._tip;
      }
      
      private function createUI(param1:Object) : void
      {
         var _loc5_:Object = null;
         var _loc6_:ISkin = null;
         var _loc2_:Array = param1.children;
         if(!_loc2_)
         {
            return;
         }
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
         var _loc3_:int = int(_loc2_.length);
         var _loc4_:* = int(_loc3_ - 1);
         while(_loc4_ >= 0)
         {
            _loc5_ = _loc2_[_loc4_];
            _loc6_ = createUIByType(_loc5_.type);
            _loc6_.skin = _loc5_;
            addChild(_loc6_ as DisplayObject);
            _loc4_--;
         }
      }
      
      protected function createVariableReference() : void
      {
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this._width = param1;
      }
      
      override public function get width() : Number
      {
         if(super.width > 0)
         {
            return super.width;
         }
         return this._width;
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this._height = param1;
      }
      
      override public function get height() : Number
      {
         if(super.height > 0)
         {
            return super.height;
         }
         return this._height;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
         this.mouseChildren = this._enabled;
         this.mouseEnabled = this._enabled;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
   }
}

