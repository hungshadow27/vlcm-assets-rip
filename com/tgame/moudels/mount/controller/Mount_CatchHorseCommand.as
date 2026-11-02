package com.tgame.moudels.mount.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import flash.geom.Point;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Mount_CatchHorseCommand extends SimpleCommand
   {
      
      public function Mount_CatchHorseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:SceneCharacter = param1.getBody() as SceneCharacter;
         this.catchHorse(_loc2_,OtherConst.DEFAULT_SKILL_DISTANCE);
      }
      
      private function catchHorse(param1:SceneCharacter, param2:int) : void
      {
         var callBack:MoveCallBack;
         var targetPoint:Point = null;
         var catchTarget:Function = null;
         var send_catch:Function = null;
         var $monsterChar:SceneCharacter = param1;
         var $distance:int = param2;
         catchTarget = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(!$monsterChar || !$monsterChar.usable)
            {
               return;
            }
            if(targetPoint.x != $monsterChar.tile_x || targetPoint.y != $monsterChar.tile_y)
            {
               catchHorse($monsterChar,$distance);
            }
         };
         send_catch = function(param1:SceneCharacter, param2:MapTile):void
         {
            if(!$monsterChar || !$monsterChar.usable)
            {
               return;
            }
            var _loc3_:Mount_MsgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
            _loc3_.send_50043($monsterChar.id);
         };
         if($monsterChar == null)
         {
            return;
         }
         targetPoint = new Point($monsterChar.tile_x,$monsterChar.tile_y);
         callBack = new MoveCallBack();
         callBack.onMoveThrough = catchTarget;
         callBack.onMoveArrived = send_catch;
         MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + $monsterChar.tile_x + "," + $monsterChar.tile_y + "," + $distance,false,callBack);
      }
   }
}

