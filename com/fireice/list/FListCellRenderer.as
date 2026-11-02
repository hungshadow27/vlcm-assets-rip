package com.fireice.list
{
   import com.fireice.base.FUIComponent;
   import com.fireice.event.FListEvent;
   import com.fireice.init.SkinInit;
   import com.fireice.text.FLabel;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class FListCellRenderer extends FUIComponent
   {
      
      private var _data:Object;
      
      private var _mask:Sprite;
      
      private var _width:Number = 100;
      
      public var _height:Number = 20;
      
      private var _tile:F9GridBitmap;
      
      private var _over:F9GridBitmap;
      
      private var _select:F9GridBitmap;
      
      private var _selected:Boolean;
      
      public function FListCellRenderer()
      {
         super();
         this._tile = new F9GridBitmap();
         this._over = new F9GridBitmap();
         this._select = new F9GridBitmap();
         addChild(this._tile);
         this._tile.visible = true;
         addChild(this._over);
         this._over.visible = false;
         addChild(this._select);
         this._select.visible = false;
         this.initListener();
         this._mask = new Sprite();
      }
      
      internal function set skin(param1:String) : void
      {
         var _loc2_:XML = SkinInit.getSkinConfigByName(param1);
         var _loc3_:XML = _loc2_.tileImage[0];
         removeChild(this._tile);
         this._tile = Tools.get9GridBitmpByName(_loc3_);
         addChildAt(this._tile,0);
         _loc3_ = _loc2_.overImage[0];
         removeChild(this._over);
         this._over = Tools.get9GridBitmpByName(_loc3_);
         addChildAt(this._over,0);
         this._over.visible = false;
         _loc3_ = _loc2_.selectImage[0];
         removeChild(this._select);
         this._select = Tools.get9GridBitmpByName(_loc3_);
         addChildAt(this._select,0);
         this._select.visible = false;
      }
      
      public function updataRender(param1:Number) : void
      {
         this._width = param1;
         this.reSize();
      }
      
      private function reSize() : void
      {
         this._mask.graphics.clear();
         with(this._mask.graphics)
         {
            clear();
            beginFill(0);
            drawRect(0,0,_width,_height);
            endFill();
         }
         this._tile.width = this._select.width = this._over.width = this._width;
         this._tile.height = this._select.height = this._over.height = this._height;
      }
      
      protected function initListener() : void
      {
         this.addEventListener(MouseEvent.CLICK,this.onClick);
         this.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      protected function removeListener() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.onClick);
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseOver);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseOut);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.select();
         var _loc2_:FListEvent = new FListEvent(FListEvent.CLICK_CELL,this,true);
         dispatchEvent(_loc2_);
      }
      
      private function onMouseOver(param1:MouseEvent) : void
      {
         this._over.visible = true;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         this._over.visible = false;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         this.initUI();
         this.reSize();
      }
      
      public function initUI() : void
      {
         this._height = 25;
         var _loc1_:FLabel = new FLabel();
         addChild(_loc1_);
         _loc1_.textColor = 16777215;
         _loc1_.selectable = false;
         _loc1_.text = this.data.label;
         _loc1_.x = 2;
         _loc1_.y = 2;
      }
      
      public function select() : void
      {
         this._selected = true;
         this._tile.visible = false;
         this._over.visible = false;
         this._select.visible = true;
      }
      
      public function unSelect() : void
      {
         this._selected = false;
         this._tile.visible = true;
         this._over.visible = false;
         this._select.visible = false;
      }
      
      public function get selectState() : Boolean
      {
         return this._selected;
      }
   }
}

