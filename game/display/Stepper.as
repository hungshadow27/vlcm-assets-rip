package game.display
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextFieldType;
   import flash.ui.Keyboard;
   
   public class Stepper extends Container
   {
      
      private static const VALUE_TOKEN:String = "v";
      
      private static const MAXIMUM_TOKEN:String = "m";
      
      private var _txt:Label;
      
      private var _prevBtn:SimpleButton;
      
      private var _nextBtn:SimpleButton;
      
      private var _lastBtn:SimpleButton;
      
      private var _firstBtn:SimpleButton;
      
      private var _editable:Boolean;
      
      private var _minimum:Number;
      
      private var _maximum:Number;
      
      private var _value:Number;
      
      private var _oldValue:Number;
      
      private var _step:Number;
      
      private var _formatter:String;
      
      public function Stepper()
      {
         super();
         this._minimum = 1;
         this._maximum = 10;
         this._step = 1;
         this._value = 0;
         this._oldValue = 0;
         this._formatter = "vv/mm";
      }
      
      override protected function createVariableReference() : void
      {
         this._txt = getChildByName("txt") as Label;
         this._txt.addEventListener(Event.CHANGE,this.onTextChange);
         this._prevBtn = getChildByName("prevBtn") as SimpleButton;
         this._nextBtn = getChildByName("nextBtn") as SimpleButton;
         this._lastBtn = getChildByName("lastBtn") as SimpleButton;
         this._firstBtn = getChildByName("firstBtn") as SimpleButton;
         this.editable = false;
         this.addBtnEventListener();
         this.value = 5;
      }
      
      private function onTextChange(param1:Event) : void
      {
         param1.stopPropagation();
      }
      
      public function addBtnEventListener() : void
      {
         this._nextBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this._prevBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         if(this._firstBtn != null)
         {
            this._firstBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         }
         if(this._lastBtn != null)
         {
            this._lastBtn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         }
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         this._oldValue = this.value;
         var _loc2_:SimpleButton = param1.target as SimpleButton;
         if(!_loc2_.enabled)
         {
            return;
         }
         var _loc3_:Number = 0;
         switch(_loc2_)
         {
            case this._prevBtn:
               _loc3_ = this._value - this._step;
               break;
            case this._nextBtn:
               _loc3_ = this._value + this._step;
               break;
            case this._firstBtn:
               _loc3_ = this._minimum;
               break;
            case this._lastBtn:
               _loc3_ = this._maximum;
         }
         this.value = _loc3_;
         if(this._oldValue != this.value)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function set editable(param1:Boolean) : void
      {
         this._txt.mouseEnabled = param1;
         this._txt.selectable = param1;
         if(param1 == true)
         {
            this._txt.type = TextFieldType.INPUT;
            this._txt.restrict = "0-9\\-\\.\\,";
            this._txt.addEventListener(FocusEvent.FOCUS_IN,this.onTextFocusIn);
            this._txt.addEventListener(KeyboardEvent.KEY_UP,this.onTextKeyUp);
            this._txt.addEventListener(Event.CHANGE,this.onChange);
         }
         else
         {
            this._txt.type = TextFieldType.DYNAMIC;
            this._txt.removeEventListener(FocusEvent.FOCUS_IN,this.onTextFocusIn);
            this._txt.removeEventListener(KeyboardEvent.KEY_UP,this.onTextKeyUp);
            this._txt.removeEventListener(Event.CHANGE,this.onChange);
         }
      }
      
      protected function onChange(param1:Event) : void
      {
         var _loc2_:Number = parseFloat(this._txt.text);
         if(_loc2_ > this._maximum)
         {
            _loc2_ = this._maximum;
            this._txt.text = this._maximum.toString();
         }
         this.value = _loc2_;
         if(this._oldValue != this.value)
         {
            dispatchEvent(new Event(Event.CHANGE));
            this._oldValue = this.value;
         }
      }
      
      private function onTextFocusIn(param1:FocusEvent) : void
      {
         this._oldValue = parseFloat(this._txt.text);
         this._oldValue = isNaN(this._oldValue) ? 0 : this._oldValue;
      }
      
      private function onTextKeyUp(param1:KeyboardEvent) : void
      {
         var _loc2_:Number = NaN;
         if(param1.keyCode == Keyboard.ENTER)
         {
            _loc2_ = parseFloat(this._txt.text);
            this.value = _loc2_;
            if(this._oldValue != this.value)
            {
               dispatchEvent(new Event(Event.CHANGE));
               this._oldValue = this.value;
            }
         }
      }
      
      private function getValidValue(param1:Number) : Number
      {
         if(isNaN(param1) == true)
         {
            return this._value;
         }
         var _loc2_:Number = Number((this._step * Math.round(param1 / this._step)).toFixed(1));
         return Math.min(Math.max(_loc2_,this._minimum),this._maximum);
      }
      
      public function get editable() : Boolean
      {
         return this._editable;
      }
      
      public function set formatter(param1:String) : void
      {
         this._formatter = param1;
      }
      
      public function get formatter() : String
      {
         return this._formatter;
      }
      
      public function set value(param1:Number) : void
      {
         this._value = this.getValidValue(param1);
         this._txt.text = this.generateDisplayStr();
         this.updateBtn();
      }
      
      private function updateBtn() : void
      {
         this.toggleButton(this._prevBtn,true);
         this.toggleButton(this._firstBtn,true);
         this.toggleButton(this._nextBtn,true);
         this.toggleButton(this._lastBtn,true);
         if(this._value == this._minimum)
         {
            this.toggleButton(this._prevBtn,false);
            this.toggleButton(this._firstBtn,false);
         }
         if(this._value == this._maximum)
         {
            this.toggleButton(this._nextBtn,false);
            this.toggleButton(this._lastBtn,false);
         }
      }
      
      private function toggleButton(param1:SimpleButton, param2:Boolean) : void
      {
         if(param1 != null)
         {
            param1.enabled = param2;
         }
      }
      
      private function generateDisplayStr() : String
      {
         var _loc1_:String = "";
         var _loc2_:int = int(this._formatter.match(/v/g).length);
         var _loc3_:int = int(this._formatter.match(/m/g).length);
         _loc1_ = this._formatter.replace(/v+/g,this.padStr(this._value.toString(),_loc2_));
         return _loc1_.replace(/m+/g,this.padStr(this._maximum.toString(),_loc3_));
      }
      
      private function padStr(param1:String, param2:int) : String
      {
         var _loc3_:String = param1;
         var _loc4_:String = "0";
         while(_loc3_.length < param2)
         {
            _loc3_ = _loc4_ + _loc3_;
         }
         return _loc3_;
      }
      
      public function get value() : Number
      {
         return this._value;
      }
      
      public function set step(param1:Number) : void
      {
         this._step = param1;
      }
      
      public function get step() : Number
      {
         return this._step;
      }
      
      public function set minimum(param1:Number) : void
      {
         this._minimum = param1;
         this.value = this._value;
      }
      
      public function get minimum() : Number
      {
         return this._minimum;
      }
      
      public function set maximum(param1:Number) : void
      {
         this._maximum = param1;
         this.value = this._value;
      }
      
      public function get maximum() : Number
      {
         return this._maximum;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this._prevBtn.enabled = param1;
         this._nextBtn.enabled = param1;
         this._txt.mouseEnabled = param1;
         this._txt.selectable = param1;
         if(this._lastBtn != null)
         {
            this._lastBtn.enabled = param1;
         }
         if(this._firstBtn != null)
         {
            this._firstBtn.enabled = param1;
         }
      }
   }
}

