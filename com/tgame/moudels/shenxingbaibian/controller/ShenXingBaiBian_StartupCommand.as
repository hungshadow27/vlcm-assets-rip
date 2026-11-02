package com.tgame.moudels.shenxingbaibian.controller
{
   import com.tgame.moudels.shenxingbaibian.model.ShenXingBaiBian_MsgReceivedProxy;
   import com.tgame.moudels.shenxingbaibian.model.ShenXingBaiBian_MsgSenderProxy;
   import com.tgame.moudels.shenxingbaibian.view.ShenXingBaiBian_Mediator;
   import com.tgame.moudels.shenxingbaibian.view.ShenXingBaiBian_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShenXingBaiBian_StartupCommand extends SimpleCommand
   {
      
      public function ShenXingBaiBian_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ShenXingBaiBian_MsgSenderProxy());
         facade.registerProxy(new ShenXingBaiBian_MsgReceivedProxy());
         facade.registerMediator(new ShenXingBaiBian_Mediator());
         facade.registerMediator(new ShenXingBaiBian_TargetMediator());
      }
   }
}

