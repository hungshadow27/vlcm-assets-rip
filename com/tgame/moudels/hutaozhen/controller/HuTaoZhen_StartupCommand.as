package com.tgame.moudels.hutaozhen.controller
{
   import com.tgame.moudels.hutaozhen.model.HuTaoZhen_MsgReceivedProxy;
   import com.tgame.moudels.hutaozhen.model.HuTaoZhen_MsgSenderProxy;
   import com.tgame.moudels.hutaozhen.view.HuTaoZhen_Mediator;
   import com.tgame.moudels.hutaozhen.view.HuTaoZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class HuTaoZhen_StartupCommand extends SimpleCommand
   {
      
      public function HuTaoZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new HuTaoZhen_MsgReceivedProxy());
         facade.registerProxy(new HuTaoZhen_MsgSenderProxy());
         facade.registerMediator(new HuTaoZhen_Mediator());
         facade.registerMediator(new HuTaoZhen_TargetPanelMediator());
      }
   }
}

