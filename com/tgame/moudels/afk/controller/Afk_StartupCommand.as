package com.tgame.moudels.afk.controller
{
   import com.tgame.moudels.afk.model.Afk_MsgReceivedProxy;
   import com.tgame.moudels.afk.model.Afk_MsgSenderProxy;
   import com.tgame.moudels.afk.view.Afk_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Afk_StartupCommand extends SimpleCommand
   {
      
      public function Afk_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Afk_MsgReceivedProxy());
         facade.registerProxy(new Afk_MsgSenderProxy());
         facade.registerMediator(new Afk_Mediator());
      }
   }
}

