package com.tgame.moudels.task.controller
{
   import com.tgame.moudels.task.model.Task_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Task_AcceptCommand extends SimpleCommand
   {
      
      public function Task_AcceptCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc2_:int = param1.getBody() as int;
         var _loc3_:Task_MsgSenderProxy = facade.retrieveProxy(Task_MsgSenderProxy.NAME) as Task_MsgSenderProxy;
         _loc3_.send_10261(_loc2_);
      }
   }
}

