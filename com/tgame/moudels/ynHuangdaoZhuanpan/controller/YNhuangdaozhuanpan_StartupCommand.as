package com.tgame.moudels.ynHuangdaoZhuanpan.controller
{
   import com.tgame.moudels.ynHuangdaoZhuanpan.model.YNhuangdaozhuanpan_MsgReceivedProxy;
   import com.tgame.moudels.ynHuangdaoZhuanpan.model.YNhuangdaozhuanpan_MsgSendProxy;
   import com.tgame.moudels.ynHuangdaoZhuanpan.view.YNhuangdaozhuanpanTarget_Mediator;
   import com.tgame.moudels.ynHuangdaoZhuanpan.view.YNhuangdaozhuanpan_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YNhuangdaozhuanpan_StartupCommand extends SimpleCommand
   {
      
      public function YNhuangdaozhuanpan_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YNhuangdaozhuanpan_MsgReceivedProxy());
         facade.registerProxy(new YNhuangdaozhuanpan_MsgSendProxy());
         facade.registerMediator(new YNhuangdaozhuanpan_Mediator());
         facade.registerMediator(new YNhuangdaozhuanpanTarget_Mediator());
      }
   }
}

