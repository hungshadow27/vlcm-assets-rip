package com.tgame.moudels.menpaineifa.controller
{
   import com.tgame.moudels.menpaineifa.model.MenPaiNeiFa_MsgReceivedProxy;
   import com.tgame.moudels.menpaineifa.model.MenPaiNeiFa_MsgSendProxy;
   import com.tgame.moudels.menpaineifa.view.MenPaiNeiFa_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MenPaiNeiFa_StartupCommand extends SimpleCommand
   {
      
      public function MenPaiNeiFa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MenPaiNeiFa_MsgReceivedProxy());
         facade.registerProxy(new MenPaiNeiFa_MsgSendProxy());
         facade.registerMediator(new MenPaiNeiFa_Mediator());
      }
   }
}

