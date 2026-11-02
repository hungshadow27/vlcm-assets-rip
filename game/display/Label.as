package game.display
{
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFieldType;
   import flash.text.TextFormat;
   import game.base.ISkin;
   import game.base.Istate;
   import game.common.UIState;
   
   public class Label extends TextField implements ISkin, Istate
   {
      
      public static const FILTER_BLACK:Array = [new GlowFilter(0,0.8,2,2,14,BitmapFilterQuality.LOW)];
      
      public static const FILTER_WHITE:Array = [new GlowFilter(16777215,0.8,2,2,14,BitmapFilterQuality.LOW)];
      
      public static const DEFAULT_FORMAT:Object = {
         "align":"left",
         "bold":false,
         "color":16777215,
         "font":"SimSun",
         "italic":false,
         "leading":0,
         "letterSpacing":0,
         "size":12,
         "underline":false
      };
      
      private var _defaultFormat:TextFormat;
      
      private var _skin:Object;
      
      private var _width:Number;
      
      private var _height:Number;
      
      private var _state:String;
      
      private var _defaultText:String;
      
      public function Label()
      {
         super();
         this.mouseEnabled = false;
         this.mouseWheelEnabled = false;
         this.selectable = false;
         this.autoSize = TextFieldAutoSize.LEFT;
      }
      
      override public function set type(param1:String) : void
      {
         super.type = param1;
         if(param1 == TextFieldType.INPUT)
         {
            this.mouseEnabled = true;
            this.selectable = true;
            addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
            addEventListener(Event.CHANGE,this.onChange);
            autoSize = TextFieldAutoSize.NONE;
         }
         else
         {
            this.mouseEnabled = false;
            this.selectable = false;
         }
      }
      
      private function onFocusOut(param1:FocusEvent) : void
      {
         if(text == "" && Boolean(this._defaultText))
         {
            this.text = this._defaultText;
         }
         addEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
         addEventListener(Event.CHANGE,this.onChange);
      }
      
      private function onChange(param1:Event) : void
      {
         if(text == "" && Boolean(this._defaultText))
         {
            this.text = this._defaultText;
         }
      }
      
      private function onFocusIn(param1:FocusEvent) : void
      {
         if(this._defaultText != "" && text == this._defaultText)
         {
            this.text = "";
         }
         removeEventListener(Event.CHANGE,this.onChange);
         addEventListener(FocusEvent.FOCUS_OUT,this.onFocusOut);
         removeEventListener(FocusEvent.FOCUS_IN,this.onFocusIn);
      }
      
      public function set skin(param1:Object) : void
      {
         this._skin = param1;
         this.autoSize = TextFieldAutoSize.NONE;
         this.name = this._skin.name;
         this.state = UIState.STATE_NORMAL;
      }
      
      public function get skin() : Object
      {
         return this._skin;
      }
      
      override public function set text(param1:String) : void
      {
         super.text = param1;
         this.updataSkinContent(param1);
      }
      
      override public function set htmlText(param1:String) : void
      {
         super.htmlText = param1;
         this.updataSkinContent(param1);
      }
      
      private function updataSkinContent(param1:String) : void
      {
         if(!this.skin)
         {
            return;
         }
         if(this.skin.normal)
         {
            this.skin.normal.content = param1;
         }
         if(this.skin.over)
         {
            this.skin.over.content = param1;
         }
         if(this.skin.down)
         {
            this.skin.down.content = param1;
         }
         if(this.skin.disable)
         {
            this.skin.disable.content = param1;
         }
      }
      
      private function updateDefaultTextFormat(param1:Object) : void
      {
         var _loc3_:String = null;
         var _loc2_:TextFormat = new TextFormat();
         for(_loc3_ in param1)
         {
            _loc2_[_loc3_] = param1[_loc3_];
         }
         this.defaultTextFormat = _loc2_;
      }
      
      private function updateFilter(param1:int) : void
      {
         if(param1 == 0)
         {
            this.filters = FILTER_WHITE;
         }
         else
         {
            this.filters = FILTER_BLACK;
         }
      }
      
      public function set state(param1:String) : void
      {
         if(this._skin[param1] != null)
         {
            this._state = param1;
            this.updateState();
         }
      }
      
      public function get state() : String
      {
         return this._state;
      }
      
      private function updateState() : void
      {
         var _loc1_:Object = this._skin[this._state];
         this.x = this._skin.x + _loc1_.x;
         this.y = this._skin.y + _loc1_.y;
         this.width = _loc1_.width;
         this.height = _loc1_.height;
         this.updateDefaultTextFormat(_loc1_.format);
         this.updateFilter(int(this.defaultTextFormat.color));
         this.htmlText = _loc1_.content;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this.mouseEnabled = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this.mouseEnabled;
      }
      
      public function set defaultText(param1:String) : void
      {
         this._defaultText = param1;
         if(text == "")
         {
            this.text = this._defaultText;
         }
      }
   }
}

