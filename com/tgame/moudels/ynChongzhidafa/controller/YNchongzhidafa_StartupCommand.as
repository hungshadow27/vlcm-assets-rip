package com.tgame.moudels.ynChongzhidafa.controller
{
   import com.tgame.moudels.ynChongzhidafa.model.YNchongzhidafa_MsgReceivedProxy;
   import com.tgame.moudels.ynChongzhidafa.model.YNchongzhidafa_MsgSendProxy;
   import com.tgame.moudels.ynChongzhidafa.view.YNchongzhidafa_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNchongzhidafa_StartupCommand extends SimpleCommand
   {
      
      public function YNchongzhidafa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNchongzhidafa_MsgReceivedProxy());
         facade.registerProxy(new YNchongzhidafa_MsgSendProxy());
         facade.registerMediator(new YNchongzhidafa_Mediator());
      }
   }
}

