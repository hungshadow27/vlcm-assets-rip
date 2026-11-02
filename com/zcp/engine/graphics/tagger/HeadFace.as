package com.zcp.engine.graphics.tagger
{
   import com.zcp.common.pool.IPoolClass;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.Engine;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.tools.ScenePool;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import gs.TweenLite;
   
   public class HeadFace extends Sprite implements IPoolClass
   {
      
      private static const FILTERS_UNLIGHT:Array = [new GlowFilter(3148544,1,2,2,15,BitmapFilterQuality.LOW)];
      
      private static const FILTERS_LIGHT:Array = [new GlowFilter(12568381,1,2,2,15,BitmapFilterQuality.LOW)];
      
      public static const HEADFACE_SPACE:int = 5;
      
      public static const DEFAULT_HEADFACE_Y:int = -100;
      
      private static const BAR_WIDTH:int = 60;
      
      private static const BAR_HEIGHT:int = 3;
      
      private static const LEFT_ICO_SPACE:int = 2;
      
      private static const TOP_ICO_SPACE:int = 2;
      
      private static const BOTTOM_BAR_SPACE:int = 2;
      
      private static const RIGHT_ICO_SPACE:int = 2;
      
      private var _nickName:String;
      
      private var _nickNameColor:uint;
      
      private var _showNickName:Boolean = true;
      
      private var _customTitle:String;
      
      private var _showCustomTitle:Boolean = true;
      
      private var _leftIco:DisplayObject;
      
      private var _showLeftIco:Boolean = true;
      
      private var _rightIco:DisplayObject;
      
      private var _centreIco:DisplayObject;
      
      private var _centreIcoVector:Vector.<DisplayObject>;
      
      private var _centreIcoZhenTime:int = 0;
      
      private var _showRightIco:Boolean = true;
      
      private var _nameDisplayObject:DisplayObject;
      
      private var _topIco:DisplayObject;
      
      private var _showTopIco:Boolean = true;
      
      private var _showCentreIco:Boolean = true;
      
      private var _barNow:Number;
      
      private var _barTotal:Number;
      
      private var _showBar:Boolean = true;
      
      private var _talkText:String;
      
      private var _talkTextColor:int;
      
      private var _talkTime:int = 0;
      
      private var _talkTimeDelay:int = 8000;
      
      private var _showTalkText:Boolean = true;
      
      private var _isLight:Boolean = false;
      
      private var _lastShineTime:int = 0;
      
      private var _mainBitmap:Bitmap;
      
      private var _barShape:Shape;
      
      private var _starSprite:Sprite;
      
      private var _frontStarSprite:Sprite;
      
      private var _barBackShape:Shape;
      
      private var _talkBitmap:Bitmap;
      
      public var autoUpdateY:Boolean = true;
      
      public var isFill:Boolean;
      
      private var topicos:Vector.<BitmapData>;
      
      private var lefticos:Vector.<BitmapData>;
      
      private var righticos:Vector.<BitmapData>;
      
      private var mainbd:BitmapData;
      
      private var talkbd:BitmapData;
      
      private var mingzikuan:int;
      
      public function HeadFace(param1:String = "", param2:uint = 16777215, param3:String = "", param4:DisplayObject = null, param5:DisplayObject = null, param6:Boolean = false, param7:DisplayObject = null, param8:DisplayObject = null, param9:Vector.<DisplayObject> = null)
      {
         super();
         this.isFill = param6;
         this.reSet([param1,param2,param3,param4,param5,param6,param7,param8,param9]);
      }
      
      public static function createHeadFace(param1:String = "", param2:uint = 16777215, param3:String = "", param4:DisplayObject = null, param5:DisplayObject = null, param6:Boolean = false, param7:DisplayObject = null, param8:DisplayObject = null, param9:Vector.<DisplayObject> = null) : HeadFace
      {
         return ScenePool.headFacePool.createObj(HeadFace,param1,param2,param3,param4,param5,param6,param7,param8,param9) as HeadFace;
      }
      
      public static function recycleHeadFace(param1:HeadFace) : void
      {
         ScenePool.headFacePool.disposeObj(param1);
      }
      
      public function get nickName() : String
      {
         return this._nickName;
      }
      
      public function get nickNameColor() : uint
      {
         return this._nickNameColor;
      }
      
      public function get customTitle() : String
      {
         return this._customTitle;
      }
      
      public function get leftIco() : DisplayObject
      {
         return this._leftIco;
      }
      
      public function get rightIco() : DisplayObject
      {
         return this._rightIco;
      }
      
      public function get centreIco() : DisplayObject
      {
         return this._centreIco;
      }
      
      public function get topIco() : DisplayObject
      {
         return this._topIco;
      }
      
      public function get barNow() : Number
      {
         return this._barNow;
      }
      
      public function get barTotal() : Number
      {
         return this._barTotal;
      }
      
      public function get talkText() : String
      {
         return this._talkText;
      }
      
      public function get talkTextColor() : int
      {
         return this._talkTextColor;
      }
      
      public function dispose() : void
      {
         graphics.clear();
         this.topicos = null;
         this.lefticos = null;
         this.righticos = null;
         Fun.clearChildren(this,false);
         this._nickName = "";
         this._nickNameColor = 16777215;
         this._customTitle = "";
         this._leftIco = null;
         this._rightIco = null;
         this._topIco = null;
         this._centreIco = null;
         this._centreIcoVector = null;
         this._nameDisplayObject = null;
         this._barNow = 0;
         this._barTotal = 0;
         this._showNickName = true;
         this._isLight = false;
         this._lastShineTime = 0;
         this._showCustomTitle = true;
         this._showLeftIco = true;
         this._showRightIco = true;
         this._showTopIco = true;
         this._showCentreIco = true;
         this._showBar = true;
         this._showTalkText = true;
         this._mainBitmap = null;
         this._barShape = null;
         this._starSprite = null;
         this._frontStarSprite = null;
         this._barBackShape = null;
         this._talkBitmap = null;
         if(this.mainbd)
         {
            this.mainbd.dispose();
            this.mainbd = null;
         }
         if(this.talkbd)
         {
            this.talkbd.dispose();
            this.talkbd = null;
         }
         this.autoUpdateY = true;
         visible = true;
      }
      
      public function reSet(param1:Array) : void
      {
         this._nickName = param1[0];
         this._nickNameColor = param1[1];
         this._customTitle = param1[2];
         this._leftIco = param1[3];
         this._topIco = param1[4];
         this._nameDisplayObject = param1[6];
         this._rightIco = param1[7];
         this._centreIcoVector = param1[8];
         if(this._centreIcoVector != null)
         {
            this._centreIco = param1[8][0];
         }
         else
         {
            this._centreIco = null;
         }
         this.drawMain();
      }
      
      private function reSetFill(param1:Array) : void
      {
         this._nickName = param1[0];
         this._nickNameColor = param1[1];
         this._customTitle = param1[2];
         this.lefticos = param1[3];
         this.topicos = param1[4];
         this.righticos = param1[5];
         this.drawMain();
      }
      
      public function setHeadFaceNickNameVisible(param1:Boolean) : void
      {
         this._showNickName = param1;
         this.drawMain();
      }
      
      public function setHeadFaceCustomTitleVisible(param1:Boolean) : void
      {
         this._showCustomTitle = param1;
         this.drawMain();
      }
      
      public function setHeadFaceLeftIcoVisible(param1:Boolean) : void
      {
         this._showLeftIco = param1;
         this.drawMain();
      }
      
      public function setHeadFaceRightIcoVisible(param1:Boolean) : void
      {
         this._showRightIco = param1;
         this.drawMain();
      }
      
      public function setHeadFaceTopIcoVisible(param1:Boolean) : void
      {
         this._showTopIco = param1;
         this.drawMain();
      }
      
      public function setHeadFaceCentreIcoVisible(param1:Boolean) : void
      {
         this._showCentreIco = param1;
         this.drawMain();
      }
      
      public function setHeadFaceBarVisible(param1:Boolean) : void
      {
         this._showBar = param1;
         if(this._barBackShape != null)
         {
            this._barBackShape.visible = this._showBar;
         }
         if(this._barShape != null)
         {
            this._barShape.visible = this._showBar;
         }
         if(this._starSprite != null)
         {
            this._starSprite.visible = this._showBar;
         }
         if(this._frontStarSprite != null)
         {
            this._frontStarSprite.visible = this._showBar;
         }
         this.drawMain();
      }
      
      public function setHeadFaceTalkTextVisible(param1:Boolean) : void
      {
         this._showTalkText = param1;
         this.drawTalk();
      }
      
      public function setHeadFaceNickName(param1:String = "", param2:uint = 16777215) : void
      {
         this.reSet([param1,param2,this._customTitle,this._leftIco,this._topIco,false,this._nameDisplayObject,this._rightIco,this._centreIcoVector]);
      }
      
      public function setHeadFaceCustomTitleHtmlText(param1:String = "") : void
      {
         this.reSet([this._nickName,this._nickNameColor,param1,this._leftIco,this._topIco,false,this._nameDisplayObject,this._rightIco,this._centreIcoVector]);
      }
      
      public function setHeadFaceLeftIco(param1:DisplayObject = null) : void
      {
         this.reSet([this._nickName,this._nickNameColor,this._customTitle,param1,this._topIco,false,this._nameDisplayObject,this._rightIco,this._centreIcoVector]);
      }
      
      public function setHeadFaceFillLeftIco(param1:Vector.<BitmapData> = null) : void
      {
         this.reSetFill([this._nickName,this._nickNameColor,this._customTitle,param1,this.topicos,this.righticos]);
      }
      
      public function setHeadFaceRightIco(param1:DisplayObject = null) : void
      {
         this.reSet([this._nickName,this._nickNameColor,this._customTitle,this._leftIco,this._topIco,false,this._nameDisplayObject,param1,this._centreIcoVector]);
      }
      
      public function setHeadFaceFillRightIco(param1:Vector.<BitmapData> = null) : void
      {
         this.reSetFill([this._nickName,this._nickNameColor,this._customTitle,this.lefticos,this.topicos,param1]);
      }
      
      public function setHeadFaceTopIco(param1:DisplayObject = null) : void
      {
         this.reSet([this._nickName,this._nickNameColor,this._customTitle,this._leftIco,param1,false,this._nameDisplayObject,this._rightIco,this._centreIcoVector]);
      }
      
      public function setHeadFaceFillTopIco(param1:Vector.<BitmapData> = null) : void
      {
         this.reSetFill([this._nickName,this._nickNameColor,this._customTitle,this.lefticos,param1,this.righticos]);
      }
      
      public function setHeadFaceCentreIco(param1:Vector.<DisplayObject> = null) : void
      {
         this.reSet([this._nickName,this._nickNameColor,this._customTitle,this._leftIco,this._topIco,false,this._nameDisplayObject,this._rightIco,param1]);
      }
      
      public function setHeadFaceBar(param1:Number, param2:Number, param3:Object = null, param4:Object = null) : void
      {
         var _loc5_:uint = 0;
         var _loc6_:Matrix = null;
         var _loc7_:BitmapData = null;
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param2 < 0)
         {
            param2 = 0;
         }
         if(param2 == 0)
         {
            return;
         }
         this._barNow = param1;
         this._barTotal = param2;
         if(this._barBackShape == null || this._barShape == null)
         {
            if(this._barBackShape == null)
            {
               this._barBackShape = new Shape();
               this._barBackShape.graphics.beginFill(0,0.4);
               this._barBackShape.graphics.drawRoundRect(0,0,BAR_WIDTH,BAR_HEIGHT,BAR_HEIGHT / 2,BAR_HEIGHT / 2);
               this._barBackShape.graphics.endFill();
               this._barBackShape.y = -BAR_HEIGHT;
               addChild(this._barBackShape);
               this._barBackShape.visible = this._showBar;
            }
            if(this._barShape == null)
            {
               this._barShape = new Shape();
               this._barShape.graphics.beginFill(16711680,1);
               this._barShape.graphics.drawRoundRect(0,0,BAR_WIDTH,BAR_HEIGHT,BAR_HEIGHT / 2,BAR_HEIGHT / 2);
               this._barShape.graphics.endFill();
               this._barShape.y = -BAR_HEIGHT;
               addChild(this._barShape);
               this._barShape.visible = this._showBar;
            }
            this.resize();
         }
         if(param3)
         {
            _loc5_ = 16711680;
            _loc5_ = uint(param3.color);
            this._barShape.graphics.clear();
            this._barShape.graphics.beginFill(_loc5_,1);
            this._barShape.graphics.drawRoundRect(0,0,BAR_WIDTH,BAR_HEIGHT,BAR_HEIGHT / 2,BAR_HEIGHT / 2);
            this._barShape.graphics.endFill();
            _loc6_ = new Matrix();
            _loc6_.identity();
            if(this._starSprite == null)
            {
               this._starSprite = new Sprite();
               addChild(this._starSprite);
            }
            else
            {
               this._starSprite.graphics.clear();
            }
            _loc7_ = param3.bmd as BitmapData;
            this._starSprite.graphics.beginBitmapFill(_loc7_);
            this._starSprite.graphics.drawRect(0,0,_loc7_.width * param3.bmdNum,_loc7_.height);
            this._starSprite.graphics.endFill();
            this._starSprite.x = this._barBackShape.x + this._barBackShape.width + LEFT_ICO_SPACE;
            this._starSprite.y = this._barBackShape.y - (this._starSprite.height - this._barBackShape.height) * 0.5;
            this._starSprite.visible = this._showBar;
         }
         if(param4)
         {
            if(this._frontStarSprite == null)
            {
               this._frontStarSprite = new Sprite();
               addChild(this._frontStarSprite);
            }
            else
            {
               this._frontStarSprite.graphics.clear();
            }
            if(param4.isShowBmd)
            {
               _loc7_ = param4.bmd as BitmapData;
               this._frontStarSprite.graphics.beginBitmapFill(_loc7_);
               this._frontStarSprite.graphics.drawRect(0,0,_loc7_.width,_loc7_.height);
               this._frontStarSprite.graphics.endFill();
               this._frontStarSprite.x = this._barBackShape.x - this._frontStarSprite.width - LEFT_ICO_SPACE;
               this._frontStarSprite.y = this._barBackShape.y - (this._frontStarSprite.height - this._barBackShape.height) * 0.5;
            }
            else
            {
               this._frontStarSprite.graphics.clear();
            }
            this._frontStarSprite.visible = this._showBar;
         }
         TweenLite.to(this._barShape,0.5,{"scaleX":this._barNow / this._barTotal});
      }
      
      public function setHeadFaceTalkText(param1:String = "", param2:uint = 16777215, param3:int = 8000) : void
      {
         this._talkText = param1;
         this._talkTextColor = param2;
         this._talkTime = SceneRender.nowTime;
         this._talkTimeDelay = param3;
         this.drawTalk();
      }
      
      public function checkTalkTime() : void
      {
         if(this._talkText != "" && SceneRender.nowTime - this._talkTime > this._talkTimeDelay)
         {
            this.setHeadFaceTalkText("");
         }
      }
      
      public function swapShine(param1:Boolean = false) : void
      {
         if(param1)
         {
            if(this._isLight == false)
            {
               return;
            }
         }
         if(SceneRender.nowTime - this._lastShineTime > 200)
         {
            this._lastShineTime = SceneRender.nowTime;
            this._isLight = !this._isLight;
            this.drawMain();
         }
      }
      
      private function drawMainText() : void
      {
         var _loc2_:TextField = null;
         var _loc3_:TextField = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Matrix = null;
         var _loc1_:Sprite = new Sprite();
         if(this._showNickName && this._nickName != "")
         {
            _loc2_ = new TextField();
            _loc2_.autoSize = TextFormatAlign.CENTER;
            _loc2_.multiline = true;
            _loc2_.mouseEnabled = false;
            _loc2_.defaultTextFormat = new TextFormat(Engine.font_HeadFace,12,this._nickNameColor,null,null,null,null,null,TextFormatAlign.CENTER);
            _loc2_.width = 0;
            _loc2_.x = 0;
            _loc2_.text = this._nickName;
            if(this._isLight)
            {
               _loc2_.filters = FILTERS_LIGHT;
            }
            else
            {
               _loc2_.filters = FILTERS_UNLIGHT;
            }
         }
         if(this._showCustomTitle && this._customTitle != "")
         {
            _loc3_ = new TextField();
            _loc3_.autoSize = TextFormatAlign.CENTER;
            _loc3_.multiline = true;
            _loc3_.mouseEnabled = false;
            _loc3_.defaultTextFormat = new TextFormat(Engine.font_HeadFace,12,null,null,null,null,null,null,TextFormatAlign.CENTER,0,0,0,5);
            _loc3_.width = 0;
            _loc3_.x = 0;
            _loc3_.filters = FILTERS_UNLIGHT;
            _loc3_.htmlText = this._customTitle;
         }
         if(_loc2_ != null)
         {
            _loc1_.addChild(_loc2_);
         }
         if(_loc3_ != null)
         {
            _loc1_.addChild(_loc3_);
         }
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(_loc2_ != null && _loc3_ != null)
         {
            _loc4_ = Math.max(_loc2_.width,_loc3_.width);
            _loc5_ = _loc2_.height + _loc3_.height;
         }
         else if(_loc2_ != null)
         {
            _loc4_ = _loc2_.width;
            _loc5_ = _loc2_.height;
         }
         else if(_loc3_ != null)
         {
            _loc4_ = _loc3_.width;
            _loc5_ = _loc3_.height;
         }
         if(_loc2_ != null)
         {
            _loc2_.x = (_loc4_ - _loc2_.width) / 2;
            _loc2_.y = -_loc2_.height;
         }
         if(_loc3_ != null)
         {
            _loc3_.x = (_loc4_ - _loc3_.width) / 2;
            if(_loc2_ != null)
            {
               _loc3_.y = _loc2_.y - _loc3_.height;
            }
            else
            {
               _loc3_.y = -_loc3_.height;
            }
         }
         if(_loc1_.numChildren > 0)
         {
            this.mainbd = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc6_ = _loc1_.getBounds(_loc1_);
            _loc7_ = new Matrix();
            _loc7_.tx = -_loc6_.x;
            _loc7_.ty = -_loc6_.y;
            this.mainbd.draw(_loc1_,_loc7_);
         }
         else
         {
            this.mainbd = null;
         }
         this.resizeFill();
      }
      
      private function resizeFill() : void
      {
         var _loc6_:BitmapData = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Matrix = new Matrix();
         var _loc5_:int = 0;
         graphics.clear();
         if(this._showBar && this._barBackShape != null && this._barShape != null)
         {
            _loc1_ = true;
            this._barBackShape.x = this._barShape.x = -BAR_WIDTH / 2;
            this._barBackShape.y = this._barShape.y = -BAR_HEIGHT;
         }
         _loc4_.identity();
         if(this.mainbd != null)
         {
            _loc2_ = true;
            _loc4_.tx = -this.mainbd.width / 2;
            if(this._showBar && this._barBackShape != null && this._barShape != null)
            {
               _loc5_ = -BAR_HEIGHT - BOTTOM_BAR_SPACE - this.mainbd.height;
            }
            else
            {
               _loc5_ = -this.mainbd.height;
            }
            _loc4_.ty = _loc5_;
            graphics.beginBitmapFill(this.mainbd,_loc4_);
            graphics.drawRect(_loc4_.tx,_loc5_,this.mainbd.width,this.mainbd.height);
            graphics.endFill();
         }
         var _loc7_:int = _loc5_;
         if(this._showTopIco && this.topicos != null)
         {
            _loc8_ = 0;
            while(_loc8_ < this.topicos.length)
            {
               _loc6_ = this.topicos[_loc8_];
               _loc7_ -= _loc6_.height;
               _loc4_.ty = _loc7_ - TOP_ICO_SPACE;
               _loc4_.tx = -_loc6_.width / 2;
               graphics.beginBitmapFill(_loc6_,_loc4_);
               graphics.drawRect(_loc4_.tx,_loc4_.ty,_loc6_.width,_loc6_.height);
               graphics.endFill();
               _loc8_++;
            }
         }
         if(this._showLeftIco && this.lefticos != null)
         {
            _loc9_ = this.mainbd ? int(-this.mainbd.width / 2) : 0;
            _loc10_ = 0;
            while(_loc10_ < this.lefticos.length)
            {
               _loc6_ = this.lefticos[_loc10_];
               _loc9_ -= _loc6_.width;
               _loc4_.ty = _loc5_ + this.mainbd.height - _loc6_.height;
               _loc4_.tx = _loc9_ - LEFT_ICO_SPACE;
               graphics.beginBitmapFill(_loc6_,_loc4_);
               graphics.drawRect(_loc4_.tx,_loc4_.ty,_loc6_.width,_loc6_.height);
               graphics.endFill();
               _loc10_++;
            }
         }
         if(this._showRightIco && this.righticos != null)
         {
            _loc9_ = this.mainbd ? int(this.mainbd.width / 2) : 0;
            _loc11_ = 0;
            while(_loc11_ < this.righticos.length)
            {
               _loc6_ = this.righticos[_loc11_];
               _loc9_ += _loc6_.width;
               _loc4_.ty = _loc5_ + this.mainbd.height - _loc6_.height;
               _loc4_.tx = _loc9_ + RIGHT_ICO_SPACE;
               graphics.beginBitmapFill(_loc6_,_loc4_);
               graphics.drawRect(_loc4_.tx,_loc4_.ty,_loc6_.width,_loc6_.height);
               graphics.endFill();
               _loc11_++;
            }
         }
         if(this.talkbd != null)
         {
            _loc3_ = true;
            _loc4_.tx = -this.talkbd.width / 2;
            if(_loc2_)
            {
               _loc4_.ty = _loc5_ - BOTTOM_BAR_SPACE - this.talkbd.height;
            }
            else if(_loc1_)
            {
               _loc4_.ty = this._barBackShape.y - BOTTOM_BAR_SPACE - this.talkbd.height;
            }
            else
            {
               _loc4_.ty = -this.talkbd.height;
            }
            graphics.beginBitmapFill(this.talkbd,_loc4_);
            graphics.drawRect(_loc4_.tx,_loc4_.ty,this.talkbd.width,this.talkbd.height);
            graphics.endFill();
         }
      }
      
      public function setCentreIcoRen() : void
      {
         if(Boolean(this._centreIcoVector) && this._showCentreIco)
         {
            ++this._centreIcoZhenTime;
            if(this._centreIcoZhenTime >= this._centreIcoVector.length)
            {
               this._centreIcoZhenTime = 0;
            }
            this._centreIco = this._centreIcoVector[this._centreIcoZhenTime];
            this.drawMain();
         }
      }
      
      public function drawMain() : void
      {
         var _loc2_:TextField = null;
         var _loc3_:TextField = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc8_:Rectangle = null;
         var _loc9_:Rectangle = null;
         var _loc10_:Rectangle = null;
         var _loc11_:Matrix = null;
         if(this.isFill)
         {
            this.drawMainText();
            return;
         }
         var _loc1_:Sprite = new Sprite();
         if(this._showNickName && this._nickName != "")
         {
            _loc2_ = new TextField();
            _loc2_.autoSize = TextFormatAlign.CENTER;
            _loc2_.multiline = true;
            _loc2_.mouseEnabled = false;
            _loc2_.defaultTextFormat = new TextFormat(Engine.font_HeadFace,12,this._nickNameColor,null,null,null,null,null,TextFormatAlign.CENTER);
            _loc2_.width = 0;
            _loc2_.x = 0;
            _loc2_.text = this._nickName;
            if(this._isLight)
            {
               _loc2_.filters = FILTERS_LIGHT;
            }
            else
            {
               _loc2_.filters = FILTERS_UNLIGHT;
            }
         }
         if(this._showCustomTitle && this._customTitle != "")
         {
            _loc3_ = new TextField();
            _loc3_.autoSize = TextFormatAlign.CENTER;
            _loc3_.multiline = true;
            _loc3_.mouseEnabled = false;
            _loc3_.defaultTextFormat = new TextFormat(Engine.font_HeadFace,12,null,null,null,null,null,null,TextFormatAlign.CENTER,0,0,0,5);
            _loc3_.width = 0;
            _loc3_.x = 0;
            _loc3_.filters = FILTERS_UNLIGHT;
            _loc3_.htmlText = this._customTitle;
         }
         if(_loc2_ != null)
         {
            _loc1_.addChild(_loc2_);
         }
         if(_loc3_ != null)
         {
            _loc1_.addChild(_loc3_);
         }
         if(this._showLeftIco && this._leftIco != null)
         {
            _loc1_.addChild(this._leftIco);
         }
         if(this._showRightIco && this._rightIco != null)
         {
            _loc1_.addChild(this._rightIco);
         }
         if(this._showTopIco && this._topIco != null)
         {
            _loc1_.addChild(this._topIco);
         }
         if(this._showCentreIco && this._centreIco != null)
         {
            _loc1_.addChild(this._centreIco);
         }
         if(this._nameDisplayObject != null)
         {
            _loc1_.addChild(this._nameDisplayObject);
         }
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         if(_loc2_ != null && _loc3_ != null)
         {
            _loc4_ = Math.max(_loc2_.width,_loc3_.width);
            _loc5_ = _loc2_.height + _loc3_.height;
         }
         else if(this._nameDisplayObject != null && _loc3_ != null)
         {
            _loc4_ = Math.max(this._nameDisplayObject.width,_loc3_.width);
            _loc5_ = this._nameDisplayObject.height + _loc3_.height;
         }
         else if(_loc2_ != null)
         {
            _loc4_ = _loc2_.width;
            _loc5_ = _loc2_.height;
         }
         else if(this._nameDisplayObject != null)
         {
            _loc4_ = this._nameDisplayObject.width;
            _loc5_ = this._nameDisplayObject.height;
         }
         else if(_loc3_ != null)
         {
            _loc4_ = _loc3_.width;
            _loc5_ = _loc3_.height;
         }
         if(_loc2_ != null)
         {
            _loc2_.x = (_loc4_ - _loc2_.width) / 2;
            _loc2_.y = -_loc2_.height;
         }
         this.mingzikuan = _loc4_;
         if(this._nameDisplayObject != null)
         {
            this._nameDisplayObject.x = (_loc4_ - this._nameDisplayObject.width) / 2;
            this._nameDisplayObject.y = -this._nameDisplayObject.height;
         }
         if(_loc3_ != null)
         {
            _loc3_.x = (_loc4_ - _loc3_.width) / 2;
            if(_loc2_ != null)
            {
               _loc3_.y = _loc2_.y - _loc3_.height;
            }
            else if(this._nameDisplayObject != null)
            {
               _loc3_.y = this._nameDisplayObject.y - _loc3_.height;
            }
            else
            {
               _loc3_.y = -_loc3_.height;
            }
         }
         if(this._showLeftIco && this._leftIco != null)
         {
            _loc6_ = this._leftIco.getBounds(this._leftIco);
            this._leftIco.x = -_loc6_.x - _loc6_.width - 2;
            this._leftIco.y = -_loc6_.y - (_loc5_ - _loc6_.height) / 2 - _loc6_.height;
         }
         if(this._showRightIco && this._rightIco != null)
         {
            _loc7_ = this._rightIco.getBounds(this._rightIco);
            this._rightIco.x = _loc4_ + RIGHT_ICO_SPACE;
            this._rightIco.y = -_loc7_.y - (_loc5_ - _loc7_.height) / 2 - _loc7_.height;
         }
         if(this._showTopIco && this._topIco != null)
         {
            _loc8_ = this._topIco.getBounds(this._topIco);
            this._topIco.x = (_loc4_ - _loc8_.width) / 2;
            if(this._showLeftIco && this._leftIco != null && _loc6_.height > _loc5_)
            {
               this._topIco.y = -_loc8_.x - (_loc6_.height / 2 + _loc5_ / 2) - TOP_ICO_SPACE - _loc8_.height;
               if(this._showCentreIco && this._centreIco != null)
               {
                  this._topIco.y -= this._centreIco.height;
               }
            }
            else
            {
               this._topIco.y = -_loc8_.y - _loc5_ - TOP_ICO_SPACE - _loc8_.height;
               if(this._showCentreIco && this._centreIco != null)
               {
                  this._topIco.y -= this._centreIco.height;
               }
            }
         }
         if(this._showCentreIco && this._centreIco != null)
         {
            _loc9_ = this._centreIco.getBounds(this._centreIco);
            this._centreIco.x = (_loc4_ - _loc9_.width) / 2;
            if(this._showLeftIco && this._leftIco != null && _loc6_.height > _loc5_)
            {
               this._centreIco.y = -_loc9_.x - (_loc6_.height / 2 + _loc5_ / 2) - TOP_ICO_SPACE - _loc9_.height;
            }
            else
            {
               this._centreIco.y = -_loc9_.y - _loc5_ - TOP_ICO_SPACE - _loc9_.height;
            }
         }
         if(_loc1_.numChildren > 0)
         {
            if(this._mainBitmap == null)
            {
               this._mainBitmap = new Bitmap();
               addChild(this._mainBitmap);
            }
            this._mainBitmap.bitmapData = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc10_ = _loc1_.getBounds(_loc1_);
            _loc11_ = new Matrix();
            _loc11_.tx = -_loc10_.x;
            _loc11_.ty = -_loc10_.y;
            this._mainBitmap.bitmapData.draw(_loc1_,_loc11_);
         }
         else if(this._mainBitmap)
         {
            this._mainBitmap.bitmapData.dispose();
            if(this._mainBitmap.parent)
            {
               this._mainBitmap.parent.removeChild(this._mainBitmap);
            }
            this._mainBitmap = null;
         }
         this.resize();
      }
      
      private function drawTalk() : void
      {
         var _loc2_:TextField = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Matrix = null;
         var _loc1_:Sprite = new Sprite();
         if(this._showTalkText && this._talkText != "")
         {
            _loc2_ = new TextField();
            _loc2_.autoSize = TextFormatAlign.LEFT;
            _loc2_.multiline = true;
            _loc2_.mouseEnabled = false;
            _loc2_.defaultTextFormat = new TextFormat(Engine.font_HeadFace,12,this._talkTextColor,null,null,null,null,null,TextFormatAlign.CENTER);
            _loc2_.width = 0;
            _loc2_.x = 0;
            _loc2_.filters = FILTERS_UNLIGHT;
            _loc2_.text = this._talkText;
         }
         if(_loc2_ != null)
         {
            _loc1_.addChild(_loc2_);
            _loc1_.graphics.beginFill(0,0.3);
            _loc1_.graphics.drawRect(-2,-2,_loc1_.width + 4,_loc1_.height + 4);
            _loc1_.graphics.endFill();
         }
         if(_loc1_.numChildren > 0)
         {
            if(this._talkBitmap == null)
            {
               this._talkBitmap = new Bitmap();
               if(!this.isFill)
               {
                  addChild(this._talkBitmap);
               }
            }
            this._talkBitmap.bitmapData = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc3_ = _loc1_.getBounds(_loc1_);
            _loc4_ = new Matrix();
            _loc4_.tx = -_loc3_.x;
            _loc4_.ty = -_loc3_.y;
            this._talkBitmap.bitmapData.draw(_loc1_,_loc4_);
            this.talkbd = this._talkBitmap.bitmapData;
         }
         else if(this._talkBitmap)
         {
            this._talkBitmap.bitmapData.dispose();
            this.talkbd = null;
            if(this._talkBitmap.parent)
            {
               this._talkBitmap.parent.removeChild(this._talkBitmap);
            }
            this._talkBitmap = null;
         }
         if(this.isFill)
         {
            this.resizeFill();
         }
         else
         {
            this.resize();
         }
      }
      
      private function resize() : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:int = 0;
         if(this.isFill)
         {
            this.resizeFill();
            return;
         }
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         if(this._showBar && this._barBackShape != null && this._barShape != null)
         {
            _loc1_ = true;
            this._barBackShape.x = this._barShape.x = -BAR_WIDTH / 2;
            this._barBackShape.y = this._barShape.y = -BAR_HEIGHT;
         }
         if(this._mainBitmap != null)
         {
            _loc2_ = true;
            if(this._showTopIco && this._topIco != null && this._topIco.width == this._mainBitmap.width)
            {
               this._mainBitmap.x = -this._mainBitmap.width / 2;
            }
            else if(this._showCentreIco && this._centreIco != null && this._centreIco.width == this._mainBitmap.width)
            {
               this._mainBitmap.x = -this._mainBitmap.width / 2;
            }
            else if(this._topIco != null && this._mainBitmap.width > this._topIco.width || this._centreIco != null && this._mainBitmap.width > this._centreIco.width)
            {
               _loc4_ = this._showLeftIco && this._leftIco != null ? this._leftIco.width : 0;
               _loc5_ = this._showTopIco && this._topIco != null ? this._topIco.width : 0;
               _loc6_ = this._showCentreIco && this._centreIco != null ? this._centreIco.width : 0;
               _loc7_ = 0;
               if(_loc5_ != 0 || _loc6_ != 0)
               {
                  if(_loc5_ > _loc6_)
                  {
                     _loc7_ = _loc4_ - (_loc5_ - this.mingzikuan) / 2;
                  }
                  else
                  {
                     _loc7_ = _loc4_ - (_loc6_ - this.mingzikuan) / 2;
                  }
               }
               if(_loc5_ > _loc6_)
               {
                  _loc8_ = _loc5_;
               }
               else
               {
                  _loc8_ = _loc6_;
               }
               this._mainBitmap.x = -_loc7_ - _loc8_ / 2;
            }
            else
            {
               _loc4_ = this._showLeftIco && this._leftIco != null ? this._leftIco.width + LEFT_ICO_SPACE : 0;
               _loc9_ = this._showRightIco && this._rightIco != null ? this._rightIco.width + RIGHT_ICO_SPACE : 0;
               _loc7_ = this._mainBitmap.width - _loc4_ - _loc9_;
               this._mainBitmap.x = -_loc4_ - _loc7_ / 2;
            }
            if(this._showBar && this._barBackShape != null && this._barShape != null)
            {
               _loc10_ = BAR_HEIGHT;
               if(Boolean(this._starSprite) && this._starSprite.height > BAR_HEIGHT)
               {
                  _loc10_ += (this._starSprite.height - BAR_HEIGHT) * 0.5;
               }
               else if(Boolean(this._frontStarSprite) && this._frontStarSprite.height > BAR_HEIGHT)
               {
                  _loc10_ += (this._frontStarSprite.height - BAR_HEIGHT) * 0.5;
               }
               this._mainBitmap.y = -_loc10_ - BOTTOM_BAR_SPACE - this._mainBitmap.height;
            }
            else
            {
               this._mainBitmap.y = -this._mainBitmap.height;
            }
         }
         if(this._talkBitmap != null)
         {
            _loc3_ = true;
            this._talkBitmap.x = -this._talkBitmap.width / 2;
            if(_loc2_)
            {
               this._talkBitmap.y = this._mainBitmap.y - BOTTOM_BAR_SPACE - this._talkBitmap.height;
            }
            else if(_loc1_)
            {
               this._talkBitmap.y = this._barBackShape.y - BOTTOM_BAR_SPACE - this._talkBitmap.height;
            }
            else
            {
               this._talkBitmap.y = -this._talkBitmap.height;
            }
         }
      }
   }
}

