package com.tgame.moudels.team.controller
{
   import com.tgame.moudels.team.model.Team_MsgReceivedProxy;
   import com.tgame.moudels.team.model.Team_MsgSenderProxy;
   import com.tgame.moudels.team.view.Team_GumuMishi_Mediator;
   import com.tgame.moudels.team.view.Team_Instance_Mediator;
   import com.tgame.moudels.team.view.Team_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Team_StartupCommand extends SimpleCommand
   {
      
      public function Team_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Team_MsgReceivedProxy());
         facade.registerProxy(new Team_MsgSenderProxy());
         facade.registerMediator(new Team_Mediator());
         facade.registerMediator(new Team_Instance_Mediator());
         facade.registerMediator(new Team_GumuMishi_Mediator());
      }
   }
}

