package com.tgame.common.ui.componets.rollText
{
   import flash.display.Sprite;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   
   public class RollTextFace extends Sprite
   {
      
      private static var filter:Array = [new GlowFilter(3591,1,4,4,4,BitmapFilterQuality.LOW)];
      
      public var maxShowCount:int = 1;
      
      public var showCount:int;
      
      private var _text:String;
      
      public function RollTextFace(param1:String = "", param2:int = 1)
      {
         var _loc3_:TextField = null;
         super();
         this._text = param1;
         this.maxShowCount = param2;
         this.showCount = 0;
         _loc3_ = new TextField();
         _loc3_.mouseEnabled = false;
         _loc3_.autoSize = TextFieldAutoSize.LEFT;
         _loc3_.textColor = 16777215;
         _loc3_.filters = filter;
         _loc3_.htmlText = this._text;
         var _loc4_:TextFormat = new TextFormat();
         _loc4_.size = 18;
         _loc3_.setTextFormat(_loc4_);
         this.addChild(_loc3_);
      }
      
      public function clone() : RollTextFace
      {
         return new RollTextFace(this._text,this.maxShowCount);
      }
   }
}

