package com.tgame.moudels.pickup.controller
{
   import com.tgame.moudels.pickup.model.PickUp_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class PickUp_PickUpCommand extends SimpleCommand
   {
      
      public function PickUp_PickUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:PickUp_MsgSenderProxy = facade.retrieveProxy(PickUp_MsgSenderProxy.NAME) as PickUp_MsgSenderProxy;
         _loc2_.send_11163(param1.getBody());
      }
   }
}

