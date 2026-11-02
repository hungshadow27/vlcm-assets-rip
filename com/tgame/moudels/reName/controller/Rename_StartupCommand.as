package com.tgame.moudels.reName.controller
{
   import com.tgame.moudels.reName.model.Rename_MsgReceivedProxy;
   import com.tgame.moudels.reName.model.Rename_MsgSendProxy;
   import com.tgame.moudels.reName.view.Rename_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Rename_StartupCommand extends SimpleCommand
   {
      
      public function Rename_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Rename_MsgReceivedProxy());
         facade.registerProxy(new Rename_MsgSendProxy());
         facade.registerMediator(new Rename_Mediator());
      }
   }
}

