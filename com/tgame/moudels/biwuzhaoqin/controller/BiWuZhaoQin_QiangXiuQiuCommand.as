package com.tgame.moudels.biwuzhaoqin.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.moudels.biwuzhaoqin.model.BiWuZhaoQin_MsgSenderProxy;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BiWuZhaoQin_QiangXiuQiuCommand extends SimpleCommand
   {
      
      public function BiWuZhaoQin_QiangXiuQiuCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var callBack:MoveCallBack;
         var sc:SceneCharacter = null;
         var send_bajian:Function = null;
         var $note:INotification = param1;
         send_bajian = function(param1:SceneCharacter = null, param2:MapTile = null):void
         {
            if(!sc.usable)
            {
               return;
            }
            var _loc3_:BiWuZhaoQin_MsgSenderProxy = facade.retrieveProxy(BiWuZhaoQin_MsgSenderProxy.NAME) as BiWuZhaoQin_MsgSenderProxy;
            _loc3_.send_61505(sc.id);
         };
         sc = $note.getBody() as SceneCharacter;
         if(!sc)
         {
            return;
         }
         callBack = new MoveCallBack();
         callBack.onMoveArrived = send_bajian;
         MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + sc.tile_x + "," + sc.tile_y + ",70",false,callBack);
      }
   }
}

