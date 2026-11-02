package com.fireice.panel
{
   import com.fireice.base.FUIComponent;
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.init.SkinInit;
   import com.fireice.util.Tools;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   
   public class FPanel extends FUIComponent
   {
      
      public static var useClostEffect:Boolean = true;
      
      public static var useDragRestrict:Boolean = true;
      
      private var _dragAble:Boolean;
      
      private var title:Title;
      
      private var canvas:FCanvas;
      
      public var closeBtn:FSimpleButton;
      
      private var _skin:String;
      
      private var _dragRestrict:Boolean;
      
      private var _panelWidth:Number;
      
      private var _panelHeight:Number;
      
      private var _x:Number;
      
      private var _y:Number;
      
      private var _isCloseEffect:Boolean;
      
      private var images:Vector.<Bitmap>;
      
      public function FPanel()
      {
         super();
         this._isCloseEffect = useClostEffect;
         this.init();
         this.skin = "panel";
         this._dragRestrict = useDragRestrict;
      }
      
      public function get dragAble() : Boolean
      {
         return this._dragAble;
      }
      
      public function set dragAble(param1:Boolean) : void
      {
         this._dragAble = param1;
         if(param1)
         {
            this.addEventListener(MouseEvent.MOUSE_DOWN,this.onDrag);
         }
         else
         {
            this.removeEventListener(MouseEvent.MOUSE_DOWN,this.onDrag);
         }
      }
      
      private function onDrag(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               if(!(this.closeBtn != null && this.closeBtn.visible == true && this.closeBtn.getBounds(this.closeBtn).contains(this.closeBtn.mouseX,this.closeBtn.mouseY)))
               {
                  if(this.title != null && Boolean(this.title.getBounds(this.title).contains(this.title.mouseX,this.title.mouseY)))
                  {
                     Tools.currentStage.addEventListener(MouseEvent.MOUSE_UP,this.onDrag);
                     this.parent.setChildIndex(this,parent.numChildren - 1);
                     if(this._dragRestrict)
                     {
                        startDrag(false,new Rectangle(0,0,Tools.currentStage.stageWidth - this._panelWidth,Tools.currentStage.stageHeight - this.title.height));
                     }
                     else
                     {
                        startDrag(false);
                     }
                  }
               }
               break;
            case MouseEvent.MOUSE_UP:
               Tools.currentStage.removeEventListener(MouseEvent.MOUSE_UP,this.onDrag);
               stopDrag();
         }
      }
      
      private function init() : void
      {
         this.title = new Title();
         super.addChild(this.title);
         this.closeBtn = new FSimpleButton();
         super.addChild(this.closeBtn);
         this.closeBtn.visible = false;
         this.canvas = new FCanvas();
         this.canvas.name = "canvas";
         super.addChild(this.canvas);
         this.reSize();
      }
      
      public function set isCloseEffect(param1:Boolean) : void
      {
         this._isCloseEffect = param1;
      }
      
      public function get isCloseEffect() : Boolean
      {
         return this._isCloseEffect;
      }
      
      public function get titleHeight() : Number
      {
         return this.title.height;
      }
      
      public function set dragRestrict(param1:Boolean) : void
      {
         this._dragRestrict = param1;
      }
      
      public function get panelWidth() : Number
      {
         return this._panelWidth;
      }
      
      public function get panelHeight() : Number
      {
         return this._panelHeight;
      }
      
      override public function set width(param1:Number) : void
      {
         this.title.width = param1;
         this._panelWidth = param1;
         this.closeBtn.x = this.title.width - this.closeBtn.width - this.closeBtn.y;
         this.canvas.width = param1;
      }
      
      override public function set height(param1:Number) : void
      {
         this._panelHeight = param1;
         this.canvas.height = param1 - this.title.height;
         this.reSize();
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         this.canvas.addChild(param1);
         return param1;
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         this.canvas.addChildAt(param1,param2);
         return param1;
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         return this.canvas.getChildAt(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         return this.canvas.getChildIndex(param1);
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         return this.canvas.getChildByName(param1);
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         return this.canvas.removeChild(param1);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         return this.canvas.removeChildAt(param1);
      }
      
      override public function get numChildren() : int
      {
         return this.canvas.numChildren;
      }
      
      public function set skin(param1:String) : void
      {
         if(param1 == "")
         {
            return;
         }
         this._skin = param1;
         var _loc2_:XML = SkinInit.getSkinConfigByName(param1);
         var _loc3_:XML = _loc2_.title[0];
         this.title.skin = _loc3_.@link;
         _loc3_ = _loc2_.canvas[0];
         this.canvas.skin = _loc3_.@link;
         _loc3_ = _loc2_.closeButton[0];
         this.closeBtn.skin = _loc3_.@link;
         this.reSize();
      }
      
      public function set titleText(param1:String) : void
      {
         this.title.setSkin(this._skin);
         this.title.titleText = param1;
      }
      
      public function set Title(param1:DisplayObject) : void
      {
         this.title.titleObj = param1;
      }
      
      private function reSize() : void
      {
         this.closeBtn.y = this.title.height - this.closeBtn.height > 0 ? (this.title.height - this.closeBtn.height) / 2 : 0;
         this.closeBtn.x = this.title.width - this.closeBtn.width - this.closeBtn.y;
         this.canvas.y = this.title.height - 1;
      }
      
      public function set showCloseButton(param1:Boolean) : void
      {
         this.closeBtn.visible = param1;
         if(param1)
         {
            this.addEventListener(MouseEvent.CLICK,this.onClose);
         }
         else
         {
            this.removeEventListener(MouseEvent.CLICK,this.onClose);
         }
      }
      
      public function set setCloseBtnPos(param1:Point) : void
      {
         this.closeBtn.x = param1.x;
         this.closeBtn.y = param1.y;
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         if(this.closeBtn == null || this.closeBtn.visible == false || !this.closeBtn.getBounds(this.closeBtn).contains(this.closeBtn.mouseX,this.closeBtn.mouseY))
         {
            return;
         }
         if(this._isCloseEffect)
         {
            this._x = x;
            this._y = y;
            TweenLite.to(this,0.5,{
               "alpha":0,
               "onComplete":this.onCom
            });
         }
         else
         {
            Tools.currentStage.stage.focus = Tools.currentStage.stage;
            dispatchEvent(new FCloseEvent(FCloseEvent.CLOSE,null));
         }
      }
      
      private function onCom() : void
      {
         this.alpha = 1;
         Tools.currentStage.stage.focus = Tools.currentStage.stage;
         dispatchEvent(new FCloseEvent(FCloseEvent.CLOSE,null));
      }
      
      public function set DynamicManageImages(param1:Vector.<Bitmap>) : void
      {
         if(param1.length > 0)
         {
            this.addEventListener(Event.ADDED_TO_STAGE,this.create);
            this.addEventListener(Event.REMOVED_FROM_STAGE,this.dispose);
         }
         else
         {
            this.removeEventListener(Event.ADDED_TO_STAGE,this.create);
            this.removeEventListener(Event.REMOVED_FROM_STAGE,this.dispose);
         }
         this.images = param1;
      }
      
      private function dispose(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.images.length);
         if(Tools.getBD != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.images[_loc2_].bitmapData = null;
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.images[_loc2_].bitmapData.dispose();
               this.images[_loc2_].bitmapData = null;
               _loc2_++;
            }
         }
      }
      
      private function create(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc4_:Class = null;
         var _loc3_:int = int(this.images.length);
         if(Tools.getBD != null)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.images[_loc2_].bitmapData = Tools.getBD(this.images[_loc2_].name);
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = getDefinitionByName(this.images[_loc2_].name) as Class;
               this.images[_loc2_].bitmapData = new _loc4_(5,5) as BitmapData;
               _loc2_++;
            }
         }
      }
   }
}

