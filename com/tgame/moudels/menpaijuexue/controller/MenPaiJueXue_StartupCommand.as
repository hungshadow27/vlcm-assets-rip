package com.tgame.moudels.menpaijuexue.controller
{
   import com.tgame.moudels.menpaijuexue.model.MenPaiJueXue_MsgReceivedProxy;
   import com.tgame.moudels.menpaijuexue.model.MenPaiJueXue_MsgSendProxy;
   import com.tgame.moudels.menpaijuexue.view.MenPaiJueXue_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MenPaiJueXue_StartupCommand extends SimpleCommand
   {
      
      public function MenPaiJueXue_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MenPaiJueXue_MsgReceivedProxy());
         facade.registerProxy(new MenPaiJueXue_MsgSendProxy());
         facade.registerMediator(new MenPaiJueXue_Mediator());
      }
   }
}

