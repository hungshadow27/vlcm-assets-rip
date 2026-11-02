package com.tgame.moudels.jinSheJianFa.controller
{
   import com.tgame.moudels.jinSheJianFa.model.JinSheJianFa_MsgReceivedProxy;
   import com.tgame.moudels.jinSheJianFa.model.JinSheJianFa_MsgSenderProxy;
   import com.tgame.moudels.jinSheJianFa.view.JinSheJianFa_Mediator;
   import com.tgame.moudels.jinSheJianFa.view.JinSheJianFa_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class JinSheJianFa_StartupCommand extends SimpleCommand
   {
      
      public function JinSheJianFa_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new JinSheJianFa_MsgReceivedProxy());
         facade.registerProxy(new JinSheJianFa_MsgSenderProxy());
         facade.registerMediator(new JinSheJianFa_Mediator());
         facade.registerMediator(new JinSheJianFa_TargetPanelMediator());
      }
   }
}

