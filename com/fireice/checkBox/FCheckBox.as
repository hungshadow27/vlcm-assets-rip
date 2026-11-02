package com.fireice.checkBox
{
   import com.fireice.base.FUIComponent;
   import com.fireice.init.SkinInit;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class FCheckBox extends FUIComponent
   {
      
      private var _selectImg:F9GridBitmap;
      
      private var _unSelectImg:F9GridBitmap;
      
      private var _selectState:Boolean;
      
      private var _showText:TextField;
      
      private var _data:Object;
      
      private var _skin:String;
      
      public function FCheckBox()
      {
         var skinXml:XML;
         var xml:XML;
         super();
         mouseChildren = false;
         this._skin = "checkBox";
         skinXml = SkinInit.getSkinConfigByName("checkBox");
         xml = skinXml.selectImage[0];
         this._selectImg = Tools.get9GridBitmpByName(xml);
         xml = skinXml.unSelectImage[0];
         this._unSelectImg = Tools.get9GridBitmpByName(xml);
         addChild(this._selectImg);
         this._selectImg.visible = false;
         addChild(this._unSelectImg);
         this._showText = new TextField();
         addChild(this._showText);
         with(this._showText)
         {
            selectable = false;
            multiline = false;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = 0;
            x = _selectImg.width;
         }
         addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      public function set skin(param1:String) : void
      {
         this._skin = param1;
         var _loc2_:XML = SkinInit.getSkinConfigByName(param1);
         var _loc3_:XML = _loc2_.selectImage[0];
         if(this._selectImg != null && Boolean(this._selectImg.parent))
         {
            this._selectImg.parent.removeChild(this._selectImg);
         }
         if(this._unSelectImg != null && Boolean(this._unSelectImg.parent))
         {
            this._unSelectImg.parent.removeChild(this._unSelectImg);
         }
         this._selectImg = Tools.get9GridBitmpByName(_loc3_);
         _loc3_ = _loc2_.unSelectImage[0];
         this._unSelectImg = Tools.get9GridBitmpByName(_loc3_);
         addChild(this._selectImg);
         this._selectImg.visible = false;
         addChild(this._unSelectImg);
      }
      
      public function get skin() : String
      {
         return this._skin;
      }
      
      public function get selectState() : Boolean
      {
         return this._selectState;
      }
      
      public function set selectState(param1:Boolean) : void
      {
         this._selectState = param1;
         if(param1)
         {
            this._selectImg.visible = true;
            this._unSelectImg.visible = false;
         }
         else
         {
            this._selectImg.visible = false;
            this._unSelectImg.visible = true;
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(param1)
         {
            filters = [];
            mouseEnabled = true;
            mouseChildren = true;
         }
         else
         {
            filters = Tools.blackWhiteFilter;
            mouseEnabled = false;
            mouseChildren = false;
         }
      }
      
      public function set text(param1:String) : void
      {
         this._showText.text = param1;
         this._showText.y = (this._selectImg.height - this._showText.height) / 2;
      }
      
      public function set textColor(param1:uint) : void
      {
         this._showText.textColor = param1;
      }
      
      public function set border(param1:Boolean) : void
      {
         this._showText.filters = Tools.borderFilter;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.selectState = !this._selectState;
      }
   }
}

