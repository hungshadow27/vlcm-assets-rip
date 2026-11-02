package com.tgame.moudels.meiren.controller
{
   import com.tgame.moudels.meiren.model.MeiRen_MsgReceivedProxy;
   import com.tgame.moudels.meiren.model.MeiRen_MsgSenderProxy;
   import com.tgame.moudels.meiren.view.MeiRen_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class MeiRen_StartupCommand extends SimpleCommand
   {
      
      public function MeiRen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new MeiRen_MsgReceivedProxy());
         facade.registerProxy(new MeiRen_MsgSenderProxy());
         facade.registerMediator(new MeiRen_Mediator());
      }
   }
}

