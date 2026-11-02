package com.tgame.moudels.yn2016xingyunzhuanpan.controller
{
   import com.tgame.moudels.yn2016xingyunzhuanpan.model.YN2016xingyunzhuanpan_MsgReceivedProxy;
   import com.tgame.moudels.yn2016xingyunzhuanpan.model.YN2016xingyunzhuanpan_MsgSendProxy;
   import com.tgame.moudels.yn2016xingyunzhuanpan.view.YN2016xingyunzhuanpan_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YN2016xingyunzhuanpan_StartupCommand extends SimpleCommand
   {
      
      public function YN2016xingyunzhuanpan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YN2016xingyunzhuanpan_MsgReceivedProxy());
         facade.registerProxy(new YN2016xingyunzhuanpan_MsgSendProxy());
         facade.registerMediator(new YN2016xingyunzhuanpan_Mediator());
      }
   }
}

