package com.tgame.moudels.ynTulongdao.controller
{
   import com.tgame.moudels.ynTulongdao.model.YNtulongdao_MsgReceivedProxy;
   import com.tgame.moudels.ynTulongdao.model.YNtulongdao_MsgSendProxy;
   import com.tgame.moudels.ynTulongdao.view.YNtulongdao_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNtulongdao_StartupCommand extends SimpleCommand
   {
      
      public function YNtulongdao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNtulongdao_MsgReceivedProxy());
         facade.registerProxy(new YNtulongdao_MsgSendProxy());
         facade.registerMediator(new YNtulongdao_Mediator());
      }
   }
}

