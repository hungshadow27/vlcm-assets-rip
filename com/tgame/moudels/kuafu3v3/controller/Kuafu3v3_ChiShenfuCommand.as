package com.tgame.moudels.kuafu3v3.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.MainCharSeachPathManager;
   import com.tgame.moudels.kuafu3v3.model.Kuafu3v3_MsgSenderProxy;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.vo.map.MapTile;
   import com.zcp.engine.vo.move.MoveCallBack;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Kuafu3v3_ChiShenfuCommand extends SimpleCommand
   {
      
      public function Kuafu3v3_ChiShenfuCommand()
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
            var _loc3_:Kuafu3v3_MsgSenderProxy = facade.retrieveProxy(Kuafu3v3_MsgSenderProxy.NAME) as Kuafu3v3_MsgSenderProxy;
            _loc3_.send_53615(sc.id);
         };
         sc = $note.getBody() as SceneCharacter;
         if(!sc)
         {
            return;
         }
         callBack = new MoveCallBack();
         callBack.onMoveArrived = send_bajian;
         MainCharSeachPathManager.mainCharWalk(GameInstance.scene.mapConfig.mapID + "," + sc.tile_x + "," + sc.tile_y + ",0",false,callBack);
      }
   }
}

