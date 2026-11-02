package com.fireice.button
{
   import flash.text.TextFormat;
   
   public class FButton extends FBaseButton
   {
      
      public function FButton()
      {
         super(null,null,null);
      }
      
      override public function clone() : Object
      {
         var _loc1_:FButton = new FButton();
         _loc1_.skin = _skin;
         _loc1_.color = _label.textColor;
         _loc1_.label = _label.text;
         _loc1_.border = _border;
         _loc1_.borderColor = _borderColor;
         _loc1_.paddingTop = _top;
         _loc1_.paddingBottom = _bottom;
         _loc1_.paddingLeft = _left;
         _loc1_.paddingRight = _right;
         _loc1_.width = width;
         _loc1_.height = height;
         return _loc1_;
      }
      
      public function set textFormat(param1:TextFormat) : void
      {
         _label.defaultTextFormat = param1;
      }
      
      public function set textColor(param1:uint) : void
      {
         _label.textColor = param1;
      }
      
      public function set autoSize(param1:String) : void
      {
         _label.autoSize = param1;
      }
   }
}

