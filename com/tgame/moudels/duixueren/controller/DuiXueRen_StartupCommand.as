package com.tgame.moudels.duixueren.controller
{
   import com.tgame.moudels.duixueren.model.DuiXueRen_MsgReceivedProxy;
   import com.tgame.moudels.duixueren.model.DuiXueRen_MsgSendProxy;
   import com.tgame.moudels.duixueren.view.DuiXueRen_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DuiXueRen_StartupCommand extends SimpleCommand
   {
      
      public function DuiXueRen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DuiXueRen_MsgReceivedProxy());
         facade.registerProxy(new DuiXueRen_MsgSendProxy());
         facade.registerMediator(new DuiXueRen_Mediator());
      }
   }
}

