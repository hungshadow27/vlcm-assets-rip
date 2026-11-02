package com.tgame.moudels.shiJieBei.controller
{
   import com.tgame.moudels.shiJieBei.model.ShiJieBei_MsgReceivedProxy;
   import com.tgame.moudels.shiJieBei.model.ShiJieBei_MsgSenderProxy;
   import com.tgame.moudels.shiJieBei.view.ShiJieBei_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShiJieBei_StartupCommand extends SimpleCommand
   {
      
      public function ShiJieBei_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ShiJieBei_MsgSenderProxy());
         facade.registerProxy(new ShiJieBei_MsgReceivedProxy());
         facade.registerMediator(new ShiJieBei_Mediator());
      }
   }
}

