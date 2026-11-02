package com.zcp.engine.graphics.avatar
{
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.pool.IPoolClass;
   import com.zcp.common.utils.ZMath;
   import com.zcp.common.vo.Bounds;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.graphics.layers.SceneAvatarLayer;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.RestType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.tools.ScenePool;
   import com.zcp.engine.vo.avatar.AvatarFaceData;
   import com.zcp.engine.vo.avatar.AvatarImgData;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPartData;
   import com.zcp.engine.vo.avatar.AvatarPartStatus;
   import com.zcp.engine.vo.avatar.AvatarPartStatusList;
   import com.zcp.engine.vo.avatar.AvatarPlayCallBack;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.engine.vo.avatar.DynamicPosition.IDynamicPosition;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.filters.BitmapFilter;
   import flash.filters.GlowFilter;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarPart implements IPoolClass
   {
      
      private static const MOUSE_ON_GLOWFILTER:GlowFilter = new GlowFilter(16777215,0.7,7,7,4,1);
      
      public var usable:Boolean = false;
      
      private var _enablePlay:Boolean = false;
      
      public var visible:Boolean = true;
      
      public var updateNow:Boolean = false;
      
      private var _oldData:Object = null;
      
      public var avatar:Avatar;
      
      private var _avatarParamData:AvatarParamData;
      
      private var _avatarPartStatusList:AvatarPartStatusList;
      
      private var _sceneCharacterPosition:Point = null;
      
      public var cutRect:Rectangle = null;
      
      private var _sourcePoint:Point = null;
      
      public var renderRectArr:Array = null;
      
      public var id:String;
      
      public var type:String;
      
      private var _classNamePrefix:String;
      
      private var _repeat:int = 0;
      
      public var depth:int = 0;
      
      private var _offsetX:int = 0;
      
      private var _offsetY:int = 0;
      
      private var _offsetOnMountX:int = 0;
      
      private var _offsetOnMountY:int = 0;
      
      private var _offsetSitX:int = 0;
      
      private var _offsetSitY:int = 0;
      
      private var _dynamicPosition:IDynamicPosition = null;
      
      private var _sleepTime:int = 0;
      
      private var _onAdd:Function;
      
      private var _onRemove:Function;
      
      private var _onPlayBeforeStart:Function;
      
      private var _onPlayStart:Function;
      
      private var _onPlayUpdate:Function;
      
      private var _onPlayComplete:Function;
      
      private var _avatarImgData:AvatarImgData;
      
      private var _drawSourceBitmapData:BitmapData;
      
      private var _glowFilterDrawSourceBitmapData:BitmapData;
      
      private var _inMaskDrawSourceBitmapData:BitmapData;
      
      private const _bitmapFilters:Array = [];
      
      private var _currentStatus:String = "";
      
      private var _use_currentStatus:String = "";
      
      private var _currentAvatarPartStatus:AvatarPartStatus;
      
      private var _currentFrame:int = -1;
      
      private var _currentLogicAngel:int = 0;
      
      private var _currentRotation:Number = 0;
      
      private var _playCondition:AvatarPlayCondition;
      
      private var _playCount:int = 0;
      
      private var _playBeforeStart:Boolean = false;
      
      private var _playStart:Boolean = false;
      
      private var _playComplete:Boolean = false;
      
      private var _lastTime:int = 0;
      
      private var _lastPlayCompleteTime:int = 0;
      
      private var _only1Frame:Boolean = false;
      
      private var _only1LogicAngel:Boolean = false;
      
      private var _only1Repeat:Boolean = false;
      
      private var _autoRecycle:Boolean = false;
      
      private var _autoToStand:Boolean = false;
      
      private var _useSpecilizeXY:Boolean = true;
      
      private var _drawMouseOn:Boolean = true;
      
      private var _callBackAttack:Boolean = false;
      
      public function AvatarPart(param1:AvatarParamData, param2:AvatarPartStatusList)
      {
         super();
         this.reSet([param1,param2]);
      }
      
      public static function createAvatarPart(param1:AvatarParamData, param2:AvatarPartStatusList) : AvatarPart
      {
         return ScenePool.avatarPartPool.createObj(AvatarPart,param1,param2) as AvatarPart;
      }
      
      public static function recycleAvatarPart(param1:AvatarPart) : void
      {
         ScenePool.avatarPartPool.disposeObj(param1);
      }
      
      public function get avatarParamData() : AvatarParamData
      {
         return this._avatarParamData;
      }
      
      private function get avatarImg() : BitmapData
      {
         if(this._avatarImgData != null)
         {
            return this._avatarImgData.getBitmapData(this._currentLogicAngel,this._currentFrame);
         }
         return null;
      }
      
      public function get bitmapFilters() : Array
      {
         return this._bitmapFilters;
      }
      
      public function addFilter(param1:BitmapFilter) : void
      {
         if(this._bitmapFilters.indexOf(param1) == -1)
         {
            this._bitmapFilters.push(param1);
         }
         this._oldData.filterChanged = true;
         this.updateNow = true;
      }
      
      public function removeFilter(param1:BitmapFilter) : void
      {
         var _loc2_:int = this._bitmapFilters.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._bitmapFilters.splice(_loc2_,1);
         }
         this._oldData.filterChanged = true;
         this.updateNow = true;
      }
      
      public function removeAllFilters() : void
      {
         this._bitmapFilters.length = 0;
         this._oldData.filterChanged = true;
         this.updateNow = true;
      }
      
      public function get currentFrame() : int
      {
         return this._currentFrame;
      }
      
      public function get totalFrame() : int
      {
         return this._currentAvatarPartStatus != null ? this._currentAvatarPartStatus.frame : 1;
      }
      
      public function playTo(param1:String = null, param2:int = -1, param3:int = -1, param4:AvatarPlayCondition = null) : void
      {
         var _loc19_:String = null;
         var _loc20_:Object = null;
         if(!this.avatar || !this.avatar.sceneCharacter)
         {
            return;
         }
         if(param3 != -1)
         {
            param3 = (param3 % 360 + 360) % 360;
         }
         var _loc5_:Boolean = false;
         var _loc6_:String = this._currentStatus;
         var _loc7_:String = this._use_currentStatus;
         var _loc8_:int = this._currentLogicAngel;
         var _loc9_:Number = this._currentRotation;
         var _loc10_:String = this._classNamePrefix;
         this._only1Frame = false;
         this._autoRecycle = false;
         this._autoToStand = false;
         this._drawMouseOn = true;
         this._callBackAttack = false;
         this._only1LogicAngel = false;
         this._only1Repeat = false;
         if(param1 != null && param1 != this._currentStatus)
         {
            this._currentStatus = param1;
         }
         if(param2 != -1 && param2 != this._currentLogicAngel)
         {
            this._currentLogicAngel = param2;
         }
         if(param3 != -1 && param3 != this._currentRotation)
         {
            this._currentRotation = param3;
         }
         if(param4 != null)
         {
            this._playCondition = param4;
         }
         else if(this._playCondition == null)
         {
            this._playCondition = new AvatarPlayCondition();
         }
         if(this.id == AvatarPartID.BLANK)
         {
            this._currentStatus = CharStatusType.STAND;
            this._currentLogicAngel = 0;
            this._only1LogicAngel = true;
         }
         if(this.avatar.sceneCharacter.type == SceneCharacterType.TRANSPORT)
         {
            this._currentStatus = CharStatusType.STAND;
            this._currentLogicAngel = 0;
            this._only1LogicAngel = true;
         }
         if(this.type == AvatarPartType.MAGIC_RING || this.type == AvatarPartType.MAGIC_PASS || this.type == AvatarPartType.MAGIC)
         {
            this._currentStatus = CharStatusType.STAND;
            if(!this._avatarParamData.useMagicAngle)
            {
               this._currentLogicAngel = 0;
               this._only1LogicAngel = true;
            }
         }
         if(this.type == AvatarPartType.BODY && this._currentStatus == CharStatusType.ATTACK)
         {
            this._callBackAttack = true;
         }
         if(this.type == AvatarPartType.MOUNT)
         {
            if(this._currentStatus == CharStatusType.JUMP)
            {
               this._currentStatus = CharStatusType.WALK;
            }
            else if(this._currentStatus == CharStatusType.ATTACK)
            {
               this._currentStatus = CharStatusType.MOUNT_ATTACK;
            }
         }
         if(this._currentStatus == CharStatusType.DEATH)
         {
            this._currentLogicAngel = 0;
            this._only1LogicAngel = true;
         }
         if(CharStatusType.isOnly1Repeat(this._currentStatus))
         {
            this._only1Repeat = true;
         }
         if(this.type == AvatarPartType.MAGIC_PASS)
         {
            this._only1Frame = true;
         }
         if(this.type == AvatarPartType.MAGIC_PASS || this.type == AvatarPartType.MAGIC)
         {
            this._autoRecycle = true;
         }
         if(this.type == AvatarPartType.MAGIC_RING || this.type == AvatarPartType.MAGIC_PASS || this.type == AvatarPartType.MAGIC)
         {
            this._drawMouseOn = false;
         }
         if(this.type == AvatarPartType.BODY)
         {
            this._autoToStand = true;
         }
         var _loc11_:Array = [AvatarPartType.BODY,AvatarPartType.WEAPON,AvatarPartType.BOW,AvatarPartType.SWING,AvatarPartType.HEAD,AvatarPartType.MOUNT];
         var _loc12_:Array = [CharStatusType.JUMP,CharStatusType.ATTACK,CharStatusType.MOUNT_ATTACK,CharStatusType.INJURED,CharStatusType.DEATH];
         var _loc13_:Array = [AvatarPartType.BODY,AvatarPartType.WEAPON,AvatarPartType.BOW,AvatarPartType.SWING,AvatarPartType.HEAD,AvatarPartType.MOUNT];
         var _loc14_:Array = [CharStatusType.JUMP,CharStatusType.DEATH];
         var _loc15_:Array = [AvatarPartType.BODY,AvatarPartType.WEAPON,AvatarPartType.BOW,AvatarPartType.SWING,AvatarPartType.HEAD,AvatarPartType.MOUNT];
         var _loc16_:Array = [CharStatusType.DEATH];
         var _loc17_:Array = [AvatarPartType.BODY,AvatarPartType.WEAPON,AvatarPartType.BOW,AvatarPartType.SWING,AvatarPartType.HEAD,AvatarPartType.MOUNT];
         var _loc18_:Array = [CharStatusType.JUMP];
         this._playCondition.playAtBegin = this._playCondition.playAtBegin && _loc11_.indexOf(this.type) != -1 && _loc12_.indexOf(this._currentStatus) != -1 ? true : false;
         this._playCondition.stayAtEnd = this._playCondition.stayAtEnd && _loc13_.indexOf(this.type) != -1 && _loc14_.indexOf(this._currentStatus) != -1 ? true : false;
         this._playCondition.showEnd = this._playCondition.showEnd && _loc15_.indexOf(this.type) != -1 && _loc16_.indexOf(this._currentStatus) != -1 ? true : false;
         this._playCondition.showXunhuan = this._playCondition.showXunhuan && _loc17_.indexOf(this.type) != -1 && _loc18_.indexOf(this._currentStatus) != -1 ? true : false;
         this._use_currentStatus = this._currentStatus;
         if(this._currentStatus == CharStatusType.STAND && this._playCondition.standStatus != null && this._playCondition.standStatus != "")
         {
            this._use_currentStatus = this._playCondition.standStatus;
         }
         if(this._currentStatus == CharStatusType.ATTACK && this._playCondition.attackStatus != null && this._playCondition.attackStatus != "")
         {
            this._use_currentStatus = this._playCondition.attackStatus;
         }
         if(this._currentStatus == CharStatusType.MOUNT_ATTACK && this._playCondition.mount_attackStatus != null && this._playCondition.mount_attackStatus != "")
         {
            this._use_currentStatus = this._playCondition.mount_attackStatus;
         }
         if(_loc6_ != this._currentStatus || _loc7_ != this._use_currentStatus)
         {
            if(this._avatarPartStatusList != null)
            {
               this._currentAvatarPartStatus = this._avatarPartStatusList.getAvatarPardStatus(this._use_currentStatus);
               if(this._currentAvatarPartStatus != null)
               {
                  this._classNamePrefix = this._currentAvatarPartStatus.classNamePrefix;
               }
            }
            else
            {
               this._currentAvatarPartStatus = null;
            }
            _loc5_ = true;
         }
         if(_loc8_ != this._currentLogicAngel)
         {
            _loc5_ = true;
         }
         if(_loc9_ != this._currentRotation)
         {
            _loc5_ = true;
         }
         if(_loc5_)
         {
            if(_loc6_ != this._currentStatus || _loc7_ != this._use_currentStatus)
            {
               if(_loc7_ != null && _loc7_ != "")
               {
                  _loc19_ = _loc10_ + _loc7_;
                  this._avatarImgData = null;
                  SceneCache.uninstallAvatarImg(_loc19_);
               }
               if(this._use_currentStatus != null && this._use_currentStatus != "" && this._currentAvatarPartStatus != null)
               {
                  _loc19_ = this._classNamePrefix + this._use_currentStatus;
                  this._avatarImgData = SceneCache.installAvatarImg(this._currentAvatarPartStatus,_loc19_,this._only1LogicAngel);
               }
               else
               {
                  this._avatarImgData = null;
               }
               this._lastTime = 0;
               this._currentFrame = -1;
               this._playCount = 0;
               this._playBeforeStart = true;
               this._playStart = true;
               this._playComplete = false;
            }
            this._enablePlay = true;
            this.updateNow = true;
         }
         if(this._playCondition.playAtBegin)
         {
            this.updateNow = true;
            this._lastTime = 0;
            this._currentFrame = -1;
            this._playCount = 0;
            this._playBeforeStart = true;
            this._playStart = true;
            this._playComplete = false;
         }
         if(this._playCondition.showEnd)
         {
            this.updateNow = true;
            this._playCount = 0;
            this._playBeforeStart = false;
            this._playStart = false;
            this._playComplete = false;
         }
         if(this._playCondition.showXunhuan)
         {
            this.updateNow = true;
            this._playCount = 0;
            this._playBeforeStart = false;
            this._playStart = false;
            this._playComplete = false;
         }
         if(this._avatarParamData.depth == 0)
         {
            this.depth = AvatarPartType.getDefaultDepth(this.type,this.avatar.logicAngle);
         }
      }
      
      public function onAdd() : void
      {
         if(this._onAdd != null)
         {
            this._onAdd(this.avatar != null ? this.avatar.sceneCharacter : null,this);
         }
      }
      
      public function onRemove() : void
      {
         if(this._onRemove != null)
         {
            this._onRemove(this.avatar != null ? this.avatar.sceneCharacter : null,this);
         }
      }
      
      public function run(param1:int = -1) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         var _loc8_:Point = null;
         var _loc9_:AvatarPartData = null;
         var _loc10_:BitmapData = null;
         var _loc11_:Point = null;
         var _loc12_:Point = null;
         var _loc13_:Point = null;
         var _loc14_:Point = null;
         var _loc15_:Point = null;
         var _loc16_:Number = NaN;
         var _loc17_:Number = NaN;
         var _loc18_:Matrix = null;
         var _loc19_:BitmapFilter = null;
         if(!this._enablePlay)
         {
            return;
         }
         this.renderRectArr.length = 0;
         var _loc2_:Boolean = false;
         var _loc3_:int = SceneRender.nowTime;
         if(this._sleepTime > 0 && this._lastPlayCompleteTime > 0 && _loc3_ - this._lastPlayCompleteTime <= this._sleepTime)
         {
            _loc2_ = true;
         }
         if(this.avatar.sceneCharacter.updateNow)
         {
            this.updateNow = true;
         }
         if(this.avatar.updateNow)
         {
            this.updateNow = true;
         }
         if(this._oldData.visible != this.visible)
         {
            this._oldData.visible = this.visible;
            this.updateNow = true;
         }
         if(this._oldData.inSleep != _loc2_)
         {
            this._oldData.inSleep = _loc2_;
            this.updateNow = true;
         }
         var _loc4_:Boolean = this.avatarImg != null;
         if(this._oldData.hasAvatarImg != _loc4_)
         {
            this._oldData.hasAvatarImg = _loc4_;
            this.updateNow = true;
         }
         if(this._playBeforeStart)
         {
            this.updateNow = true;
         }
         if(this._dynamicPosition != null)
         {
            this.updateNow = true;
         }
         if(this._currentAvatarPartStatus != null)
         {
            if(!_loc2_)
            {
               if(param1 >= 0)
               {
                  this._currentFrame = param1;
                  this.updateNow = true;
               }
               else if(this._playCondition.showEnd)
               {
                  this._currentFrame = this.totalFrame - 1;
               }
               else
               {
                  _loc5_ = _loc3_ - this._lastTime;
                  if(_loc5_ >= this._currentAvatarPartStatus.time)
                  {
                     this._lastTime = _loc3_;
                     ++this._currentFrame;
                     _loc6_ = false;
                     if(this._currentFrame >= this.totalFrame)
                     {
                        if(this._sleepTime > 0)
                        {
                           this._lastPlayCompleteTime = _loc3_;
                           _loc2_ = true;
                           this._currentFrame = -1;
                        }
                        else
                        {
                           this._currentFrame = 0;
                        }
                        if(this._playCondition.stayAtEnd)
                        {
                           this._currentFrame = this.totalFrame - 1;
                           _loc6_ = true;
                        }
                        else
                        {
                           _loc7_ = this._only1Repeat ? 1 : this._repeat;
                           if(_loc7_ != 0 && ++this._playCount >= _loc7_)
                           {
                              this._currentFrame = this.totalFrame - 1;
                              this._playComplete = true;
                           }
                        }
                        if(this._playCondition.showXunhuan)
                        {
                           this._currentFrame = 1;
                        }
                     }
                     if(!_loc6_ && this.totalFrame > 1)
                     {
                        this.updateNow = true;
                     }
                  }
               }
            }
         }
         if(this.updateNow)
         {
            if(!this.avatar || !this.avatar.sceneCharacter)
            {
               return;
            }
            if(this._only1Frame)
            {
               this._currentFrame = 0;
            }
            if(this.visible && this.avatar.visible && this.avatar.sceneCharacter.visible && this.avatar.sceneCharacter.inViewDistance() && this.avatarImg != null && !_loc2_ && this._currentAvatarPartStatus != null)
            {
               _loc8_ = this.getTargetPosition();
               if(this._dynamicPosition != null)
               {
                  if(this._sceneCharacterPosition.x != -int.MAX_VALUE || this._sceneCharacterPosition.y != -int.MAX_VALUE)
                  {
                     _loc8_ = this._dynamicPosition.updateDynamicTargetPosition(this._sceneCharacterPosition,_loc8_,this.avatar.sceneCharacter.getLogicAngle());
                  }
               }
               this._sceneCharacterPosition.x = _loc8_.x;
               this._sceneCharacterPosition.y = _loc8_.y;
               _loc9_ = this._currentAvatarPartStatus.getAvatarPartData(this._currentLogicAngel,this._currentFrame);
               if(_loc9_ != null)
               {
                  this.cutRect.width = _loc9_.width;
                  this.cutRect.height = _loc9_.height;
                  this.cutRect.x = this._sceneCharacterPosition.x - _loc9_.tx;
                  this.cutRect.y = this._sceneCharacterPosition.y - _loc9_.ty;
                  this._sourcePoint.x = _loc9_.sx;
                  this._sourcePoint.y = _loc9_.sy;
                  if(this._currentRotation > 0)
                  {
                     if(this._drawSourceBitmapData == null || this._oldData.oldDrawRotation != this._currentRotation)
                     {
                        this._oldData.oldDrawRotation = this._currentRotation;
                        _loc10_ = new BitmapData(_loc9_.width,_loc9_.height,true,0);
                        _loc10_.copyPixels(this.avatarImg,new Rectangle(_loc9_.sx,_loc9_.sy,_loc9_.width,_loc9_.height),new Point(),null,null,true);
                        _loc11_ = new Point(_loc9_.tx,_loc9_.ty);
                        _loc12_ = ZMath.getRotPoint(new Point(0,0),_loc11_,this._currentRotation);
                        _loc13_ = ZMath.getRotPoint(new Point(_loc9_.width,0),_loc11_,this._currentRotation);
                        _loc14_ = ZMath.getRotPoint(new Point(_loc9_.width,_loc9_.height),_loc11_,this._currentRotation);
                        _loc15_ = ZMath.getRotPoint(new Point(0,_loc9_.height),_loc11_,this._currentRotation);
                        _loc16_ = Math.max(Math.abs(_loc14_.x - _loc12_.x),Math.abs(_loc15_.x - _loc13_.x));
                        _loc17_ = Math.max(Math.abs(_loc14_.y - _loc12_.y),Math.abs(_loc15_.y - _loc13_.y));
                        this._oldData.oldOffsetX = Math.min(_loc12_.x,_loc13_.x,_loc14_.x,_loc15_.x);
                        this._oldData.oldOffsetY = Math.min(_loc12_.y,_loc13_.y,_loc14_.y,_loc15_.y);
                        _loc18_ = new Matrix();
                        _loc18_.translate(-_loc9_.tx,-_loc9_.ty);
                        _loc18_.rotate(this._currentRotation * Math.PI / 180);
                        _loc18_.translate(_loc16_ / 2,_loc17_ / 2);
                        this._drawSourceBitmapData = new BitmapData(_loc16_,_loc17_,true,0);
                        this._drawSourceBitmapData.draw(_loc10_,_loc18_,null,null,null,true);
                     }
                     this.cutRect.x = this._sceneCharacterPosition.x - (_loc9_.tx - this._oldData.oldOffsetX);
                     this.cutRect.y = this._sceneCharacterPosition.y - (_loc9_.ty - this._oldData.oldOffsetY);
                     this.cutRect.width = this._drawSourceBitmapData.width;
                     this.cutRect.height = this._drawSourceBitmapData.height;
                     this._sourcePoint.x = 0;
                     this._sourcePoint.y = 0;
                  }
                  else
                  {
                     this._drawSourceBitmapData = this.avatarImg;
                  }
                  if(this._bitmapFilters.length > 0)
                  {
                     if(this._glowFilterDrawSourceBitmapData == null || Boolean(this._oldData.filterChanged))
                     {
                        this._glowFilterDrawSourceBitmapData = new BitmapData(this.cutRect.width,this.cutRect.height,true,0);
                        this._glowFilterDrawSourceBitmapData.copyPixels(this._drawSourceBitmapData,new Rectangle(this._sourcePoint.x,this._sourcePoint.y,this.cutRect.width,this.cutRect.height),new Point(),null,null,true);
                        for each(_loc19_ in this._bitmapFilters)
                        {
                           this._glowFilterDrawSourceBitmapData.applyFilter(this._glowFilterDrawSourceBitmapData,new Rectangle(0,0,this.cutRect.width,this.cutRect.height),new Point(),_loc19_);
                        }
                     }
                     this._sourcePoint.x = 0;
                     this._sourcePoint.y = 0;
                  }
                  else if(this._glowFilterDrawSourceBitmapData != null)
                  {
                     this._glowFilterDrawSourceBitmapData = null;
                  }
                  if(this.avatar.sceneCharacter.isInMask)
                  {
                     this._inMaskDrawSourceBitmapData = new BitmapData(this.cutRect.width,this.cutRect.height,true,0);
                     this._inMaskDrawSourceBitmapData.copyPixels(this._glowFilterDrawSourceBitmapData || this._drawSourceBitmapData,new Rectangle(this._sourcePoint.x,this._sourcePoint.y,this.cutRect.width,this.cutRect.height),new Point(0,0),null,null,true);
                     this._inMaskDrawSourceBitmapData.colorTransform(this._inMaskDrawSourceBitmapData.rect,new ColorTransform(1,1,1,0.5,0,0,0,0));
                     this._sourcePoint.x = 0;
                     this._sourcePoint.y = 0;
                  }
                  else if(this._inMaskDrawSourceBitmapData != null)
                  {
                     this._inMaskDrawSourceBitmapData.dispose();
                     this._inMaskDrawSourceBitmapData = null;
                  }
               }
               else
               {
                  this.cutRect.setEmpty();
                  this._sourcePoint.x = 0;
                  this._sourcePoint.y = 0;
               }
            }
            else
            {
               this.cutRect.setEmpty();
               this._sourcePoint.x = 0;
               this._sourcePoint.y = 0;
            }
            if(this.avatar.sceneCharacter.scene)
            {
               if(!this._oldData.oldCutRect.isEmpty())
               {
                  this.avatar.sceneCharacter.scene.sceneAvatarLayer.clearBoundsArr.push(Bounds.fromRectangle(this._oldData.oldCutRect));
               }
               if(!this.cutRect.isEmpty() && !this.cutRect.equals(this._oldData.oldCutRect))
               {
                  this.avatar.sceneCharacter.scene.sceneAvatarLayer.clearBoundsArr.push(Bounds.fromRectangle(this.cutRect));
               }
            }
            else
            {
               if(!this._oldData.oldCutRect.isEmpty() && !this.avatar.isClearRectArrContains(this._oldData.oldCutRect))
               {
                  this.avatar.clearRectArr.push((this._oldData.oldCutRect as Rectangle).clone());
               }
               if(!this.cutRect.isEmpty() && !this.cutRect.equals(this._oldData.oldCutRect) && !this.avatar.isClearRectArrContains(this.cutRect))
               {
                  this.avatar.clearRectArr.push(this.cutRect.clone());
               }
            }
            if(!this.cutRect.isEmpty())
            {
               this.renderRectArr.push(this.cutRect);
            }
            this._oldData.oldCutRect.x = this.cutRect.x;
            this._oldData.oldCutRect.y = this.cutRect.y;
            this._oldData.oldCutRect.width = this.cutRect.width;
            this._oldData.oldCutRect.height = this.cutRect.height;
         }
         else if(this.avatar.sceneCharacter.scene)
         {
            this.avatar.sceneCharacter.scene.sceneAvatarLayer.restingAvatarPartArr.push(this);
         }
         else
         {
            this.avatar.restingAvatarPartArr.push(this);
         }
         if(this._drawMouseOn && !this.cutRect.isEmpty())
         {
            if(this.avatar.sceneCharacter.mouseRect != null)
            {
               this.avatar.sceneCharacter.mouseRect = this.avatar.sceneCharacter.mouseRect.union(this.cutRect);
            }
            else
            {
               this.avatar.sceneCharacter.mouseRect = this.cutRect;
            }
         }
      }
      
      public function draw(param1:IBitmapDrawable) : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Function = null;
         if(!this.updateNow)
         {
            return;
         }
         this.updateNow = false;
         if(!this._enablePlay)
         {
            return;
         }
         if(this._playBeforeStart)
         {
            this._playBeforeStart = false;
            if(this._onPlayBeforeStart != null)
            {
               this._onPlayBeforeStart(this.avatar != null ? this.avatar.sceneCharacter : null,this);
            }
         }
         if(!this._enablePlay)
         {
            return;
         }
         if(!this.avatar || !this.avatar.sceneCharacter)
         {
            return;
         }
         if(this.visible && this.avatar.visible && this.avatar.sceneCharacter.visible && this.avatar.sceneCharacter.inViewDistance() && Boolean(this.avatarImg))
         {
            _loc2_ = this._inMaskDrawSourceBitmapData || this._glowFilterDrawSourceBitmapData || this._drawSourceBitmapData;
            if(_loc2_ != null)
            {
               for each(_loc3_ in this.renderRectArr)
               {
                  if(!_loc3_.isEmpty())
                  {
                     this.copyToAvatarBD(param1,_loc2_,this._sourcePoint.x + (_loc3_.x - this.cutRect.x),this._sourcePoint.y + (_loc3_.y - this.cutRect.y),_loc3_.width,_loc3_.height,_loc3_.x,_loc3_.y);
                  }
               }
            }
         }
         if(this._playStart)
         {
            this._playStart = false;
            if(this._onPlayStart != null)
            {
               this._onPlayStart(this.avatar != null ? this.avatar.sceneCharacter : null,this);
            }
         }
         if(this._onPlayUpdate != null)
         {
            this._onPlayUpdate(this.avatar != null ? this.avatar.sceneCharacter : null,this);
         }
         if(this._callBackAttack)
         {
            if(this.avatar.sceneCharacter.showAttack != null && this._currentFrame >= Math.max(this.totalFrame - 3,0))
            {
               this._callBackAttack = false;
               _loc4_ = this.avatar.sceneCharacter.showAttack;
               this.avatar.sceneCharacter.showAttack = null;
               HandlerHelper.execute(_loc4_);
            }
         }
         if(this._playComplete)
         {
            this._playComplete = false;
            this._enablePlay = false;
            if(this._onPlayComplete != null)
            {
               this._onPlayComplete(this.avatar != null ? this.avatar.sceneCharacter : null,this);
            }
            if(this._autoRecycle && Boolean(this.avatar))
            {
               this.avatar.removeAvatarPart(this);
            }
            else if(this._autoToStand && Boolean(this.avatar))
            {
               this.avatar.playTo(CharStatusType.STAND);
            }
         }
      }
      
      private function copyToAvatarBD(param1:IBitmapDrawable, param2:BitmapData, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         if(!param2)
         {
            return;
         }
         if(param1 is SceneAvatarLayer)
         {
            (param1 as SceneAvatarLayer).copyImage(param2,param3,param4,param5,param6,param7,param8);
         }
         else if(param1 is BitmapData)
         {
            this.avatar.drawUIAvatar(param1 as BitmapData,param2,param3,param4,param5,param6,param7,param8);
         }
      }
      
      private function getTargetPosition() : Point
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._useSpecilizeXY && (this.avatar.sceneCharacter.strongUseSpecilizeXY || this.avatar.sceneCharacter.isJumping() || this.avatar.sceneCharacter.restStatus == RestType.DOUBLE_SIT))
         {
            _loc1_ = Math.round(this.avatar.sceneCharacter.specilize_x);
            _loc2_ = Math.round(this.avatar.sceneCharacter.specilize_y);
         }
         else
         {
            _loc1_ = Math.round(this.avatar.sceneCharacter.piexl_x);
            _loc2_ = Math.round(this.avatar.sceneCharacter.piexl_y);
         }
         _loc1_ += this._offsetX;
         _loc2_ += this._offsetY;
         if(this.avatar.sceneCharacter.isOnMount)
         {
            _loc1_ += this._offsetOnMountX;
            _loc2_ += this._offsetOnMountY;
         }
         if(this.avatar.sceneCharacter.isSit)
         {
            _loc1_ += this._offsetSitX;
            _loc2_ += this._offsetSitY;
         }
         return new Point(_loc1_,_loc2_);
      }
      
      public function correctAvatarPosition() : void
      {
         if(this.avatar == null || this.avatar.sceneCharacter == null)
         {
            return;
         }
         var _loc1_:Point = this.getTargetPosition();
         this._sceneCharacterPosition.x = _loc1_.x;
         this._sceneCharacterPosition.y = _loc1_.y;
         this.updateNow = true;
      }
      
      public function getNowAvatarFaceData() : AvatarFaceData
      {
         if(!this.usable)
         {
            return null;
         }
         if(!this.visible && !this.avatar.visible && !this.avatar.sceneCharacter.visible)
         {
            return null;
         }
         var _loc1_:AvatarFaceData = new AvatarFaceData();
         _loc1_.sourceBitmapData = this._inMaskDrawSourceBitmapData || this._glowFilterDrawSourceBitmapData || this._drawSourceBitmapData;
         _loc1_.cutRect = this.cutRect;
         _loc1_.sourcePoint = this._sourcePoint;
         _loc1_.id = this.id;
         _loc1_.type = this.type;
         if(!_loc1_.isGood())
         {
            return null;
         }
         return _loc1_;
      }
      
      public function hitPoint(param1:Point) : Boolean
      {
         var _loc3_:uint = 0;
         if(!this.visible)
         {
            return false;
         }
         var _loc2_:BitmapData = this._inMaskDrawSourceBitmapData || this._glowFilterDrawSourceBitmapData || this._drawSourceBitmapData;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getPixel32(param1.x - this.cutRect.x + this._sourcePoint.x,param1.y - this.cutRect.y + this._sourcePoint.y);
            if(_loc3_ != 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function clearMe() : void
      {
         if(this.avatar.sceneCharacter.scene)
         {
            this.avatar.sceneCharacter.scene.sceneAvatarLayer.removeBoundsArr.push(Bounds.fromRectangle(this._oldData.oldCutRect));
         }
         else if(!this.avatar.isClearRectArrContains(this._oldData.oldCutRect))
         {
            this.avatar.clearRectArr.push((this._oldData.oldCutRect as Rectangle).clone());
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:String = null;
         this.usable = false;
         this.clearMe();
         if(this._use_currentStatus != null && this._use_currentStatus != "")
         {
            _loc1_ = this._classNamePrefix + this._use_currentStatus;
            SceneCache.uninstallAvatarImg(_loc1_);
         }
         this._enablePlay = false;
         this.visible = true;
         this.updateNow = false;
         this._oldData = null;
         this.avatar = null;
         this._avatarParamData = null;
         this._avatarPartStatusList = null;
         this._sceneCharacterPosition = null;
         this.cutRect = null;
         this._sourcePoint = null;
         this.renderRectArr = null;
         this.id = "";
         this.type = "";
         this._classNamePrefix = "";
         this._repeat = 0;
         this.depth = 0;
         this._offsetX = 0;
         this._offsetY = 0;
         this._offsetOnMountX = 0;
         this._offsetOnMountY = 0;
         this._offsetSitX = 0;
         this._offsetSitY = 0;
         this._dynamicPosition = null;
         this._sleepTime = 0;
         this._onAdd = null;
         this._onRemove = null;
         this._onPlayBeforeStart = null;
         this._onPlayStart = null;
         this._onPlayUpdate = null;
         this._onPlayComplete = null;
         this._avatarImgData = null;
         if(this._drawSourceBitmapData)
         {
            this._drawSourceBitmapData = null;
         }
         if(this._inMaskDrawSourceBitmapData)
         {
            this._inMaskDrawSourceBitmapData.dispose();
            this._inMaskDrawSourceBitmapData = null;
         }
         if(this._glowFilterDrawSourceBitmapData)
         {
            this._glowFilterDrawSourceBitmapData.dispose();
            this._glowFilterDrawSourceBitmapData = null;
         }
         this._bitmapFilters.length = 0;
         this._currentStatus = "";
         this._use_currentStatus = "";
         this._currentAvatarPartStatus = null;
         this._currentFrame = -1;
         this._currentLogicAngel = 0;
         this._currentRotation = 0;
         this._playCondition = null;
         this._playCount = 0;
         this._playBeforeStart = false;
         this._playStart = false;
         this._playComplete = false;
         this._lastTime = 0;
         this._lastPlayCompleteTime = 0;
         this._only1Frame = false;
         this._only1LogicAngel = false;
         this._only1Repeat = false;
         this._autoRecycle = false;
         this._autoToStand = false;
         this._useSpecilizeXY = true;
         this._drawMouseOn = true;
         this._callBackAttack = false;
      }
      
      public function reSet(param1:Array) : void
      {
         this._avatarParamData = param1[0];
         this._avatarPartStatusList = param1[1];
         this.id = this._avatarParamData.id;
         this.type = this._avatarParamData.type || AvatarPartType.BODY;
         this._repeat = this._avatarParamData.repeat;
         this.depth = this._avatarParamData.depth;
         this._offsetX = this._avatarParamData.offsetX;
         this._offsetY = this._avatarParamData.offsetY;
         this._offsetOnMountX = this._avatarParamData.offsetOnMountX;
         this._offsetOnMountY = this._avatarParamData.offsetOnMountY;
         this._offsetSitX = this._avatarParamData.offsetSitX;
         this._offsetSitY = this._avatarParamData.offsetSitY;
         this._dynamicPosition = this._avatarParamData.dynamicPosition;
         this._sleepTime = this._avatarParamData.sleepTime;
         this._useSpecilizeXY = this._avatarParamData.useSpecilizeXY;
         var _loc2_:AvatarPlayCallBack = this._avatarParamData.playCallBack;
         if(_loc2_ != null)
         {
            this._onAdd = _loc2_.onAdd;
            this._onRemove = _loc2_.onRemove;
            this._onPlayBeforeStart = _loc2_.onPlayBeforeStart;
            this._onPlayStart = _loc2_.onPlayStart;
            this._onPlayUpdate = _loc2_.onPlayUpdate;
            this._onPlayComplete = _loc2_.onPlayComplete;
         }
         this.updateNow = true;
         this._oldData = {
            "visible":true,
            "oldCutRect":new Rectangle(),
            "oldDrawRotation":-1,
            "oldOffsetX":0,
            "oldOffsetY":0,
            "inSleep":false,
            "hasAvatarImg":false
         };
         this._sceneCharacterPosition = new Point(-int.MAX_VALUE,-int.MAX_VALUE);
         this.cutRect = new Rectangle();
         this._sourcePoint = new Point();
         this.renderRectArr = [];
         this.usable = true;
      }
   }
}

