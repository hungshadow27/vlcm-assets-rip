package com.tgame.moudels.canhezhi.controller
{
   import com.tgame.moudels.canhezhi.model.CanHeZhi_MsgReceivedProxy;
   import com.tgame.moudels.canhezhi.model.CanHeZhi_MsgSenderProxy;
   import com.tgame.moudels.canhezhi.view.CanHeZhi_Mediator;
   import com.tgame.moudels.canhezhi.view.CanHeZhi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class CanHeZhi_StartupCommand extends SimpleCommand
   {
      
      public function CanHeZhi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new CanHeZhi_MsgSenderProxy());
         facade.registerProxy(new CanHeZhi_MsgReceivedProxy());
         facade.registerMediator(new CanHeZhi_Mediator());
         facade.registerMediator(new CanHeZhi_TargetMediator());
      }
   }
}

