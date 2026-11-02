package com.tgame.moudels.ynShijiebei.controller
{
   import com.tgame.moudels.ynShijiebei.model.YNshijiebei_MsgReceivedProxy;
   import com.tgame.moudels.ynShijiebei.model.YNshijiebei_MsgSendProxy;
   import com.tgame.moudels.ynShijiebei.view.YNCommitFootball_Mediator;
   import com.tgame.moudels.ynShijiebei.view.YNshijiebei_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNshijiebei_StartupCommand extends SimpleCommand
   {
      
      public function YNshijiebei_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNshijiebei_MsgReceivedProxy());
         facade.registerProxy(new YNshijiebei_MsgSendProxy());
         facade.registerMediator(new YNshijiebei_Mediator());
         facade.registerMediator(new YNCommitFootball_Mediator());
      }
   }
}

