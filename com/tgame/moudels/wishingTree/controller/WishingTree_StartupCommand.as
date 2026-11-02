package com.tgame.moudels.wishingTree.controller
{
   import com.tgame.moudels.wishingTree.model.WishingTree_MsgReceivedProxy;
   import com.tgame.moudels.wishingTree.model.WishingTree_MsgSenderProxy;
   import com.tgame.moudels.wishingTree.view.WishingTree_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WishingTree_StartupCommand extends SimpleCommand
   {
      
      public function WishingTree_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WishingTree_MsgReceivedProxy());
         facade.registerProxy(new WishingTree_MsgSenderProxy());
         facade.registerMediator(new WishingTree_Mediator());
      }
   }
}

