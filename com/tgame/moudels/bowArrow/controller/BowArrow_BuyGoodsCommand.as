package com.tgame.moudels.bowArrow.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.moudels.bowArrow.view.BowArrow_Mediator;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BowArrow_BuyGoodsCommand extends SimpleCommand
   {
      
      public function BowArrow_BuyGoodsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:BowArrow_Mediator = facade.retrieveMediator(BowArrow_Mediator.NAME) as BowArrow_Mediator;
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            _loc2_.setCompsePanelData(_loc2_.curtBowArrowCmpInfo);
         }
      }
   }
}

