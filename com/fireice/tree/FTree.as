package com.fireice.tree
{
   import com.fireice.base.FUIComponent;
   import com.fireice.event.FTreeEvent;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class FTree extends FUIComponent
   {
      
      public static const NODE_OPEN:String = "nodeOpen";
      
      public static const NODE_CLOSE:String = "nodeClose";
      
      private var _treeWidth:Number = 100;
      
      private var _treeHeight:Number = 200;
      
      private var _dataProvider:*;
      
      protected var xmlProvider:XML;
      
      private var _itemRenderer:*;
      
      public var maxLevel:int;
      
      private var _selectItem:Object;
      
      protected var treeCellRendererVOArrayProvider:Array;
      
      protected var treeCellRendererArray:Array;
      
      protected var treeCellRendererList:Array;
      
      protected var treeContainer:Sprite;
      
      public function FTree()
      {
         super();
         this.init();
      }
      
      public function get selectItem() : Object
      {
         return this._selectItem;
      }
      
      public function get itemRenderer() : *
      {
         return this._itemRenderer;
      }
      
      public function set itemRenderer(param1:*) : void
      {
         this._itemRenderer = param1;
      }
      
      public function get treeHeight() : Number
      {
         return this._treeHeight;
      }
      
      public function set treeHeight(param1:Number) : void
      {
         this._treeHeight = param1;
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,this._treeWidth,this._treeHeight);
         graphics.endFill();
      }
      
      public function get treeWidth() : Number
      {
         return this._treeWidth;
      }
      
      public function set treeWidth(param1:Number) : void
      {
         this._treeWidth = param1;
         graphics.clear();
         graphics.beginFill(0,0);
         graphics.drawRect(0,0,this._treeWidth,this._treeHeight);
         graphics.endFill();
      }
      
      protected function init() : void
      {
         this.initListener();
      }
      
      protected function initListener() : void
      {
         this.addEventListener(FTreeEvent.CLICK_NODE,this.onClickNode);
      }
      
      protected function removeListener() : void
      {
         this.removeEventListener(FTreeEvent.CLICK_NODE,this.onClickNode);
      }
      
      protected function onClickNode(param1:FTreeEvent) : void
      {
         this._selectItem = param1.item.data;
         this.drawLayout();
         this.resetSelected(param1);
      }
      
      protected function resetSelected(param1:FTreeEvent) : void
      {
         var _loc2_:FTreeCellRenderer = null;
         for each(_loc2_ in this.treeCellRendererList)
         {
            if(param1.item != _loc2_)
            {
               _loc2_.unSelected();
            }
         }
      }
      
      protected function drawLayout() : void
      {
         var _loc2_:FTreeCellRenderer = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.treeCellRendererArray.length)
         {
            _loc2_ = this.treeCellRendererArray[_loc1_];
            if(_loc1_ == 0)
            {
               _loc2_.y = 0;
            }
            else
            {
               _loc2_.y = this.treeCellRendererArray[_loc1_ - 1].y + this.treeCellRendererArray[_loc1_ - 1].height;
            }
            _loc1_++;
         }
      }
      
      protected function updateAllNode() : void
      {
         var _loc1_:FTreeCellRenderer = null;
         for each(_loc1_ in this.treeCellRendererList)
         {
            _loc1_.updateRenderer(this._treeWidth);
         }
      }
      
      protected function drawUI() : void
      {
         var _loc2_:FTreeCellRenderer = null;
         if(this.treeContainer == null)
         {
            this.treeContainer = new Sprite();
            this.addChild(this.treeContainer);
         }
         while(this.treeContainer.numChildren > 0)
         {
            this.treeContainer.removeChildAt(0);
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.treeCellRendererArray.length)
         {
            _loc2_ = this.treeCellRendererArray[_loc1_];
            this.treeContainer.addChild(_loc2_);
            _loc1_++;
         }
         this.drawLayout();
         this.updateAllNode();
      }
      
      protected function resolveXMLData(param1:XML) : void
      {
         var _loc2_:XML = null;
         this.treeCellRendererVOArrayProvider = [];
         for each(_loc2_ in param1.elements())
         {
            this.treeCellRendererVOArrayProvider.push(this.splitXMLDataToVO(null,_loc2_));
         }
         this.resolveArrayData(this.treeCellRendererVOArrayProvider);
      }
      
      protected function splitXMLDataToVO(param1:FTreeCellRendererVO, param2:XML) : FTreeCellRendererVO
      {
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:XML = null;
         var _loc3_:FTreeCellRendererVO = new FTreeCellRendererVO();
         _loc3_.label = param2.@label;
         for each(_loc4_ in param2.attributes())
         {
            _loc5_ = String(_loc4_.name());
            _loc6_ = String(_loc4_.toString());
            if(_loc5_ != "label")
            {
               _loc3_[_loc5_] = _loc6_;
            }
         }
         if(param1 != null)
         {
            _loc3_.parentNode = param1;
         }
         if(param2.elements().length() > 0)
         {
            _loc3_.childNodes = [];
            for each(_loc7_ in param2.elements())
            {
               _loc3_.childNodes.push(this.splitXMLDataToVO(_loc3_,_loc7_));
            }
         }
         return _loc3_;
      }
      
      protected function resolveArrayData(param1:Array) : void
      {
         var _loc2_:FTreeCellRendererVO = null;
         this.treeCellRendererArray = [];
         this.treeCellRendererList = [];
         for each(_loc2_ in param1)
         {
            this.treeCellRendererArray.push(this.splitVOToRenderer(0,null,_loc2_));
         }
         this.drawUI();
      }
      
      protected function splitVOToRenderer(param1:int, param2:FTreeCellRenderer, param3:FTreeCellRendererVO) : FTreeCellRenderer
      {
         var _loc4_:FTreeCellRenderer = null;
         var _loc5_:Class = null;
         var _loc6_:FTreeCellRendererVO = null;
         if(this._itemRenderer == null)
         {
            _loc4_ = new FTreeCellRenderer();
         }
         else
         {
            _loc5_ = getDefinitionByName(getQualifiedClassName(this._itemRenderer)) as Class;
            _loc4_ = new _loc5_() as FTreeCellRenderer;
         }
         if(param2 != null)
         {
            _loc4_.parentNode = param2;
         }
         _loc4_.level = param1;
         if(param3.hasChildNodes)
         {
            _loc4_.childNodes = [];
            param1++;
            this.maxLevel = param1;
            for each(_loc6_ in param3.childNodes)
            {
               _loc4_.childNodes.push(this.splitVOToRenderer(param1,_loc4_,_loc6_));
            }
            _loc4_.drawChildrenDisplay();
         }
         _loc4_.data = param3;
         this.treeCellRendererList.push(_loc4_);
         return _loc4_;
      }
      
      public function showNodeByLabel(param1:String) : Boolean
      {
         var _loc2_:FTreeCellRenderer = null;
         var _loc3_:MouseEvent = null;
         var _loc4_:FTreeEvent = null;
         for each(_loc2_ in this.treeCellRendererList)
         {
            if(_loc2_.data.label == param1)
            {
               this.openParent(_loc2_);
               _loc2_.clickNode();
               _loc3_ = new MouseEvent(MouseEvent.CLICK);
               dispatchEvent(_loc3_);
               _loc4_ = new FTreeEvent(FTreeEvent.CLICK_NODE,_loc2_);
               this.onClickNode(_loc4_);
               return true;
            }
         }
         return false;
      }
      
      private function openParent(param1:FTreeCellRenderer) : void
      {
         var _loc2_:FTreeCellRenderer = null;
         if(param1.data.hasParentNodes)
         {
            _loc2_ = param1.parentNode;
            _loc2_.clickNode();
            this.openParent(_loc2_);
         }
      }
      
      public function get dataProvider() : *
      {
         return this._dataProvider;
      }
      
      public function set dataProvider(param1:*) : void
      {
         this._dataProvider = param1;
         if(param1 is XML)
         {
            this.xmlProvider = param1;
            this.resolveXMLData(param1);
            return;
         }
         if(param1 is Array)
         {
            this.treeCellRendererVOArrayProvider = param1;
            this.resolveArrayData(param1);
            return;
         }
      }
   }
}

