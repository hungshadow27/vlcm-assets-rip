package com.tgame.moudels.engine.controller
{
   import com.tgame.moudels.engine.Engine_ApplicationFacade;
   import com.tgame.moudels.engine.model.Engine_MsgReceivedProxy;
   import com.tgame.moudels.engine.model.Engine_MsgSenderProxy;
   import com.tgame.moudels.engine.model.Engine_SceneProxy;
   import com.tgame.moudels.engine.view.Engine_SceneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Engine_StartupCommand extends SimpleCommand
   {
      
      public function Engine_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Engine_SceneProxy());
         facade.registerProxy(new Engine_MsgSenderProxy());
         facade.registerProxy(new Engine_MsgReceivedProxy());
         facade.registerCommand(Engine_ApplicationFacade.SCENE_INTERACTIVE,Engine_SceneInteractiveCommand);
         facade.registerCommand(Engine_ApplicationFacade.SCENE_WALK,Engine_SceneWalkCommand);
         facade.registerCommand(Engine_ApplicationFacade.SCENE_PROCESS,Engine_SceneProcessCommand);
         facade.registerCommand(Engine_ApplicationFacade.SCENE_STATUS,Engine_SceneStatusCommand);
         facade.registerMediator(new Engine_SceneMediator());
         sendNotification(Engine_ApplicationFacade.CREAT_SCENE);
      }
   }
}

