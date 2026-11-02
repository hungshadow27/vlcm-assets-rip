package com.tgame.moudels.jubaopen.controller
{
   import com.tgame.moudels.jubaopen.model.JuBaoPen_MsgReceivedProxy;
   import com.tgame.moudels.jubaopen.model.JuBaoPen_MsgSenderProxy;
   import com.tgame.moudels.jubaopen.view.JuBaoPen_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JuBaoPen_StartupCommand extends SimpleCommand
   {
      
      public function JuBaoPen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new JuBaoPen_Mediator());
         facade.registerProxy(new JuBaoPen_MsgReceivedProxy());
         facade.registerProxy(new JuBaoPen_MsgSenderProxy());
      }
   }
}

