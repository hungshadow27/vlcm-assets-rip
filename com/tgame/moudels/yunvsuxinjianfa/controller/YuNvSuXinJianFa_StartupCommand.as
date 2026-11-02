package com.tgame.moudels.yunvsuxinjianfa.controller
{
   import com.tgame.moudels.yunvsuxinjianfa.model.YuNvSuXinJianFa_MsgReceivedProxy;
   import com.tgame.moudels.yunvsuxinjianfa.model.YuNvSuXinJianFa_MsgSenderProxy;
   import com.tgame.moudels.yunvsuxinjianfa.view.YuNvSuXinJianFa_Mediator;
   import com.tgame.moudels.yunvsuxinjianfa.view.YuNvSuXinJianFa_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YuNvSuXinJianFa_StartupCommand extends SimpleCommand
   {
      
      public function YuNvSuXinJianFa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YuNvSuXinJianFa_MsgSenderProxy());
         facade.registerProxy(new YuNvSuXinJianFa_MsgReceivedProxy());
         facade.registerMediator(new YuNvSuXinJianFa_Mediator());
         facade.registerMediator(new YuNvSuXinJianFa_TargetMediator());
      }
   }
}

