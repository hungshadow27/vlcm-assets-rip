package com.tgame.moudels.nitaCyclone.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.moudels.nitaCyclone.view.NitaCyclone_Mediator;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class NitaCyclone_BuyGoodsCommand extends SimpleCommand
   {
      
      public function NitaCyclone_BuyGoodsCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:NitaCyclone_Mediator = facade.retrieveMediator(NitaCyclone_Mediator.NAME) as NitaCyclone_Mediator;
         if(Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
         }
      }
   }
}

