package com.tgame.moudels.scene.controller
{
   import com.tgame.moudels.scene.model.Scene_SceneProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Scene_LoadTelportCommand extends SimpleCommand
   {
      
      public function Scene_LoadTelportCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Scene_SceneProxy = facade.retrieveProxy(Scene_SceneProxy.NAME) as Scene_SceneProxy;
         _loc2_.loadTelePort();
      }
   }
}

