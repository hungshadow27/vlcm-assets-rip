package com.tgame.moudels.settings.controller
{
   import com.tgame.moudels.settings.model.Settings_MsgReceivedProxy;
   import com.tgame.moudels.settings.model.Settings_MsgSenderProxy;
   import com.tgame.moudels.settings.view.Settings_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Settings_StartupCommand extends SimpleCommand
   {
      
      public function Settings_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Settings_MsgReceivedProxy());
         facade.registerProxy(new Settings_MsgSenderProxy());
         facade.registerMediator(new Settings_Mediator());
      }
   }
}

