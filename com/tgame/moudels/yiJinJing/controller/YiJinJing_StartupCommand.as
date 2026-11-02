package com.tgame.moudels.yiJinJing.controller
{
   import com.tgame.moudels.yiJinJing.model.YiJinJing_MsgSenderProxy;
   import com.tgame.moudels.yiJinJing.model.YiJingJing_MsgReceivedProxy;
   import com.tgame.moudels.yiJinJing.view.YiJinJing_Mediator;
   import com.tgame.moudels.yiJinJing.view.YiJinJing_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YiJinJing_StartupCommand extends SimpleCommand
   {
      
      public function YiJinJing_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YiJingJing_MsgReceivedProxy());
         facade.registerProxy(new YiJinJing_MsgSenderProxy());
         facade.registerMediator(new YiJinJing_Mediator());
         facade.registerMediator(new YiJinJing_TargetPanelMediator());
      }
   }
}

