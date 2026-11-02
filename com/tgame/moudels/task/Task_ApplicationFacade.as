package com.tgame.moudels.task
{
   import com.tgame.PipeConstants;
   import com.tgame.manager.PipeManager;
   import com.tgame.moudels.task.controller.Task_StartupCommand;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.patterns.facade.Facade;
   
   public class Task_ApplicationFacade extends Facade
   {
      
      public static const NAME:String = "com.tgame.moudels.task.Task_ApplicationFacade";
      
      public static const STARTUP:String = "STARTUP";
      
      public static const TASK_ACCEPT_CMD:String = "TASK_ACCEPT_CMD";
      
      public static const TASK_HANDIN_CMD:String = "TASK_HANDIN_CMD";
      
      public static const TASK_UPDATE_CMD:String = "TASK_UPDATE_CMD";
      
      public static const TASK_UPDATE_TASKLIST:String = "TASK_UPDATE_TASKLIST";
      
      public static const TASK_UPDATE_TASKTRACKER:String = "TASK_UPDATE_TASKTRACKER";
      
      public static const DROP_TASK:String = "DROP_TASK";
      
      public function Task_ApplicationFacade(param1:String)
      {
         super(param1);
         PipeManager.registerMsgs([PipeConstants.STARTUP_TASK,PipeConstants.TASK_ACCEPT_CMD,PipeConstants.TASK_HANDIN_CMD,PipeConstants.TASK_UPDATE_CMD,PipeConstants.TASK_UPDATE_TASKLIST,PipeConstants.TASK_UPDATE_TASKTRACKER,PipeConstants.DROP_TASK],this.handlePipeMessage,Task_ApplicationFacade);
      }
      
      public static function getInstance() : Task_ApplicationFacade
      {
         if(instanceMap[NAME] == null)
         {
            instanceMap[NAME] = new Task_ApplicationFacade(NAME);
         }
         return instanceMap[NAME] as Task_ApplicationFacade;
      }
      
      override protected function initializeController() : void
      {
         super.initializeController();
         registerCommand(STARTUP,Task_StartupCommand);
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.STARTUP_TASK:
               this.startup();
               break;
            case PipeConstants.TASK_ACCEPT_CMD:
               sendNotification(TASK_ACCEPT_CMD,_loc2_);
               break;
            case PipeConstants.TASK_HANDIN_CMD:
               sendNotification(TASK_HANDIN_CMD,_loc2_);
               break;
            case PipeConstants.TASK_UPDATE_CMD:
               sendNotification(TASK_UPDATE_CMD,_loc2_);
               break;
            case PipeConstants.TASK_UPDATE_TASKLIST:
               sendNotification(TASK_UPDATE_TASKLIST,_loc2_);
               break;
            case PipeConstants.TASK_UPDATE_TASKTRACKER:
               sendNotification(TASK_UPDATE_TASKTRACKER,_loc2_);
               break;
            case PipeConstants.DROP_TASK:
               sendNotification(DROP_TASK,_loc2_);
         }
      }
      
      private function startup() : void
      {
         sendNotification(STARTUP);
      }
   }
}

