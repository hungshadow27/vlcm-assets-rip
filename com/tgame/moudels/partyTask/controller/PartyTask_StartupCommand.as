package com.tgame.moudels.partyTask.controller
{
   import com.tgame.moudels.partyTask.model.PartyTask_MsgReceivedProxy;
   import com.tgame.moudels.partyTask.model.PartyTask_MsgSenderProxy;
   import com.tgame.moudels.partyTask.view.PartyBossInvite_Mediator;
   import com.tgame.moudels.partyTask.view.PartyTaskComplete_Mediator;
   import com.tgame.moudels.partyTask.view.PartyTaskInvite_Mediator;
   import com.tgame.moudels.partyTask.view.PartyTask_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class PartyTask_StartupCommand extends SimpleCommand
   {
      
      public function PartyTask_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new PartyTask_MsgReceivedProxy());
         facade.registerProxy(new PartyTask_MsgSenderProxy());
         facade.registerMediator(new PartyTask_Mediator());
         facade.registerMediator(new PartyTaskComplete_Mediator());
         facade.registerMediator(new PartyTaskInvite_Mediator());
         facade.registerMediator(new PartyBossInvite_Mediator());
      }
   }
}

