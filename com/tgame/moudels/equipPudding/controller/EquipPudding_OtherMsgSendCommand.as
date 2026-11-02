package com.tgame.moudels.equipPudding.controller
{
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class EquipPudding_OtherMsgSendCommand extends SimpleCommand
   {
      
      public function EquipPudding_OtherMsgSendCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:EquipPudding_MsgSendProxy = facade.retrieveProxy(EquipPudding_MsgSendProxy.NAME) as EquipPudding_MsgSendProxy;
         var _loc3_:Object = param1.getBody();
         _loc2_.send_50125(_loc3_);
      }
   }
}

