package com.fireice.tree
{
   import com.fireice.base.FUIComponent;
   import com.fireice.event.FTreeEvent;
   import com.fireice.init.SkinInit;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class FTreeCellRenderer extends FUIComponent
   {
      
      private var mouseArea:Sprite;
      
      private var bg:Sprite;
      
      private var tile:F9GridBitmap;
      
      private var selectBg:F9GridBitmap;
      
      private var overBg:F9GridBitmap;
      
      private var _data:FTreeCellRendererVO;
      
      private var _parentNode:FTreeCellRenderer;
      
      private var _childNodes:Array;
      
      private var _hasParentNode:Boolean;
      
      private var _hasChildNodes:Boolean;
      
      private var _openIcon:F9GridBitmap;
      
      private var _closeIcon:F9GridBitmap;
      
      private var _level:int;
      
      private var paddingX:int = 10;
      
      public var nodeStatus:String = "nodeClose";
      
      private var _isSelected:Boolean;
      
      private var _maxMaskX:Number;
      
      private var _maskHeight:Number;
      
      private var _maskX:Number;
      
      protected var icon:Sprite;
      
      protected var labelTextField:TextField;
      
      protected var childrenContainer:Sprite;
      
      protected var overColor:uint = 0;
      
      protected var selectColor:uint = 0;
      
      public function FTreeCellRenderer()
      {
         super();
         this.buttonMode = true;
         var _loc1_:XML = SkinInit.getSkinConfigByName("tree");
         var _loc2_:XML = _loc1_.openIcon[0];
         this._openIcon = Tools.get9GridBitmpByName(_loc2_);
         _loc2_ = _loc1_.closeIcon[0];
         this._closeIcon = Tools.get9GridBitmpByName(_loc2_);
         _loc2_ = _loc1_.tileImage[0];
         this.tile = Tools.get9GridBitmpByName(_loc2_);
         addChild(this.tile);
         _loc2_ = _loc1_.selectImage[0];
         this.selectBg = Tools.get9GridBitmpByName(_loc2_);
         addChild(this.selectBg);
         _loc2_ = _loc1_.overImage[0];
         this.overBg = Tools.get9GridBitmpByName(_loc2_);
         addChild(this.overBg);
         this.tile.visible = true;
         this.overBg.visible = false;
         this.selectBg.visible = false;
         this.initUI();
         this.initListener();
      }
      
      public function get closeIcon() : F9GridBitmap
      {
         return this._closeIcon.clone();
      }
      
      public function set closeIcon(param1:F9GridBitmap) : void
      {
         this._closeIcon = param1;
      }
      
      public function get openIcon() : F9GridBitmap
      {
         return this._openIcon.clone();
      }
      
      public function set openIcon(param1:F9GridBitmap) : void
      {
         this._openIcon = param1;
      }
      
      protected function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      protected function initUI() : void
      {
         this.mouseArea = new Sprite();
         this.icon = new Sprite();
         this.labelTextField = new TextField();
         this.labelTextField.tabEnabled = false;
         this.labelTextField.multiline = false;
         this.labelTextField.selectable = false;
         this.labelTextField.mouseEnabled = false;
         this.labelTextField.autoSize = TextFieldAutoSize.LEFT;
      }
      
      public function updateRenderer(param1:Number) : void
      {
         this._maskX = this._level * 10 * -1;
         this._maxMaskX = param1;
         var _loc2_:Number = param1;
         this.setMouseArea(this._maskX,_loc2_);
         this.tile.width = this.selectBg.width = this.overBg.width = _loc2_;
         this.tile.height = this.selectBg.height = this.overBg.height = this._maskHeight;
         this.tile.x = this.selectBg.x = this.overBg.x = this._maskX;
      }
      
      protected function setBg(param1:Number, param2:Number) : void
      {
         this.bg.graphics.clear();
         this.bg.graphics.beginFill(0,0);
         this.bg.graphics.drawRect(param1,0,param2,this._maskHeight);
         this.bg.graphics.endFill();
      }
      
      protected function setMouseArea(param1:Number, param2:Number) : void
      {
         this.mouseArea.graphics.clear();
         this.mouseArea.graphics.beginFill(0,0);
         this.mouseArea.graphics.drawRect(param1,0,param2,this._maskHeight);
         this.mouseArea.graphics.endFill();
      }
      
      protected function setMouseOverBg() : void
      {
         this.tile.visible = false;
         this.overBg.visible = true;
         this.selectBg.visible = false;
      }
      
      protected function setMouseOutBg() : void
      {
         this.tile.visible = true;
         this.overBg.visible = false;
         this.selectBg.visible = false;
      }
      
      protected function setSelectedBg() : void
      {
         this.tile.visible = false;
         this.overBg.visible = false;
         this.selectBg.visible = true;
      }
      
      protected function initListener() : void
      {
         this.addEventListener(FTreeEvent.CLICK_NODE,this.otherClickNode);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         this.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      protected function removeListener() : void
      {
         this.removeEventListener(FTreeEvent.CLICK_NODE,this.otherClickNode);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.onClick);
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      protected function setOpenIcon() : void
      {
         this._openIcon.visible = false;
         this._closeIcon.visible = true;
      }
      
      protected function setCloseIcon() : void
      {
         this._openIcon.visible = true;
         this._closeIcon.visible = false;
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         param1.stopPropagation();
         this.clickNode();
         this.dispatchEvent(new FTreeEvent(FTreeEvent.CLICK_NODE,this,true));
      }
      
      public function clickNode() : void
      {
         this.selected();
         if(!this.isOpen())
         {
            this.open();
         }
         else
         {
            this.close();
         }
      }
      
      public function selected() : void
      {
         this._isSelected = true;
         this.setSelectedBg();
      }
      
      public function unSelected() : void
      {
         this._isSelected = false;
         this.setMouseOutBg();
      }
      
      protected function open() : void
      {
         if(this.hasChildNodes)
         {
            if(this.isOpen() == false)
            {
               this.setOpenIcon();
               this.nodeStatus = FTree.NODE_OPEN;
               this.childrenContainer.y = this.height;
               this.addChild(this.childrenContainer);
            }
         }
      }
      
      protected function close() : void
      {
         if(this.hasChildNodes)
         {
            if(this.isOpen() == true)
            {
               this.setCloseIcon();
               this.nodeStatus = FTree.NODE_CLOSE;
               this.removeChild(this.childrenContainer);
            }
         }
      }
      
      public function isOpen() : Boolean
      {
         if(!this._hasChildNodes)
         {
            return false;
         }
         if(this.nodeStatus == FTree.NODE_OPEN)
         {
            return true;
         }
         if(this.nodeStatus == FTree.NODE_CLOSE)
         {
            return false;
         }
         return false;
      }
      
      protected function otherClickNode(param1:FTreeEvent) : void
      {
         this.drawLayout();
      }
      
      protected function onMouseOver(param1:MouseEvent) : void
      {
         if(mouseX < this._maskX || mouseX > this._maxMaskX || mouseY < 0 || mouseY > this._maskHeight)
         {
            return;
         }
         if(!this._isSelected)
         {
            this.setMouseOverBg();
         }
      }
      
      protected function onMouseOut(param1:MouseEvent) : void
      {
         if(!this._isSelected)
         {
            this.setMouseOutBg();
         }
      }
      
      protected function resloveData() : void
      {
         this.drawData();
      }
      
      protected function drawData() : void
      {
         var _loc1_:Sprite = this.icon as Sprite;
         if(this._hasChildNodes)
         {
            _loc1_.addChild(this._closeIcon);
            _loc1_.addChild(this._openIcon);
         }
         this.addChild(_loc1_);
         this.itemRender();
         this.addChild(this.labelTextField);
         this.addChild(this.mouseArea);
         this._maskHeight = Math.max(this.labelTextField.height,_loc1_.height);
      }
      
      public function itemRender() : void
      {
         var _loc1_:TextFormat = new TextFormat();
         _loc1_.color = 16777215;
         this.labelTextField.defaultTextFormat = _loc1_;
         this.labelTextField.text = this.data.label;
         this.labelTextField.x = this.icon.width;
         this.labelTextField.y = 0;
      }
      
      public function drawChildrenDisplay() : void
      {
         var _loc2_:FTreeCellRenderer = null;
         this.childrenContainer = new Sprite();
         var _loc1_:int = 0;
         while(_loc1_ < this._childNodes.length)
         {
            _loc2_ = this._childNodes[_loc1_];
            this.childrenContainer.addChild(_loc2_);
            _loc1_++;
         }
         this.drawLayout();
      }
      
      protected function drawLayout() : void
      {
         var _loc2_:FTreeCellRenderer = null;
         if(!this._hasChildNodes)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this._childNodes.length)
         {
            _loc2_ = this._childNodes[_loc1_];
            if(_loc1_ == 0)
            {
               _loc2_.y = 0;
            }
            else
            {
               _loc2_.y = this._childNodes[_loc1_ - 1].y + this._childNodes[_loc1_ - 1].height;
            }
            _loc1_++;
         }
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set level(param1:int) : void
      {
         this._level = param1;
         if(param1 != 0)
         {
            this.x = this.paddingX;
         }
      }
      
      public function get hasChildNodes() : Boolean
      {
         return this._hasChildNodes;
      }
      
      public function get hasParentNode() : Boolean
      {
         return this._hasParentNode;
      }
      
      public function get childNodes() : Array
      {
         return this._childNodes;
      }
      
      public function set childNodes(param1:Array) : void
      {
         this._childNodes = param1;
         this._hasChildNodes = true;
      }
      
      public function get parentNode() : FTreeCellRenderer
      {
         return this._parentNode;
      }
      
      public function set parentNode(param1:FTreeCellRenderer) : void
      {
         this._parentNode = param1;
         if(this._parentNode != null)
         {
            this._hasParentNode = true;
         }
      }
      
      public function get data() : FTreeCellRendererVO
      {
         return this._data;
      }
      
      public function set data(param1:FTreeCellRendererVO) : void
      {
         this._data = param1;
         if(this._data != null)
         {
            this.resloveData();
         }
      }
   }
}

