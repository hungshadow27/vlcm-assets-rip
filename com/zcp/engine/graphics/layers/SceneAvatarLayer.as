package com.zcp.engine.graphics.layers
{
   import com.zcp.common.log.ZLog;
   import com.zcp.common.utils.Fun;
   import com.zcp.common.utils.dirty.DirtyBoundsMaker;
   import com.zcp.common.vo.Bounds;
   import com.zcp.engine.Scene;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class SceneAvatarLayer extends Sprite
   {
      
      private static const MAX_AVATAR_CACHE_X:int = 2;
      
      private static const MAX_AVATAR_CACHE_Y:int = 1;
      
      public static const MAX_AVATARBD_WIDTH:Number = 300;
      
      public static const MAX_AVATARBD_HEIGHT:Number = 300;
      
      private static const floor:Function = Math.floor;
      
      private var _scene:Scene;
      
      private var _avatarBDDict:Dictionary = new Dictionary();
      
      private var _mapWidth:Number;
      
      private var _mapHeight:Number;
      
      private var _mH:Number;
      
      private var _mV:Number;
      
      private var _dH:Number;
      
      private var _dV:Number;
      
      public var removeBoundsArr:Array = [];
      
      public var clearBoundsArr:Array = [];
      
      public var restingAvatarPartArr:Array = [];
      
      private var _dirtyBoundsMaker:DirtyBoundsMaker = new DirtyBoundsMaker();
      
      private var _count:int = 0;
      
      public function SceneAvatarLayer(param1:Scene)
      {
         super();
         this._scene = param1;
         mouseEnabled = false;
         mouseChildren = false;
      }
      
      public function getAvatarBD(param1:int, param2:int) : BitmapData
      {
         return this._avatarBDDict[param2 + "_" + param1];
      }
      
      private function getAndCreatAvatarBD(param1:int, param2:int) : BitmapData
      {
         var _loc3_:BitmapData = this.getAvatarBD(param1,param2);
         if(_loc3_ == null)
         {
            this.creatAvatarBD(param1,param2);
            _loc3_ = this.getAvatarBD(param1,param2);
         }
         return _loc3_;
      }
      
      public function dispose() : void
      {
         this.removeAllAvatarBD();
         this.removeBoundsArr = [];
         this.clearBoundsArr = [];
         this.restingAvatarPartArr = [];
         this._dirtyBoundsMaker.clear();
      }
      
      public function initAvatarBD() : void
      {
         this.removeAllAvatarBD();
         this._mapWidth = this._scene.mapConfig.width;
         this._mapHeight = this._scene.mapConfig.height;
         this._mH = this._mapWidth % MAX_AVATARBD_WIDTH;
         this._mV = this._mapHeight % MAX_AVATARBD_HEIGHT;
         this._dH = floor(this._mapWidth / MAX_AVATARBD_WIDTH);
         this._dV = floor(this._mapHeight / MAX_AVATARBD_HEIGHT);
         if(this._mH == 0)
         {
            --this._dH;
         }
         if(this._mV == 0)
         {
            --this._dV;
         }
      }
      
      private function creatAvatarBD(param1:int, param2:int) : void
      {
         var bm:Bitmap;
         var xx:int = 0;
         var yy:int = 0;
         var ww:Number = NaN;
         var hh:Number = NaN;
         var bd:BitmapData = null;
         var $i:int = param1;
         var $j:int = param2;
         var key:String = $j + "_" + $i;
         if(this._avatarBDDict[key] != null)
         {
            return;
         }
         yy = $j * MAX_AVATARBD_HEIGHT;
         hh = MAX_AVATARBD_HEIGHT;
         xx = $i * MAX_AVATARBD_WIDTH;
         ww = MAX_AVATARBD_WIDTH;
         try
         {
            bd = new BitmapData(ww,hh,true,0);
         }
         catch(e:Error)
         {
            ZLog.add("内存不足，无法创建绘图区！");
            throw new Error("内存不足，无法创建绘图区！");
         }
         this._avatarBDDict[key] = bd;
         bm = new Bitmap(bd);
         bm.name = key;
         bm.x = xx;
         bm.y = yy;
         this.addChild(bm);
      }
      
      private function removeAllAvatarBD() : void
      {
         var _loc1_:BitmapData = null;
         var _loc2_:String = null;
         Fun.clearChildren(this);
         for(_loc2_ in this._avatarBDDict)
         {
            _loc1_ = this._avatarBDDict[_loc2_];
            _loc1_.dispose();
         }
         this._avatarBDDict = new Dictionary();
      }
      
      private function checkDisposeAvatarBD() : void
      {
         var _loc3_:BitmapData = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(this._count++ < 200)
         {
            return;
         }
         this._count = 0;
         var _loc1_:int = floor(this._scene.sceneCamera.piexl_x / MAX_AVATARBD_WIDTH);
         var _loc2_:int = floor(this._scene.sceneCamera.piexl_y / MAX_AVATARBD_HEIGHT);
         for(_loc4_ in this._avatarBDDict)
         {
            _loc5_ = _loc4_.split("_");
            _loc7_ = Number(_loc5_[0]);
            _loc6_ = Number(_loc5_[1]);
            if(Math.abs(_loc1_ - _loc6_) > this._scene.sceneCamera.avatarRangeXY.x + MAX_AVATAR_CACHE_X || Math.abs(_loc2_ - _loc7_) > this._scene.sceneCamera.avatarRangeXY.y + MAX_AVATAR_CACHE_Y)
            {
               _loc3_ = this._avatarBDDict[_loc4_];
               _loc3_.dispose();
               delete this._avatarBDDict[_loc4_];
               this.removeChild(this.getChildByName(_loc4_));
            }
         }
      }
      
      private function lock() : void
      {
         var _loc1_:BitmapData = null;
         for each(_loc1_ in this._avatarBDDict)
         {
            _loc1_.lock();
         }
      }
      
      private function unlock() : void
      {
         var _loc1_:BitmapData = null;
         for each(_loc1_ in this._avatarBDDict)
         {
            _loc1_.unlock();
         }
      }
      
      private function clear(param1:Array) : void
      {
         var _loc2_:Bounds = null;
         var _loc3_:Rectangle = null;
         for each(_loc2_ in param1)
         {
            _loc3_ = Bounds.toRectangle(_loc2_);
            this.copyImage(null,0,0,_loc3_.width,_loc3_.height,_loc3_.x,_loc3_.y);
         }
      }
      
      public function copyImage(param1:BitmapData, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:BitmapData = null;
         var _loc8_:uint = 0;
         if(Boolean(this._scene.mapConfig) && !this._scene.mapConfig.unbounded)
         {
            if(param6 < 0)
            {
               if(-param6 > param4)
               {
                  return;
               }
               param2 -= param6;
               param4 += param6;
               param6 = 0;
            }
            if(param7 < 0)
            {
               if(-param7 > param5)
               {
                  return;
               }
               param3 -= param7;
               param5 += param7;
               param7 = 0;
            }
            if(param6 + param4 > this._mapWidth)
            {
               if(param6 > this._mapWidth)
               {
                  return;
               }
               param4 -= param6 + param4 - this._mapWidth;
            }
            if(param7 + param5 > this._mapHeight)
            {
               if(param7 > this._mapHeight)
               {
                  return;
               }
               param5 -= param7 + param5 - this._mapHeight;
            }
         }
         _loc9_ = (param6 % MAX_AVATARBD_WIDTH + MAX_AVATARBD_WIDTH) % MAX_AVATARBD_WIDTH;
         _loc10_ = (param7 % MAX_AVATARBD_HEIGHT + MAX_AVATARBD_HEIGHT) % MAX_AVATARBD_HEIGHT;
         _loc11_ = ((param6 + param4) % MAX_AVATARBD_WIDTH + MAX_AVATARBD_WIDTH) % MAX_AVATARBD_WIDTH;
         _loc12_ = ((param7 + param5) % MAX_AVATARBD_HEIGHT + MAX_AVATARBD_HEIGHT) % MAX_AVATARBD_HEIGHT;
         _loc13_ = floor(param6 / MAX_AVATARBD_WIDTH);
         _loc14_ = floor(param7 / MAX_AVATARBD_HEIGHT);
         _loc15_ = floor((param6 + param4) / MAX_AVATARBD_WIDTH);
         _loc16_ = floor((param7 + param5) / MAX_AVATARBD_HEIGHT);
         if(_loc11_ == 0)
         {
            _loc15_--;
         }
         if(_loc12_ == 0)
         {
            _loc16_--;
         }
         _loc20_ = 0;
         _loc18_ = _loc14_;
         while(_loc18_ <= _loc16_)
         {
            _loc22_ = param3 + _loc20_;
            if(_loc14_ == _loc16_)
            {
               _loc24_ = param5;
            }
            else if(_loc18_ == _loc14_)
            {
               _loc24_ = MAX_AVATARBD_HEIGHT - _loc10_;
            }
            else if(_loc18_ == _loc16_ && _loc12_ != 0)
            {
               _loc24_ = _loc12_;
            }
            else
            {
               _loc24_ = MAX_AVATARBD_HEIGHT;
            }
            _loc20_ += _loc24_;
            _loc26_ = _loc18_ == _loc14_ ? int(_loc10_) : 0;
            _loc19_ = 0;
            _loc17_ = _loc13_;
            while(_loc17_ <= _loc15_)
            {
               _loc21_ = param2 + _loc19_;
               if(_loc13_ == _loc15_)
               {
                  _loc23_ = param4;
               }
               else if(_loc17_ == _loc13_)
               {
                  _loc23_ = MAX_AVATARBD_WIDTH - _loc9_;
               }
               else if(_loc17_ == _loc15_ && _loc11_ != 0)
               {
                  _loc23_ = _loc11_;
               }
               else
               {
                  _loc23_ = MAX_AVATARBD_WIDTH;
               }
               _loc19_ += _loc23_;
               _loc25_ = _loc17_ == _loc13_ ? int(_loc9_) : 0;
               _loc27_ = this.getAndCreatAvatarBD(_loc17_,_loc18_);
               if(param1 != null)
               {
                  _loc27_.copyPixels(param1,new Rectangle(_loc21_,_loc22_,_loc23_,_loc24_),new Point(_loc25_,_loc26_),null,null,true);
               }
               else
               {
                  _loc27_.fillRect(new Rectangle(_loc25_,_loc26_,_loc23_,_loc24_),_loc8_);
               }
               _loc17_++;
            }
            _loc18_++;
         }
      }
      
      public function run() : void
      {
         var _loc2_:SceneCharacter = null;
         var _loc3_:Bounds = null;
         var _loc4_:Array = null;
         var _loc5_:AvatarPart = null;
         var _loc6_:Bounds = null;
         var _loc7_:Rectangle = null;
         this._dirtyBoundsMaker.clear();
         this.clearBoundsArr.length = 0;
         this.restingAvatarPartArr.length = 0;
         var _loc1_:Array = this._scene.renderCharacters;
         _loc1_.sortOn(["showIndex","piexl_y","piexl_x","logicAnglePRI","id"],[Array.NUMERIC,Array.NUMERIC,Array.NUMERIC,Array.NUMERIC,Array.NUMERIC]);
         for each(_loc2_ in _loc1_)
         {
            _loc2_.runAvatar();
         }
         this.clearBoundsArr = this.clearBoundsArr.concat(this.removeBoundsArr);
         this.clearBoundsArr.sortOn("top",Array.NUMERIC);
         this.removeBoundsArr.length = 0;
         for each(_loc3_ in this.clearBoundsArr)
         {
            if(!_loc3_.isEmpty())
            {
               this._dirtyBoundsMaker.addBounds(_loc3_);
            }
         }
         _loc4_ = this._dirtyBoundsMaker.getBoundsArr();
         for each(_loc5_ in this.restingAvatarPartArr)
         {
            for each(_loc3_ in _loc4_)
            {
               _loc6_ = Bounds.fromRectangle(_loc5_.cutRect);
               if(_loc6_.intersects(_loc3_))
               {
                  _loc7_ = Bounds.toRectangle(_loc6_.intersection(_loc3_));
                  _loc5_.updateNow = true;
                  _loc5_.renderRectArr.push(_loc7_);
               }
            }
         }
         this.clear(_loc4_);
         for each(_loc2_ in _loc1_)
         {
            _loc2_.drawAvatar(this);
         }
         this.checkDisposeAvatarBD();
      }
   }
}

