package com.tgame.moudels.MonthSignIn.controller
{
   import com.tgame.moudels.MonthSignIn.model.MonthSignIn_MsgReceivedProxy;
   import com.tgame.moudels.MonthSignIn.model.MonthSignIn_MsgSenderProxy;
   import com.tgame.moudels.MonthSignIn.view.MonthSignIn_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MonthSignIn_StartupCommand extends SimpleCommand
   {
      
      public function MonthSignIn_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MonthSignIn_MsgReceivedProxy());
         facade.registerProxy(new MonthSignIn_MsgSenderProxy());
         facade.registerMediator(new MonthSignIn_Mediator());
      }
   }
}

