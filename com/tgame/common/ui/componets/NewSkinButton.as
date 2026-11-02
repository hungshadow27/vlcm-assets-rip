package com.tgame.common.ui.componets
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.init.SkinInit;
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.zcp.manager.LoaderManager;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.*;
   
   public class NewSkinButton extends Sprite
   {
      
      private var _up:Sprite;
      
      private var _over:Sprite;
      
      private var _down:Sprite;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var _enabled:Boolean;
      
      private var bloodMc:MovieClip;
      
      private var bloodMcSpr:Sprite;
      
      private var shape:Shape;
      
      public var isNew:Boolean = false;
      
      private var _width:int = 0;
      
      public function NewSkinButton()
      {
         super();
         buttonMode = true;
         mouseChildren = false;
         this._up = new Sprite();
         this._over = new Sprite();
         this._down = new Sprite();
         addChild(this._up);
         addChild(this._over);
         addChild(this._down);
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouse);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouse);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouse);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouse);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "toolTip";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            text = "";
         }
         this.tipCanvas.addChild(this.tip);
         this.bloodMcSpr = new Sprite();
         addChild(this.bloodMcSpr);
      }
      
      private function onMouse(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this._up.visible = false;
               this._over.visible = true;
               this._down.visible = false;
               this.showTip();
               break;
            case MouseEvent.MOUSE_OUT:
               this._up.visible = true;
               this._over.visible = false;
               this._down.visible = false;
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_UP:
               this._up.visible = true;
               this._over.visible = false;
               this._down.visible = false;
               break;
            case MouseEvent.MOUSE_DOWN:
               this._up.visible = false;
               this._over.visible = false;
               this._down.visible = true;
         }
      }
      
      private function showTip() : void
      {
         if(this.tip.text == "")
         {
            return;
         }
         Tools.currentStage.addChild(this.tipCanvas);
         var _loc1_:Point = new Point(this.x,this.y);
         _loc1_ = this.parent.localToGlobal(_loc1_);
         if(_loc1_.x + this.width + this.tipCanvas.width > Tools.currentStage.stageWidth)
         {
            this.tipCanvas.x = _loc1_.x - this.tipCanvas.width;
         }
         else
         {
            this.tipCanvas.x = _loc1_.x + this.width + 10;
         }
         if(_loc1_.y + this.height + this.tipCanvas.height > Tools.currentStage.stageHeight)
         {
            this.tipCanvas.y = _loc1_.y - this.tipCanvas.height;
         }
         else
         {
            this.tipCanvas.y = _loc1_.y + this.height + 10;
         }
      }
      
      public function set skin(param1:String) : void
      {
         if(param1 == "")
         {
            return;
         }
         var _loc2_:XML = SkinInit.getSkinConfigByName(param1);
         var _loc3_:XML = _loc2_.upImage[0];
         var _loc4_:String = String(_loc3_.@name);
         this._width = _loc3_.@width;
         this.up = FLoader.startLoad(GameConfig.fileBaseFolder + _loc4_,int(_loc3_.@width),int(_loc3_.@height)) as Sprite;
         _loc3_ = _loc2_.overImage[0];
         _loc4_ = String(_loc3_.@name);
         this.over = FLoader.startLoad(GameConfig.fileBaseFolder + _loc4_,int(_loc3_.@width),int(_loc3_.@height)) as Sprite;
         _loc3_ = _loc2_.downImage[0];
         _loc4_ = String(_loc3_.@name);
         this.down = FLoader.startLoad(GameConfig.fileBaseFolder + _loc4_,int(_loc3_.@width),int(_loc3_.@height)) as Sprite;
      }
      
      public function set up(param1:Sprite) : void
      {
         removeChild(this._up);
         this._up = param1;
         addChildAt(this._up,0);
      }
      
      public function set over(param1:Sprite) : void
      {
         removeChild(this._over);
         this._over = param1;
         addChildAt(this._over,0);
         this._over.visible = false;
      }
      
      public function set down(param1:Sprite) : void
      {
         removeChild(this._down);
         this._down = param1;
         addChildAt(this._down,0);
         this._down.visible = false;
      }
      
      public function set toolTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
         if(param1)
         {
            filters = [];
            mouseEnabled = true;
         }
         else
         {
            filters = Tools.blackWhiteFilter;
            mouseEnabled = false;
         }
      }
      
      public function set setBg(param1:String) : void
      {
         var loadUrl:String = null;
         var value:String = param1;
         loadUrl = GameConfig.fileBaseFolder + value;
         if(Boolean(this.bloodMc) && this.bloodMc.parent != null)
         {
            this.bloodMc.stop();
            this.bloodMc.parent.removeChild(this.bloodMc);
         }
         while(this.bloodMcSpr.numChildren > 0)
         {
            this.bloodMcSpr.removeChildAt(0);
         }
         LoaderManager.lazyLoad(function(param1:Event):void
         {
            var _loc2_:LoadingItem = param1.target as LoadingItem;
            if(_loc2_.url.url != loadUrl)
            {
               return;
            }
            if(Boolean(bloodMc) && bloodMc.parent != null)
            {
               bloodMc.stop();
               bloodMc.parent.removeChild(bloodMc);
            }
            bloodMc = _loc2_.content as MovieClip;
            if(bloodMc)
            {
               bloodMcSpr.addChild(bloodMc);
            }
         },null,false,loadUrl);
      }
      
      public function set setBo(param1:Boolean) : void
      {
         if(param1)
         {
            while(this.bloodMcSpr.numChildren > 0)
            {
               this.bloodMcSpr.removeChildAt(0);
            }
         }
      }
      
      public function drawRedPoint() : void
      {
         if(!this.shape)
         {
            this.shape = new Shape();
            this.shape.graphics.beginFill(16711680);
            this.shape.graphics.drawCircle(0,0,3);
            this.shape.graphics.endFill();
            addChild(this.shape);
            this.shape.x = this._width;
         }
         this.isNew = true;
      }
      
      public function clearRedPoint() : void
      {
         if(this.shape)
         {
            this.shape.parent.removeChild(this.shape);
            this.shape = null;
         }
         this.isNew = false;
      }
   }
}

