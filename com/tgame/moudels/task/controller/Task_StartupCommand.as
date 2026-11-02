package com.tgame.moudels.task.controller
{
   import com.tgame.moudels.task.Task_ApplicationFacade;
   import com.tgame.moudels.task.model.Task_MsgReceivedProxy;
   import com.tgame.moudels.task.model.Task_MsgSenderProxy;
   import com.tgame.moudels.task.model.Task_TaskProxy;
   import com.tgame.moudels.task.view.Task_AcceptCycTaskPlaneMediator;
   import com.tgame.moudels.task.view.Task_TaskPlaneMediator;
   import com.tgame.moudels.task.view.Task_TaskTrackPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Task_StartupCommand extends SimpleCommand
   {
      
      public function Task_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Task_TaskProxy());
         facade.registerProxy(new Task_MsgSenderProxy());
         facade.registerProxy(new Task_MsgReceivedProxy());
         facade.registerCommand(Task_ApplicationFacade.TASK_ACCEPT_CMD,Task_AcceptCommand);
         facade.registerCommand(Task_ApplicationFacade.TASK_HANDIN_CMD,Task_HandInCommand);
         facade.registerCommand(Task_ApplicationFacade.TASK_UPDATE_CMD,Task_UpdateCommand);
         facade.registerMediator(new Task_TaskPlaneMediator());
         facade.registerMediator(new Task_TaskTrackPlaneMediator());
         facade.registerMediator(new Task_AcceptCycTaskPlaneMediator());
      }
   }
}

