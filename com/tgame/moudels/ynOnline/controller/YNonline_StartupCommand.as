package com.tgame.moudels.ynOnline.controller
{
   import com.tgame.moudels.ynOnline.model.YNonline_MsgReceivedProxy;
   import com.tgame.moudels.ynOnline.model.YNonline_MsgSendProxy;
   import com.tgame.moudels.ynOnline.view.YNonline_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNonline_StartupCommand extends SimpleCommand
   {
      
      public function YNonline_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNonline_MsgReceivedProxy());
         facade.registerProxy(new YNonline_MsgSendProxy());
         facade.registerMediator(new YNonline_Mediator());
      }
   }
}

