package com.tgame.moudels.rank.controller
{
   import com.tgame.moudels.rank.model.Rank_MsgSendProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Rand_OtherSendMsgCommand extends SimpleCommand
   {
      
      public function Rand_OtherSendMsgCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Rank_MsgSendProxy = facade.retrieveProxy(Rank_MsgSendProxy.NAME) as Rank_MsgSendProxy;
         var _loc3_:Object = param1.getBody();
         _loc2_.send_50301({
            "id":_loc3_.id,
            "type":_loc3_.type,
            "action":(_loc3_.action ? _loc3_.action : 0)
         });
      }
   }
}

