package com.tgame.moudels.lianQi.controller
{
   import com.tgame.moudels.lianQi.model.LianQi_MsgReceivedProxy;
   import com.tgame.moudels.lianQi.model.LianQi_MsgSenderProxy;
   import com.tgame.moudels.lianQi.view.LianQi_Mediator;
   import com.tgame.moudels.lianQi.view.LianQi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class LianQi_StartupCommand extends SimpleCommand
   {
      
      public function LianQi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new LianQi_MsgReceivedProxy());
         facade.registerProxy(new LianQi_MsgSenderProxy());
         facade.registerMediator(new LianQi_Mediator());
         facade.registerMediator(new LianQi_TargetMediator());
      }
   }
}

