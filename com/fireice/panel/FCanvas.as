package com.fireice.panel
{
   import com.fireice.component.FComponent;
   import com.fireice.init.SkinInit;
   import com.fireice.util.Tools;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class FCanvas extends FComponent
   {
      
      private var _dragAble:Boolean;
      
      private var bg:DisplayObject;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      private var container:Sprite;
      
      public function FCanvas()
      {
         super();
         this.init();
         this.skin = "canvas";
      }
      
      private function init() : void
      {
         this.container = new Sprite();
         super.addChild(this.container);
         this.bg = new Sprite();
         this.bg.name = "bg";
         super.addChild(this.bg);
         graphics.beginFill(0,0.5);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
      }
      
      public function set skin(param1:String) : void
      {
         if(param1 == "")
         {
            return;
         }
         graphics.clear();
         var _loc2_:XML = SkinInit.getSkinConfigByName(param1);
         var _loc3_:XML = _loc2_.backgroundImage[0];
         if(this.bg != null)
         {
            super.removeChild(this.bg);
         }
         this.bg = Tools.get9GridBitmpByName(_loc3_);
         super.addChildAt(this.bg,0);
         if(this._width != 0)
         {
            this.bg.width = this._width;
         }
         if(this._height != 0)
         {
            this.bg.height = this._height;
         }
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         this.container.addChild(param1);
         return param1;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         this.container.addChildAt(param1,param2);
         return param1;
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         return this.container.getChildAt(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return this.container.getChildIndex(param1);
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         return this.container.getChildByName(param1);
      }
      
      override public function get numChildren() : int
      {
         return this.container.numChildren;
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         return this.container.removeChildAt(param1);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         return this.container.removeChild(param1);
      }
      
      override public function set width(param1:Number) : void
      {
         this._width = param1;
         if(this.bg == null)
         {
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,this._width,this._height);
            graphics.endFill();
         }
         else
         {
            this.bg.width = param1;
         }
      }
      
      override public function set height(param1:Number) : void
      {
         this._height = param1;
         if(this.bg == null)
         {
            graphics.beginFill(0,0.5);
            graphics.drawRect(0,0,this._width,this._height);
            graphics.endFill();
         }
         else
         {
            this.bg.height = param1;
         }
      }
   }
}

