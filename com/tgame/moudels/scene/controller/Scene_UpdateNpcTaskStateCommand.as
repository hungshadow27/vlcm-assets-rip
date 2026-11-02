package com.tgame.moudels.scene.controller
{
   import com.tgame.moudels.scene.model.Scene_SceneProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Scene_UpdateNpcTaskStateCommand extends SimpleCommand
   {
      
      public function Scene_UpdateNpcTaskStateCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Array = param1.getBody() as Array;
         var _loc3_:Scene_SceneProxy = facade.retrieveProxy(Scene_SceneProxy.NAME) as Scene_SceneProxy;
         _loc3_.updateNpcTaskState(_loc2_[0],_loc2_[1],_loc2_[2],_loc2_[3]);
      }
   }
}

