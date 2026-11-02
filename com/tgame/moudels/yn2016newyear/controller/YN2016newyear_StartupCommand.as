package com.tgame.moudels.yn2016newyear.controller
{
   import com.tgame.moudels.yn2016newyear.model.YN2016newyear_MsgReceivedProxy;
   import com.tgame.moudels.yn2016newyear.model.YN2016newyear_MsgSendProxy;
   import com.tgame.moudels.yn2016newyear.view.YN2016newyear_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YN2016newyear_StartupCommand extends SimpleCommand
   {
      
      public function YN2016newyear_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YN2016newyear_MsgReceivedProxy());
         facade.registerProxy(new YN2016newyear_MsgSendProxy());
         facade.registerMediator(new YN2016newyear_Mediator());
      }
   }
}

