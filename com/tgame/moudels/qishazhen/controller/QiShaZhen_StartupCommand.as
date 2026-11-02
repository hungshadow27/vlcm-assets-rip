package com.tgame.moudels.qishazhen.controller
{
   import com.tgame.moudels.qishazhen.model.QiShaZhen_MsgReceivedProxy;
   import com.tgame.moudels.qishazhen.model.QiShaZhen_MsgSenderProxy;
   import com.tgame.moudels.qishazhen.view.QiShaZhen_Mediator;
   import com.tgame.moudels.qishazhen.view.QiShaZhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QiShaZhen_StartupCommand extends SimpleCommand
   {
      
      public function QiShaZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QiShaZhen_MsgSenderProxy());
         facade.registerProxy(new QiShaZhen_MsgReceivedProxy());
         facade.registerMediator(new QiShaZhen_Mediator());
         facade.registerMediator(new QiShaZhen_TargetMediator());
      }
   }
}

