package com.tgame.moudels.feast.controller
{
   import com.tgame.moudels.feast.model.Feast_MsgReceivedProxy;
   import com.tgame.moudels.feast.model.Feast_MsgSenderProxy;
   import com.tgame.moudels.feast.view.FeastMarriageCashGiftList_Mediator;
   import com.tgame.moudels.feast.view.FeastMarriageDine_Mediator;
   import com.tgame.moudels.feast.view.FeastMarriageGiveCashGift_Mediator;
   import com.tgame.moudels.feast.view.FeastMarriageWedding_Mediator;
   import com.tgame.moudels.feast.view.FeastTeam_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Feast_StartupCommand extends SimpleCommand
   {
      
      public function Feast_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Feast_MsgReceivedProxy());
         facade.registerProxy(new Feast_MsgSenderProxy());
         facade.registerMediator(new FeastMarriageWedding_Mediator());
         facade.registerMediator(new FeastMarriageCashGiftList_Mediator());
         facade.registerMediator(new FeastMarriageDine_Mediator());
         facade.registerMediator(new FeastMarriageGiveCashGift_Mediator());
         facade.registerMediator(new FeastTeam_Mediator());
      }
   }
}

