package com.tgame.manager
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.AvatarPartID;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.utils.Astar;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   
   public class AutoFlyManager
   {
      
      public function AutoFlyManager()
      {
         super();
      }
      
      public static function mainCharAutoFly(param1:Point, param2:Point, param3:Number, param4:Function) : void
      {
         var parthArr:Array;
         var pathLen:int;
         var mpveCallBack:MoveCallBack;
         var oldMountStatus:Boolean = false;
         var oldMountApd:AvatarParamData = null;
         var onMoveReady:Function = null;
         var onMoveThrough:Function = null;
         var onMoveArrived:Function = null;
         var $fromTilePoint:Point = param1;
         var $toTilePoint:Point = param2;
         var $flySpeed:Number = param3;
         var $onFlyComplete:Function = param4;
         onMoveReady = function(param1:SceneCharacter, param2:MapTile, param3:MapTile):void
         {
            KeyboardManager.enable = false;
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
            PipeManager.sendMsg(PipeConstants.HIDE_ALL_UI_EXCEPT_MAINUI);
            GameInstance.mainChar.setTileXY($fromTilePoint.x,$fromTilePoint.y);
            GameInstance.scene.updateCameraNow();
            GameInstance.mainChar.setSpeed($flySpeed);
            GameInstance.mainCharData.avatarInfo.apd_mount = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_AUTO_FLY_MOUNT),AvatarPartType.MOUNT);
            GameInstance.mainChar.isOnMount = true;
            if(GameInstance.mainChar.getStatus() == CharStatusType.DEATH || GameInstance.mainChar.getStatus() == CharStatusType.SIT)
            {
               GameInstance.mainChar.playTo(CharStatusType.STAND);
            }
            AvatarManager.updateMainAvatar(GameInstance.mainChar);
            GameInstance.mainChar.hideAvatarPartByID(AvatarPartID.SHADOW);
            GameInstance.mainChar.headFace.y = -145;
            GameInstance.mainChar.headFace.autoUpdateY = false;
         };
         onMoveThrough = function(param1:SceneCharacter, param2:MapTile):void
         {
         };
         onMoveArrived = function(param1:SceneCharacter, param2:MapTile):void
         {
            GameInstance.mainCharData.isInAutoFly = false;
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
            KeyboardManager.enable = true;
            GameInstance.mainChar.setSpeed(GameInstance.mainCharData.moveSpeed);
            GameInstance.mainCharData.avatarInfo.apd_mount = oldMountApd;
            GameInstance.mainChar.isOnMount = oldMountStatus;
            if(GameInstance.mainChar.getStatus() == CharStatusType.DEATH || GameInstance.mainChar.getStatus() == CharStatusType.SIT)
            {
               GameInstance.mainChar.playTo(CharStatusType.STAND);
            }
            AvatarManager.updateMainAvatar(GameInstance.mainChar);
            GameInstance.mainChar.showAvatarPartByID(AvatarPartID.SHADOW);
            GameInstance.mainChar.headFace.autoUpdateY = true;
            if($onFlyComplete != null)
            {
               $onFlyComplete();
            }
         };
         GameInstance.mainCharData.isInAutoFly = true;
         oldMountStatus = GameInstance.mainChar.isOnMount;
         oldMountApd = GameInstance.mainCharData.avatarInfo.apd_mount;
         parthArr = Astar.search_noSolid($fromTilePoint.x,$fromTilePoint.y,$toTilePoint.x,$toTilePoint.y);
         if(parthArr == null || parthArr.length == 0)
         {
            if($onFlyComplete != null)
            {
               $onFlyComplete();
            }
            return;
         }
         parthArr = parthArr.reverse();
         pathLen = int(parthArr.length);
         mpveCallBack = new MoveCallBack();
         mpveCallBack.onMoveReady = onMoveReady;
         mpveCallBack.onMoveThrough = onMoveThrough;
         mpveCallBack.onMoveArrived = onMoveArrived;
         GameInstance.mainChar.walk0(parthArr,null,-1,0,mpveCallBack);
      }
      
      public static function mainCharAutoFly_biwuZhaoqin(param1:Point, param2:Function, param3:Boolean) : void
      {
         var onMoveReady:Function = null;
         var onMoveThrough:Function = null;
         var onMoveArrived:Function = null;
         var $toTilePoint:Point = param1;
         var $onFlyComplete:Function = param2;
         var bo:Boolean = param3;
         onMoveReady = function(param1:SceneCharacter, param2:MapTile, param3:MapTile):void
         {
            KeyboardManager.enable = false;
            GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = false;
         };
         onMoveThrough = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(GameInstance.mainChar.tile_x == $toTilePoint.x && GameInstance.mainChar.tile_y == $toTilePoint.y)
            {
               if($onFlyComplete != null)
               {
                  $onFlyComplete();
               }
            }
         };
         onMoveArrived = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(bo)
            {
               GameInstance.app.mouseEnabled = GameInstance.app.mouseChildren = true;
               KeyboardManager.enable = true;
            }
         };
         var mpveCallBack:MoveCallBack = new MoveCallBack();
         mpveCallBack.onMoveReady = onMoveReady;
         mpveCallBack.onMoveThrough = onMoveThrough;
         mpveCallBack.onMoveArrived = onMoveArrived;
         GameInstance.mainChar.walk($toTilePoint,-1,-1,mpveCallBack);
      }
   }
}

