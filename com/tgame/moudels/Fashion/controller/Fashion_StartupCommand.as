package com.tgame.moudels.Fashion.controller
{
   import com.tgame.moudels.Fashion.model.Fashion_MsgReceivedProxy;
   import com.tgame.moudels.Fashion.model.Fashion_MsgSenderProxy;
   import com.tgame.moudels.Fashion.view.Fashion_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Fashion_StartupCommand extends SimpleCommand
   {
      
      public function Fashion_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Fashion_MsgReceivedProxy());
         facade.registerProxy(new Fashion_MsgSenderProxy());
         facade.registerMediator(new Fashion_Mediator());
      }
   }
}

