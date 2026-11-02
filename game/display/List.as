package game.display
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class List extends Container
   {
      
      public static const ITEM_PREFIX:String = "item_";
      
      public static const ORIENTATION_COLUMN:int = 0;
      
      public static const ORIENTATION_ROW:int = 1;
      
      public static const DEFAULT_GAP:int = 3;
      
      private var _itemList:Vector.<ListItemRender>;
      
      private var _itemSkin:Object;
      
      private var _horizontalGap:int;
      
      private var _verticalGap:int;
      
      private var _columnCount:int;
      
      private var _rowCount:int;
      
      private var _orientation:int;
      
      private var _selectedItem:ListItemRender;
      
      private var _itemClass:Class;
      
      public function List()
      {
         super();
         this._itemList = new Vector.<ListItemRender>();
         this._orientation = 0;
         this._columnCount = 1;
         this._rowCount = int.MAX_VALUE;
         this._horizontalGap = DEFAULT_GAP;
         this._verticalGap = DEFAULT_GAP;
      }
      
      override public function set skin(param1:Object) : void
      {
         this._itemSkin = param1.item;
         super.skin = param1;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = super.addChild(param1);
         var _loc3_:ListItemRender = _loc2_ as ListItemRender;
         if(_loc3_ != null)
         {
            _loc3_.skin = this._itemSkin;
            this.addItemToList(_loc3_);
         }
         return _loc2_;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc4_:int = 0;
         var _loc3_:ListItemRender = param1 as ListItemRender;
         if(_loc3_ != null)
         {
            _loc3_.skin = this._itemSkin;
            _loc4_ = this.findInsertIndex(param2);
            this.addItemToList(_loc3_,_loc4_);
         }
         return super.addChildAt(param1,param2);
      }
      
      public function set ItemClass(param1:Class) : void
      {
         this._itemClass = param1;
      }
      
      private function findInsertIndex(param1:int) : int
      {
         var _loc4_:ListItemRender = null;
         var _loc5_:int = 0;
         var _loc2_:int = int(this._itemList.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._itemList[_loc3_];
            _loc5_ = getChildIndex(_loc4_);
            if(_loc5_ >= param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChild(param1);
         var _loc3_:ListItemRender = _loc2_ as ListItemRender;
         if(_loc3_ != null)
         {
            this.removeItemFromList(_loc3_);
         }
         return _loc2_;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChildAt(param1);
         var _loc3_:ListItemRender = _loc2_ as ListItemRender;
         if(_loc3_ != null)
         {
            this.removeItemFromList(_loc3_);
         }
         return _loc2_;
      }
      
      public function removeAllItem() : void
      {
         var _loc1_:ListItemRender = null;
         for each(_loc1_ in this._itemList)
         {
            super.removeChild(_loc1_);
            this.removeItemEventListener(_loc1_);
         }
         this._itemList.length = 0;
      }
      
      private function deployItem() : void
      {
         var _loc3_:ListItemRender = null;
         var _loc1_:int = int(this._itemList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._itemList[_loc2_];
            if(this._orientation == ORIENTATION_COLUMN)
            {
               _loc3_.x = _loc2_ % this._columnCount * (_loc3_.width + this._horizontalGap);
               _loc3_.y = int(_loc2_ / this._columnCount) * (_loc3_.height + this._verticalGap);
            }
            else if(this._orientation == ORIENTATION_ROW)
            {
               _loc3_.x = int(_loc2_ / this._rowCount) * (_loc3_.width + this._horizontalGap);
               _loc3_.y = _loc2_ % this._rowCount * (_loc3_.height + this._verticalGap);
            }
            _loc3_.index = _loc2_;
            _loc3_.name = ITEM_PREFIX + _loc2_;
            _loc2_++;
         }
      }
      
      private function addItemToList(param1:ListItemRender, param2:int = 2147483647) : void
      {
         var _loc3_:int = this._itemList.indexOf(param1);
         if(_loc3_ == -1)
         {
            this._itemList.splice(param2,0,param1);
            this.addItemEventListener(param1);
            this.deployItem();
            this.updateItemIndex();
         }
      }
      
      private function removeItemFromList(param1:ListItemRender) : void
      {
         var _loc2_:int = this._itemList.indexOf(param1);
         if(_loc2_ > -1)
         {
            this._itemList.splice(_loc2_,1);
            this.removeItemEventListener(param1);
            this.deployItem();
            this.updateItemIndex();
         }
      }
      
      private function updateItemIndex() : void
      {
         var _loc3_:ListItemRender = null;
         var _loc1_:int = int(this._itemList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._itemList[_loc2_];
            _loc3_.index = _loc2_;
            _loc2_++;
         }
      }
      
      private function addItemEventListener(param1:ListItemRender) : void
      {
         param1.addEventListener(MouseEvent.CLICK,this.onItemClick);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:ListItemRender = param1.currentTarget as ListItemRender;
         if(_loc2_ == this._selectedItem)
         {
            return;
         }
         this.selection = _loc2_;
      }
      
      private function removeItemEventListener(param1:ListItemRender) : void
      {
         param1.removeEventListener(MouseEvent.CLICK,this.onItemClick);
      }
      
      public function set selection(param1:ListItemRender) : void
      {
         if(this._selectedItem != null)
         {
            this._selectedItem.selected = false;
         }
         this._selectedItem = param1;
         this._selectedItem.selected = true;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get selection() : ListItemRender
      {
         return this._selectedItem;
      }
      
      public function set selectIndex(param1:int) : void
      {
         if(param1 < 0 || param1 > this._itemList.length - 1)
         {
            throw new ArgumentError("索引值越界！");
         }
         var _loc2_:ListItemRender = this._itemList[param1];
         if(this.selection != _loc2_)
         {
            this.selection = _loc2_;
         }
      }
      
      public function get selectIndex() : int
      {
         return this._itemList.indexOf(this.selection);
      }
      
      public function get items() : Vector.<ListItemRender>
      {
         return this._itemList;
      }
      
      public function get horizontalGap() : int
      {
         return this._horizontalGap;
      }
      
      public function set horizontalGap(param1:int) : void
      {
         this._horizontalGap = param1;
      }
      
      public function get verticalGap() : int
      {
         return this._verticalGap;
      }
      
      public function set verticalGap(param1:int) : void
      {
         this._verticalGap = param1;
      }
      
      public function get columnCount() : int
      {
         return this._columnCount;
      }
      
      public function set columnCount(param1:int) : void
      {
         this._columnCount = param1;
      }
      
      public function get rowCount() : int
      {
         return this._rowCount;
      }
      
      public function set rowCount(param1:int) : void
      {
         this._rowCount = param1;
      }
      
      public function get orientation() : int
      {
         return this._orientation;
      }
      
      public function set orientation(param1:int) : void
      {
         this._orientation = param1;
         this._columnCount = int.MAX_VALUE;
         this._rowCount = 1;
      }
      
      public function set DataSource(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ListItemRender = null;
         this.removeAllItem();
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new this._itemClass() as ListItemRender;
            this.addChild(_loc4_);
            _loc4_.data = param1[_loc2_];
            _loc2_++;
         }
         this.deployItem();
      }
      
      public function get DataSource() : Array
      {
         var _loc2_:int = 0;
         var _loc1_:Array = [];
         var _loc3_:int = int(this._itemList.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc1_.push(this._itemList[_loc2_].data);
            _loc2_++;
         }
         return _loc1_.reverse();
      }
   }
}

