package com.tgame.moudels.buchangfuben.controller
{
   import com.tgame.moudels.buchangfuben.model.BuchangFuben_MsgReceivedProxy;
   import com.tgame.moudels.buchangfuben.model.BuchangFuben_MsgSendProxy;
   import com.tgame.moudels.buchangfuben.view.BuchangFuben_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BuchangFuben_StartupCommand extends SimpleCommand
   {
      
      public function BuchangFuben_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BuchangFuben_MsgReceivedProxy());
         facade.registerProxy(new BuchangFuben_MsgSendProxy());
         facade.registerMediator(new BuchangFuben_Mediator());
      }
   }
}

