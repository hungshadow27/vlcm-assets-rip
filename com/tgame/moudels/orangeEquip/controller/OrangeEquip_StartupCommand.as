package com.tgame.moudels.orangeEquip.controller
{
   import com.tgame.moudels.orangeEquip.model.OrangeEquip_MsgReceivedProxy;
   import com.tgame.moudels.orangeEquip.model.OrangeEquip_MsgSenderProxy;
   import com.tgame.moudels.orangeEquip.view.OrangeEquip_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class OrangeEquip_StartupCommand extends SimpleCommand
   {
      
      public function OrangeEquip_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new OrangeEquip_MsgReceivedProxy());
         facade.registerProxy(new OrangeEquip_MsgSenderProxy());
         facade.registerMediator(new OrangeEquip_Mediator());
      }
   }
}

