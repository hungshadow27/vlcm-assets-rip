package com.tgame.moudels.moxue.controller
{
   import com.tgame.moudels.moxue.model.MoXue_MsgReceivedProxy;
   import com.tgame.moudels.moxue.model.MoXue_MsgSenderProxy;
   import com.tgame.moudels.moxue.view.MoXue_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MoXue_StartupCommand extends SimpleCommand
   {
      
      public function MoXue_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MoXue_MsgReceivedProxy());
         facade.registerProxy(new MoXue_MsgSenderProxy());
         facade.registerMediator(new MoXue_Mediator());
      }
   }
}

