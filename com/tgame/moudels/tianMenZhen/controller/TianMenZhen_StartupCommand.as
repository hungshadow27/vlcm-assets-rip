package com.tgame.moudels.tianMenZhen.controller
{
   import com.tgame.moudels.tianMenZhen.model.TianMenZhen_MsgReceivedProxy;
   import com.tgame.moudels.tianMenZhen.model.TianMenZhen_MsgSenderProxy;
   import com.tgame.moudels.tianMenZhen.view.BuZhen_Mediator;
   import com.tgame.moudels.tianMenZhen.view.TianMenZhen_Mediator;
   import com.tgame.moudels.tianMenZhen.view.TianMenZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class TianMenZhen_StartupCommand extends SimpleCommand
   {
      
      public function TianMenZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new TianMenZhen_MsgReceivedProxy());
         facade.registerProxy(new TianMenZhen_MsgSenderProxy());
         facade.registerMediator(new TianMenZhen_Mediator());
         facade.registerMediator(new TianMenZhen_TargetPanelMediator());
         facade.registerMediator(new BuZhen_Mediator());
      }
   }
}

