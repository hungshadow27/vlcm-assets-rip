package com.zcp.engine
{
   import com.zcp.common.pool.IPoolClass;
   import com.zcp.common.utils.ZMath;
   import com.zcp.engine.graphics.avatar.Avatar;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.graphics.tagger.HeadFace;
   import com.zcp.engine.helper.MagicHelper;
   import com.zcp.engine.helper.MoveHelper;
   import com.zcp.engine.helper.TaggerHelper;
   import com.zcp.engine.move.WalkStep;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.RestType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.tools.ScenePool;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.utils.Transformer;
   import com.zcp.engine.vo.BaseElement;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import com.zcp.engine.vo.move.MoveCallBack;
   import com.zcp.engine.vo.move.MoveData;
   import flash.display.DisplayObject;
   import flash.display.IBitmapDrawable;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   public class SceneCharacter extends BaseElement implements IPoolClass
   {
      
      public var usable:Boolean = false;
      
      public var visible:Boolean = true;
      
      public var updateNow:Boolean = false;
      
      private var _oldData:Object;
      
      public var scene:Scene;
      
      public var type:int;
      
      public var avatar:Avatar;
      
      public var headFace:HeadFace;
      
      private var _moveData:MoveData;
      
      public var specilize_x:Number = 0;
      
      public var specilize_y:Number = 0;
      
      public var surround_angle:Number = 0;
      
      public var showIndex:int = 0;
      
      public var showAttack:Function;
      
      public var mouseRect:Rectangle;
      
      public var isMouseOn:Boolean;
      
      public var isSelected:Boolean;
      
      public var isMask:Boolean = false;
      
      public var restStatus:int;
      
      public var strongUseSpecilizeXY:Boolean;
      
      private var _colorFilterDict:Dictionary;
      
      public function SceneCharacter(param1:int, param2:Scene, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         super();
         this.reSet([param1,param2,param3,param4,param5]);
      }
      
      public static function createSceneCharacter(param1:int, param2:Scene, param3:int = 0, param4:int = 0, param5:int = 0) : SceneCharacter
      {
         return ScenePool.sceneCharacterPool.createObj(SceneCharacter,param1,param2,param3,param4,param5) as SceneCharacter;
      }
      
      public static function recycleSceneCharacter(param1:SceneCharacter) : void
      {
         ScenePool.sceneCharacterPool.disposeObj(param1);
      }
      
      public function get moveData() : MoveData
      {
         if(this._moveData == null)
         {
            this._moveData = new MoveData();
         }
         return this._moveData;
      }
      
      public function get isInMask() : Boolean
      {
         return SceneUtil.isMask(tile_x,tile_y) || this.isMask;
      }
      
      public function faceTo(param1:Number, param2:Number) : void
      {
         if(piexl_x == param1 && piexl_y == param2)
         {
            return;
         }
         var _loc3_:Number = ZMath.getTowPointsAngle(new Point(piexl_x,piexl_y),new Point(param1,param2));
         this.setAngle(_loc3_);
      }
      
      public function faceToTile(param1:Number, param2:Number) : void
      {
         var _loc3_:Point = Transformer.transTilePoint2PixelPoint(new Point(param1,param2));
         this.faceTo(_loc3_.x,_loc3_.y);
      }
      
      public function faceToCharacter(param1:SceneCharacter) : void
      {
         this.faceTo(param1.piexl_x,param1.piexl_y);
      }
      
      public function setXY(param1:Number, param2:Number) : void
      {
         piexl_x = param1;
         piexl_y = param2;
      }
      
      public function setTileXY(param1:Number, param2:Number) : void
      {
         tile_x = param1;
         tile_y = param2;
      }
      
      public function reviseTileXY(param1:Number, param2:Number) : void
      {
         this.setTileXY(param1,param2);
         MoveHelper.reviseMove(this);
      }
      
      public function setSpeed(param1:Number) : void
      {
         this.moveData.walk_speed = param1;
      }
      
      public function getSpeed() : Number
      {
         return this.moveData.walk_speed;
      }
      
      public function setStatus(param1:String) : void
      {
         if(this.getStatus() == param1)
         {
            return;
         }
         this.playTo(param1,-1,-1);
      }
      
      public function getStatus() : String
      {
         return this.avatar.status;
      }
      
      public function setAngle(param1:Number) : void
      {
         var _loc2_:int = Transformer.transAngle2LogicAngle(param1);
         this.setLogicAngle(_loc2_);
      }
      
      public function setLogicAngle(param1:int) : void
      {
         if(this.getLogicAngle() == param1)
         {
            return;
         }
         this.playTo(null,param1,-1);
      }
      
      public function getLogicAngle() : int
      {
         return this.avatar.logicAngle;
      }
      
      public function get logicAnglePRI() : int
      {
         if(this.avatar.logicAngle == 0)
         {
            return 0;
         }
         if(this.avatar.logicAngle == 1)
         {
            return 1;
         }
         if(this.avatar.logicAngle == 7)
         {
            return 2;
         }
         if(this.avatar.logicAngle == 2)
         {
            return 3;
         }
         if(this.avatar.logicAngle == 6)
         {
            return 4;
         }
         if(this.avatar.logicAngle == 3)
         {
            return 5;
         }
         if(this.avatar.logicAngle == 5)
         {
            return 6;
         }
         if(this.avatar.logicAngle == 4)
         {
            return 7;
         }
         return 0;
      }
      
      public function setRotation(param1:Number) : void
      {
         this.playTo(null,-1,param1);
      }
      
      public function playTo(param1:String = null, param2:int = -1, param3:int = -1, param4:AvatarPlayCondition = null) : void
      {
         this.avatar.playTo(param1,param2,param3,param4);
      }
      
      public function stopMove(param1:Boolean = true, param2:Boolean = false) : void
      {
         MoveHelper.stopMove(this,param1,param2);
      }
      
      public function jump(param1:Point, param2:Number = -1, param3:Number = -1, param4:MoveCallBack = null, param5:Boolean = false, param6:Boolean = false) : void
      {
         MoveHelper.jump(this,param1,param2,param3,param4,param5,param6);
      }
      
      public function breakJump(param1:Boolean = false, param2:Boolean = false) : void
      {
         MoveHelper.breakJump(this,param1,param2);
      }
      
      public function lineTo(param1:Point, param2:Number, param3:Boolean = false, param4:MoveCallBack = null) : void
      {
         MoveHelper.lineTo(this,param1,param2,param3,param4);
      }
      
      public function lineToPiexl(param1:Point, param2:Number, param3:Function = null) : void
      {
         MoveHelper.lineToPiexl(this,param1,param2,param3);
      }
      
      public function curveToPiexl(param1:Point, param2:int, param3:int, param4:Function = null) : void
      {
         MoveHelper.curveToPiexl(this,param1,param2,param3,param4);
      }
      
      public function walk(param1:Point, param2:Number = -1, param3:Number = 0, param4:MoveCallBack = null) : void
      {
         MoveHelper.walk(this,param1,param2,param3,param4);
      }
      
      public function walk0(param1:Array, param2:Point = null, param3:Number = -1, param4:Number = 0, param5:MoveCallBack = null) : void
      {
         MoveHelper.walk0(this,param1,param2,param3,param4,param5);
      }
      
      public function walk1(param1:ByteArray, param2:Point = null, param3:Number = -1, param4:Number = 0, param5:MoveCallBack = null) : void
      {
         MoveHelper.walk1(this,param1,param2,param3,param4,param5);
      }
      
      public function set isOnMount(param1:Boolean) : void
      {
         this.avatar.isOnMount = param1;
      }
      
      public function get isOnMount() : Boolean
      {
         return this.avatar.isOnMount;
      }
      
      public function get isSit() : Boolean
      {
         return this.avatar.isSit;
      }
      
      public function hasTypeAvatarParts(param1:String) : Boolean
      {
         return this.avatar.hasTypeAvatarParts(param1);
      }
      
      public function hasIDAvatarPart(param1:String) : Boolean
      {
         return this.avatar.hasIDAvatarPart(param1);
      }
      
      public function hasSameAvatarPart(param1:AvatarParamData) : Boolean
      {
         return this.avatar.hasSameAvatarPart(param1);
      }
      
      public function loadAvatarPart(param1:AvatarParamData = null) : void
      {
         this.avatar.loadAvatarPart(param1);
      }
      
      public function showAvatarPart(param1:AvatarPart) : void
      {
         this.avatar.showAvatarPart(param1);
      }
      
      public function hideAvatarPart(param1:AvatarPart) : void
      {
         this.avatar.hideAvatarPart(param1);
      }
      
      public function getTypeAvatarPartsVisible(param1:String) : Boolean
      {
         return this.avatar.getTypeAvatarPartsVisible(param1);
      }
      
      public function showAvatarPartsByType(param1:String) : void
      {
         this.avatar.showAvatarPartsByType(param1);
      }
      
      public function hideAvatarPartsByType(param1:String) : void
      {
         this.avatar.hideAvatarPartsByType(param1);
      }
      
      public function getIDAvatarPartVisible(param1:String) : Boolean
      {
         return this.avatar.getIDAvatarPartVisible(param1);
      }
      
      public function showAvatarPartByID(param1:String) : void
      {
         this.avatar.showAvatarPartByID(param1);
      }
      
      public function hideAvatarPartByID(param1:String) : void
      {
         this.avatar.hideAvatarPartByID(param1);
      }
      
      public function addAvatarPart(param1:AvatarPart, param2:Boolean = false) : void
      {
         var _loc3_:ColorMatrixFilter = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         this.avatar.addAvatarPart(param1,param2);
         if(this._colorFilterDict != null)
         {
            for each(_loc3_ in this._colorFilterDict)
            {
               _loc4_ = 0;
               while(_loc4_ < AvatarPartType.mouseFloodArr.length)
               {
                  _loc5_ = this.getAvatarPartsByType(AvatarPartType.mouseFloodArr[_loc4_]);
                  _loc6_ = 0;
                  while(_loc6_ < _loc5_.length)
                  {
                     _loc5_[_loc6_].addFilter(_loc3_);
                     _loc6_++;
                  }
                  _loc4_++;
               }
            }
         }
      }
      
      public function removeAvatarPart(param1:AvatarPart, param2:Boolean = false, param3:Boolean = true) : void
      {
         this.avatar.removeAvatarPart(param1,param2,param3);
      }
      
      public function removeAllAvatarParts(param1:Boolean = true) : void
      {
         this.avatar.removeAllAvatarParts(param1);
      }
      
      public function removeAvatarPartsByType(param1:String, param2:Boolean = true) : void
      {
         this.avatar.removeAvatarPartsByType(param1,param2);
      }
      
      public function removeAvatarPartByID(param1:String, param2:Boolean = true) : void
      {
         this.avatar.removeAvatarPartByID(param1,param2);
      }
      
      public function getAvatarPartsByType(param1:String) : Array
      {
         return this.avatar.getAvatarPartsByType(param1);
      }
      
      public function getAvatarPartByID(param1:String) : AvatarPart
      {
         return this.avatar.getAvatarPartByID(param1);
      }
      
      public function showMagic_from1passNtoN(param1:Array, param2:AvatarParamData = null, param3:AvatarParamData = null, param4:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1passNtoN(this,param1,param2,param3,param4);
      }
      
      public function showMagic_from1pass1toPointArea(param1:Point, param2:AvatarParamData = null, param3:AvatarParamData = null, param4:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1pass1toPointArea(this,param1,param2,param3,param4);
      }
      
      public function showMagic_from1pass1toRectArea(param1:Point, param2:int, param3:int, param4:int = 1, param5:Boolean = true, param6:AvatarParamData = null, param7:AvatarParamData = null, param8:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1pass1toRectArea(this,param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function showMagic_from1passNtoRectArea(param1:Point, param2:int, param3:int, param4:int = 25, param5:Boolean = true, param6:AvatarParamData = null, param7:AvatarParamData = null, param8:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1passNtoRectArea(this,param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function showMagic_from1pass1toCircleArea(param1:Point, param2:int, param3:int = 10, param4:int = 25, param5:Boolean = true, param6:AvatarParamData = null, param7:AvatarParamData = null, param8:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1pass1toCircleArea(this,param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function showMagic_from1passNtoCircleArea(param1:Point, param2:int, param3:int = 10, param4:int = 25, param5:Boolean = true, param6:AvatarParamData = null, param7:AvatarParamData = null, param8:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1passNtoCircleArea(this,param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function showMagic_from1pass0toCircleArea_byQueue(param1:Point, param2:int, param3:int = 10, param4:int = 25, param5:Boolean = true, param6:AvatarParamData = null, param7:AvatarParamData = null, param8:AvatarParamData = null, param9:int = 10) : void
      {
         MagicHelper.showMagic_from1pass0toCircleArea_byQueue(this,param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function showMagic_from1passNtoSectorEdge(param1:Point, param2:Number = 30, param3:int = 10, param4:AvatarParamData = null, param5:AvatarParamData = null, param6:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1passNtoSectorEdge(this,param1,param2,param3,param4,param5,param6);
      }
      
      public function showMagic(param1:Array, param2:AvatarParamData = null, param3:AvatarParamData = null, param4:AvatarParamData = null) : void
      {
         MagicHelper.showMagic(this,param1,param2,param3,param4);
      }
      
      public function showMagic_from1pass1toStageRandom(param1:SceneCharacter, param2:int, param3:int, param4:int, param5:int, param6:AvatarParamData = null, param7:AvatarParamData = null, param8:AvatarParamData = null) : void
      {
         MagicHelper.showMagic_from1pass1toStageRandom(this,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function showHeadFace(param1:String = "", param2:uint = 16777215, param3:String = "", param4:DisplayObject = null, param5:DisplayObject = null, param6:Boolean = false, param7:DisplayObject = null, param8:DisplayObject = null, param9:Vector.<DisplayObject> = null) : void
      {
         TaggerHelper.showHeadFace(this,param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setHeadFaceNickNameVisible(param1:Boolean) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceNickNameVisible(param1);
      }
      
      public function setHeadFaceCustomTitleVisible(param1:Boolean) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceCustomTitleVisible(param1);
      }
      
      public function setHeadFaceLeftIcoVisible(param1:Boolean) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceLeftIcoVisible(param1);
      }
      
      public function setHeadFaceRightIcoVisible(param1:Boolean) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceRightIcoVisible(param1);
      }
      
      public function setHeadFaceTopIcoVisible(param1:Boolean) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceTopIcoVisible(param1);
      }
      
      public function setHeadFaceCentreIocVisible(param1:Boolean) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceCentreIcoVisible(param1);
      }
      
      public function setHeadFaceBarVisible(param1:Boolean) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceBarVisible(param1);
      }
      
      public function setHeadFaceNickName(param1:String = "", param2:uint = 16777215) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceNickName(param1,param2);
      }
      
      public function setHeadFaceCustomTitleHtmlText(param1:String = "") : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceCustomTitleHtmlText(param1);
      }
      
      public function setHeadFaceLeftIco(param1:DisplayObject = null) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceLeftIco(param1);
      }
      
      public function setHeadFaceRightIco(param1:DisplayObject = null) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceRightIco(param1);
      }
      
      public function setHeadFaceTopIco(param1:DisplayObject = null) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceTopIco(param1);
      }
      
      public function setHeadFaceCentreIco(param1:Vector.<DisplayObject> = null) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceCentreIco(param1);
      }
      
      public function setHeadFaceBar(param1:Number, param2:Number, param3:Object = null, param4:Object = null) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceBar(param1,param2,param3,param4);
      }
      
      public function setHeadFaceTalkText(param1:String = "", param2:uint = 16777215, param3:int = 8000) : void
      {
         if(this.headFace == null)
         {
            this.showHeadFace();
         }
         this.headFace.setHeadFaceTalkText(param1,param2,param3);
      }
      
      public function getHeadFaceNickName() : String
      {
         if(this.headFace == null)
         {
            return name;
         }
         return this.headFace.nickName;
      }
      
      public function getHeadFaceNickNameColor() : uint
      {
         if(this.headFace == null)
         {
            return 0;
         }
         return this.headFace.nickNameColor;
      }
      
      public function showAttackFace(param1:String = "", param2:Number = 0, param3:String = "", param4:uint = 0, param5:uint = 0) : void
      {
         TaggerHelper.showAttackFace(this,param1,param2,param3,param4,param5);
      }
      
      public function getCustomFaceByName(param1:String) : DisplayObject
      {
         return TaggerHelper.getCustomFaceByName(this,param1);
      }
      
      public function addCustomFace(param1:DisplayObject) : void
      {
         TaggerHelper.addCustomFace(this,param1);
      }
      
      public function removeCustomFace(param1:DisplayObject) : void
      {
         TaggerHelper.removeCustomFace(this,param1);
      }
      
      public function removeCustomFaceByName(param1:String) : void
      {
         TaggerHelper.removeCustomFaceByName(this,param1);
      }
      
      public function isMainChar() : Boolean
      {
         return this.scene != null ? this == this.scene.mainChar : false;
      }
      
      public function inViewDistance() : Boolean
      {
         return this.scene == null || this.scene.sceneCamera.canSee(this);
      }
      
      public function isJumping() : Boolean
      {
         return this.moveData.isJumping;
      }
      
      public function on2Jumping() : Boolean
      {
         return this.moveData.on2Jumping;
      }
      
      public function on3Jumping() : Boolean
      {
         return this.moveData.on3Jumping;
      }
      
      public function correctAvatarPosition() : void
      {
         this.avatar.correctAvatarPosition();
      }
      
      public function getNowAvatarFaceList() : Array
      {
         return this.avatar.getNowAvatarFaceList();
      }
      
      public function hitPoint(param1:Point) : Boolean
      {
         return this.visible && this.avatar.hitPoint(param1);
      }
      
      public function clearMe() : void
      {
         this.avatar.clearMe();
      }
      
      public function dispose() : void
      {
         this.usable = false;
         SceneCache.removeWaitingAvatar(this);
         Avatar.recycleAvatar(this.avatar);
         if(this.headFace != null)
         {
            if(this.headFace.parent)
            {
               this.headFace.parent.removeChild(this.headFace);
            }
            HeadFace.recycleHeadFace(this.headFace);
         }
         this.visible = true;
         this.updateNow = false;
         this._oldData = null;
         this.scene = null;
         this.type = -1;
         this.avatar = null;
         this.headFace = null;
         this._moveData = null;
         this.specilize_x = 0;
         this.specilize_y = 0;
         this.showIndex = 0;
         this.showAttack = null;
         this._colorFilterDict = null;
         this.mouseRect = null;
         this.isSelected = false;
         this.isMouseOn = false;
         this.restStatus = RestType.COMMON;
         this.strongUseSpecilizeXY = false;
         id = 0;
         name = "";
         data = null;
         disableContainer();
      }
      
      public function reSet(param1:Array) : void
      {
         this.type = param1[0];
         this.scene = param1[1];
         tile_x = param1[2];
         tile_y = param1[3];
         this.showIndex = param1[4];
         this.avatar = Avatar.createAvatar(this);
         if(this.scene != null)
         {
            this.avatar.visible = this.scene.isAlwaysShowChar(this) || this.scene.getCharAvatarVisible(this.type);
         }
         this._oldData = {
            "visible":true,
            "inViewDistance":false,
            "isMouseOn":false,
            "isSelected":false,
            "pos":new Point(),
            "spPos":new Point(),
            "restStatus":this.restStatus
         };
         this.usable = true;
      }
      
      public function runWalk() : void
      {
         WalkStep.step(this);
      }
      
      public function runAvatar(param1:int = -1) : void
      {
         var _loc2_:Number = Math.round(piexl_x);
         var _loc3_:Number = Math.round(piexl_y);
         if(this._oldData.pos.x != _loc2_ || this._oldData.pos.y != _loc3_)
         {
            this._oldData.pos.x = _loc2_;
            this._oldData.pos.y = _loc3_;
            this.updateNow = true;
         }
         _loc2_ = Math.round(this.specilize_x);
         _loc3_ = Math.round(this.specilize_y);
         if(this._oldData.spPos.x != _loc2_ || this._oldData.spPos.y != _loc3_)
         {
            this._oldData.spPos.x = _loc2_;
            this._oldData.spPos.y = _loc3_;
            this.updateNow = true;
         }
         if(this._oldData.isMouseOn != this.isMouseOn)
         {
            this._oldData.isMouseOn = this.isMouseOn;
            this.updateNow = true;
         }
         if(this._oldData.visible != this.visible)
         {
            this._oldData.visible = this.visible;
            this.updateNow = true;
         }
         var _loc4_:Boolean = this.inViewDistance();
         if(this._oldData.inViewDistance != _loc4_)
         {
            this._oldData.inViewDistance = _loc4_;
            this.updateNow = true;
         }
         if(this._oldData.restStatus != this.restStatus)
         {
            this._oldData.restStatus = this.restStatus;
            this.updateNow = true;
         }
         this.mouseRect = null;
         this.avatar.run(param1);
         this.updateNow = false;
      }
      
      public function drawAvatar(param1:IBitmapDrawable) : void
      {
         this.avatar.draw(param1);
      }
      
      public function addColorFilter(param1:String, param2:ColorMatrixFilter) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(this._colorFilterDict == null)
         {
            this._colorFilterDict = new Dictionary();
         }
         if(this._colorFilterDict[param1] != null)
         {
            return;
         }
         this._colorFilterDict[param1] = param2;
         var _loc3_:int = 0;
         while(_loc3_ < AvatarPartType.mouseFloodArr.length)
         {
            _loc4_ = this.getAvatarPartsByType(AvatarPartType.mouseFloodArr[_loc3_]);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc4_[_loc5_].addFilter(param2);
               _loc5_++;
            }
            _loc3_++;
         }
      }
      
      public function removeColorFilter(param1:String) : void
      {
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         if(this._colorFilterDict == null)
         {
            return;
         }
         var _loc2_:ColorMatrixFilter = this._colorFilterDict[param1];
         if(_loc2_ == null)
         {
            return;
         }
         delete this._colorFilterDict[param1];
         var _loc3_:int = 0;
         while(_loc3_ < AvatarPartType.mouseFloodArr.length)
         {
            _loc4_ = this.getAvatarPartsByType(AvatarPartType.mouseFloodArr[_loc3_]);
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               _loc4_[_loc5_].removeFilter(_loc2_);
               _loc5_++;
            }
            _loc3_++;
         }
      }
   }
}

