package com.tgame.moudels.engine.controller
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.engine.model.Engine_SceneProxy;
   import com.zcp.engine.events.SceneEvent;
   import com.zcp.engine.events.SceneEventAction_process;
   import flash.display.BitmapData;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Engine_SceneProcessCommand extends SimpleCommand
   {
      
      public function Engine_SceneProcessCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc4_:Object = null;
         var _loc5_:BitmapData = null;
         var _loc6_:Engine_SceneProxy = null;
         var _loc2_:SceneEvent = param1.getBody() as SceneEvent;
         var _loc3_:String = _loc2_.action;
         _loc4_ = _loc2_.data;
         switch(_loc3_)
         {
            case SceneEventAction_process.LOAD_SMALL_MAP_COMPLETE:
               _loc5_ = _loc4_ as BitmapData;
               PipeManager.sendMsg(PipeConstants.LOAD_SMALL_MAP_COMPLETE,_loc5_);
               _loc6_ = facade.retrieveProxy(Engine_SceneProxy.NAME) as Engine_SceneProxy;
               _loc6_.updateMainCharInSmallMap();
         }
      }
   }
}

