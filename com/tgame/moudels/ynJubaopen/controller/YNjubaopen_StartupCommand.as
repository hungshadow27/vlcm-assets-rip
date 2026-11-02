package com.tgame.moudels.ynJubaopen.controller
{
   import com.tgame.moudels.ynJubaopen.model.YNjubaopen_MsgReceivedProxy;
   import com.tgame.moudels.ynJubaopen.model.YNjubaopen_MsgSendProxy;
   import com.tgame.moudels.ynJubaopen.view.YNjubaopen_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNjubaopen_StartupCommand extends SimpleCommand
   {
      
      public function YNjubaopen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNjubaopen_MsgReceivedProxy());
         facade.registerProxy(new YNjubaopen_MsgSendProxy());
         facade.registerMediator(new YNjubaopen_Mediator());
      }
   }
}

