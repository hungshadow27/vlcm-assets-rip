package com.tgame.moudels.zhenlongqiju.controller
{
   import com.tgame.moudels.zhenlongqiju.model.ZhenLongQiJu_MsgReceivedProxy;
   import com.tgame.moudels.zhenlongqiju.model.ZhenLongQiJu_MsgSenderProxy;
   import com.tgame.moudels.zhenlongqiju.view.ZhenLongQiJu_Mediator;
   import com.tgame.moudels.zhenlongqiju.view.ZhenLongQiJu_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZhenLongQiJu_StartupCommand extends SimpleCommand
   {
      
      public function ZhenLongQiJu_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZhenLongQiJu_MsgSenderProxy());
         facade.registerProxy(new ZhenLongQiJu_MsgReceivedProxy());
         facade.registerMediator(new ZhenLongQiJu_Mediator());
         facade.registerMediator(new ZhenLongQiJu_TargetMediator());
      }
   }
}

