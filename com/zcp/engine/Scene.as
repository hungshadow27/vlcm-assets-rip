package com.zcp.engine
{
   import com.zcp.common.draw.helper.DrawHelper;
   import com.zcp.common.log.ZLog;
   import com.zcp.engine.config.MapConfig;
   import com.zcp.engine.config.SceneConfig;
   import com.zcp.engine.graphics.layers.SceneAvatarLayer;
   import com.zcp.engine.graphics.layers.SceneHeadLayer;
   import com.zcp.engine.graphics.layers.SceneInteractiveLayer;
   import com.zcp.engine.graphics.layers.SceneMapLayer;
   import com.zcp.engine.graphics.layers.SceneSmallMapLayer;
   import com.zcp.engine.loader.MapLoader;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.utils.SceneUtil;
   import com.zcp.engine.vo.ShowContainer;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import gs.TweenLite;
   
   public class Scene extends Sprite
   {
      
      public static var scene:Scene;
      
      private static const floor:Function = Math.floor;
      
      private static const TILE_WIDTH:Number = SceneConfig.TILE_WIDTH;
      
      private static const TILE_HEGHT:Number = SceneConfig.TILE_HEIGHT;
      
      private static const MAX_AVATARBD_WIDTH:Number = SceneAvatarLayer.MAX_AVATARBD_WIDTH;
      
      private static const MAX_AVATARBD_HEIGHT:Number = SceneAvatarLayer.MAX_AVATARBD_HEIGHT;
      
      public var sceneConfig:SceneConfig;
      
      public var mapConfig:MapConfig;
      
      public var sceneCamera:SceneCamera;
      
      public var sceneRender:SceneRender;
      
      public var sceneSmallMapLayer:SceneSmallMapLayer;
      
      public var sceneMapLayer:SceneMapLayer;
      
      public var sceneInteractiveLayer:SceneInteractiveLayer;
      
      public var customLowLayer:Sprite;
      
      public var sceneAvatarLayer:SceneAvatarLayer;
      
      public var sceneHeadLayer:SceneHeadLayer;
      
      public var customLayer:Sprite;
      
      private var _mask:Shape;
      
      public var mainChar:SceneCharacter;
      
      private var _mouseChar:SceneCharacter;
      
      private var _mouseOnCharacter:SceneCharacter;
      
      private var _selectedCharacter:SceneCharacter;
      
      public var renderCharacters:Array = [];
      
      public var sceneCharacters:Array = [];
      
      private var _sceneDummies:Array = [];
      
      private var _selectedAvatarParamData:AvatarParamData;
      
      public var blankAvatarParamData:AvatarParamData;
      
      public var shadowAvatarParamData:AvatarParamData;
      
      private var _always_show_char_types:Array = [SceneCharacterType.DUMMY,SceneCharacterType.BAG,SceneCharacterType.MONSTER,SceneCharacterType.NPC,SceneCharacterType.TRANSPORT];
      
      private var _always_show_chars:Array = [];
      
      private var _charVisible:Boolean = true;
      
      private var _charHeadVisible:Boolean = true;
      
      private var _charAvatarVisible:Boolean = true;
      
      private var baibian:GlowFilter = new GlowFilter(16777215,0.5,7,7,4,1);
      
      public function Scene(param1:Number, param2:Number)
      {
         super();
         if(!Engine.engineReady)
         {
            throw new Error("引擎尚未初始化！");
         }
         if(scene != null)
         {
            throw new Error("Scene单例");
         }
         scene = this;
         this.sceneConfig = new SceneConfig(param1,param2);
         this.sceneSmallMapLayer = new SceneSmallMapLayer(this);
         addChild(this.sceneSmallMapLayer);
         this.sceneMapLayer = new SceneMapLayer(this);
         addChild(this.sceneMapLayer);
         this.sceneInteractiveLayer = new SceneInteractiveLayer(this);
         this.customLowLayer = new Sprite();
         this.customLowLayer.mouseEnabled = this.customLowLayer.mouseChildren = false;
         addChild(this.customLowLayer);
         this.sceneAvatarLayer = new SceneAvatarLayer(this);
         addChild(this.sceneAvatarLayer);
         this.sceneHeadLayer = new SceneHeadLayer(this);
         addChild(this.sceneHeadLayer);
         this.customLayer = new Sprite();
         this.customLayer.mouseEnabled = this.customLayer.mouseChildren = false;
         addChild(this.customLayer);
         this.sceneCamera = new SceneCamera(this);
         this.sceneRender = new SceneRender(this);
         this.mainChar = this.createSceneCharacter(SceneCharacterType.PLAYER);
         this.addAlwaysShowChar(this.mainChar);
         this._mouseChar = this.createSceneCharacter(SceneCharacterType.DUMMY);
         this.hideMouseChar();
         this.addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
      }
      
      private function updateCharsVisible() : void
      {
         this.setCharVisible(this._charVisible);
         this.setCharHeadVisible(this._charHeadVisible);
         this.setCharAvatarVisible(this._charAvatarVisible);
      }
      
      public function isAlwaysShowCharType(param1:int) : Boolean
      {
         var _loc2_:int = this._always_show_char_types.indexOf(param1);
         return _loc2_ != -1;
      }
      
      public function addAlwaysShowCharType(param1:int) : void
      {
         var _loc2_:int = this._always_show_char_types.indexOf(param1);
         if(_loc2_ == -1)
         {
            this._always_show_char_types.push(param1);
            this.updateCharsVisible();
         }
      }
      
      public function removeAlwaysShowCharType(param1:int) : void
      {
         var _loc2_:int = this._always_show_char_types.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._always_show_char_types.splice(_loc2_,1);
            this.updateCharsVisible();
         }
      }
      
      public function isAlwaysShowChar(param1:SceneCharacter) : Boolean
      {
         var _loc2_:int = this._always_show_chars.indexOf(param1);
         return _loc2_ != -1;
      }
      
      public function addAlwaysShowChar(param1:SceneCharacter) : void
      {
         var _loc2_:int = this._always_show_chars.indexOf(param1);
         if(_loc2_ == -1)
         {
            this._always_show_chars.push(param1);
            this.updateCharsVisible();
         }
      }
      
      public function removeAlwaysShowChar(param1:SceneCharacter) : void
      {
         var _loc2_:int = this._always_show_chars.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._always_show_chars.splice(_loc2_,1);
            this.updateCharsVisible();
         }
      }
      
      public function getCharVisible(param1:int) : Boolean
      {
         return this.isAlwaysShowCharType(param1) || this._charVisible;
      }
      
      public function setCharVisible(param1:Boolean = false) : void
      {
         var _loc2_:SceneCharacter = null;
         this._charVisible = param1;
         for each(_loc2_ in this.sceneCharacters)
         {
            if(this._charVisible || this.isAlwaysShowCharType(_loc2_.type) || this.isAlwaysShowChar(_loc2_))
            {
               _loc2_.visible = true;
               if(_loc2_.useContainer)
               {
                  _loc2_.showContainer.visible = true;
               }
            }
            else
            {
               _loc2_.visible = false;
               if(_loc2_.useContainer)
               {
                  _loc2_.showContainer.visible = false;
               }
            }
         }
      }
      
      public function getCharHeadVisible(param1:int) : Boolean
      {
         return this.isAlwaysShowCharType(param1) || this._charHeadVisible;
      }
      
      public function setCharHeadVisible(param1:Boolean = false) : void
      {
         var _loc2_:SceneCharacter = null;
         this._charHeadVisible = param1;
         for each(_loc2_ in this.sceneCharacters)
         {
            if(this._charHeadVisible || this.isAlwaysShowCharType(_loc2_.type) || this.isAlwaysShowChar(_loc2_))
            {
               if(_loc2_.useContainer)
               {
                  _loc2_.showContainer.showHeadFaceContainer();
               }
            }
            else if(_loc2_.useContainer)
            {
               _loc2_.showContainer.hideHeadFaceContainer();
            }
         }
      }
      
      public function getCharAvatarVisible(param1:int) : Boolean
      {
         return this.isAlwaysShowCharType(param1) || this._charAvatarVisible;
      }
      
      public function setCharAvatarVisible(param1:Boolean = false) : void
      {
         var _loc2_:SceneCharacter = null;
         this._charAvatarVisible = param1;
         for each(_loc2_ in this.sceneCharacters)
         {
            if(this._charAvatarVisible || this.isAlwaysShowCharType(_loc2_.type) || this.isAlwaysShowChar(_loc2_))
            {
               _loc2_.avatar.visible = true;
               if(_loc2_.useContainer)
               {
                  _loc2_.showContainer.showAttackFaceContainer();
                  _loc2_.showContainer.showCustomFaceContainer();
               }
            }
            else
            {
               _loc2_.avatar.visible = false;
               if(_loc2_.useContainer)
               {
                  _loc2_.showContainer.hideAttackFaceContainer();
                  _loc2_.showContainer.hideCustomFaceContainer();
               }
            }
         }
      }
      
      private function onAddToStage(param1:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         if(!this._mask)
         {
            this._mask = new Shape();
            DrawHelper.drawRect(this._mask,new Point(0,0),new Point(1,1));
            this.parent.addChild(this._mask);
            this.mask = this._mask;
         }
         this.reSize(this.sceneConfig.width,this.sceneConfig.height);
         this.enableInteractiveHandle();
      }
      
      public function reSize(param1:Number, param2:Number) : void
      {
         this.sceneConfig.width = param1;
         this.sceneConfig.height = param2;
         this._mask.x = 0;
         this._mask.y = 0;
         this._mask.width = this.sceneConfig.width;
         this._mask.height = this.sceneConfig.height;
         this.sceneCamera.updateRangeXY();
         this.updateCameraNow();
         this.sceneMapLayer.strongLoadMap = true;
      }
      
      public function switchScene(param1:int, param2:String, param3:Function = null, param4:Function = null) : void
      {
         var scene:Scene = null;
         var newOnComplete:Function = null;
         var $mapID:int = param1;
         var $mapConfigUrl:String = param2;
         var $onComplete:Function = param3;
         var $onUpdate:Function = param4;
         newOnComplete = function(param1:MapConfig, param2:Object):void
         {
            var _loc3_:Object = null;
            var _loc4_:SceneCharacter = null;
            mapConfig = param1;
            SceneCache.mapTiles = param2;
            if(mapConfig.slipcovers != null && mapConfig.slipcovers.length > 0)
            {
               for each(_loc3_ in mapConfig.slipcovers)
               {
                  _loc4_ = createSceneCharacter(SceneCharacterType.DUMMY);
                  _loc4_.piexl_x = _loc3_.piexl_x;
                  _loc4_.piexl_y = _loc3_.piexl_y;
                  _loc4_.loadAvatarPart(new AvatarParamData(_loc3_.sourcePath));
               }
            }
            MapLoader.loadSmallMap(scene);
            sceneMapLayer.initMapZones();
            sceneAvatarLayer.initAvatarBD();
            if(mainChar)
            {
               mainChar.stopMove();
               mainChar.correctAvatarPosition();
               mainChar.updateNow = true;
               sceneCamera.lookAt(mainChar);
            }
            _mouseChar.visible = false;
            sceneRender.startRender(true);
            enableInteractiveHandle();
            if($onComplete != null)
            {
               $onComplete();
            }
         };
         this.disableInteractiveHandle();
         this.sceneRender.stopRender();
         this.dispose();
         MapLoader.loadMapConfig($mapID,$mapConfigUrl,this,newOnComplete,$onUpdate);
         scene = this;
      }
      
      public function setBlankAvatarParamData(param1:AvatarParamData) : void
      {
         var _loc2_:SceneCharacter = null;
         param1.id_noCheckValid = AvatarPartID.BLANK;
         param1.type = AvatarPartType.BODY;
         param1.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BODY);
         param1.useType = 0;
         param1.clearSameType = false;
         this.blankAvatarParamData = param1;
         for each(_loc2_ in this.sceneCharacters)
         {
            if(_loc2_.type != SceneCharacterType.BAG)
            {
               _loc2_.loadAvatarPart(this.blankAvatarParamData);
            }
         }
      }
      
      public function setShadowAvatarParamData(param1:AvatarParamData) : void
      {
         var _loc2_:SceneCharacter = null;
         param1.id_noCheckValid = AvatarPartID.SHADOW;
         param1.type = AvatarPartType.MAGIC_RING;
         param1.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.MAGIC_RING);
         param1.depth = -int.MAX_VALUE;
         param1.useType = 0;
         param1.clearSameType = false;
         this.shadowAvatarParamData = param1;
         for each(_loc2_ in this.sceneCharacters)
         {
            if(_loc2_.type != SceneCharacterType.BAG && _loc2_.type != SceneCharacterType.TRANSPORT)
            {
               _loc2_.loadAvatarPart(this.shadowAvatarParamData);
            }
         }
      }
      
      public function setSelectedAvatarParamData(param1:AvatarParamData) : void
      {
         param1.id_noCheckValid = AvatarPartID.SELECTED;
         param1.type = AvatarPartType.MAGIC_RING;
         param1.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.MAGIC_RING);
         param1.depth = -int.MAX_VALUE + 1;
         param1.useType = 0;
         param1.clearSameType = false;
         var _loc2_:SceneCharacter = this._selectedCharacter;
         this.setSelectedCharacter(null);
         this._selectedAvatarParamData = param1;
         this.setSelectedCharacter(_loc2_);
      }
      
      public function setMouseCharAvatarParamData(param1:AvatarParamData) : void
      {
         param1.type = AvatarPartType.BODY;
         param1.repeat = AvatarPartType.getDefaultRepeat(AvatarPartType.BODY);
         this._mouseChar.removeAllAvatarParts(false);
         this._mouseChar.loadAvatarPart(param1);
      }
      
      public function createSceneCharacter(param1:int = 1, param2:int = 0, param3:int = 0, param4:int = 0) : SceneCharacter
      {
         var _loc5_:SceneCharacter = SceneCharacter.createSceneCharacter(param1,this,param2,param3,param4);
         this.addCharacter(_loc5_);
         if(_loc5_.type != SceneCharacterType.DUMMY && _loc5_.type != SceneCharacterType.BAG)
         {
            if(this.blankAvatarParamData != null)
            {
               _loc5_.loadAvatarPart(this.blankAvatarParamData);
            }
            if(_loc5_.type != SceneCharacterType.TRANSPORT && this.shadowAvatarParamData != null)
            {
               _loc5_.loadAvatarPart(this.shadowAvatarParamData);
            }
         }
         return _loc5_;
      }
      
      public function addCharacter(param1:SceneCharacter) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type != SceneCharacterType.DUMMY)
         {
            if(this.sceneCharacters.indexOf(param1) != -1)
            {
               return;
            }
            this.sceneCharacters.push(param1);
            this.renderCharacters.push(param1);
            ZLog.add("###场景角色数量：" + this.sceneCharacters.length + " 虚拟体数量：" + this._sceneDummies.length);
         }
         else
         {
            if(this._sceneDummies.indexOf(param1) != -1)
            {
               return;
            }
            this._sceneDummies.push(param1);
            this.renderCharacters.push(param1);
            ZLog.add("###场景角色数量：" + this.sceneCharacters.length + " 虚拟体数量：" + this._sceneDummies.length);
         }
         param1.visible = this.isAlwaysShowChar(param1) || this.getCharVisible(param1.type);
         param1.updateNow = true;
      }
      
      public function removeCharacter(param1:SceneCharacter, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         if(param1 == null)
         {
            return;
         }
         if(param1.type != SceneCharacterType.DUMMY)
         {
            _loc3_ = this.sceneCharacters.indexOf(param1);
            if(_loc3_ != -1)
            {
               this.sceneCharacters.splice(_loc3_,1);
               this.renderCharacters.splice(this.renderCharacters.indexOf(param1),1);
               TweenLite.killTweensOf(param1);
               if(this._mouseOnCharacter == param1)
               {
                  this.setMouseOnCharacter(null);
               }
               if(this._selectedCharacter == param1)
               {
                  this.setSelectedCharacter(null);
               }
               this.removeAlwaysShowChar(param1);
               if(param2)
               {
                  SceneCharacter.recycleSceneCharacter(param1);
               }
               else
               {
                  param1.clearMe();
               }
            }
            ZLog.add("###场景角色数量：" + this.sceneCharacters.length + " 虚拟体数量：" + this._sceneDummies.length);
         }
         else
         {
            _loc3_ = this._sceneDummies.indexOf(param1);
            if(_loc3_ != -1)
            {
               this._sceneDummies.splice(_loc3_,1);
               this.renderCharacters.splice(this.renderCharacters.indexOf(param1),1);
               TweenLite.killTweensOf(param1);
               if(param2)
               {
                  SceneCharacter.recycleSceneCharacter(param1);
               }
               else
               {
                  param1.clearMe();
               }
            }
            ZLog.add("###场景角色数量：" + this.sceneCharacters.length + " 虚拟体数量：" + this._sceneDummies.length);
         }
      }
      
      public function removeCharacterByIDAndType(param1:int, param2:int = 1, param3:Boolean = true) : void
      {
         var _loc4_:SceneCharacter = this.getCharByID(param1,param2);
         if(_loc4_ != null)
         {
            this.removeCharacter(_loc4_,param3);
         }
      }
      
      public function getCharByID(param1:int, param2:int = 1) : SceneCharacter
      {
         var _loc3_:SceneCharacter = null;
         if(param2 != SceneCharacterType.DUMMY)
         {
            for each(_loc3_ in this.sceneCharacters)
            {
               if(_loc3_.id == param1 && _loc3_.type == param2)
               {
                  return _loc3_;
               }
            }
         }
         else
         {
            for each(_loc3_ in this._sceneDummies)
            {
               if(_loc3_.id == param1)
               {
                  return _loc3_;
               }
            }
         }
         return null;
      }
      
      public function getCharsByType(param1:int = 1) : Array
      {
         var _loc3_:SceneCharacter = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.sceneCharacters)
         {
            if(_loc3_.type == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      private function dispose() : void
      {
         var _loc1_:SceneCharacter = null;
         SceneCache.mapImgCache.dispose();
         SceneCache.currentMapZones = {};
         SceneCache.mapTiles = {};
         SceneCache.mapZones = {};
         SceneCache.removeWaitingAvatar(null,null,null,[this.mainChar,this._mouseChar]);
         this.mapConfig = null;
         this.sceneSmallMapLayer.dispose();
         this.sceneMapLayer.dispose();
         this.sceneAvatarLayer.dispose();
         this.sceneHeadLayer.dispose();
         var _loc2_:int = 0;
         while(this.renderCharacters.length > _loc2_)
         {
            _loc1_ = this.renderCharacters[_loc2_];
            if(_loc1_ != this.mainChar && _loc1_ != this._mouseChar)
            {
               this.removeCharacter(_loc1_);
            }
            else
            {
               _loc2_++;
            }
         }
         this.hideMouseChar();
         this.setMouseOnCharacter(null);
         this.setSelectedCharacter(null);
         this.renderCharacters = [];
         this.sceneCharacters = [];
         this._sceneDummies = [];
         this._mouseOnCharacter = null;
         this._selectedCharacter = null;
         this.sceneCamera.lookAt(null);
         if(this.mainChar)
         {
            this.mainChar.stopMove();
            this.addCharacter(this.mainChar);
            if(this.mainChar.showContainer)
            {
               this.sceneHeadLayer.addChild(this.mainChar.showContainer);
            }
         }
         this.addCharacter(this._mouseChar);
      }
      
      public function sceneDispatchEvent(param1:Event) : void
      {
         if(this.mapConfig != null)
         {
            this.sceneInteractiveLayer.dispatchEvent(param1);
         }
      }
      
      public function enableInteractiveHandle() : void
      {
         this.sceneInteractiveLayer.enableInteractiveHandle();
      }
      
      public function disableInteractiveHandle() : void
      {
         this.sceneInteractiveLayer.disableInteractiveHandle();
      }
      
      public function showMouseChar(param1:Number, param2:Number) : void
      {
         this._mouseChar.tile_x = param1;
         this._mouseChar.tile_y = param2;
         this._mouseChar.visible = true;
         this._mouseChar.playTo(null,-1,-1,new AvatarPlayCondition(true));
      }
      
      public function hideMouseChar() : void
      {
         this._mouseChar.visible = false;
      }
      
      public function setMouseOnCharacter(param1:SceneCharacter) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         if(this._mouseOnCharacter == param1)
         {
            return;
         }
         if(this._mouseOnCharacter != null && this._mouseOnCharacter.usable)
         {
            this._mouseOnCharacter.isMouseOn = false;
            _loc2_ = 0;
            while(_loc2_ < AvatarPartType.mouseFloodArr.length)
            {
               _loc3_ = this._mouseOnCharacter.getAvatarPartsByType(AvatarPartType.mouseFloodArr[_loc2_]);
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  _loc3_[_loc4_].removeFilter(this.baibian);
                  _loc4_++;
               }
               _loc2_++;
            }
         }
         this._mouseOnCharacter = param1;
         if(this._mouseOnCharacter != null && this._mouseOnCharacter.usable)
         {
            this._mouseOnCharacter.isMouseOn = true;
            _loc5_ = 0;
            while(_loc5_ < AvatarPartType.mouseFloodArr.length)
            {
               _loc6_ = this._mouseOnCharacter.getAvatarPartsByType(AvatarPartType.mouseFloodArr[_loc5_]);
               _loc7_ = 0;
               while(_loc7_ < _loc6_.length)
               {
                  _loc6_[_loc7_].addFilter(this.baibian);
                  _loc7_++;
               }
               _loc5_++;
            }
         }
         else
         {
            this._mouseOnCharacter = null;
         }
      }
      
      public function getMouseOnCharacter() : SceneCharacter
      {
         return this._mouseOnCharacter;
      }
      
      public function setSelectedCharacter(param1:SceneCharacter) : void
      {
         if(this._selectedCharacter == param1)
         {
            return;
         }
         if(this._selectedCharacter != null && this._selectedCharacter.usable)
         {
            this._selectedCharacter.removeAvatarPartByID(AvatarPartID.SELECTED);
            this._selectedCharacter.isSelected = false;
         }
         this._selectedCharacter = param1;
         if(this._selectedCharacter != null && this._selectedCharacter.usable)
         {
            if(this._selectedAvatarParamData != null)
            {
               this._selectedCharacter.loadAvatarPart(this._selectedAvatarParamData);
            }
            this._selectedCharacter.isSelected = true;
         }
         else
         {
            this._selectedCharacter = null;
         }
      }
      
      public function getSelectedCharacter() : SceneCharacter
      {
         return this._selectedCharacter;
      }
      
      public function getSceneObjectsUnderPoint(param1:Point, param2:Array = null) : Array
      {
         var _loc6_:SceneCharacter = null;
         var _loc10_:Point = null;
         var _loc11_:int = 0;
         var _loc12_:* = 0;
         var _loc13_:ShowContainer = null;
         var _loc14_:uint = 0;
         var _loc3_:Array = [null,[],[]];
         var _loc4_:int = floor(param1.x / TILE_WIDTH);
         var _loc5_:int = floor(param1.y / TILE_HEGHT);
         _loc3_[0] = SceneUtil.getMapTile(_loc4_,_loc5_);
         if(_loc3_[0] == null)
         {
            return _loc3_;
         }
         if(!this._charAvatarVisible)
         {
            _loc10_ = this.localToGlobal(param1);
            _loc11_ = this.sceneHeadLayer.numChildren;
            _loc12_ = int(_loc11_ - 1);
            while(_loc12_ >= 0)
            {
               _loc13_ = this.sceneHeadLayer.getChildAt(_loc12_) as ShowContainer;
               if(_loc13_ != null && _loc13_.headFace != null && _loc13_.visible && _loc13_.headFace.visible)
               {
                  if(_loc13_.headFace.hitTestPoint(_loc10_.x,_loc10_.y,true))
                  {
                     _loc6_ = _loc13_.owner as SceneCharacter;
                     if(_loc6_ != null && (param2 == null || param2.indexOf(_loc6_.type) == -1))
                     {
                        if(_loc6_ != this.mainChar)
                        {
                           _loc3_[1].push(_loc6_);
                        }
                     }
                  }
               }
               _loc12_--;
            }
         }
         var _loc7_:int = floor(param1.x / MAX_AVATARBD_WIDTH);
         var _loc8_:int = floor(param1.y / MAX_AVATARBD_HEIGHT);
         var _loc9_:BitmapData = this.sceneAvatarLayer.getAvatarBD(_loc7_,_loc8_);
         if(_loc9_ != null)
         {
            _loc14_ = _loc9_.getPixel32(param1.x - _loc7_ * MAX_AVATARBD_WIDTH,param1.y - _loc8_ * MAX_AVATARBD_HEIGHT);
            if(_loc14_ != 0)
            {
               for each(_loc6_ in this.sceneCharacters)
               {
                  if(_loc6_ != this.mainChar)
                  {
                     if(!(param2 != null && param2.indexOf(_loc6_.type) != -1))
                     {
                        if(_loc3_[1].indexOf(_loc6_) == -1)
                        {
                           if(_loc6_.mouseRect != null && _loc6_.mouseRect.containsPoint(param1))
                           {
                              _loc3_[2].push(_loc6_);
                           }
                        }
                     }
                  }
               }
            }
         }
         if(_loc3_[2].length > 0)
         {
            _loc3_[2].sortOn("piexl_y",Array.DESCENDING | Array.NUMERIC);
         }
         return _loc3_;
      }
      
      public function updateCameraNow() : void
      {
         this.sceneCamera.run(false);
      }
   }
}

