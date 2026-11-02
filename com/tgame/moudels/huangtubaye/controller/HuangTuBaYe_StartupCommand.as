package com.tgame.moudels.huangtubaye.controller
{
   import com.tgame.moudels.huangtubaye.model.HuangTuBaYe_MsgReceivedProxy;
   import com.tgame.moudels.huangtubaye.model.HuangTuBaYe_MsgSenderProxy;
   import com.tgame.moudels.huangtubaye.view.HuangTuBaYe_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class HuangTuBaYe_StartupCommand extends SimpleCommand
   {
      
      public function HuangTuBaYe_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new HuangTuBaYe_MsgReceivedProxy());
         facade.registerProxy(new HuangTuBaYe_MsgSenderProxy());
         facade.registerMediator(new HuangTuBaYe_Mediator());
      }
   }
}

