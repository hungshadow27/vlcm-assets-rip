package com.tgame.moudels.yitianjian.controller
{
   import com.tgame.moudels.yitianjian.model.YNyitianjian_MsgReceivedProxy;
   import com.tgame.moudels.yitianjian.model.YNyitianjian_MsgSendProxy;
   import com.tgame.moudels.yitianjian.view.YNyitianjian_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNyitianjian_StartupCommand extends SimpleCommand
   {
      
      public function YNyitianjian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNyitianjian_MsgReceivedProxy());
         facade.registerProxy(new YNyitianjian_MsgSendProxy());
         facade.registerMediator(new YNyitianjian_Mediator());
      }
   }
}

