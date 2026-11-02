package com.zcp.engine.graphics.avatar
{
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.handler.helper.HandlerHelper;
   import com.zcp.common.pool.IPoolClass;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_status;
   import com.zcp.engine.loader.AvatarPartLoader;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import com.zcp.engine.tools.SceneCache;
   import com.zcp.engine.tools.ScenePool;
   import com.zcp.engine.vo.avatar.AvatarFaceData;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.avatar.AvatarPlayCondition;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class Avatar implements IPoolClass
   {
      
      public var usable:Boolean = false;
      
      public var visible:Boolean = true;
      
      public var updateNow:Boolean = false;
      
      private var _oldData:Object;
      
      public var sceneCharacter:SceneCharacter;
      
      public var status:String = "stand";
      
      public var logicAngle:int = 0;
      
      public var playCondition:AvatarPlayCondition;
      
      private var _isOnMount:Boolean;
      
      private var _hideAvatarPartTypes:Array = [];
      
      private var _hideAvatarPartIds:Array = [];
      
      private var avatarParts:Array = [];
      
      public var clearRectArr:Array = [];
      
      public var restingAvatarPartArr:* = [];
      
      public function Avatar(param1:SceneCharacter)
      {
         super();
         this.reSet([param1]);
      }
      
      public static function createAvatar(param1:SceneCharacter) : Avatar
      {
         return ScenePool.avatarPool.createObj(Avatar,param1) as Avatar;
      }
      
      public static function recycleAvatar(param1:Avatar) : void
      {
         ScenePool.avatarPool.disposeObj(param1);
      }
      
      public function set isOnMount(param1:Boolean) : void
      {
         this._isOnMount = param1;
         this.updateDefaultAvatar();
      }
      
      public function get isOnMount() : Boolean
      {
         return this._isOnMount;
      }
      
      public function get isSit() : Boolean
      {
         return this.status == CharStatusType.SIT;
      }
      
      private function updateDefaultAvatar() : void
      {
         if(!this.sceneCharacter.scene)
         {
            return;
         }
         if(!this._isOnMount)
         {
            if(!this.hasTypeAvatarParts(AvatarPartType.BODY))
            {
               if(this.sceneCharacter.scene.blankAvatarParamData != null)
               {
                  if(this.sceneCharacter.type != SceneCharacterType.DUMMY && this.sceneCharacter.type != SceneCharacterType.BAG)
                  {
                     this.sceneCharacter.loadAvatarPart(this.sceneCharacter.scene.blankAvatarParamData);
                  }
               }
            }
         }
      }
      
      public function hasTypeAvatarParts(param1:String) : Boolean
      {
         var _loc2_:AvatarPart = null;
         for each(_loc2_ in this.avatarParts)
         {
            if(_loc2_.type == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasIDAvatarPart(param1:String) : Boolean
      {
         var _loc2_:AvatarPart = null;
         for each(_loc2_ in this.avatarParts)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function hasSameAvatarPart(param1:AvatarParamData) : Boolean
      {
         var _loc2_:AvatarPart = null;
         for each(_loc2_ in this.avatarParts)
         {
            if(_loc2_.avatarParamData.equals(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function loadAvatarPart(param1:AvatarParamData = null) : void
      {
         AvatarPartLoader.loadAvatarPart(this.sceneCharacter,param1);
      }
      
      public function showAvatarPart(param1:AvatarPart) : void
      {
         param1.visible = true;
      }
      
      public function hideAvatarPart(param1:AvatarPart) : void
      {
         param1.visible = true;
      }
      
      public function getTypeAvatarPartsVisible(param1:String) : Boolean
      {
         var _loc2_:int = this._hideAvatarPartTypes.indexOf(param1);
         return _loc2_ == -1;
      }
      
      public function showAvatarPartsByType(param1:String) : void
      {
         var _loc3_:AvatarPart = null;
         var _loc2_:int = this._hideAvatarPartTypes.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._hideAvatarPartTypes.splice(_loc2_,1);
         }
         for each(_loc3_ in this.avatarParts)
         {
            if(_loc3_.type == param1)
            {
               _loc3_.visible = true;
            }
         }
      }
      
      public function hideAvatarPartsByType(param1:String) : void
      {
         var _loc2_:AvatarPart = null;
         if(this._hideAvatarPartTypes.indexOf(param1) == -1)
         {
            this._hideAvatarPartTypes.push(param1);
         }
         for each(_loc2_ in this.avatarParts)
         {
            if(_loc2_.type == param1)
            {
               _loc2_.visible = false;
            }
         }
      }
      
      public function getIDAvatarPartVisible(param1:String) : Boolean
      {
         var _loc2_:int = this._hideAvatarPartIds.indexOf(param1);
         return _loc2_ == -1;
      }
      
      public function showAvatarPartByID(param1:String) : void
      {
         var _loc2_:int = this._hideAvatarPartIds.indexOf(param1);
         if(_loc2_ != -1)
         {
            this._hideAvatarPartIds.splice(_loc2_,1);
         }
         var _loc3_:AvatarPart = this.getAvatarPartByID(param1);
         if(_loc3_ != null)
         {
            _loc3_.visible = true;
         }
      }
      
      public function hideAvatarPartByID(param1:String) : void
      {
         if(this._hideAvatarPartIds.indexOf(param1) == -1)
         {
            this._hideAvatarPartIds.push(param1);
         }
         var _loc2_:AvatarPart = this.getAvatarPartByID(param1);
         if(_loc2_ != null)
         {
            _loc2_.visible = false;
         }
      }
      
      public function addAvatarPart(param1:AvatarPart, param2:Boolean = false) : void
      {
         var _loc3_:AvatarPart = null;
         if(param2)
         {
            this.removeAvatarPartsByType(param1.type,false);
         }
         if(this.avatarParts.indexOf(param1) != -1)
         {
            return;
         }
         if(param1.id != null && param1.id != "")
         {
            _loc3_ = this.getAvatarPartByID(param1.id);
            if(_loc3_ != null)
            {
               this.removeAvatarPart(_loc3_,false,false);
            }
         }
         param1.visible = this._hideAvatarPartTypes.indexOf(param1.type) == -1;
         param1.avatar = this;
         param1.updateNow = true;
         if(param1.depth == 0)
         {
            param1.depth = AvatarPartType.getDefaultDepth(param1.type,this.logicAngle);
         }
         this.avatarParts.push(param1);
         this.sortAvatarParts();
         param1.onAdd();
      }
      
      public function sortAvatarParts() : void
      {
         this.avatarParts.sortOn("depth",Array.NUMERIC);
      }
      
      public function removeAvatarPart(param1:AvatarPart, param2:Boolean = false, param3:Boolean = true) : void
      {
         var _loc4_:int = 0;
         if(param2)
         {
            this.removeAvatarPartsByType(param1.type);
         }
         else
         {
            _loc4_ = this.avatarParts.indexOf(param1);
            if(_loc4_ == -1)
            {
               return;
            }
            param1.onRemove();
            this.avatarParts.splice(_loc4_,1);
            AvatarPart.recycleAvatarPart(param1);
         }
         if(param3)
         {
            this.updateDefaultAvatar();
         }
      }
      
      public function removeAvatarPartByID(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:AvatarPart = null;
         if(param1 == null || param1 == "")
         {
            return;
         }
         SceneCache.removeWaitingAvatar(this.sceneCharacter,param1);
         for each(_loc3_ in this.avatarParts)
         {
            if(_loc3_.id == param1)
            {
               _loc3_.onRemove();
               this.avatarParts.splice(this.avatarParts.indexOf(_loc3_),1);
               AvatarPart.recycleAvatarPart(_loc3_);
               break;
            }
         }
         if(param2)
         {
            this.updateDefaultAvatar();
         }
      }
      
      public function removeAvatarPartsByType(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:AvatarPart = null;
         SceneCache.removeWaitingAvatar(this.sceneCharacter,null,param1);
         for each(_loc3_ in this.avatarParts)
         {
            if(_loc3_.type == param1)
            {
               _loc3_.onRemove();
               this.avatarParts.splice(this.avatarParts.indexOf(_loc3_),1);
               AvatarPart.recycleAvatarPart(_loc3_);
            }
         }
         if(param2)
         {
            this.updateDefaultAvatar();
         }
      }
      
      public function removeAllAvatarParts(param1:Boolean = true) : void
      {
         var _loc2_:AvatarPart = null;
         SceneCache.removeWaitingAvatar(this.sceneCharacter);
         for each(_loc2_ in this.avatarParts)
         {
            _loc2_.onRemove();
            AvatarPart.recycleAvatarPart(_loc2_);
         }
         this.avatarParts.length = 0;
         if(param1)
         {
            this.updateDefaultAvatar();
         }
      }
      
      public function getAvatarPartByID(param1:String) : AvatarPart
      {
         var _loc2_:AvatarPart = null;
         for each(_loc2_ in this.avatarParts)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getAvatarPartsByType(param1:String) : Array
      {
         var _loc3_:AvatarPart = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.avatarParts)
         {
            if(_loc3_.type == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function playTo(param1:String = null, param2:int = -1, param3:int = -1, param4:AvatarPlayCondition = null) : void
      {
         var _loc6_:AvatarPart = null;
         var _loc7_:Function = null;
         var _loc8_:SceneEvent = null;
         var _loc5_:String = this.status;
         if(param1 != null)
         {
            this.status = param1;
         }
         if(param2 != -1)
         {
            this.logicAngle = param2;
         }
         if(param4 != null)
         {
            this.playCondition = param4;
         }
         else if(this.playCondition == null)
         {
            this.playCondition = new AvatarPlayCondition();
         }
         for each(_loc6_ in this.avatarParts)
         {
            _loc6_.playTo(param1,param2,param3,this.playCondition.clone());
         }
         this.sortAvatarParts();
         if(this.sceneCharacter.showAttack != null)
         {
            _loc7_ = this.sceneCharacter.showAttack;
            this.sceneCharacter.showAttack = null;
            HandlerHelper.execute(_loc7_);
            if(param1 == CharStatusType.ATTACK && this.status != CharStatusType.ATTACK)
            {
               this.playTo(CharStatusType.ATTACK);
            }
         }
         if(Boolean(this.sceneCharacter.scene) && Boolean(this.sceneCharacter == this.sceneCharacter.scene.mainChar) && _loc5_ != this.status)
         {
            _loc8_ = new SceneEvent(SceneEvent.STATUS,SceneEventAction_status.CHANGED,[this.sceneCharacter,this.status]);
            EventDispatchCenter.getInstance().dispatchEvent(_loc8_);
         }
      }
      
      public function run(param1:int = -1) : void
      {
         var _loc2_:AvatarPart = null;
         if(this._oldData.visible != this.visible)
         {
            this._oldData.visible = this.visible;
            this.updateNow = true;
         }
         for each(_loc2_ in this.avatarParts)
         {
            _loc2_.run(param1);
         }
         this.updateNow = false;
      }
      
      private function clear(param1:BitmapData) : void
      {
         var _loc2_:AvatarPart = null;
         var _loc3_:Rectangle = null;
         var _loc4_:Rectangle = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         this.clearRectArr.sortOn("top",Array.NUMERIC);
         for each(_loc2_ in this.restingAvatarPartArr)
         {
            for each(_loc3_ in this.clearRectArr)
            {
               _loc5_ = _loc2_.cutRect;
               if(_loc5_.intersects(_loc3_))
               {
                  _loc6_ = _loc5_.intersection(_loc3_);
                  _loc2_.updateNow = true;
                  _loc2_.renderRectArr.push(_loc6_);
               }
            }
         }
         this.restingAvatarPartArr = [];
         while(this.clearRectArr.length > 0)
         {
            _loc4_ = this.clearRectArr.shift() as Rectangle;
            _loc4_.x += (param1 as BitmapData).width / 2;
            _loc4_.y += (param1 as BitmapData).height / 2;
            param1.fillRect(_loc4_,0);
         }
      }
      
      public function isClearRectArrContains(param1:Rectangle) : Boolean
      {
         var _loc2_:Rectangle = null;
         for each(_loc2_ in this.clearRectArr)
         {
            if(_loc2_.equals(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function drawUIAvatar(param1:BitmapData, param2:BitmapData, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         param7 += param1.width / 2;
         param8 += param1.height / 2;
         param1.copyPixels(param2,new Rectangle(param3,param4,param5,param6),new Point(param7,param8),null,null,true);
      }
      
      public function draw(param1:IBitmapDrawable) : void
      {
         var _loc2_:AvatarPart = null;
         if(param1 is BitmapData)
         {
            this.clear(param1 as BitmapData);
         }
         for each(_loc2_ in this.avatarParts)
         {
            _loc2_.draw(param1);
         }
      }
      
      public function correctAvatarPosition() : void
      {
         var _loc1_:AvatarPart = null;
         for each(_loc1_ in this.avatarParts)
         {
            _loc1_.correctAvatarPosition();
         }
      }
      
      public function getNowAvatarFaceList() : Array
      {
         var _loc2_:AvatarPart = null;
         var _loc3_:AvatarFaceData = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.avatarParts)
         {
            _loc3_ = _loc2_.getNowAvatarFaceData();
            if(_loc3_ != null)
            {
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public function hitPoint(param1:Point) : Boolean
      {
         var _loc2_:AvatarPart = null;
         if(!this.visible)
         {
            return false;
         }
         for each(_loc2_ in this.avatarParts)
         {
            if(_loc2_.type != AvatarPartType.MAGIC_RING && _loc2_.type != AvatarPartType.MAGIC_PASS && _loc2_.type != AvatarPartType.MAGIC && _loc2_.hitPoint(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function clearMe() : void
      {
         var _loc1_:AvatarPart = null;
         for each(_loc1_ in this.avatarParts)
         {
            _loc1_.clearMe();
         }
      }
      
      public function dispose() : void
      {
         this.usable = false;
         this.removeAllAvatarParts(false);
         this.visible = true;
         this.updateNow = false;
         this._oldData = null;
         this.sceneCharacter = null;
         this.status = CharStatusType.STAND;
         this.logicAngle = 0;
         this.playCondition = null;
         this._isOnMount = false;
         this._hideAvatarPartTypes.length = 0;
         this._hideAvatarPartIds.length = 0;
         this.avatarParts.length = 0;
      }
      
      public function reSet(param1:Array) : void
      {
         this.sceneCharacter = param1[0];
         this._oldData = {"visible":true};
         this.usable = true;
      }
   }
}

