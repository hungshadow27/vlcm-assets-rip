package game.display
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class Accordion extends Container
   {
      
      public static const ITEM_PREFIX:String = "header_";
      
      private var _headerList:Vector.<AccordionHeader>;
      
      private var _headerSkin:Object;
      
      private var _selectedHeader:AccordionHeader;
      
      private var _selectedIndex:int;
      
      public function Accordion()
      {
         super();
         this._headerList = new Vector.<AccordionHeader>();
      }
      
      override public function set skin(param1:Object) : void
      {
         this._headerSkin = param1.header;
         super.skin = param1;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = super.addChild(param1);
         var _loc3_:AccordionHeader = _loc2_ as AccordionHeader;
         if(_loc3_ != null)
         {
            _loc3_.skin = this._headerSkin;
            this.addItemToList(_loc3_);
         }
         return _loc2_;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc4_:int = 0;
         var _loc3_:AccordionHeader = param1 as AccordionHeader;
         if(_loc3_ != null)
         {
            _loc3_.skin = this._headerSkin;
            _loc4_ = this.findInsertIndex(param2);
            this.addItemToList(_loc3_,_loc4_);
         }
         return super.addChildAt(param1,param2);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChild(param1);
         var _loc3_:AccordionHeader = _loc2_ as AccordionHeader;
         if(_loc3_ != null)
         {
            this.removeItemFromList(_loc3_);
         }
         return _loc2_;
      }
      
      public function removeAllHeader() : void
      {
         var _loc1_:AccordionHeader = null;
         for each(_loc1_ in this._headerList)
         {
            super.removeChild(_loc1_);
            this.removeItemEventListener(_loc1_);
         }
         this._headerList.length = 0;
      }
      
      public function addHeader(param1:String) : AccordionHeader
      {
         var _loc2_:AccordionHeader = new AccordionHeader();
         this.addChild(_loc2_);
         _loc2_.label = param1;
         return _loc2_;
      }
      
      public function removeHeader(param1:AccordionHeader) : Container
      {
         return this.removeChild(param1) as Container;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChildAt(param1);
         var _loc3_:AccordionHeader = _loc2_ as AccordionHeader;
         if(_loc3_ != null)
         {
            this.removeItemFromList(_loc3_);
         }
         return _loc2_;
      }
      
      private function addItemEventListener(param1:AccordionHeader) : void
      {
         param1.addEventListener(MouseEvent.CLICK,this.onItemClick);
      }
      
      private function removeItemEventListener(param1:AccordionHeader) : void
      {
         param1.removeEventListener(MouseEvent.CLICK,this.onItemClick);
      }
      
      private function onItemClick(param1:MouseEvent) : void
      {
         var _loc2_:AccordionHeader = param1.currentTarget as AccordionHeader;
         if((param1.target as DisplayObject).name != "clickRect")
         {
            return;
         }
         if(this._selectedHeader != _loc2_)
         {
            this.selection = _loc2_;
         }
         else
         {
            this.selection = null;
         }
         this.deployItem();
      }
      
      private function findInsertIndex(param1:int) : int
      {
         var _loc4_:AccordionHeader = null;
         var _loc5_:int = 0;
         var _loc2_:int = int(this._headerList.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._headerList[_loc3_];
            _loc5_ = getChildIndex(_loc4_);
            if(_loc5_ >= param1)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function addItemToList(param1:AccordionHeader, param2:int = 2147483647) : void
      {
         var _loc3_:int = this._headerList.indexOf(param1);
         if(_loc3_ == -1)
         {
            this._headerList.splice(param2,0,param1);
            this.addItemEventListener(param1);
            this.deployItem();
            this.updateItemIndex();
         }
      }
      
      private function removeItemFromList(param1:AccordionHeader) : void
      {
         var _loc2_:int = this._headerList.indexOf(param1);
         if(_loc2_ > -1)
         {
            this._headerList.splice(_loc2_,1);
            this.removeItemEventListener(param1);
            this.deployItem();
            this.updateItemIndex();
         }
      }
      
      private function deployItem() : void
      {
         var _loc4_:AccordionHeader = null;
         var _loc1_:int = int(this._headerList.length);
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_)
         {
            _loc4_ = this._headerList[_loc3_];
            _loc4_.y = _loc2_;
            _loc2_ += _loc4_.height;
            _loc4_.index = _loc3_;
            _loc4_.name = ITEM_PREFIX + _loc3_;
            _loc3_++;
         }
      }
      
      private function updateItemIndex() : void
      {
         var _loc3_:AccordionHeader = null;
         var _loc1_:int = int(this._headerList.length);
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_)
         {
            _loc3_ = this._headerList[_loc2_];
            _loc3_.index = _loc2_;
            _loc2_++;
         }
      }
      
      public function set selection(param1:AccordionHeader) : void
      {
         if(this._selectedHeader != null)
         {
            this._selectedHeader.selected = false;
         }
         this._selectedHeader = param1;
         if(param1)
         {
            this._selectedHeader.selected = true;
         }
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get selection() : AccordionHeader
      {
         return this._selectedHeader;
      }
      
      public function set selectIndex(param1:int) : void
      {
         if(param1 < 0 || param1 > this._headerList.length - 1)
         {
            throw new ArgumentError("按钮索引值越界！");
         }
         var _loc2_:AccordionHeader = this._headerList[param1];
         if(this.selection != _loc2_)
         {
            this.selection = _loc2_;
         }
      }
      
      public function get selectIndex() : int
      {
         return this._headerList.indexOf(this.selection);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         var _loc2_:AccordionHeader = null;
         super.enabled = param1;
         for each(_loc2_ in this._headerList)
         {
            _loc2_.enabled = param1;
         }
      }
   }
}

