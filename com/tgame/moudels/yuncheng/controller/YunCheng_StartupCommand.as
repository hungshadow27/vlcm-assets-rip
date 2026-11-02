package com.tgame.moudels.yuncheng.controller
{
   import com.tgame.moudels.yuncheng.model.YunCheng_MsgReceivedProxy;
   import com.tgame.moudels.yuncheng.model.YunCheng_MsgSenderProxy;
   import com.tgame.moudels.yuncheng.view.YunCheng_Mediator;
   import com.tgame.moudels.yuncheng.view.YunCheng_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YunCheng_StartupCommand extends SimpleCommand
   {
      
      public function YunCheng_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YunCheng_MsgReceivedProxy());
         facade.registerProxy(new YunCheng_MsgSenderProxy());
         facade.registerMediator(new YunCheng_Mediator());
         facade.registerMediator(new YunCheng_TargetMediator());
      }
   }
}

