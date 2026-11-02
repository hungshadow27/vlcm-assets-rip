package com.tgame.moudels.bowArrow.controller
{
   import com.tgame.moudels.bowArrow.BowArrow_ApplicationFacade;
   import com.tgame.moudels.bowArrow.model.BowArrow_MsgReceivedProxy;
   import com.tgame.moudels.bowArrow.model.BowArrow_MsgSenderProxy;
   import com.tgame.moudels.bowArrow.view.BowArrow_Mediator;
   import com.tgame.moudels.bowArrow.view.TargetBowArrow_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BowArrow_StartUpCommand extends SimpleCommand
   {
      
      public function BowArrow_StartUpCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BowArrow_MsgReceivedProxy());
         facade.registerProxy(new BowArrow_MsgSenderProxy());
         facade.registerCommand(BowArrow_ApplicationFacade.BUG_GOODS,BowArrow_BuyGoodsCommand);
         facade.registerMediator(new BowArrow_Mediator());
         facade.registerMediator(new TargetBowArrow_Mediator());
      }
   }
}

