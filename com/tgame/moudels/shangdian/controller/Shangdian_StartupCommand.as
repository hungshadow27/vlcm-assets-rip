package com.tgame.moudels.shangdian.controller
{
   import com.tgame.moudels.shangdian.model.Shangdian_MsgReceivedProxy;
   import com.tgame.moudels.shangdian.model.Shangdian_MsgSenderProxy;
   import com.tgame.moudels.shangdian.view.Shangdian_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Shangdian_StartupCommand extends SimpleCommand
   {
      
      public function Shangdian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Shangdian_MsgReceivedProxy());
         facade.registerProxy(new Shangdian_MsgSenderProxy());
         facade.registerMediator(new Shangdian_Mediator());
      }
   }
}

