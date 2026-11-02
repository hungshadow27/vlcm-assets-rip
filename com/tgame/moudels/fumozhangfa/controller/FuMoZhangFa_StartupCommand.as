package com.tgame.moudels.fumozhangfa.controller
{
   import com.tgame.moudels.fumozhangfa.model.FuMoZhangFa_MsgReceivedProxy;
   import com.tgame.moudels.fumozhangfa.model.FuMoZhangFa_MsgSenderProxy;
   import com.tgame.moudels.fumozhangfa.view.FuMoZhangFa_Mediator;
   import com.tgame.moudels.fumozhangfa.view.FuMoZhangFa_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class FuMoZhangFa_StartupCommand extends SimpleCommand
   {
      
      public function FuMoZhangFa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new FuMoZhangFa_MsgSenderProxy());
         facade.registerProxy(new FuMoZhangFa_MsgReceivedProxy());
         facade.registerMediator(new FuMoZhangFa_Mediator());
         facade.registerMediator(new FuMoZhangFa_TargetMediator());
      }
   }
}

