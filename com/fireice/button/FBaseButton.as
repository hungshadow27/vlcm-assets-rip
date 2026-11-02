package com.fireice.button
{
   import com.fireice.init.SkinInit;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   
   public class FBaseButton extends FBaseSimpleButton
   {
      
      protected var _left:Number = 8;
      
      protected var _top:Number = 4;
      
      protected var _right:Number = 8;
      
      protected var _bottom:Number = 4;
      
      protected var _label:FLabel;
      
      protected var _skin:String;
      
      protected var _border:Boolean;
      
      protected var _borderColor:uint = 3591;
      
      public function FBaseButton(param1:F9GridBitmap, param2:F9GridBitmap, param3:F9GridBitmap, param4:String = "按钮")
      {
         super(param1,param2,param3);
         this._label = new FLabel();
         this._label.mouseEnabled = false;
         this._label.text = param4;
         addChild(this._label);
         this._label.x = 8;
         this._label.y = 4;
         super.width = this._label.width + 16;
         super.height = this._label.height + 8;
         this.skin = "button";
      }
      
      public function set paddingLeft(param1:int) : void
      {
         this._label.x = param1;
         this._left = param1;
         super.width = this._label.width + param1 + this._right;
      }
      
      public function set paddingTop(param1:int) : void
      {
         this._label.y = param1;
         this._top = param1;
         super.height = this._label.height + param1 + this._bottom;
      }
      
      public function set paddingRight(param1:int) : void
      {
         this._right = param1;
         super.width = this._left + this._label.width + param1;
      }
      
      public function set paddingBottom(param1:int) : void
      {
         this._bottom = param1;
         super.height = this._label.height + this._top + param1;
      }
      
      public function set color(param1:uint) : void
      {
         this._label.textColor = param1;
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
         super.width = this._label.width + this._left + this._right;
         super.height = this._label.height + this._top + this._bottom;
      }
      
      public function get label() : String
      {
         return this._label.text;
      }
      
      public function set border(param1:Boolean) : void
      {
         this._border = param1;
         if(param1)
         {
            this._label.filters = [new GlowFilter(this._borderColor,1,3,3,15,BitmapFilterQuality.LOW)];
         }
         else
         {
            this._label.filters = [];
         }
      }
      
      public function set borderColor(param1:uint) : void
      {
         this._borderColor = param1;
      }
      
      override public function set skin(param1:String) : void
      {
         var skinXml:XML = null;
         var xml:XML = null;
         var value:String = param1;
         this._skin = value;
         skinXml = SkinInit.getSkinConfigByName(value);
         xml = skinXml.upImage[0];
         try
         {
            up = Tools.get9GridBitmpByName(xml);
         }
         catch(e:Error)
         {
            trace("加载按钮皮肤" + value + "错误");
         }
         xml = skinXml.overImage[0];
         try
         {
            over = Tools.get9GridBitmpByName(xml);
         }
         catch(e:Error)
         {
            xml = skinXml.upImage[0];
            over = Tools.get9GridBitmpByName(xml);
         }
         xml = skinXml.downImage[0];
         try
         {
            down = Tools.get9GridBitmpByName(xml);
         }
         catch(e:Error)
         {
            xml = skinXml.upImage[0];
            down = Tools.get9GridBitmpByName(xml);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this._label.width = param1 - this._left - this._right;
      }
      
      public function set align(param1:String) : void
      {
         if(param1 == "center")
         {
            this._label.x = (super.width - this._label.width) / 2;
         }
      }
      
      override public function set height(param1:Number) : void
      {
         super.height = param1;
         this._label.height = param1 - this._top - this._bottom;
      }
      
      override public function clone() : Object
      {
         var _loc1_:FBaseButton = new FBaseButton(null,null,null);
         _loc1_.skin = this._skin;
         _loc1_.color = this._label.textColor;
         _loc1_.label = this._label.text;
         _loc1_.border = this._border;
         _loc1_.borderColor = this._borderColor;
         _loc1_.paddingTop = this._top;
         _loc1_.paddingBottom = this._bottom;
         _loc1_.paddingLeft = this._left;
         _loc1_.paddingRight = this._right;
         _loc1_.width = width;
         _loc1_.height = height;
         return _loc1_;
      }
   }
}

