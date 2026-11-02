package com.tgame.moudels.shijianshalou.controller
{
   import com.tgame.moudels.shijianshalou.model.ShiJianShaLou_MsgReceivedProxy;
   import com.tgame.moudels.shijianshalou.model.ShiJianShaLou_MsgSendProxy;
   import com.tgame.moudels.shijianshalou.view.ShiJianShaLou_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShiJianShaLou_StartupCommand extends SimpleCommand
   {
      
      public function ShiJianShaLou_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ShiJianShaLou_MsgReceivedProxy());
         facade.registerProxy(new ShiJianShaLou_MsgSendProxy());
         facade.registerMediator(new ShiJianShaLou_Mediator());
      }
   }
}

