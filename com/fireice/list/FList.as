package com.fireice.list
{
   import com.fireice.base.FUIComponent;
   import com.fireice.event.FListEvent;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class FList extends FUIComponent
   {
      
      private var _dataProvider:Array = [];
      
      private var _itemRenderer:FListCellRenderer;
      
      private var fListcellRendererArray:Array = [];
      
      private var _selectItem:Object;
      
      private var _width:Number = 10;
      
      private var _height:Number = 10;
      
      private var _skin:String;
      
      private var _useCellRealHeight:Boolean;
      
      public function FList()
      {
         super();
         this._useCellRealHeight = false;
         this.init();
      }
      
      public function set skin(param1:String) : void
      {
         this._skin = param1;
      }
      
      public function set listWidth(param1:Number) : void
      {
         this._width = param1;
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
      }
      
      public function set listHeight(param1:Number) : void
      {
         this._height = param1;
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
      }
      
      public function set isUseCellRealHeight(param1:Boolean) : void
      {
         this._useCellRealHeight = true;
      }
      
      public function get selectItem() : Object
      {
         return this._selectItem;
      }
      
      private function init() : void
      {
         this.initListener();
      }
      
      private function initListener() : void
      {
         addEventListener(FListEvent.CLICK_CELL,this.onCellClick);
      }
      
      private function onCellClick(param1:FListEvent) : void
      {
         var _loc2_:FListCellRenderer = null;
         this._selectItem = param1.item.data;
         for each(_loc2_ in this.fListcellRendererArray)
         {
            if(param1.target != _loc2_)
            {
               _loc2_.unSelect();
            }
         }
      }
      
      public function getAllRenders() : Array
      {
         return this.fListcellRendererArray;
      }
      
      public function get itemRenderer() : FListCellRenderer
      {
         return this._itemRenderer;
      }
      
      public function set itemRenderer(param1:FListCellRenderer) : void
      {
         this._itemRenderer = param1;
      }
      
      public function get dataProvider() : *
      {
         return this._dataProvider;
      }
      
      private function reInitUI(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:FListCellRenderer = null;
         var _loc6_:Class = null;
         this._dataProvider = param1;
         this.fListcellRendererArray = [];
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
         var _loc3_:int = int(param1.length);
         var _loc5_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this._itemRenderer == null)
            {
               _loc4_ = new FListCellRenderer();
            }
            else
            {
               _loc6_ = getDefinitionByName(getQualifiedClassName(this._itemRenderer)) as Class;
               _loc4_ = new _loc6_() as FListCellRenderer;
            }
            _loc4_.updataRender(this._width);
            if(this._skin != "" && this._skin != null)
            {
               _loc4_.skin = this._skin;
            }
            _loc4_.data = param1[_loc2_];
            _loc4_.y = _loc5_;
            if(this._useCellRealHeight)
            {
               _loc5_ += _loc4_.height;
            }
            else
            {
               _loc5_ += _loc4_._height;
            }
            addChild(_loc4_);
            this.fListcellRendererArray.push(_loc4_);
            _loc2_++;
         }
      }
      
      private function xmlToObj(param1:XML) : Object
      {
         var _loc4_:int = 0;
         var _loc2_:XMLList = param1.@*;
         var _loc3_:Object = {};
         var _loc5_:int = _loc2_.length();
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc3_[_loc2_[_loc4_].name().toString()] = _loc2_[_loc4_].toString();
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function initUIforXml(param1:XML) : void
      {
         var _loc2_:int = 0;
         var _loc6_:XML = null;
         var _loc3_:int = param1.children().length();
         var _loc4_:Array = [];
         var _loc5_:XMLList = param1.children();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc6_ = _loc5_[_loc2_];
            _loc4_.push(this.xmlToObj(_loc6_));
            _loc2_++;
         }
         this.reInitUI(_loc4_);
      }
      
      public function setSelectItemByIndex(param1:int) : void
      {
         (getChildAt(param1) as FListCellRenderer).select();
         this._selectItem = (getChildAt(param1) as FListCellRenderer).data;
      }
      
      public function setSelcetNext() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = numChildren;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if((getChildAt(_loc1_) as FListCellRenderer).selectState)
            {
               (getChildAt(_loc1_) as FListCellRenderer).unSelect();
               if(_loc1_ + 1 == _loc2_)
               {
                  _loc1_ = 0;
               }
               else
               {
                  _loc1_ += 1;
               }
               (getChildAt(_loc1_) as FListCellRenderer).select();
               this._selectItem = (getChildAt(_loc1_) as FListCellRenderer).data;
            }
            _loc1_++;
         }
      }
      
      public function setSelectPrevious() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = numChildren;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            if((getChildAt(_loc1_) as FListCellRenderer).selectState)
            {
               (getChildAt(_loc1_) as FListCellRenderer).unSelect();
               if(_loc1_ == 0)
               {
                  _loc1_ = _loc2_ - 1;
               }
               else
               {
                  _loc1_--;
               }
               (getChildAt(_loc1_) as FListCellRenderer).select();
               this._selectItem = (getChildAt(_loc1_) as FListCellRenderer).data;
            }
            _loc1_++;
         }
      }
      
      public function setSelectItemByLabel(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((getChildAt(_loc2_) as FListCellRenderer).data.label == param1)
            {
               (getChildAt(_loc2_) as FListCellRenderer).select();
               this._selectItem = (getChildAt(_loc2_) as FListCellRenderer).data;
            }
            else
            {
               (getChildAt(_loc2_) as FListCellRenderer).unSelect();
            }
            _loc2_++;
         }
      }
      
      public function getCellRenderByLabel(param1:String) : FListCellRenderer
      {
         var _loc2_:int = 0;
         var _loc3_:int = numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if((getChildAt(_loc2_) as FListCellRenderer).data.label == param1)
            {
               return getChildAt(_loc2_) as FListCellRenderer;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function set dataProvider(param1:Object) : void
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         if(param1 is Vector.<*>)
         {
            _loc2_ = [];
            _loc3_ = 0;
            while(_loc3_ < param1.length)
            {
               _loc2_.push(param1[_loc3_]);
               _loc3_++;
            }
            param1 = _loc2_;
         }
         if(param1 is Array)
         {
            this.reInitUI(param1 as Array);
         }
         else if(param1 is XML)
         {
            this.initUIforXml(param1 as XML);
         }
         else
         {
            this.reInitUI([]);
         }
         this._selectItem = null;
      }
      
      public function getDataProvider() : Array
      {
         return this._dataProvider;
      }
   }
}

