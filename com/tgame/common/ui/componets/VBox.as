package com.tgame.common.ui.componets
{
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   
   public class VBox extends Sprite
   {
      
      private var _verticalGap:int;
      
      public function VBox(param1:int = 0)
      {
         super();
         this._verticalGap = param1;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         super.addChild(param1);
         this.layout();
         return param1;
      }
      
      private function layout() : void
      {
         var _loc4_:DisplayObject = null;
         var _loc1_:Array = this.getChildren(this);
         var _loc2_:Number = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc1_.length)
         {
            _loc4_ = _loc1_[_loc3_] as DisplayObject;
            _loc4_.y = _loc2_;
            _loc2_ += _loc4_.height + this.verticalGap;
            _loc3_++;
         }
      }
      
      private function getChildren(param1:DisplayObjectContainer) : Array
      {
         var _loc2_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            _loc2_.push(param1.getChildAt(_loc3_));
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get verticalGap() : int
      {
         return this._verticalGap;
      }
   }
}

