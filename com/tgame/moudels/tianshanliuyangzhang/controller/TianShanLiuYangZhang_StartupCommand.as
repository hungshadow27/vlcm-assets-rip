package com.tgame.moudels.tianshanliuyangzhang.controller
{
   import com.tgame.moudels.tianshanliuyangzhang.model.TianShanLiuYangZhang_MsgReceivedProxy;
   import com.tgame.moudels.tianshanliuyangzhang.model.TianShanLiuYangZhang_MsgSenderProxy;
   import com.tgame.moudels.tianshanliuyangzhang.view.TianShanLiuYangZhang_Mediator;
   import com.tgame.moudels.tianshanliuyangzhang.view.TianShanLiuYangZhang_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TianShanLiuYangZhang_StartupCommand extends SimpleCommand
   {
      
      public function TianShanLiuYangZhang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TianShanLiuYangZhang_MsgSenderProxy());
         facade.registerProxy(new TianShanLiuYangZhang_MsgReceivedProxy());
         facade.registerMediator(new TianShanLiuYangZhang_Mediator());
         facade.registerMediator(new TianShanLiuYangZhang_TargetMediator());
      }
   }
}

