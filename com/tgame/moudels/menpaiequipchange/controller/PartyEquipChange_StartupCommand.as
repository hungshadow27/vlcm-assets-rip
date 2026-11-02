package com.tgame.moudels.menpaiequipchange.controller
{
   import com.tgame.moudels.menpaiequipchange.model.PartyEquipChange_MsgReceivedProxy;
   import com.tgame.moudels.menpaiequipchange.model.PartyEquipChange_MsgSenderProxy;
   import com.tgame.moudels.menpaiequipchange.view.PartyEquipChange_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class PartyEquipChange_StartupCommand extends SimpleCommand
   {
      
      public function PartyEquipChange_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new PartyEquipChange_MsgReceivedProxy());
         facade.registerProxy(new PartyEquipChange_MsgSenderProxy());
         facade.registerMediator(new PartyEquipChange_Mediator());
      }
   }
}

