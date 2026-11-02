package com.tgame.moudels.biwuCrossP.controller
{
   import com.tgame.moudels.biwuCrossP.model.BiwuCrossP_MsgReceivedProxy;
   import com.tgame.moudels.biwuCrossP.model.BiwuCrossP_MsgSenderProxy;
   import com.tgame.moudels.biwuCrossP.view.BiwuCrossP_Mediator;
   import com.tgame.moudels.biwuCrossP.view.YNXiangyangzhanchangRank_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BiwuCrossP_StartupCommand extends SimpleCommand
   {
      
      public function BiwuCrossP_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new BiwuCrossP_Mediator());
         facade.registerMediator(new YNXiangyangzhanchangRank_Mediator());
         facade.registerProxy(new BiwuCrossP_MsgReceivedProxy());
         facade.registerProxy(new BiwuCrossP_MsgSenderProxy());
      }
   }
}

