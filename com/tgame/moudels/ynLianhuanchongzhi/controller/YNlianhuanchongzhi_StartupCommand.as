package com.tgame.moudels.ynLianhuanchongzhi.controller
{
   import com.tgame.moudels.ynLianhuanchongzhi.model.YNlianhuanchongzhi_MsgReceivedProxy;
   import com.tgame.moudels.ynLianhuanchongzhi.model.YNlianhuanchongzhi_MsgSendProxy;
   import com.tgame.moudels.ynLianhuanchongzhi.view.YNlianhuanchongzhi_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNlianhuanchongzhi_StartupCommand extends SimpleCommand
   {
      
      public function YNlianhuanchongzhi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNlianhuanchongzhi_MsgReceivedProxy());
         facade.registerProxy(new YNlianhuanchongzhi_MsgSendProxy());
         facade.registerMediator(new YNlianhuanchongzhi_Mediator());
      }
   }
}

