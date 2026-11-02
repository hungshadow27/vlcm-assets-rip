package com.tgame.moudels.achievement.controller
{
   import com.tgame.moudels.achievement.model.Achievement_MsgReceivedProxy;
   import com.tgame.moudels.achievement.model.Achievement_MsgSenderProxy;
   import com.tgame.moudels.achievement.view.Achievement_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Achievement_StartupCommand extends SimpleCommand
   {
      
      public function Achievement_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Achievement_MsgSenderProxy());
         facade.registerProxy(new Achievement_MsgReceivedProxy());
         facade.registerMediator(new Achievement_Mediator());
      }
   }
}

