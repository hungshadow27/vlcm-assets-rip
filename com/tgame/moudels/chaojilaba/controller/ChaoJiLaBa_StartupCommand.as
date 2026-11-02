package com.tgame.moudels.chaojilaba.controller
{
   import com.tgame.moudels.chaojilaba.model.ChaoJiLaBa_MsgReceivedProxy;
   import com.tgame.moudels.chaojilaba.model.ChaoJiLaBa_MsgSendProxy;
   import com.tgame.moudels.chaojilaba.view.ChaoJiLaBa_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ChaoJiLaBa_StartupCommand extends SimpleCommand
   {
      
      public function ChaoJiLaBa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ChaoJiLaBa_MsgReceivedProxy());
         facade.registerProxy(new ChaoJiLaBa_MsgSendProxy());
         facade.registerMediator(new ChaoJiLaBa_Mediator());
      }
   }
}

