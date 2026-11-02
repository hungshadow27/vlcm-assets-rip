package game.display
{
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class ComboBox extends Container
   {
      
      private var _btn:Button;
      
      private var _label:Label;
      
      private var _list:List;
      
      private var _listInitY:int;
      
      private var _scrollBar:ScrollBar;
      
      private var _stage:Stage;
      
      private var _listItemClass:Class;
      
      private var _listData:Array;
      
      private var _data:Object;
      
      private var _isListShow:Boolean;
      
      public function ComboBox()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this._stage = this.stage;
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         if(this._isListShow == true)
         {
            this.hideList();
            this._stage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
         }
         this._stage = null;
      }
      
      override protected function createVariableReference() : void
      {
         this._btn = getChildByName("btn") as Button;
         this._label = getChildByName("label") as Label;
         this._label.enabled = true;
         this._list = getChildByName("list") as List;
         this._list.verticalGap = 0;
         this._list.horizontalGap = 0;
         this._listInitY = this._list.y;
         this._scrollBar = getChildByName("scrollBar") as ScrollBar;
         if(this._scrollBar != null)
         {
            this._scrollBar.mode = ScrollBar.MODE_HIDE_BAR;
         }
         this.hideList();
         this.addChildEventListener();
      }
      
      private function addChildEventListener() : void
      {
         if(this._scrollBar != null)
         {
            this._scrollBar.addEventListener(MouseEvent.CLICK,this.onScrollClick);
         }
         this._label.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this._btn.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this._list.addEventListener(Event.CHANGE,this.onListChange);
      }
      
      private function onScrollClick(param1:MouseEvent) : void
      {
         param1.stopPropagation();
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         if(this._isListShow == false)
         {
            this.showList();
            this._stage.addEventListener(MouseEvent.CLICK,this.onStageClick);
         }
         else
         {
            this.hideList();
            this._stage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
         }
      }
      
      private function showList() : void
      {
         this._list.y = this._listInitY;
         addChild(this._list);
         if(this._scrollBar != null)
         {
            addChild(this._scrollBar);
            this._scrollBar.target = this._list;
         }
         this._isListShow = true;
      }
      
      private function hideList() : void
      {
         removeChild(this._list);
         if(this._scrollBar != null)
         {
            removeChild(this._scrollBar);
         }
         this._isListShow = false;
      }
      
      private function onListChange(param1:Event) : void
      {
         var _loc2_:ComboBoxListItemRender = this._list.selection as ComboBoxListItemRender;
         this._data = _loc2_.data;
         this._label.text = _loc2_.label;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      private function onStageClick(param1:MouseEvent) : void
      {
         this.hideList();
         this._stage.removeEventListener(MouseEvent.CLICK,this.onStageClick);
      }
      
      public function set ListItemRenderClass(param1:Class) : void
      {
         this._listItemClass = param1;
      }
      
      public function set DataSource(param1:Array) : void
      {
         var _loc4_:ComboBoxListItemRender = null;
         var _loc5_:Object = null;
         this._list.removeAllItem();
         this._listData = param1;
         var _loc2_:int = int(this._listData.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new this._listItemClass() as ComboBoxListItemRender;
            this._list.addChild(_loc4_);
            _loc5_ = this._listData[_loc3_];
            _loc4_.data = _loc5_;
            _loc3_++;
         }
      }
      
      public function set selectIndex(param1:int) : void
      {
         this._list.selectIndex = param1;
      }
      
      public function get selectIndex() : int
      {
         return this._list.selectIndex;
      }
      
      public function set selection(param1:ComboBoxListItemRender) : void
      {
         this._list.selection = param1;
      }
      
      public function get selection() : ComboBoxListItemRender
      {
         return this._list.selection as ComboBoxListItemRender;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function get text() : String
      {
         return this._label.text;
      }
      
      public function set text(param1:String) : void
      {
         this._label.text = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         super.enabled = param1;
         this._btn.enabled = param1;
         this._label.enabled = param1;
      }
   }
}

