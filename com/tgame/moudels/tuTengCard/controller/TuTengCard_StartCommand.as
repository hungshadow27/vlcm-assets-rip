package com.tgame.moudels.tuTengCard.controller
{
   import com.tgame.moudels.tuTengCard.model.TuTengCade_MsgReceivedProxy;
   import com.tgame.moudels.tuTengCard.model.TuTengCade_MsgSendProxy;
   import com.tgame.moudels.tuTengCard.view.TuTengCade_TianJiSuo_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TuTengCard_StartCommand extends SimpleCommand
   {
      
      public function TuTengCard_StartCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TuTengCade_MsgReceivedProxy());
         facade.registerProxy(new TuTengCade_MsgSendProxy());
         facade.registerMediator(new TuTengCade_TianJiSuo_Mediator());
      }
   }
}

