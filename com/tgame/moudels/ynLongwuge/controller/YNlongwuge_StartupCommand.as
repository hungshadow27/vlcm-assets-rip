package com.tgame.moudels.ynLongwuge.controller
{
   import com.tgame.moudels.ynLongwuge.model.YNlongwuge_MsgReceivedProxy;
   import com.tgame.moudels.ynLongwuge.model.YNlongwuge_MsgSendProxy;
   import com.tgame.moudels.ynLongwuge.view.YNlongwuge_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNlongwuge_StartupCommand extends SimpleCommand
   {
      
      public function YNlongwuge_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNlongwuge_MsgReceivedProxy());
         facade.registerProxy(new YNlongwuge_MsgSendProxy());
         facade.registerMediator(new YNlongwuge_Mediator());
      }
   }
}

