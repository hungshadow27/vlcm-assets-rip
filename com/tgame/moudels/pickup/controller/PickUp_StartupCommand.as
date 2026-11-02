package com.tgame.moudels.pickup.controller
{
   import com.tgame.moudels.pickup.PickUp_ApplicationFacade;
   import com.tgame.moudels.pickup.model.PickUp_MsgReceivedProxy;
   import com.tgame.moudels.pickup.model.PickUp_MsgSenderProxy;
   import com.tgame.moudels.pickup.model.PickUp_PickUpProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class PickUp_StartupCommand extends SimpleCommand
   {
      
      public function PickUp_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new PickUp_PickUpProxy());
         facade.registerProxy(new PickUp_MsgSenderProxy());
         facade.registerProxy(new PickUp_MsgReceivedProxy());
         facade.registerCommand(PickUp_ApplicationFacade.PICK_UP,PickUp_PickUpCommand);
         facade.registerCommand(PickUp_ApplicationFacade.SPACE_AUTO_PICK_UP,PickUp_AutoPickUpCommand);
      }
   }
}

