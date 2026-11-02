package com.tgame.moudels.Item.controller
{
   import com.tgame.moudels.Item.model.Item_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Item_SendItemUseCommand extends SimpleCommand
   {
      
      public function Item_SendItemUseCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:Item_MsgSenderProxy = facade.retrieveProxy(Item_MsgSenderProxy.NAME) as Item_MsgSenderProxy;
         _loc2_.send_11201(param1.getBody());
      }
   }
}

