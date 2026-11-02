package com.tgame.moudels.menpaizhuanhuan.controller
{
   import com.tgame.moudels.menpaizhuanhuan.model.PartyChange_MsgReceivedProxy;
   import com.tgame.moudels.menpaizhuanhuan.model.PartyChange_MsgSenderProxy;
   import com.tgame.moudels.menpaizhuanhuan.view.PartyChange_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class PartyChange_StartupCommand extends SimpleCommand
   {
      
      public function PartyChange_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new PartyChange_MsgReceivedProxy());
         facade.registerProxy(new PartyChange_MsgSenderProxy());
         facade.registerMediator(new PartyChange_Mediator());
      }
   }
}

