package com.zcp.engine.vo.avatar
{
   import com.zcp.common.handler.HandlerThread;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.graphics.avatar.AvatarPart;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.DynamicPosition.IDynamicPosition;
   
   public class AvatarParamData
   {
      
      private var _id:String;
      
      public var sourcePath:String;
      
      public var type:String = AvatarPartType.BODY;
      
      public var repeat:int = 0;
      
      public var depth:int = 0;
      
      public var useType:int = 0;
      
      public var useSpecilizeXY:Boolean = true;
      
      public var offsetX:int = 0;
      
      public var offsetY:int = 0;
      
      public var offsetOnMountX:int = 0;
      
      public var offsetOnMountY:int = 0;
      
      public var offsetSitX:int = 0;
      
      public var offsetSitY:int = 0;
      
      public var offsetDandaoStartX:int = 0;
      
      public var offsetDandaoStartY:int = 0;
      
      public var dynamicPosition:IDynamicPosition = null;
      
      public var sleepTime:int = 0;
      
      public var status:String = "stand";
      
      public var angle:int = -1;
      
      public var rotation:int = -1;
      
      public var useMagicAngle:Boolean = false;
      
      public var clearSameType:Boolean = false;
      
      public var playCallBack:AvatarPlayCallBack = null;
      
      public function AvatarParamData(param1:String = "", param2:String = "body")
      {
         super();
         this.sourcePath = param1;
         this.type = param2;
         this.repeat = AvatarPartType.getDefaultRepeat(this.type);
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         if(!AvatarPartID.isValidID(param1))
         {
            throw new Error("换装ID非法（原因：该ID为引擎换装ID关键字）");
         }
         this._id = param1;
      }
      
      public function set id_noCheckValid(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get className() : String
      {
         if(this.sourcePath != null && this.sourcePath != "")
         {
            return this.sourcePath.replace(/\\/g,"/").replace(/^(.*\/)*([a-zA-Z_\d]+)\..+$/,"$2");
         }
         return "";
      }
      
      public function extendCallBack(param1:Function = null, param2:Function = null, param3:Function = null, param4:Function = null, param5:Function = null, param6:Function = null, param7:Boolean = false) : void
      {
         var onPlayBeforeStart_old:Function = null;
         var onPlayStart_old:Function = null;
         var onPlayUpdate_old:Function = null;
         var onPlayComplete_old:Function = null;
         var onAdd_old:Function = null;
         var onRemove_old:Function = null;
         var $new_onPlayBeforeStart:Function = param1;
         var $new_onPlayStart:Function = param2;
         var $new_onPlayUpdate:Function = param3;
         var $new_onPlayComplete:Function = param4;
         var $new_onAdd:Function = param5;
         var $new_onRemove:Function = param6;
         var $clearOld:Boolean = param7;
         this.playCallBack = this.playCallBack || new AvatarPlayCallBack();
         if($clearOld)
         {
            this.playCallBack.onPlayBeforeStart = $new_onPlayBeforeStart;
            this.playCallBack.onPlayStart = $new_onPlayStart;
            this.playCallBack.onPlayUpdate = $new_onPlayUpdate;
            this.playCallBack.onPlayComplete = $new_onPlayComplete;
            this.playCallBack.onAdd = $new_onAdd;
            this.playCallBack.onRemove = $new_onRemove;
         }
         else
         {
            if($new_onPlayBeforeStart != null)
            {
               if(this.playCallBack.onPlayBeforeStart == null)
               {
                  this.playCallBack.onPlayBeforeStart = $new_onPlayBeforeStart;
               }
               else
               {
                  onPlayBeforeStart_old = this.playCallBack.onPlayBeforeStart;
                  this.playCallBack.onPlayBeforeStart = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
                  {
                     onPlayBeforeStart_old(param1,param2);
                     $new_onPlayBeforeStart(param1,param2);
                  };
               }
            }
            if($new_onPlayStart != null)
            {
               if(this.playCallBack.onPlayStart == null)
               {
                  this.playCallBack.onPlayStart = $new_onPlayStart;
               }
               else
               {
                  onPlayStart_old = this.playCallBack.onPlayStart;
                  this.playCallBack.onPlayStart = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
                  {
                     onPlayStart_old(param1,param2);
                     $new_onPlayStart(param1,param2);
                  };
               }
            }
            if($new_onPlayUpdate != null)
            {
               if(this.playCallBack.onPlayUpdate == null)
               {
                  this.playCallBack.onPlayUpdate = $new_onPlayUpdate;
               }
               else
               {
                  onPlayUpdate_old = this.playCallBack.onPlayUpdate;
                  this.playCallBack.onPlayUpdate = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
                  {
                     onPlayUpdate_old(param1,param2);
                     $new_onPlayUpdate(param1,param2);
                  };
               }
            }
            if($new_onPlayComplete != null)
            {
               if(this.playCallBack.onPlayComplete == null)
               {
                  this.playCallBack.onPlayComplete = $new_onPlayComplete;
               }
               else
               {
                  onPlayComplete_old = this.playCallBack.onPlayComplete;
                  this.playCallBack.onPlayComplete = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
                  {
                     onPlayComplete_old(param1,param2);
                     $new_onPlayComplete(param1,param2);
                  };
               }
            }
            if($new_onAdd != null)
            {
               if(this.playCallBack.onAdd == null)
               {
                  this.playCallBack.onAdd = $new_onAdd;
               }
               else
               {
                  onAdd_old = this.playCallBack.onAdd;
                  this.playCallBack.onAdd = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
                  {
                     onAdd_old(param1,param2);
                     $new_onAdd(param1,param2);
                  };
               }
            }
            if($new_onRemove != null)
            {
               if(this.playCallBack.onRemove == null)
               {
                  this.playCallBack.onRemove = $new_onRemove;
               }
               else
               {
                  onRemove_old = this.playCallBack.onRemove;
                  this.playCallBack.onRemove = function(param1:SceneCharacter = null, param2:AvatarPart = null):void
                  {
                     onRemove_old(param1,param2);
                     $new_onRemove(param1,param2);
                  };
               }
            }
         }
      }
      
      public function executeCallBack(param1:SceneCharacter = null, param2:AvatarPart = null, param3:Boolean = true, param4:Boolean = true, param5:Boolean = true, param6:Boolean = true, param7:Boolean = true, param8:Boolean = true, param9:int = 0, param10:int = 0, param11:int = 0, param12:int = 0, param13:int = 0, param14:int = 0) : void
      {
         if(this.playCallBack == null)
         {
            return;
         }
         var _loc15_:HandlerThread = new HandlerThread();
         if(param3 && this.playCallBack.onPlayBeforeStart != null)
         {
            _loc15_.push(this.playCallBack.onPlayBeforeStart,[param1,param2],param9);
         }
         if(param4 && this.playCallBack.onPlayStart != null)
         {
            _loc15_.push(this.playCallBack.onPlayStart,[param1,param2],param10);
         }
         if(param5 && this.playCallBack.onPlayUpdate != null)
         {
            _loc15_.push(this.playCallBack.onPlayUpdate,[param1,param2],param11);
         }
         if(param6 && this.playCallBack.onPlayComplete != null)
         {
            _loc15_.push(this.playCallBack.onPlayComplete,[param1,param2],param12);
         }
         if(param7 && this.playCallBack.onAdd != null)
         {
            _loc15_.push(this.playCallBack.onAdd,[param1,param2],param13);
         }
         if(param8 && this.playCallBack.onRemove != null)
         {
            _loc15_.push(this.playCallBack.onRemove,[param1,param2],param14);
         }
      }
      
      public function clone() : AvatarParamData
      {
         var _loc1_:AvatarParamData = new AvatarParamData(this.sourcePath,this.type);
         _loc1_.id_noCheckValid = this.id;
         _loc1_.repeat = this.repeat;
         _loc1_.depth = this.depth;
         _loc1_.useType = this.useType;
         _loc1_.offsetX = this.offsetX;
         _loc1_.offsetY = this.offsetY;
         _loc1_.offsetOnMountX = this.offsetOnMountX;
         _loc1_.offsetOnMountY = this.offsetOnMountY;
         _loc1_.offsetSitX = this.offsetSitX;
         _loc1_.offsetSitY = this.offsetSitY;
         _loc1_.offsetDandaoStartX = this.offsetDandaoStartX;
         _loc1_.offsetDandaoStartY = this.offsetDandaoStartY;
         if(this.dynamicPosition != null)
         {
            _loc1_.dynamicPosition = this.dynamicPosition.clone();
         }
         _loc1_.sleepTime = this.sleepTime;
         _loc1_.useSpecilizeXY = this.useSpecilizeXY;
         _loc1_.status = this.status;
         _loc1_.angle = this.angle;
         _loc1_.useMagicAngle = this.useMagicAngle;
         _loc1_.rotation = this.rotation;
         _loc1_.clearSameType = this.clearSameType;
         if(this.playCallBack != null)
         {
            _loc1_.playCallBack = this.playCallBack.clone();
         }
         return _loc1_;
      }
      
      public function equals(param1:AvatarParamData) : Boolean
      {
         return this.sourcePath == param1.sourcePath && this.type == param1.type && this.id == param1.id && this.repeat == param1.repeat && this.depth == param1.depth && this.useType == param1.useType && this.offsetX == param1.offsetX && this.offsetY == param1.offsetY && this.offsetOnMountX == param1.offsetOnMountX && this.offsetOnMountY == param1.offsetOnMountY && this.offsetSitX == param1.offsetSitX && this.offsetSitY == param1.offsetSitY && this.offsetDandaoStartX == param1.offsetDandaoStartX && this.offsetDandaoStartY == param1.offsetDandaoStartY && (this.dynamicPosition == null && param1.dynamicPosition == null || this.dynamicPosition.equals(param1.dynamicPosition)) && this.sleepTime == param1.sleepTime && this.useSpecilizeXY == param1.useSpecilizeXY && this.status == param1.status && this.angle == param1.angle && this.useMagicAngle == param1.useMagicAngle && this.rotation == param1.rotation && this.clearSameType == param1.clearSameType;
      }
   }
}

