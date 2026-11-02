package game.display
{
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class RadioButtonGroup extends Container
   {
      
      private var _btnList:Vector.<RadioButton>;
      
      private var _selectedBtn:RadioButton;
      
      private var _selectedIndex:int;
      
      public function RadioButtonGroup()
      {
         super();
         this._btnList = new Vector.<RadioButton>();
      }
      
      override protected function createVariableReference() : void
      {
         this.selection = this.findFirstBtn();
      }
      
      private function findFirstBtn() : RadioButton
      {
         var _loc2_:RadioButton = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.numChildren)
         {
            _loc2_ = getChildAt(_loc1_) as RadioButton;
            if(_loc2_ != null)
            {
               return _loc2_;
            }
            _loc1_++;
         }
         return _loc2_;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = super.addChild(param1);
         var _loc3_:RadioButton = _loc2_ as RadioButton;
         if(_loc3_ != null)
         {
            this.addBtnEventListener(_loc3_);
            this.addToBtnList(_loc3_);
         }
         return _loc2_;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         var _loc3_:DisplayObject = super.addChildAt(param1,param2);
         var _loc4_:RadioButton = _loc3_ as RadioButton;
         if(_loc4_ != null)
         {
            this.addBtnEventListener(_loc4_);
            this.addToBtnList(_loc4_);
         }
         return _loc3_;
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChild(param1);
         var _loc3_:RadioButton = _loc2_ as RadioButton;
         if(_loc3_ != null)
         {
            this.removeBtnEventListener(_loc3_);
            this.removeFromBtnList(_loc3_);
         }
         return _loc2_;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChildAt(param1);
         var _loc3_:RadioButton = _loc2_ as RadioButton;
         if(_loc3_ != null)
         {
            this.removeBtnEventListener(_loc3_);
            this.removeFromBtnList(_loc3_);
         }
         return _loc2_;
      }
      
      private function addToBtnList(param1:RadioButton) : void
      {
         this._btnList.push(param1);
      }
      
      private function removeFromBtnList(param1:RadioButton) : void
      {
         var _loc2_:int = this._btnList.indexOf(param1);
         if(_loc2_ > -1)
         {
            this._btnList.splice(_loc2_,1);
         }
      }
      
      private function addBtnEventListener(param1:RadioButton) : void
      {
         param1.addEventListener(MouseEvent.CLICK,this.onBtnClick);
      }
      
      private function removeBtnEventListener(param1:RadioButton) : void
      {
         param1.removeEventListener(MouseEvent.CLICK,this.onBtnClick);
      }
      
      private function onBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:RadioButton = param1.currentTarget as RadioButton;
         if(this.selection != _loc2_)
         {
            this.selection = _loc2_;
            this.rearrangeBtnListDepth();
         }
      }
      
      private function rearrangeBtnListDepth() : void
      {
         var _loc2_:RadioButton = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc1_:int = int.MAX_VALUE;
         for each(_loc2_ in this._btnList)
         {
            _loc5_ = getChildIndex(_loc2_);
            if(_loc5_ < _loc1_)
            {
               _loc1_ = _loc5_;
            }
         }
         _loc3_ = int(this._btnList.length);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            setChildIndex(this._btnList[_loc4_],_loc1_ + _loc4_);
            _loc4_++;
         }
         setChildIndex(this._selectedBtn,_loc1_ + _loc3_ - 1);
      }
      
      public function set selection(param1:RadioButton) : void
      {
         if(this._selectedBtn != null)
         {
            this._selectedBtn.selected = false;
         }
         this._selectedBtn = param1;
         this._selectedBtn.selected = true;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function get selection() : RadioButton
      {
         return this._selectedBtn;
      }
      
      public function set selectIndex(param1:int) : void
      {
         if(param1 < 0 || param1 > this._btnList.length - 1)
         {
            throw new ArgumentError("按钮索引值越界！");
         }
         var _loc2_:RadioButton = this._btnList[param1];
         if(this.selection != _loc2_)
         {
            this.selection = _loc2_;
         }
      }
      
      public function get selectIndex() : int
      {
         return this._btnList.indexOf(this.selection);
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         var _loc2_:RadioButton = null;
         super.enabled = param1;
         for each(_loc2_ in this._btnList)
         {
            _loc2_.enabled = param1;
         }
      }
   }
}

