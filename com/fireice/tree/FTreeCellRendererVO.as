package com.fireice.tree
{
   public dynamic class FTreeCellRendererVO
   {
      
      private var _parentNode:FTreeCellRendererVO;
      
      private var _childNodes:Array;
      
      private var _hasParentNode:Boolean;
      
      private var _hasChildNodes:Boolean;
      
      private var _label:String;
      
      public function FTreeCellRendererVO()
      {
         super();
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      public function get hasChildNodes() : Boolean
      {
         return this._hasChildNodes;
      }
      
      public function get hasParentNodes() : Boolean
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
      
      public function get parentNode() : FTreeCellRendererVO
      {
         return this._parentNode;
      }
      
      public function set parentNode(param1:FTreeCellRendererVO) : void
      {
         this._parentNode = param1;
         if(this._parentNode != null)
         {
            this._hasParentNode = true;
         }
      }
   }
}

