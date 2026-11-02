package com.tgame.moudels.tianfuzhen.controller
{
   import com.tgame.moudels.tianfuzhen.model.TianFuZhen_MsgReceivedProxy;
   import com.tgame.moudels.tianfuzhen.model.TianFuZhen_MsgSenderProxy;
   import com.tgame.moudels.tianfuzhen.view.TianFuZhen_Mediator;
   import com.tgame.moudels.tianfuzhen.view.TianFuZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TianFuZhen_StartupCommand extends SimpleCommand
   {
      
      public function TianFuZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TianFuZhen_MsgSenderProxy());
         facade.registerProxy(new TianFuZhen_MsgReceivedProxy());
         facade.registerMediator(new TianFuZhen_Mediator());
         facade.registerMediator(new TianFuZhen_TargetPanelMediator());
      }
   }
}

