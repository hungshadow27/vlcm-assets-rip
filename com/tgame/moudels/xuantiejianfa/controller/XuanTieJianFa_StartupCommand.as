package com.tgame.moudels.xuantiejianfa.controller
{
   import com.tgame.moudels.xuantiejianfa.model.XuanTieJianFa_MsgReceivedProxy;
   import com.tgame.moudels.xuantiejianfa.model.XuanTieJianFa_MsgSenderProxy;
   import com.tgame.moudels.xuantiejianfa.view.XuanTieJianFa_Mediator;
   import com.tgame.moudels.xuantiejianfa.view.XuanTieJianFa_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class XuanTieJianFa_StartupCommand extends SimpleCommand
   {
      
      public function XuanTieJianFa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new XuanTieJianFa_MsgSenderProxy());
         facade.registerProxy(new XuanTieJianFa_MsgReceivedProxy());
         facade.registerMediator(new XuanTieJianFa_Mediator());
         facade.registerMediator(new XuanTieJianFa_TargetMediator());
      }
   }
}

