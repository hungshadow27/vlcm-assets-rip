package com.tgame.moudels.scene
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.scene.controller.Scene_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Scene_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.login.Scene_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const ENTER_LINE:String = "ENTER_LINE";
      
      public static const CLIENT_READY:String = "CLIENT_READY";
      
      public static const ENTER_CHAT:String = "ENTER_CHAT";
      
      public static const ENTER_SCENE:String = "ENTER_SCENE";
      
      public static const LOAD_NPC:String = "LOAD_NPC";
      
      public static const LOAD_TELPORT:String = "LOAD_TELPORT";
      
      public static const CALC_ASTAR:String = "CALC_ASTAR";
      
      public static const TASK_UPDATE_ALL_NPC_STATUS:String = "TASK_UPDATE_ALL_NPC_STATUS";
      
      public function Scene_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_SCENE,PipeConstants.ENTER_LINE,PipeConstants.CLIENT_READY,PipeConstants.ENTER_CHAT,PipeConstants.ENTER_SCENE,PipeConstants.LOAD_MAP_CONFIG_COMPLETE,PipeConstants.TASK_UPDATE_ALL_NPC_STATUS,PipeConstants.SEND_XIANJING],this.handlePipeMessage,Scene_ApplicationFacade);
      }
      
      public static function getInstance() : Scene_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Scene_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Scene_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Scene_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_SCENE:
               this.startup();
               break;
            case PipeConstants.ENTER_LINE:
               sendNotification(ENTER_LINE);
               break;
            case PipeConstants.CLIENT_READY:
               sendNotification(CLIENT_READY);
               break;
            case PipeConstants.ENTER_CHAT:
               sendNotification(ENTER_CHAT);
               break;
            case PipeConstants.ENTER_SCENE:
               sendNotification(ENTER_SCENE,_loc2_);
               break;
            case PipeConstants.LOAD_MAP_CONFIG_COMPLETE:
               sendNotification(LOAD_NPC);
               sendNotification(LOAD_TELPORT);
               break;
            case PipeConstants.TASK_UPDATE_ALL_NPC_STATUS:
               sendNotification(TASK_UPDATE_ALL_NPC_STATUS,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

