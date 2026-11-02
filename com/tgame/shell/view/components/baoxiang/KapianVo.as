package com.tgame.shell.view.components.baoxiang
{
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   
   public class KapianVo extends Sprite
   {
      
      public static const OVER_F:GlowFilter = new GlowFilter(16436996,0.6,30,30,2,1);
      
      private static const SELECT_F:GlowFilter = new GlowFilter(16436996,0.7,30,30,2,1);
      
      private var item:ItemFace;
      
      private var bg1:Bitmap;
      
      private var bg2:Bitmap;
      
      private var itemX:int = 11;
      
      private var itemY:int = 20;
      
      private var bgW:int;
      
      public var fromX:int = 0;
      
      public var fromY:int = 0;
      
      public var toX:int = 0;
      
      public var toY:int = 0;
      
      private var _isSelected:Boolean;
      
      public function KapianVo(param1:Goods)
      {
         var go:Goods = param1;
         super();
         this.bg1 = StaticValue.getBitmapByClassName("ui.qiankundai.kapai.1");
         this.bg1.x = -this.bg1.width / 2;
         addChildAt(this.bg1,0);
         this.bg2 = StaticValue.getBitmapByClassName("ui.qiankundai.kapai.2");
         this.bg2.x = -this.bg2.width / 2;
         addChildAt(this.bg2,0);
         this.bgW = -this.bg2.width / 2;
         this.item = new ItemFace(go);
         this.item.x = this.itemX + this.bgW;
         this.item.y = this.itemY;
         addChild(this.item);
         this.addEventListener(MouseEvent.MOUSE_OVER,function(param1:MouseEvent):void
         {
            if(item.visible == false)
            {
               if(filters == null || filters.length == 0)
               {
                  filters = [OVER_F];
               }
            }
         });
         this.addEventListener(MouseEvent.MOUSE_OUT,function(param1:MouseEvent):void
         {
            if(!_isSelected)
            {
               filters = null;
            }
         });
      }
      
      public function hiedItem() : void
      {
         this.item.visible = false;
         this.bg1.visible = false;
         this.bg2.visible = true;
      }
      
      public function showItem() : void
      {
         this.item.visible = true;
         this.bg1.visible = true;
         this.bg2.visible = false;
      }
      
      public function setItem(param1:Goods) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param1);
         this.item.x = this.itemX + this.bgW;
         this.item.y = this.itemY;
         addChild(this.item);
         this.item.visible = false;
      }
      
      public function setSelect(param1:Boolean) : void
      {
         this._isSelected = param1;
         if(this._isSelected)
         {
            filters = [SELECT_F];
         }
         else
         {
            filters = null;
         }
      }
   }
}

