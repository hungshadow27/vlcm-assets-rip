package com.tgame.moudels.fabao.controller
{
   import com.tgame.moudels.fabao.model.Fabao_MsgReceivedProxy;
   import com.tgame.moudels.fabao.model.Fabao_MsgSendProxy;
   import com.tgame.moudels.fabao.view.FabaoLingli_Mediator;
   import com.tgame.moudels.fabao.view.Fabao_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Fabao_StartupCommand extends SimpleCommand
   {
      
      public function Fabao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Fabao_MsgReceivedProxy());
         facade.registerProxy(new Fabao_MsgSendProxy());
         facade.registerMediator(new Fabao_Mediator());
         facade.registerMediator(new FabaoLingli_Mediator());
      }
   }
}

