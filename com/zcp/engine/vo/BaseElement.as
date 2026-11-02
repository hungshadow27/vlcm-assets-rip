package com.zcp.engine.vo
{
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObjectContainer;
   
   public class BaseElement
   {
      
      public var id:int = 0;
      
      public var name:String = "";
      
      public var tile_width:Number = 25;
      
      public var tile_height:Number = 25;
      
      private var _piexl_x:Number = 0;
      
      private var _piexl_y:Number = 0;
      
      private var _tile_x:int = 0;
      
      private var _tile_y:int = 0;
      
      public var data:Object;
      
      public var showContainer:ShowContainer;
      
      private var _useContainer:Boolean = false;
      
      public function BaseElement()
      {
         super();
      }
      
      public function get piexl_x() : Number
      {
         return this._piexl_x;
      }
      
      public function set piexl_x(param1:Number) : void
      {
         this._piexl_x = param1;
         this._tile_x = this._piexl_x / this.tile_width;
         if(this.showContainer != null && this.showContainer.x != this._piexl_x)
         {
            this.showContainer.x = this._piexl_x;
         }
      }
      
      public function get piexl_y() : Number
      {
         return this._piexl_y;
      }
      
      public function set piexl_y(param1:Number) : void
      {
         this._piexl_y = param1;
         this._tile_y = this._piexl_y / this.tile_height;
         if(this.showContainer != null && this.showContainer.y != this._piexl_y)
         {
            this.showContainer.y = this._piexl_y;
         }
      }
      
      public function get tile_x() : int
      {
         return this._tile_x;
      }
      
      public function set tile_x(param1:int) : void
      {
         this._tile_x = param1;
         this._piexl_x = this._tile_x * this.tile_width;
         if(this.showContainer != null && this.showContainer.x != this._piexl_x)
         {
            this.showContainer.x = this._piexl_x;
         }
      }
      
      public function get tile_y() : int
      {
         return this._tile_y;
      }
      
      public function set tile_y(param1:int) : void
      {
         this._tile_y = param1;
         this._piexl_y = this._tile_y * this.tile_height;
         if(this.showContainer != null && this.showContainer.y != this._piexl_y)
         {
            this.showContainer.y = this._piexl_y;
         }
      }
      
      public function get useContainer() : Boolean
      {
         return this._useContainer;
      }
      
      public function enableContainer(param1:DisplayObjectContainer = null) : void
      {
         this._useContainer = true;
         if(this.showContainer == null)
         {
            this.showContainer = new ShowContainer(this);
            this.showContainer.x = this._piexl_x;
            this.showContainer.y = this._piexl_y;
         }
         if(param1 != null && this.showContainer.parent != param1)
         {
            param1.addChild(this.showContainer);
         }
      }
      
      public function disableContainer() : void
      {
         this._useContainer = false;
         if(this.showContainer != null)
         {
            if(this.showContainer.parent != null)
            {
               this.showContainer.parent.removeChild(this.showContainer);
            }
            Fun.clearChildren(this.showContainer,false);
            this.showContainer = null;
         }
      }
   }
}

