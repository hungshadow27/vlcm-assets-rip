package com.tgame.moudels.douZhuanXingYi.controller
{
   import com.tgame.moudels.douZhuanXingYi.model.DouZhuanXingYi_MsgReceivedProxy;
   import com.tgame.moudels.douZhuanXingYi.model.DouZhuanXingYi_MsgSenderProxy;
   import com.tgame.moudels.douZhuanXingYi.view.DouZhuanXingYi_Mediator;
   import com.tgame.moudels.douZhuanXingYi.view.DouZhuanXingYi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class DouZhuanXingYi_StartupCommand extends SimpleCommand
   {
      
      public function DouZhuanXingYi_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new DouZhuanXingYi_MsgReceivedProxy());
         facade.registerProxy(new DouZhuanXingYi_MsgSenderProxy());
         facade.registerMediator(new DouZhuanXingYi_Mediator());
         facade.registerMediator(new DouZhuanXingYi_TargetMediator());
      }
   }
}

