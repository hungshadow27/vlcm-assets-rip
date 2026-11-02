package com.tgame.moudels.VIP.controller
{
   import com.tgame.moudels.VIP.model.VIP_MsgReceivedProxy;
   import com.tgame.moudels.VIP.model.VIP_MsgSenderProxy;
   import com.tgame.moudels.VIP.view.VIP_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class VIP_StartupCommand extends SimpleCommand
   {
      
      public function VIP_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new VIP_MsgReceivedProxy());
         facade.registerProxy(new VIP_MsgSenderProxy());
         facade.registerMediator(new VIP_Mediator());
      }
   }
}

