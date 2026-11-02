package com.tgame.moudels.nitaCyclone.controller
{
   import com.tgame.moudels.nitaCyclone.NitaCyclone_ApplicationFacade;
   import com.tgame.moudels.nitaCyclone.model.NitaCyclone_MsgReceivedProxy;
   import com.tgame.moudels.nitaCyclone.model.NitaCyclone_MsgSenderProxy;
   import com.tgame.moudels.nitaCyclone.view.NitaCyclone_Mediator;
   import com.tgame.moudels.nitaCyclone.view.NitaSkill_Mediator;
   import com.tgame.moudels.nitaCyclone.view.TargetNitaCyclone_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class NitaCyclone_StartUpCommand extends SimpleCommand
   {
      
      public function NitaCyclone_StartUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new NitaCyclone_MsgReceivedProxy());
         facade.registerProxy(new NitaCyclone_MsgSenderProxy());
         facade.registerCommand(NitaCyclone_ApplicationFacade.BUG_GOODS,NitaCyclone_BuyGoodsCommand);
         facade.registerMediator(new NitaCyclone_Mediator());
         facade.registerMediator(new TargetNitaCyclone_Mediator());
         facade.registerMediator(new NitaSkill_Mediator());
      }
   }
}

