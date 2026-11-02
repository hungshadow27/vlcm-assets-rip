package com.tgame.moudels.WoHuCangLong.controller
{
   import com.tgame.moudels.WoHuCangLong.model.WoHuCangLong_MsgReceivedProxy;
   import com.tgame.moudels.WoHuCangLong.model.WoHuCangLong_MsgSenderProxy;
   import com.tgame.moudels.WoHuCangLong.view.WoHuCangLongResult_Mediator;
   import com.tgame.moudels.WoHuCangLong.view.WoHuCangLong_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WoHuCangLong_StartupCommand extends SimpleCommand
   {
      
      public function WoHuCangLong_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new WoHuCangLong_Mediator());
         facade.registerMediator(new WoHuCangLongResult_Mediator());
         facade.registerProxy(new WoHuCangLong_MsgReceivedProxy());
         facade.registerProxy(new WoHuCangLong_MsgSenderProxy());
      }
   }
}