import com.fireice.init.SkinInit;
import com.fireice.util.Tools;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.filters.*;
import flash.text.*;

class Title extends Sprite
{
   
   private var bg:DisplayObject;
   
   private var _width:Number = 100;
   
   private var _height:Number = 25;
   
   private var title:TextField;
   
   private var titleObject:DisplayObject;
   
   private var _skin:String;
   
   public function Title()
   {
      super();
      this.init();
   }
   
   private function init() : void
   {
      graphics.beginFill(0,1);
      graphics.drawRect(0,0,this._width,this._height);
      graphics.endFill();
      this.title = new TextField();
      with(this.title)
      {
         y = 7;
         mouseEnabled = false;
         selectable = false;
         width = _width;
         height = _height - 7;
         defaultTextFormat = new TextFormat(null,null,null,true,null,null,null,null,"center");
         multiline = false;
         wordWrap = false;
         filters = [new GlowFilter(134152,0.8,1.5,1.5,15,BitmapFilterQuality.LOW)];
      }
      addChild(this.title);
   }
   
   public function set titleObj(param1:DisplayObject) : void
   {
      if(this.titleObject !== null)
      {
         removeChild(this.titleObject);
      }
      if(param1 == null)
      {
         return;
      }
      this.titleObject = param1;
      addChildAt(this.titleObject,getChildIndex(this.title));
      this.titleObject.x = (width - this.titleObject.width) / 2;
      this.titleObject.y = (height - this.titleObject.height) / 2;
   }
   
   public function set skin(param1:String) : void
   {
      if(param1 == null)
      {
         return;
      }
      graphics.clear();
      var _loc2_:XML = SkinInit.getSkinConfigByName(param1);
      var _loc3_:XML = _loc2_.backgroundImage[0];
      if(this.bg != null)
      {
         removeChild(this.bg);
      }
      this.bg = Tools.get9GridBitmpByName(_loc3_);
      addChildAt(this.bg,0);
      this.bg.width = this._width;
      this.title.height = this.bg.height - 7;
   }
   
   public function setSkin(param1:String) : void
   {
      this._skin = param1;
   }
   
   public function set titleText(param1:String) : void
   {
      this.title.htmlText = "<font color=\'#dae8d9\' size=\'18\' face=\'楷体_gb2312,楷体\'>" + param1 + "</font>";
      this.title.antiAliasType = AntiAliasType.ADVANCED;
      if(this._skin == "sceondPanel" || this._skin == "sceondPanel_btn")
      {
         this.title.y = 2;
         this.title.height = this._height - 2;
      }
   }
   
   override public function set width(param1:Number) : void
   {
      this._width = param1;
      if(this.bg == null)
      {
         graphics.beginFill(0,1);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
      }
      else
      {
         this.bg.width = param1;
      }
      this.title.width = this._width;
   }
   
   override public function set height(param1:Number) : void
   {
      this._height = param1;
      if(this.bg == null)
      {
         graphics.beginFill(0,1);
         graphics.drawRect(0,0,this._width,this._height);
         graphics.endFill();
      }
      else
      {
         this.bg.height = param1;
      }
      this.title.height = this._height - 7;
   }
}
