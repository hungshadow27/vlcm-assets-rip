package com.tgame.moudels.ynLongzhizhufu.controller
{
   import com.tgame.moudels.ynLongzhizhufu.model.YNlongzhizhufu_MsgReceivedProxy;
   import com.tgame.moudels.ynLongzhizhufu.model.YNlongzhizhufu_MsgSendProxy;
   import com.tgame.moudels.ynLongzhizhufu.view.YNlongzhizhufu_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNlongzhizhufu_StartupCommand extends SimpleCommand
   {
      
      public function YNlongzhizhufu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNlongzhizhufu_MsgReceivedProxy());
         facade.registerProxy(new YNlongzhizhufu_MsgSendProxy());
         facade.registerMediator(new YNlongzhizhufu_Mediator());
      }
   }
}

