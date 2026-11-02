package com.tgame.moudels.newPlayerGuide.controller
{
   import com.tgame.moudels.newPlayerGuide.model.NewPlayerGuide_MsgReceivedProxy;
   import com.tgame.moudels.newPlayerGuide.model.NewPlayerGuide_MsgSendProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class NewPlayerGuide_ShutDownCommand extends SimpleCommand
   {
      
      public function NewPlayerGuide_ShutDownCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.removeProxy(NewPlayerGuide_MsgReceivedProxy.NAME);
         facade.removeProxy(NewPlayerGuide_MsgSendProxy.NAME);
      }
   }
}

