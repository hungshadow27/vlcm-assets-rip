package com.tgame.moudels.tianyuyanmeng.controller
{
   import com.tgame.moudels.tianyuyanmeng.model.TianYuYanMeng_MsgReceivedProxy;
   import com.tgame.moudels.tianyuyanmeng.model.TianYuYanMeng_MsgSenderProxy;
   import com.tgame.moudels.tianyuyanmeng.view.TianYuYanMeng_Mediator;
   import com.tgame.moudels.tianyuyanmeng.view.TianYuYanMeng_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TianYuYanMeng_StartupCommand extends SimpleCommand
   {
      
      public function TianYuYanMeng_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TianYuYanMeng_MsgSenderProxy());
         facade.registerProxy(new TianYuYanMeng_MsgReceivedProxy());
         facade.registerMediator(new TianYuYanMeng_Mediator());
         facade.registerMediator(new TianYuYanMeng_TargetMediator());
      }
   }
}

