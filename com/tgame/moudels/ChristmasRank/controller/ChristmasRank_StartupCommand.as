package com.tgame.moudels.ChristmasRank.controller
{
   import com.tgame.moudels.ChristmasRank.model.ChristmasRank_MsgReceivedProxy;
   import com.tgame.moudels.ChristmasRank.view.ChristmasRank_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ChristmasRank_StartupCommand extends SimpleCommand
   {
      
      public function ChristmasRank_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new ChristmasRank_Mediator());
         facade.registerProxy(new ChristmasRank_MsgReceivedProxy());
      }
   }
}

