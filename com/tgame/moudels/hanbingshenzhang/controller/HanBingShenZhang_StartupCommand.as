package com.tgame.moudels.hanbingshenzhang.controller
{
   import com.tgame.moudels.hanbingshenzhang.model.HanBingShenZhang_MsgReceivedProxy;
   import com.tgame.moudels.hanbingshenzhang.model.HanBingShenZhang_MsgSenderProxy;
   import com.tgame.moudels.hanbingshenzhang.view.HanBingShenZhang_Mediator;
   import com.tgame.moudels.hanbingshenzhang.view.HanBingShenZhang_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class HanBingShenZhang_StartupCommand extends SimpleCommand
   {
      
      public function HanBingShenZhang_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new HanBingShenZhang_MsgSenderProxy());
         facade.registerProxy(new HanBingShenZhang_MsgReceivedProxy());
         facade.registerMediator(new HanBingShenZhang_Mediator());
         facade.registerMediator(new HanBingShenZhang_TargetMediator());
      }
   }
}

