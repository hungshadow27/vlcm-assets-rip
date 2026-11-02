package com.tgame.moudels.wedding.controller
{
   import com.tgame.moudels.wedding.model.Wedding_MsgReceivedProxy;
   import com.tgame.moudels.wedding.model.Wedding_MsgSenderProxy;
   import com.tgame.moudels.wedding.view.WeddingLaunchProposal_Mediator;
   import com.tgame.moudels.wedding.view.WeddingMarriageSuccess_Mediator;
   import com.tgame.moudels.wedding.view.WeddingProposalAffirm_Mediator;
   import com.tgame.moudels.wedding.view.WeddingTaKungFu_Mediator;
   import com.tgame.moudels.wedding.view.WeddingTeam_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Wedding_StartupCommand extends SimpleCommand
   {
      
      public function Wedding_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Wedding_MsgReceivedProxy());
         facade.registerProxy(new Wedding_MsgSenderProxy());
         facade.registerMediator(new WeddingLaunchProposal_Mediator());
         facade.registerMediator(new WeddingMarriageSuccess_Mediator());
         facade.registerMediator(new WeddingProposalAffirm_Mediator());
         facade.registerMediator(new WeddingTeam_Mediator());
         facade.registerMediator(new WeddingTaKungFu_Mediator());
      }
   }
}

