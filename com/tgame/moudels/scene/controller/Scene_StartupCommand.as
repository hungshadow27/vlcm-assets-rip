package com.tgame.moudels.scene.controller
{
   import com.tgame.moudels.scene.Scene_ApplicationFacade;
   import com.tgame.moudels.scene.model.Scene_ChatSocketProxy;
   import com.tgame.moudels.scene.model.Scene_LineSocketProxy;
   import com.tgame.moudels.scene.model.Scene_MsgReceivedProxy;
   import com.tgame.moudels.scene.model.Scene_MsgSenderProxy;
   import com.tgame.moudels.scene.model.Scene_SceneProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Scene_StartupCommand extends SimpleCommand
   {
      
      public function Scene_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Scene_SceneProxy());
         facade.registerProxy(new Scene_LineSocketProxy());
         facade.registerProxy(new Scene_ChatSocketProxy());
         facade.registerProxy(new Scene_MsgSenderProxy());
         facade.registerProxy(new Scene_MsgReceivedProxy());
         facade.registerCommand(Scene_ApplicationFacade.ENTER_LINE,Scene_EnterLineCommand);
         facade.registerCommand(Scene_ApplicationFacade.CLIENT_READY,Scene_ClientReadyCommand);
         facade.registerCommand(Scene_ApplicationFacade.ENTER_CHAT,Scene_EnterChatCommand);
         facade.registerCommand(Scene_ApplicationFacade.ENTER_SCENE,Scene_EnterSceneCommand);
         facade.registerCommand(Scene_ApplicationFacade.LOAD_NPC,Scene_LoadNPCCommand);
         facade.registerCommand(Scene_ApplicationFacade.LOAD_TELPORT,Scene_LoadTelportCommand);
         facade.registerCommand(Scene_ApplicationFacade.TASK_UPDATE_ALL_NPC_STATUS,Scene_UpdateNpcTaskStateCommand);
      }
   }
}

