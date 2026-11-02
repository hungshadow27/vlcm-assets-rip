package com.tgame.moudels.yuxiaojianfa.controller
{
   import com.tgame.moudels.yuxiaojianfa.model.YuXiaoJianFa_MsgReceivedProxy;
   import com.tgame.moudels.yuxiaojianfa.model.YuXiaoJianFa_MsgSenderProxy;
   import com.tgame.moudels.yuxiaojianfa.view.YuXiaoJianFa_Mediator;
   import com.tgame.moudels.yuxiaojianfa.view.YuXiaoJianFa_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class YuXiaoJianFa_StartupCommand extends SimpleCommand
   {
      
      public function YuXiaoJianFa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new YuXiaoJianFa_MsgSenderProxy());
         facade.registerProxy(new YuXiaoJianFa_MsgReceivedProxy());
         facade.registerMediator(new YuXiaoJianFa_Mediator());
         facade.registerMediator(new YuXiaoJianFa_TargetMediator());
      }
   }
}

